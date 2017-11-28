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
                          "EnsDb.Hsapiens.v75",
			  "Rsubread")



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




