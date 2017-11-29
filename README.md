<h1> GUAVA : A GUI tool for the Analysis and Visualization of ATAC-seq data </h1>


<h2>Installation</h2>
$ unzip GUAVA-master.zip<br/>
$ mv GUAVA-master GUAVA<br/>
$ cd GUAVA<br/>

<h2>Installing Dependencies</h2>
We have written configure.sh script for the easy installation of dependencies <br/>
$ sh ./configure.sh <br/>

If R packages are not installed successfully, use following command to install R packages.<br/>
Rscript lib/InstallRequiredPackages.R 


<h3> <a href="http://ec2-52-201-246-161.compute-1.amazonaws.com/guava/"> Sample Data </a> </h3>

<h1>To start GUAVA use following command</h1>

<h2>GUI version</h2>
  $ java –jar GUAVA.jar <br/>

<h2>For command line interface</h2>
  $ java -jar GUAVA.jar [options]*<br/>
  
<h1>System Requirements</h1>
  Java 1.8 or latest<br/>
  Bowtie version 1.1.2<br/>
  Python version 2.7<br/>
  MACS2 version 2.1.1.20160309<br/>
  SAMtools Version: 1.3.1<br/>
  R Version: >= 3.3.0<br/><br/>

<h2>List of required R Packages</h2>
ChIPseeker <br/>
ReactomePA <br/>
TxDb.Hsapiens.UCSC.hg19.knownGene <br/>
TxDb.Mmusculus.UCSC.mm9.knownGene <br/>
TxDb.Mmusculus.UCSC.mm10.knownGene <br/>
org.Hs.eg.db <br/>
org.Mm.eg.db <br/>
ChIPpeakAnno <br/>
GO.db <br/>
KEGG.db <br/>
EnsDb.Hsapiens.v75 <br/>
Rsubread <br/>
<h2> <a href="https://github.com/MayurDivate/GUAVA/blob/master/GUAVA_Manual.pdf">
See manual for more information<a><br/><h2/>

