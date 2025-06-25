#!/bin/bash

set -e

echo "======================================================================="
echo "  1. Update and upgrade the system (non-interactive)"
echo "======================================================================="
export DEBIAN_FRONTEND=noninteractive
export NEEDRESTART_MODE=a          # or NEEDRESTART_SUSPEND=1
sudo apt-get update -y
sudo apt-get upgrade -y

echo "======================================================================="
echo "  2. Add essential development packages"
echo "======================================================================="
sudo apt install -y \
    wget build-essential libssl-dev libbz2-dev libreadline-dev libsqlite3-dev \
    zlib1g-dev libncurses-dev libffi-dev libgdbm-dev liblzma-dev uuid-dev \
    tk-dev python3-pip libblas-dev \
    linux-tools-common linux-tools-$(uname -r) \
    libelf-dev cmake clang llvm llvm-dev

echo "======================================================================="
echo "  3. Verify perf installation"
echo "======================================================================="
if command -v perf >/dev/null 2>&1; then
    echo "perf installed successfully."
else
    echo "Error: perf installation failed."
    exit 1
fi

echo "======================================================================="
echo "  4. Add deadsnakes PPA for Python 3.10"
echo "======================================================================="
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update

echo "======================================================================="
echo "  5. Install Python 3.10 and related tools"
echo "======================================================================="
sudo apt install -y gcc g++ build-essential google-perftools \
    python3.10 python3.10-venv python3.10-dev

echo "======================================================================="
echo "  6. Create (or recreate) Python 3.10 virtual environment 'graviton_env'"
echo "======================================================================="
if [ -d graviton_env ]; then
    echo "Removing existing virtual environment 'graviton_env'..."
    rm -rf graviton_env
fi

python3.10 -m venv graviton_env

echo "======================================================================="
echo "  7. Activate the virtual environment"
echo "======================================================================="
# shellcheck disable=SC1091
source graviton_env/bin/activate

echo "======================================================================="
echo "  8. Upgrade pip"
echo "======================================================================="
python3.10 -m pip install --upgrade pip

echo "======================================================================="
echo "  9. Install useful Python packages (excluding torch)"
echo "======================================================================="
python3.10 -m pip install --upgrade \
    numpy \
    matplotlib \
    pandas \
    transformers==4.39.3 \
    jupyterlab \
    ipykernel \
    ipywidgets \
    seaborn

echo "======================================================================="
echo "  10. Clone and patch 'ao' repo"
echo "======================================================================="
git clone --recursive https://github.com/pytorch/ao.git
cd ao
git checkout 174e630af2be8cd18bc47c5e530765a82e97f45b
wget https://raw.githubusercontent.com/ArmDeveloperEcosystem/PyTorch-arm-patches/main/0001-Feat-Add-support-for-kleidiai-quantization-schemes.patch
git apply --whitespace=nowarn 0001-Feat-Add-support-for-kleidiai-quantization-schemes.patch
cd ..

echo "======================================================================="
echo "  11. Clone and patch 'torchchat' repo"
echo "======================================================================="
git clone --recursive https://github.com/pytorch/torchchat.git
cd torchchat
git checkout 925b7bd73f110dd1fb378ef80d17f0c6a47031a6
wget https://raw.githubusercontent.com/ArmDeveloperEcosystem/PyTorch-arm-patches/main/0001-modified-generate.py-for-cli-and-browser.patch
wget https://raw.githubusercontent.com/ArmDeveloperEcosystem/PyTorch-arm-patches/main/0001-Feat-Enable-int4-quantized-models-to-work-with-pytor.patch
git apply 0001-Feat-Enable-int4-quantized-models-to-work-with-pytor.patch
git apply --whitespace=nowarn 0001-modified-generate.py-for-cli-and-browser.patch

echo "======================================================================="
echo "  12. Install TorchChat requirements"
echo "======================================================================="
python3.10 -m pip install -r requirements.txt
cd ..

echo "======================================================================="
echo "  13. Download and install custom Torch 2.5.0 wheel"
echo "======================================================================="
wget https://github.com/ArmDeveloperEcosystem/PyTorch-arm-patches/raw/main/torch-2.5.0.dev20240828+cpu-cp310-cp310-manylinux_2_17_aarch64.manylinux2014_aarch64.whl
python3.10 -m pip install --force-reinstall \
  torch-2.5.0.dev20240828+cpu-cp310-cp310-manylinux_2_17_aarch64.manylinux2014_aarch64.whl


echo "======================================================================="
echo "  14. Re-install torchao from 'ao' source"
echo "======================================================================="
python3.10 -m pip uninstall -y torchao || true
cd ao
rm -rf build
python3.10 setup.py install
cd ..

####################
# STEP 15: Clone and build processwatch (if not already cloned)
#############################################################################
echo "======================================================================="
echo "  15. Clone and build 'processwatch'"
echo "======================================================================="

# Just in case, re-install the dev packages, though they should already be present:
sudo apt-get update
sudo apt-get install -y libelf-dev cmake clang llvm llvm-dev
sudo apt-get update && sudo apt-get upgrade

if [ ! -d "processwatch" ]; then
    #git clone --recursive https://github.com/intel/processwatch.git
    git clone --recursive https://github.com/grahamwoodward/processwatch.git
else
    echo "processwatch folder already exists. Skipping clone."
fi
sudo apt-get install -y linux-tools-generic
cd processwatch
./build.sh
cd ..
echo "ubuntu ALL=(ALL) NOPASSWD: /home/ubuntu/processwatch/processwatch" | sudo tee /etc/sudoers.d/99-processwatch
sudo chmod 0440 /etc/sudoers.d/99-processwatch
#############################################################################

echo "======================================================================="
echo "Setup script completed successfully!"
echo "Activate your environment using: source graviton_env/bin/activate"
echo "======================================================================="
