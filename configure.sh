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
###### Check R installation ####
################################


checkR(){
	toolPath=`which R`
	if [ -z $toolPath ]; then 
		echo "#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#"
		echo "# ERROR: R Not found                              #"
		echo "# =>> Please install R >= 3.3.2 then continue     #"
		echo "#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#"
		exit 0;
	fi
}

checkR;

################################
# Check miniconda installation #
################################

conda=false
installConda(){
echo ""
echo "#+++++++++++ GUAVA dependencies installation +++++++++++++++#"
	toolPath=`which conda`
	if [ -z $toolPath ]; then 
		conda=false
	elif [ -n $toolPath ]; then
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

if [ $machine = "Mac" ]; then
	minicondaLink="https://repo.continuum.io/miniconda/Miniconda2-latest-MacOSX-x86_64.sh";
	wget --no-check-certificate $minicondaLink;

elif [ $machine = "Linux" ]; then
	minicondaLink="https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh";
	wget --no-check-certificate $minicondaLink;

fi

}


get_minicodascriptName(){

if [ $machine = "Mac" ]; then
        minicondaScript="Miniconda2-latest-MacOSX-x86_64.sh";
elif [ $machine = "Linux" ]; then
        minicondaScript="Miniconda2-latest-Linux-x86_64.sh";
fi

}


############################
# Download miniconda setup #
############################

if [ $conda != false ]; then
	echo "conda found ! "
elif [ $conda != true ]; then
	echo "*** CONDA NOT FOUND *** "
	echo "*Installing miniconda2*"
	get_minicodascriptName;
	[ -f $minicondaScript ] && echo "Miniconda script exists" || get_minicodascript;
fi

######################
# INSTALL Miniconda  #
######################


if [ $conda != true ]; then
	echo "---------- Installing  miniconda ----------------"
	sh $minicondaScript
fi

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

installBC(){
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
installv samtools 1.3.1
installBC picard
installBC igv
installUCSC bedGraphToBigWig

#installv macs2 2.1.1.20160309
#conda install -y r-base
#installX bioconductor-chipseeker 
#installv bioconductor-deseq2 1.14.1

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#++++++++++++++ Check  R installation +++++++++++++++++++++#
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
echo ""
echo ""
echo ""

rPath=`which R`
rINS=false

if [ -z $rPath ]; then
		echo "#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#"
		echo "#%%%%%%%%%%%%%  R is NOT INSTALLED !!! %%%%%%%%%%%%%%#"
		echo "#%% Please install R and try again sh configure.sh %%#"
		echo "#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#"

elif [ -n $rPath ]; then
		echo "R is already installed ! ";
		echo $rPath;
		rINS=true
fi

echo "#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#"
echo "#+++++++++ Installing required R packages +++++++++++++++++#"
echo "#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#"
if [ $rINS != false ]; then
	Rscript ./lib/InstallRequiredPackages.R
fi
echo "#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#"
echo "#++++++++++++++ F I N S H E D +++++++++++++++++++++++++++++#"
echo "#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#"







