# Dual-image-based reversible data hiding method using center folding strategy
*Authors of the research paper:* Tzu-Chuen Lu; Jhih-Huei Wu; Chun-Chih Huang.

Published in Signal Processing, Volume 115, October 2015, Pages 195-213

## Contributors
- Shounak Shastri: <shounak.shastri@gmail.com>
---

This repository contains the MATLAB implementation of the Centre Folding Strategy (CFS) based Dual Image Reversible Data Hiding (DIRDH) scheme. 

As this is a DIRDH strategy, the embedding outputs 2 stego images. 


## Usage Instructions

*Please cite this paper in your work if you are using this code. The citation file is provided in the repository.*

This code is written in MATLAB and, depending on the version you are using, might require the Image Processing Toolbox. 



## Files in this repository

This repository contains the following files:

1. `CentreFoldingStrategyMain.m` - This file contains the basic code to run the given embedding functions for a grayscale cover image. It generates two stego images and gives their PSNR values. It will also show how many pixels were skipped to avoid underflow and overflow problems.

2. `Citation.bib` - This is the bibtex file which can be imported to your citation manager or latex file to cite the original paper.

3. `DIRDHcfsFullCap.m` - This function implements the embedding scheme to insert the secret data in as many pixels as possible for a given value of `k` (*k* is the number of secret data bits being inseted in one pixel). By default k is set to 3 and the overflow and underflow condtions are configured in accordance to that. They can be modified for other values of `k` using the equations given in the paper.

4. `DIRDHcfs.m` - This function also implements the embedding but it takes the required embedding capacity as an input argument. The functioning is same as that of the  embedding function mentioned above but the execution will stop once the required embedding capacity is reached. 

5. `DIRDHcfsKodak.m` - This file implements the embedding scheme for the Kodak image database. The file is given to show how to use MATLAB to run code on a folder full of images. The file contains code to run the embedding process on coloured images.
