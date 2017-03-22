System requirements:

Java 1.8 or latest
Bowtie version 1.1.2
Python version 2.7 
MACS2 version 2.1.1.20160309
SAMtools Version: 1.3.1
R Version: >= 3.3.0

ATACseq_analyzer command-line interface 
To print help message
$	java –jar ATACseq_analyzer.jar –h
Usage and option summary 
Usage: $ java -jar ATAC_GUI.jar [options]*
Options	Description	
R1	Path to the FASTQ file containing upstream mates
R2	Path to the FASTQ file containing upstream mates
g	Path to bowtie index of genome fasta file
a	Genome assembly version [hg18,hg18,hg38,mm9,mm10]
value	p | q value for MACS2 peak filtering default: q
c | cutoff	Cutoff for p/q value e.g. 0.05, 5E-2 default: 0.05
X	Maximum distance from each other at which read mates can map to the genome default: 2000 
m	Report alignment for pair, if maximum number of reportable alignments for pair is less or equal to m default: 1 
O | outdir	Path to the output directory default: current directory 
ram	RAM memory to use in GBs default: 1
cpu	Number of threads to use default: 1
chrM	Remove(T) or keep(F) reads mapping to mitochondrial chromosome default: T
chrY	Remove(T) or keep(F) reads mapping to chromosome Y default: F
H | help	Print help mesage

Table 1: Usage and options for 
Compulsory options are shown in blue color 

How to download genome fasta file?
To download genome fasta files please follow the following links,
Human: http://hgdownload.soe.ucsc.edu/downloads.html#human 
Mouse: http://hgdownload.soe.ucsc.edu/downloads.html#mouse
Select genome assembly that you want to download, then click on “Full data set” and download *.fa.gz or chromFa.tar.gz (one chromosome per file) file. 
To decompress file use following command
$	gzip -d <file name>
If it is one chromosome per then one single fasta file using
cat command 
e.g.
$	cat file1.fa file2.fa > genomeName.fasta

How to create bowtie index of genome fasta file?
If you already have genome fasta file, please follow the command below to create bowtie genome index. Bowtie uses this index to speed up alignment process. 
$	cd <path to genome fasta file>
$	bowtie-build <genome.fasta> <genome>
Note: It is time consuming step 

Optionally you can create fasta index of genome
samtools faidx <genome.fasta>
