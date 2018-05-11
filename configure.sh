#!/bin/bash

#########################################
# installing prerequisites for GUAVA v1 #
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

echo "INSTALLING GUAVA-1 dependencies"
echo ">>>>>> Operating system :"${machine}


isSuccess=false;

#>>>>>>>>>>>>>>>>>>>>>>>>>> INSTALL wget on linux####

isWget(){
	toolPath=`which wget`
        if [ -z $toolPath ]; then 
	   installWget;
	fi
}

installWget(){
     if [ $machine = "Linux" ]; then
	echo ">>> >> > Installing wget > >> >>>"
	sudo apt-get install wget;
     fi
}


################################################################################################################################################################


#>>>>>>>>>>>>>>>>>>>>>>>>>> Installing R ####

isR=false;

linuxR(){
  echo "deb https://cloud.r-project.org/bin/linux/ubuntu trusty/" | sudo tee -a /etc/apt/sources.list
  sudo apt-get update
  sudo apt-get install r-base


}

macR(){
	curl -O https://cran.r-project.org/bin/macosx/R-3.5.0.pkg;
}

installR(){
  if [ $machine = "Mac" ]; then
	echo ">>> >> > Downloading R > >> >>>"
	macR;
	sudo installer -verbose -pkg R-3.5.0.pkg -target / 
  else
	linuxR;
  fi
  
 
}

checkR(){
	toolPath=`which R`
	if [ -z $toolPath ]; then 
		echo ">>> >> > Installing R > >> >>>"
		installR;
	else
		echo ">>> R is already installed !"
		isR=true;
	fi
}

checkR;


#>>>>>>>>>>>>>>>>>>>>>>>>>  Installing required R packages ######
checkR;

if [ $isR != false ]; then
	echo ">>> >> > Installing R packages > >> >";
	Rscript ./lib/InstallRequiredPackages.R
else
	echo ""
	echo ">>>>>>> Error: could not install R"
	exit 0;
fi






##############################################################################################################################


#>>>>>>>>>>>>>>>>>>>>>>>>>  Installing Miniconda ######

conda=false
isConda(){
echo ""
	toolPath=`which conda`
	if [ -z $toolPath ]; then 
		conda=false
	elif [ -n $toolPath ]; then
		conda=true
	fi
}


############################################
# Get correct link of miniconda base on OS #
############################################
minicondaScript=;
minicondaLink=;

get_minicodascript(){

echo "---------- Downloading miniconda ----------------"

if [ $machine = "Mac" ]; then
	minicondaLink="https://repo.continuum.io/miniconda/Miniconda2-latest-MacOSX-x86_64.sh";
	curl -O $minicondaLink;

elif [ $machine = "Linux" ]; then
	minicondaLink="https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh"
	isWget;
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


isConda;

if [ $conda != false ]; then
	echo ">>> CONDA is already installed !"
elif [ $conda != true ]; then
	echo ">>> >> > Downloading miniconda2 > >> >>>"
	get_minicodascriptName;
	[ -f $minicondaScript ] && echo "Miniconda script exists" || get_minicodascript;
fi

######################
# INSTALL Miniconda  #
######################


if [ $conda != true ]; then
	echo ">>> >> > GUAVA dependencies installation < << <<<"
	echo "---------- Installing  miniconda ----------------"
	sh $minicondaScript
	source ~/.bash_profile
fi


isConda;

if [ $conda != true ]; then
	printf "\n\n\n\n"
	echo "******************************************************"
	echo "** >>>>>>>>>>> unable to load conda <<<<<<<<<<<<<<< **"
	echo "** >>>>>>>> please CLOSE THE TERMINAL <<<<<<<<<<<<< **"
	echo "** ++++++++ Then open the new terminal ++++++++++++ **"
	echo "** +++++++  again run the configure.sh  +++++++++++ **"
	echo "******************************************************"
	exit 0;
else
	echo "---------- Adding BIOCONDA and other channels ----------------"
	conda config --add channels r
	conda config --add channels defaults
	conda config --add channels conda-forge
	conda config --add channels bioconda
fi



####################################
# function to install dependency,  #
# if it is not found on system     #
####################################

echo ""
echo ""
echo ">>> >> > Installing dependencies > >> >>>"

installX(){
	toolPath=`which $1`
	if [ -z $toolPath ]; then
		echo ">>> >> > INSTALLING : "$1" > >> >>>"
		conda install -y $1 -c bioconda
	elif [ -n $toolPath ]; then
		echo ">>>>> FOUND: "$1" <<<<<";
	fi

}

installBC(){
	toolPath=`which $1`
	if [ -z $toolPath ]; then
		echo ">>> >> > INSTALLING : "$1" > >> >>>"
		conda install -y $1 -c bioconda
	elif [ -n $toolPath ]; then
		echo ">>>>> FOUND: "$1" <<<<<";
	fi

}


installv(){
	toolPath=`which $1`
	if [ -z $toolPath ]; then 
		echo ">>> >> > INSTALLING : "$1" > >> >>>"
		conda install -y $1=$2 -c bioconda
	elif [ -n $toolPath ]; then
		echo ">>>>> FOUND: "$1" <<<<<";

	fi
}

installUCSC(){
	toolPath=`which $1`
	if [ -z $toolPath ]; then 
		echo ">>> >> > INSTALLING : "$1" > >> >>>"
		tname="ucsc-"$1
		conda install -y $tname -c bioconda
	elif [ -n $toolPath ]; then
		echo ">>>>> FOUND: "$1" <<<<<";
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












################################################################################################################################################################

#>>>>>>>>>>>>>>>>>>>>>>>>>  Installing MACS2 ######


isMACS2=false;

installMACS2(){

macs2Path=`which macs2`

if [ -z $macs2Path ]; then
   pipPath=`which pip`

   if [ -z $pipPath ]; then
      printf "\n\n\n"
      echo ">>> >> > Installing pip > >> >>>"
      python get-pip.py
   fi

   python -c "import numpy";
   isNumpy=`echo $?`

   if [ $isNumpy > 0 ]; then
       printf "\n"
       echo ">>> >> > Installing Numpy > >> >>>"

       if [ $machine = "Mac" ]; then
          sudo -H pip install numpy;
       else
          pip install numpy;
       fi 

   fi

   printf "\n" 
   echo ">>> >> > Installing MACS2 > >> >>>"
   
   if [ $machine = "Mac" ]; then
      sudo -H pip install macs2;
   else
      pip install macs2;
   fi 
  
elif [ -n $macs2Path ]; then
     printf "\n\n\n"
     echo ">>> MACS2 is already installed ! ";
fi

}


installMACS2;

echo ">>>>>>>>> Finished <<<<<<<<<"
