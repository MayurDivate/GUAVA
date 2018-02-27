# GUAVA : A GUI tool for the Analysis and Visualization of ATAC-seq data
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://github.com/MayurDivate/GUAVASourceCode/blob/master/LICENSE) 
[![OS: mac | linux](https://img.shields.io/badge/OS-mac%20%7C%20linux-red.svg)](https://github.com/MayurDivate/GUAVASourceCode#guava--a-gui-tool-for-the-analysis-and-visualization-of-atac-seq-data) 
[![institute](https://img.shields.io/badge/Institute-University%20of%20Macau-blue.svg)](http://www.umac.mo)

<p align="justify">In nutshell, GUAVA is a standalone GUI tool for processing, analyzing and visualizing ATAC-seq data. A user can start GUAVA analysis with raw reads to identify ATAC-seq signals. Then ATAC-seq signals from two or more samples can be compared using GUAVA to identify genomic loci with differentially enriched ATAC-seq signals. Furthermore, GUAVA also provides gene ontology and pathways enrichment analysis. Since to use GUAVA requires only several clicks and no learning curve, it will help novice bioinformatics researchers and biologist with minimal computer skills to analyze ATAC-seq data. Therefore, we believe that GUAVA is a powerful and time saving tool for ATAC-seq data analysis. GUAVA setup contains a script to configure and install dependencies which facilitates the GUAVA installation. GUAVA works on Linux and Mac OS.</p>

> GUAVA is developed in the Edwin’s laboratory at University of Macau.



## Quick Start
First download the GUAVA package from here: [**GUAVA**](https://github.com/MayurDivate/GUAVA). 
Please check the manual to know how to open the terminal.

## Download GUAVA
Step 1: Click on the ``` clone or download ```<br/>
Step 2: Click on the ``` Download ZIP ``` <br/>
Step 4: This will save GUAVA zip package in the downloads folder<br/>

If the downloaded package is in the folder ```Downloads```,Then type the commands below to unzip package on the terminal.<br/>

```
mv ~/Downloads/GUAVA-master.zip ~/GUAVA.zip
cd ~/
unzip GUAVA.zip 
```

NOTE: If you have downloaded and saved GUAVA package in any other folder that Downloads. You will have to use complete path of that folder in above command instead of `~/Downloads/GUAVA-master.zip`. To copy path, simply copy the downloaded package and paste it on the terminal. 

## Installing Dependencies
Though we have written configure.sh script for the easy installation of dependencies, R and MACS2 need to be installed manually.
<br/>

## 1 INSTALL R 
#MAC 

Step 1: Download R => [**Click Here**](https://cran.r-project.org/bin/macosx/) <br/>
Step 2: Click on the R-X.X.X.pkg file link (e.g. R-3.4.3.pkg) <br/>
Step 3: Double click on the downloaded R package <br/>
Step 4: This will open a R installation window <br/>
Step 5: Click on the `continue` and follow the instructions on the screen <br/>
Step 6: After the successful installation of R proceed to next section <br/>
<br/>

#Linux

Step 1: Open the terminal <br/>
Step 2: Type command ` sudo apt-get install r-base` and press enter <br/>
<br/>

To know more about it, open the [**link**](https://cran.r-project.org/bin/linux/). Then, choose appropriate Linux OS type.

## 2 Install other dependencies and R packages
Step 1: Open the terminal <br/>
Step 2: Use following commands to run configure.sh. <br/>
Note: This may take a while to finish. Also, you will need to press ‘enter’ several times
to continue. Additionally, answer all question with ‘yes’.

```
cd ~/
sh ./configure.sh 
```
<br/>

## 3 Install MACS2
Step 1: Open the terminal <br/>
Step 2: And use following commands <br/>
NOTE: If permission denied, type 'sudo' at the beginning of the commands.
Then, to continue installation you have enter your password.
 

without sudo | with sudo
-----------|------------
``` cd ~/GUAVA ``` | ``` cd ~/GUAVA ```  
``` python get-pip.py ``` | ``` sudo python get-pip.py ```
``` pip install MACS2 ``` | ``` sudo pip install MACS2 ```

<br/>


## GUAVA manual
[**See manual for more information**](https://github.com/MayurDivate/GUAVA/blob/master/GUAVA_Manual.pdf)


## To start GUAVA use following command

**GUI version**
```
 java –jar GUAVA.jar
```
**For command line interface**
```
 java -jar GUAVA.jar [options]*
```
 
## Sample Data
 To download sample data [ **Click Here** ](http://ec2-52-201-246-161.compute-1.amazonaws.com/guava/)

## System Requirements
- Java 1.8 or latest
- Python version 2.7
- R Version: >= 3.3.2<br/>

## Required bioinformatics tools
- Bowtie
- Bowtie2
- MACS2 version 2.1.1.20160309
- SAMtools Version: 1.3.1
- FastQC
- cutadapt
- bedtools
- bedGraphToBigWig

### List of required R Packages
- ChIPseeker
- DESeq2
- ReactomePA
- TxDb.Hsapiens.UCSC.hg19.knownGene
- TxDb.Mmusculus.UCSC.mm9.knownGene
- TxDb.Mmusculus.UCSC.mm10.knownGene
- org.Hs.eg.db
- org.Mm.eg.db
- ChIPpeakAnno
- GO.db
- KEGG.db
- EnsDb.Hsapiens.v75
- Rsubread

## Support
 If you're having any problem, please [raise an issue](https://github.com/MayurDivate/GUAVASourceCode/issues) on GitHub. 
