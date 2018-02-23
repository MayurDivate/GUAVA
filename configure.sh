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

echo "#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#"
echo "Operating system :"${machine}


################################
# Check miniconda installation #
################################

conda=false
installConda(){
echo ""
echo "#+++++++++++ GUAVA dependencies installation +++++++++++++++#"
	toolPath=`which conda`
	if [ -z $toolPath ]; then 
		echo "Conda not found : "$1" ... .. ."
		conda=false
	elif [ -n $toolPath ]; then
		echo "conda : Found >>> "$toolPath;
		conda=true
	fi
}

installConda;

############################################
# Get correct link of miniconda base on OS #
############################################
minicondaScript=;
minicondaLink=;

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

if ! [ $conda ]; then
	get_minicodascriptName;
	[ -f $minicondaScript ] && echo "Miniconda script exists" || get_minicodascript;
fi



######################
# INSTALL Miniconday #
######################



if ! [ $conda ]; then
	echo "---------- Installing  miniconda ----------------"
	sh $minicondaScript
fi



##################################
# Add BIOCONDA and other channel #
##################################


echo "---------- Adding BIOCONDA and other channels ----------------"
#conda config --add channels r
#conda config --add channels defaults
#conda config --add channels conda-forge
#conda config --add channels bioconda

#######################################
#######################################


####################################
# function to install dependency,  #
# if it is not found on system     #
####################################

echo ""
echo ""
echo "#++++++++++++++ Installing Dependencies +++++++++++++++++++#"
installX(){
	toolPath=`which $1`
	echo ""
	if [ -z $toolPath ]; then
		echo "INSTALLING : "$1" ... .. ."
		conda install -y $1 -c bioconda
	elif [ -n $toolPath ]; then
		echo $1" is already installed ! ";
		echo $toolPath;
	fi

}


installv(){
	toolPath=`which $1`
	echo ""
	if [ -z $toolPath ]; then 
		echo "INSTALLING : "$1" ... .. ."
		conda install -y $1=$2 -c bioconda
	elif [ -n $toolPath ]; then
		echo $1" is already installed ! ";
		echo $toolPath;
	fi
}

installUCSC(){
	toolPath=`which $1`
	echo ""
	if [ -z $toolPath ]; then 
		echo "INSTALLING : "$1" ... .. ."
		tname="ucsc-"$1
		conda install -y $tname -c bioconda
	elif [ -n $toolPath ]; then
		echo $1" is already installed ! ";
		echo $toolPath;
	fi
}


echo "#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#"

installX java
installv bedtools 2.26.0  
installv bowtie 1.1.2
installv bowtie2 2.3.2 
installv cutadapt 1.13
installv fastqc 0.11.5
installv macs2 2.1.1.20160309
installv samtools 1.3.1
installX picard
installX igv
installUCSC bedGraphToBigWig

#conda install -y r-base
#installX bioconductor-chipseeker 
#installv bioconductor-deseq2 1.14.1

echo "" 
echo "" 
echo "#++++++++++++++ F I N S H E D +++++++++++++++++++++++++++++#"
echo "#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#"







