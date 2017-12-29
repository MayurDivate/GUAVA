#!/bin/sh

#########################################
# installing BIOCONDA and prerequisites #
#########################################
# author MayurDivate			#
# mdivate@umac.mo                	#
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

echo "---------- Downloading miniconda ----------------"
wget --no-check-certificate $minicondaLink 


if [ $machine = "Mac" ]; then
	minicondaLink="https://repo.continuum.io/miniconda/Miniconda2-latest-MacOSX-x86_64.sh";
	wget --no-check-certificate $minicondaLink;

elif [ $machine = "Linx" ]; then
	minicondaLink="https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh";
	wget --no-check-certificate $minicondaLink;

fi

}


get_minicodascriptName(){

if [ $machine = "Mac" ]; then
        minicondaScript="Miniconda2-latest-MacOSX-x86_64.sh";
elif [ $machine = "Linx" ]; then
        minicondaScript="Miniconda2-latest-Linux-x86_64.sh";
fi

}


############################
# Download miniconda setup #
############################

get_minicodascriptName;

[ -f $minicondaScript ] && echo "Miniconda script exists" || get_minicodascript;



######################
# INSTALL Miniconday #
######################

echo "---------- Installing  miniconda ----------------"
sh $minicondaScript

##################################
# Add BIOCONDA and other channel #
##################################


echo "---------- Adding BIOCONDA and other channels ----------------"
conda config --add channels r
conda config --add channels defaults
conda config --add channels conda-forge
conda config --add channels bioconda

#######################################
#######################################


####################################
# function to install dependency,  #
# if it is not found on system     #
####################################


install(){

echo ""
echo ""
echo "#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#"
	toolPath=`which $1`
	
	if [ -z $toolPath ]; then 
		echo "INSTALLING : "$1" ... .. ."
		conda install -y $1 -c bioconda
	elif [ -n $toolPath ]; then
		echo $1" : Found >>> "$toolPath;
	fi

}


installv(){

echo ""
echo ""
echo "#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#"
	toolPath=`which $1`
	
	if [ -z $toolPath ]; then 
		echo "INSTALLING : "$1" ... .. ."
		conda install -y $1=$2 -c bioconda
	elif [ -n $toolPath ]; then
		echo $1" : Found >>> "$toolPath;
	fi

}




echo "---------- Installing Bowtie ----------------"

install java
installv bedtools 2.26.0  
installv bowtie 1.1.2
installv bowtie2 2.3.2 
installv cutadapt 1.13
installv fastqc 0.11.5
installv macs2 2.1.1.20160309
installv samtools 1.3.1
install picard
install igv
install ucsc-bedgraphtobigwig

conda install -y r-base
install bioconductor-chipseeker 
installv bioconductor-deseq2 1.14.1
 
echo "####################################################################"

echo "[Done]" 






