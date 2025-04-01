# Copy-editing Queries 
## Slides

Slides, Chapter 1, Slide 3 – Lab and Chapter titles on slide did not match other slide decks or lab files. I’ve used the titles in the other slide decks (and slide 4 of ch1) and from the labx.ipynb files. 

Slides, Chapter 1, Slide 12 (and 18) – Special features Row CPU Column talks about DotProd instruction set. I can’t find a specific reference to that name, but the Arm website does talk about specific SDOT and UDOT commands. Will learners know what DotProd is? 

Slides, Chapter 1, Slide 12 – The slide shows three instances of Gb (Gigabits) but the calculation in the bullet gives an  answer in GB (Gigabytes), so have updated in 3 places. Can I check the last one (Memory read/write latency) should be GB/s and not Gb/s. Notes also quote figure but use GB. 

Slides – Learning outcomes slide on Chapter 1 (Slide 5) is styled completely differently (uses boxes) to the ones in Chapter’s 2, 3 and 4 (Bullet lists). Is this Ok or do the styles need rationalising 

## Lab 1

Lab1.pynb, lines 527 to 552 – In the preview in GitHub the code in lines 551 and 52 (grep) is appearing above that in 536 to 550. Also I’m not sure 528 to 534 is correctly formatted, or possibly duplicates 536 to 550. 

Lab1.pynb, lines 1800 and 1883 –Inconsistent alignment of maths. The Eqn for y at 1800 is left justified, but the Quantization error eqn at 1883 is centre justified. I can’t work out why . Also there is a stray ‘\’ before the ‘%’ displayed in the preview of line 1889 (Relative Quantization error’. Deleting one ‘\’ returns an error.  

Lab1.pynb, lines 1978 and boxplot below – Both refer to Lamma3.2-1B FeedForward Layer. Should this be ‘llama’? 

Lab1.pynb, lines 2021 – should ‘torch’ at the end of the line be ‘PyTorch’? 

Lab1.pynb, lines 5111 to 5152 – Are the empty code cells deliberate or should they be deleted? 

## Lab 2

Lab2.ipynb, Below ‘1. Explore Advanced Arm Intrinsics’ – There are two python and 1 markdown cells that are currently empty – I’ve left them as is, but suggest they need either content or deleting. 

Lab2.ipynb, ‘Explanation’ below ‘Collect Largest Weight matmul in LLM’ – the second tensor ‘Weight matrix’ in the text it refers to both 32,000 and 320,000. I have made it consistent at 32,000. 

Lab2.ipynb, just above solutions there are three empty Python Cells. Do these need either content or deleting? 

## Lab 3

Lab3.ipynb, End of ‘Graph Analysis: Thread Scaling and Bottlenecks’ and ‘Hands-On LLM Interaction’, ‘Things to Observe’ – There’s a rocket Emoji. I’ve left, but should it be there? 
