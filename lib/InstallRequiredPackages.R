
source("https://bioconductor.org/biocLite.R")
biocLite()

if(!require(ChIPseeker) {
biocLite("ChIPseeker")
} 
if(!require(ReactomePA)) {
biocLite("ReactomePA")
}

if(!require(TxDb.Hsapiens.UCSC.hg19.knownGene)) {
biocLite("TxDb.Hsapiens.UCSC.hg19.knownGene")
} 

if(!require(TxDb.Mmusculus.UCSC.mm9.knownGene)) {
biocLite("TxDb.Mmusculus.UCSC.mm9.knownGene")
} 

if(!require(TxDb.Mmusculus.UCSC.mm10.knownGene)) {
biocLite("TxDb.Mmusculus.UCSC.mm10.knownGene")
} 

if(!require("org.Hs.eg.db")) {
	biocLite("org.Hs.eg.db")
} 

if(!require(ChIPpeakAnno)) {
	biocLite("ChIPpeakAnno")
} 

if(!require(GO.db)) {
	biocLite("GO.db")
} 

if(!require(KEGG.db)) {
	biocLite("KEGG.db")
} 

if(!require(EnsDb.Hsapiens.v75)) {
	biocLite("EnsDb.Hsapiens.v75")
} 






