
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

