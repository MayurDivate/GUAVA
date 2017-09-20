#!/bin/sh

#########################################
# installing BIOCONDA and prerequisites #
#########################################
# author mdivate@umac.mo                #
#########################################


osname="$(uname -s)"

case "${osname}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    *)          machine="Unknown"
esac

echo "Operating system :"${machine}

minicondaScript=;
minicondaLink=;

############################################
# Get correct link of miniconda base on OS #
############################################

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

############################
# Download miniconda setup #
############################


echo "---------- Downloading miniconda ----------------"
#wget --no-check-certificate $minicondaLink 


######################
# INSTALL Miniconday #
######################

echo "---------- Installing  miniconda ----------------"
#sh $minicondaScript

##################################
# Add BIOCONDA and other channel #
##################################


echo "---------- Adding BIOCONDA and other channels ----------------"
#conda config --add channels r
#conda config --add channels defaults
#conda config --add channels conda-forge
#conda config --add channels bioconda

#######################################
# Get correct version of a dependency #
#######################################







####################################
# function to install dependency,  #
# if it is not found on system     #
####################################


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






