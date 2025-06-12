# **AI on Arm**

![learn_on_arm](./img/Learn%20on%20Arm_banner.png)

## Important
### To download the latest stable version, please click below instead of using the "Download ZIP" button.
### [Click here to download](https://github.com/arm-university/AI-on-Arm/releases/download/v1.0.0/AI-on-Arm-main.zip)

Welcome to **Generative AI on Arm**, a hands-on course designed to help you optimize generative AI workloads on Arm architectures. Through practical labs and structured lectures, you will learn how to deploy AI models efficiently across different Arm-based environments.

## Course Structure

This course consists of three hands-on labs and four lectures.

### Hands-On Labs
- **Lab 1**: Optimizing generative AI on mobile devices, such as the Raspberry Pi 5.
- **Lab 2**: Deploying AI workloads on Arm-based cloud servers, including AWS Graviton.
- **Lab 3**: Comparing Cloud vs. Edge inference, analyzing challenges and trade-offs.

### Lecture Series
Inside the `slides/` folder, you will find four lectures covering the key concepts and challenges in AI inference on Arm:

1. **Challenges Facing Cloud and Edge GenAI Inference** – Understanding the limitations and constraints of AI inference in different environments.
2. **Generative AI Models** – Exploring model architectures, training methodologies, and deployment considerations.
3. **ML Frameworks and Optimized Libraries** – A deep dive into AI software stacks, including PyTorch, ONNX Runtime, and Arm-specific optimizations.
4. **Optimization for CPU Inference** – Techniques such as quantization, pruning, and leveraging SIMD instructions for faster AI performance.

## What You'll Learn

You will learn how to optimize AI inference using Arm-specific techniques such as SIMD (SVE, Neon) and low-bit quantization. The course covers practical strategies for running generative AI efficiently on mobile, Edge, and Cloud-based Arm platforms. You will also explore the trade-offs between cloud and edge deployment, gaining both theoretical knowledge and hands-on skills.

By the end of this course, you will have a strong foundation in deploying high-performance AI models on Arm hardware.

## Requirements

This course assumes a foundational understanding of machine learning, including completion of a basic introductory course, such as one at the undergraduate level.

Additionally to run the laboratory exercises, we assume you have access to a Raspberry Pi 5 and an Arm-based cloud instance. We have validated this on an AWS Graviton instance but it is expected to work through other cloud service providers. 


---

## **Getting Started**

### **Lab 1: Optimizing Generative AI on Raspberry Pi**

1. **Run the setup script**  
   Open a terminal in the project directory and execute the setup script:  
   ```bash
   ./setup_pi5.sh
   ```
   Please Note: This can take around 30 minutes to complete this step. 

2. **Login to a Hugging Face account**
   ```bash
   huggingface-cli login
   ```
3. **Open the course material**  
   The course material is provided as Jupyter notebooks. To access the content:
   ```bash
   source pi5_env/bin/activate
   jupyter lab
   ```

4. Follow the instructions provided in `lab1.ipynb` to complete the lab.

---

### **Lab 2: Optimizing Generative AI on Arm Servers**

1. **Launch an AWS EC2 instance**  
   - Go to Amazon EC2 and create a new instance.
   - **Select key pair**: Create a key for SSH connection (e.g., `yourkey.pem`).
   - **Choose an AMI**: Use the `Ubuntu 22.04` AMI as the operating system.
   - **Instance type**: Select `m7g.xlarge` (Graviton-based instance with Arm Neoverse cores).
   - **Storage**: Add 32 GB of root storage.

2. **Connect to the instance via SSH**  
   Use the following command to establish an SSH connection (replace with your instance details):
   ```bash
   ssh -i "yourkey.pem" -L 8888:localhost:8888 ubuntu@<ec2-public-dns>
   ```

3. **Clone the repository**  
   Once connected to the instance, clone the repository:
   ```bash
   git clone git@github.com:arm-university/AI-on-Arm.git
   ```

4. **Run the setup script**  
   Change to the repository directory and run the setup script:
   ```bash
   ./setup_graviton.sh
   ```

5. **Activate the virtual environment and log in to Hugging Face**  
   After the setup completes, activate the virtual environment:
   ```bash
   source graviton_env/bin/activate
   huggingface-cli login
   ```
   (You will need to log in to Hugging Face to download the required large language model.)

6. **Launch the lab**  
   Start Jupyter Lab by running:
   ```bash
   jupyter lab
   ```
   Copy the link provided in the terminal output, open it in your local browser, and follow the instructions in the notebooks.

---

### **Lab 3: Comparative Inference Benchmarking on Arm Server and Edge Devices**

1. Follow the setup stpes for `lab1` on your local Raspberry Pi.
2. Follow the setup stpes for `lab2` on your Raspberry Pi, to create and connect to a cloud instance.
3. Open `lab3.ipynb` to find the instructions for completing the lab 

---

## **Additional Notes**
- To complete this course you are required to have access to a Raspberry Pi 5, for the cloud sections, AWS can be utilised. 
- For Lab 2 and 3 make sure to terminate the EC2 instance when you're done to avoid unnecessary charges.

**Happy learning!**

**Note:** The primary content writer for this course is an AI researcher, [Oliver Grainge](https://github.com/OliverGrainge).
