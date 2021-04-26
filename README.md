# GUAVA : A GUI tool for the Analysis and Visualization of ATAC-seq data
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://github.com/MayurDivate/GUAVASourceCode/blob/master/LICENSE) 
[![OS: mac | linux](https://img.shields.io/badge/OS-mac%20%7C%20linux-red.svg)](https://github.com/MayurDivate/GUAVASourceCode#guava--a-gui-tool-for-the-analysis-and-visualization-of-atac-seq-data) 
[![institute](https://img.shields.io/badge/Institute-University%20of%20Macau-blue.svg)](http://www.umac.mo)

<p align="justify">GUAVA is a standalone GUI tool for the processing, analysis, and visualization of ATAC-seq data from raw sequencing reads to ATAC-seq signals. GUAVA can compare ATAC-seq signals from two conditions to identify genomic loci with differentially enriched ATAC-seq signals. Furthermore, GUAVA provides results on gene ontology and pathways analysis. Since using GUAVA requires only several clicks and no learning curve, it will help novice bioinformatics researchers and biologist with minimal computer skills to analyze ATAC-seq data. Therefore, we believe that GUAVA is a powerful and time saving tool for ATAC-seq data analysis. The GUAVA setup contains a script to configure and install dependencies which facilitates the GUAVA installation. GUAVA works on Linux and Mac OS. <br/>
<br/>
This document contains all the information that is required to install and use GUAVA.<br/>
<br/>
</p>

> GUAVA was developed in Edwin Cheung’s laboratory at the University of Macau.<br/>


## Quick Start
## How to download GUAVA 
First download the GUAVA package.<br/>
<br/>
Step 1: Go to the [**link**](https://github.com/MayurDivate/GUAVA/releases) <br/>
Step 2: Click on the `Source Code (zip)` <br/>
Step 3: This will save GUAVA zip package in the downloads folder <br/>
<br/>
Then you will need to open the terminal to complete installation.<br/>
Please check the [**manual**](http://ec2-52-201-246-161.compute-1.amazonaws.com/guava/docs/GUAVA_manual.pdf) to know how to open the terminal.<br/>
<br/>
If the downloaded package is in the folder ```Downloads```, Then type the commands below in the Terminal to move "GUAVA-1.zip" into the home folder and unzip it.<br/>

```
mv ~/Downloads/GUAVA-1.zip ~/
cd ~/
unzip GUAVA-1.zip
```

> NOTE <br/>
> If you have already unzipped package then remove the '.zip' suffix in the first command and skip the third command.<br/>
> If you have downloaded and saved GUAVA package in any other folder that Downloads. You will have to use complete path of that folder in above command instead of `~/Downloads/GUAVA-master.zip`. To copy path, simply copy the downloaded package and paste it on the terminal. 

## Installing GUAVA
GUAVA depends on other tools in order to process ATAC-seq data (e.g. Bowtie for alignment). If any of the dependencies are not found on the system, GUAVA will not work properly. Therefore, to help users to install the dependencies, we have written a program called configure.sh, which automatically downloads and installs the dependencies. Please follow the steps given below to run configure.sh.
<br/>

#### Run configure.sh

```
cd ~/GUAVA-1
sh ./configure.sh 
```
<br/>

> NOTE <br/>
> This may take 15-20 mins to finish. Also, you will need to press ‘enter’ several times to continue. Additionally, answer all questions with ‘yes’. If you see the message about the ‘Xcode’, choose ‘install’ to continue. Some users may need to repeat step 1-3 in the new terminal if it could not load the ‘conda’. 

> Error: [**Anaconda Error**](https://github.com/MayurDivate/GUAVA#anaconda-error-missing-write-permissions-in)

**End of the installation, Close the terminal.**


## How to start GUAVA 

**GUI version**
```
 java -jar GUAVA.jar
```

<br/>

**For command line interface**
```
 java -jar GUAVA.jar [options]*
```

## GUAVA manual 
To download manual [**click here**](http://ec2-52-201-246-161.compute-1.amazonaws.com/guava/docs/GUAVA_manual.pdf)
<br/>

## Sample Data 
To download sample data [ **Click Here** ](https://drive.google.com/drive/folders/1TqSOOAuA6wRJVCeOMTD8q7RE1fscAoe2?usp=sharing)

## Anaconda Error: Missing write permissions in
If you encounter error which says "Error: Missing write permissions in:/share/apps/anaconda***",<br/>
please follow the commands below to create local Anaconda enviroment.  

- Use the command below and replace the text after 'clone=' with your Anaconda path. Check the error to know correct path. 
```
conda create -n my_root --clone=/share/apps/anaconda2/4.0.0
``` 
- use commands below to activate loacal my_root anaconda
```
source activate my_root
conda remove conda-build
conda remove conda-env
conda update anaconda
```
- try to install dependencies again
``
cd ~/GUAVA-1
sh ./configure.sh
``

## System Requirements
- Java 1.8 or latest
- Python version 2.7
- R Version: >= 3.3.2<br/>

## Required bioinformatic tools
- Bowtie
- Bowtie2
- MACS2 version 2.1.1.20160309
- SAMtools Version: 1.3.1
- FastQC
- cutadapt
- bedtools
- bedGraphToBigWig

### List of required R Packages
- DESeq2
- ChIPpeakAnno
- GO.db
- KEGG.db
- EnsDb.Hsapiens.v75
- Rsubread
- ggplot2
- TxDb.Hsapiens.UCSC.hg19.knownGene
- TxDb.Mmusculus.UCSC.mm9.knownGene
- TxDb.Mmusculus.UCSC.mm10.knownGene
- org.Hs.eg.db
- org.Mm.eg.db


## Support
 If you're having any problem, please [raise an issue](https://github.com/MayurDivate/GUAVASourceCode/issues) on GitHub. 
