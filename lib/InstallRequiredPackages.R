
print(">>> >> > Loading BIOCONDUCTOR > >> >>>")

source("https://bioconductor.org/biocLite.R")
biocLite(suppressAutoUpdate=TRUE,ask = FALSE,suppressUpdates = TRUE)

print(">>> >> > checking required packages > >> >>>")


bioconductorPackages <- c("ReactomePA", "GenomicFeatures",
                          "TxDb.Hsapiens.UCSC.hg19.knownGene",
                          "TxDb.Mmusculus.UCSC.mm9.knownGene",
                          "TxDb.Mmusculus.UCSC.mm10.knownGene",
                          "org.Hs.eg.db",  "org.Mm.eg.db",
                          "ChIPpeakAnno",
                          "GO.db", "KEGG.db", "EnsDb.Hsapiens.v75", "Rsubread", "DESeq2")

otherPackages <- c("ggplot2")

checkBCpackage <- function(bcpkgname){ 
  c <- suppressMessages(library(bcpkgname,character.only = TRUE,logical.return = TRUE,quietly = TRUE))
  if(!c){
    print(paste(">>> >> > Trying to install",bcpkgname,"> >> >>>",sep = " "))
    biocLite(bcpkgname)
    
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
    install.packages(bcpkgname)
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

for(i in 1:length(bioconductorPackages)){
    if(!checkBCpackage(bioconductorPackages[i])){
      failedPackages <-c(failedPackages,bioconductorPackages[i])
    }
}


for(i in 1:length(otherPackages)){
  if(!checkPackage(otherPackages[i])){
    failedPackages <-c(failedPackages,otherPackages[i])
  }
}


if(length(failedPackages) > 0){
  print("#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#")
  print("#%%%%%%% Following packages are FAILED to install %%%%%%%%%#")
  print(failedPackages)
  print("#%%%%%%%% Please install these packages manually %%%%%%%%%%#")
  print("#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#")
}


