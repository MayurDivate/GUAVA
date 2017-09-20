#!/bin/sh

#######################################
# installing BIOCONDA and prerequisites 
####
# author mdivate@umac.mo
#################################

osname="$(uname -s)"

case "${osname}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="Unknown"
esac

echo "Operating system :"${machine}

minicondaScript=;
minicondaLink=;

get_minicodascript(){

if [ $machine = "Mac" ]; then
	minicondaScript="Miniconda2-latest-MacOSX-x86_64.sh";
	minicondaLink="https://repo.continuum.io/miniconda/Miniconda2-latest-MacOSX-x86_64.sh";
elif [ $machine = "Linx" ]; then
	minicondaScript="Miniconda2-latest-Linux-x86_64.sh";
	minicondaLink="https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh";
fi

}

get_minicodascript

echo "---------- Downloading miniconda ----------------"
#wget --no-check-certificate $minicondaLink 

echo "---------- Installing  miniconda ----------------"
#sh $minicondaScript

echo "---------- Adding BIOCONDA and other channels ----------------"
#conda config --add channels r
#conda config --add channels defaults
#conda config --add channels conda-forge
#conda config --add channels bioconda

###################
# function to get tool path
####################


install(){

echo ""
echo ""
echo "####################################################################"
	toolPath=`which $1`
	
	if [ -z $toolPath ]; then 
		echo "INSTALLING : "$1" ... .. ."
		conda install $1
	elif [ -n $toolPath ]; then
		echo $1" : Found >>> "$toolPath;
	fi

}


echo "---------- Installing Bowtie ----------------"
#conda install bowtie

install bowtie 
install bowtie2 
install java
install cutadapt
install fastqc
install macs2
install samtools
install bioconductor-chipseeker
install bioconductor-deseq2
install picard
 
echo "####################################################################"

echo "[Done]" 
