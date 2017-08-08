<<<<<<< HEAD

source("https://bioconductor.org/biocLite.R")

if("ChIPseeker" %in% rownames(installed.packages()) == FALSE) {
biocLite("ChIPseeker")
} else {
print("***** ChIPseeker R package found *****")
}

if("ReactomePA" %in% rownames(installed.packages()) == FALSE) {
biocLite("ReactomePA")
} else {
print("***** ReactomePA R package found *****")
}

if("TxDb.Hsapiens.UCSC.hg19.knownGene" %in% rownames(installed.packages()) == FALSE) {
biocLite("TxDb.Hsapiens.UCSC.hg19.knownGene")
} else {
print("***** TxDb.Hsapiens.UCSC.hg19.knownGene R package found *****")
}

if("TxDb.Mmusculus.UCSC.mm9.knownGene" %in% rownames(installed.packages()) == FALSE) {
biocLite("TxDb.Mmusculus.UCSC.mm9.knownGene")
} else {
print("***** TxDb.Mmusculus.UCSC.mm9.knownGene *****")
}

if("TxDb.Mmusculus.UCSC.mm10.knownGene" %in% rownames(installed.packages()) == FALSE) {
biocLite("TxDb.Mmusculus.UCSC.mm10.knownGene")
} else {
print("***** TxDb.Mmusculus.UCSC.mm10.knownGene *****")
}

if(!require("org.Hs.eg.db")) {
source("https://bioconductor.org/biocLite.R")
biocLite("org.Hs.eg.db")
} else {
print("***** org.Hs.eg.db found *****")
}

if(!require("org.Mm.eg.db")) {
source("https://bioconductor.org/biocLite.R")
biocLite("org.Mm.eg.db")
} else {
print("***** org.Mm.eg.db found *****")
}
=======
source("https://bioconductor.org/biocLite.R")
biocLite(suppressAutoUpdate=TRUE)

bioconductorPackages <- c("ChIPseeker","ReactomePA",
                          "TxDb.Hsapiens.UCSC.hg19.knownGene",
                          "TxDb.Mmusculus.UCSC.mm9.knownGene",
                          "TxDb.Mmusculus.UCSC.mm10.knownGene",
                          "org.Hs.eg.db",
                          "org.Mm.eg.db",
                          "ChIPpeakAnno",
                          "GO.db",
                          "KEGG.db",
                          "EnsDb.Hsapiens.v75")



checkBCpackage <- function(bcpkgname){ 
c <- require(bcpkgname,character.only = TRUE)
  if(!c){
    print(paste("Trying to install",bcpkgname,sep = " "))
    biocLite(bcpkgname)
    c2 <- require(bcpkgname,character.only = TRUE)
      if(!c2){
        print(paste("FAILED :",bcpkgname,sep = " "))
        print(paste("Please install",bcpkgname,"manually",sep = " "))
      }
      else{
        print(paste("Package",bcpkgname,"installed successfully",sep = " "))
      }    
  }
  #else{
  #  print(paste("Package",bcpkgname,"already installed",sep = " "))
  #} 

}


for(i in 1:length(bioconductorPackages)){
  checkBCpackage(bioconductorPackages[i])
  print("")
}



>>>>>>> cutadapt

