
print(">>> >> > Loading BIOCONDUCTOR > >> >>>")

# old way to install bioconductor packages (biocLite)
#source("https://bioconductor.org/biocLite.R")
#biocLite(suppressAutoUpdate=TRUE,ask = FALSE,suppressUpdates = TRUE)

# lates way to install bioconductor packages 
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")


print(">>> >> > checking required packages > >> >>>")


bioconductorPackages <- c("GenomicFeatures",
                          "TxDb.Hsapiens.UCSC.hg19.knownGene",
                          "TxDb.Mmusculus.UCSC.mm10.knownGene",
                          "org.Hs.eg.db",  "org.Mm.eg.db",
                          "ChIPpeakAnno",
                          "GO.db", "KEGG.db", "Rsubread", "DESeq2")

otherPackages <- c("ggplot2")

checkBCpackage <- function(bcpkgname){ 
  c <- suppressMessages(library(bcpkgname,character.only = TRUE,logical.return = TRUE,quietly = TRUE))
  if(!c){
	  print(paste(">>> >> > Trying to install",bcpkgname,"> >> >>>",sep = " "))
	  # old way	
	  # biocLite(bcpkgname, ask = TRUE)
	  # New way
	  BiocManager::install(bcpkgname, ask=TRUE)
    
    c2 <- library(bcpkgname,character.only = TRUE,logical.return = TRUE,quietly = TRUE)  
    if(!c2){
		  return(FALSE)
    }
    else{
      print(paste(">>>>> Package",bcpkgname,"installed successfully",sep = " "))
      return(TRUE)
    }    
  }
  else{
    print(paste(">>>>> Found: ",bcpkgname,"<<<<<",sep = " "))
    return(TRUE)
  }
  
}

checkPackage <- function(bcpkgname){ 
  c <- library(bcpkgname,character.only = TRUE,logical.return = TRUE,quietly = TRUE)  
  if(!c){
   print(paste(">>> >> > Trying to install",bcpkgname,"> >> >>>",sep = " "))
    install.packages(bcpkgname,repos='http://cran.us.r-project.org')
    c2 <- library(bcpkgname,character.only = TRUE,logical.return = TRUE,quietly = TRUE)  
    if(!c2){
	return(FALSE)
    }
    else{
	print(paste(">>>>> Package",bcpkgname,"installed successfully",sep = " "))
	return(TRUE)
    }    
  }
  else{
    print(paste(">>>>> Found:",bcpkgname,"<<<<<",sep = " "))
    return(TRUE)
  }
}

failedPackages <-c()

for(i in 1:length(otherPackages)){
  if(!checkPackage(otherPackages[i])){
    failedPackages <-c(failedPackages,otherPackages[i])
  }
}



for(i in 1:length(bioconductorPackages)){
    if(!checkBCpackage(bioconductorPackages[i])){
      failedPackages <-c(failedPackages,bioconductorPackages[i])
    }
}


if(length(failedPackages) > 0){

  print("#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#")
  print("#%%%%%%% Following packages are FAILED to install %%%%%%%%%#")
  print(paste(">",failedPackages,"<"))
  print("#%%%%%%%% Please install these packages manually %%%%%%%%%%#")
  print("#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#")
}


