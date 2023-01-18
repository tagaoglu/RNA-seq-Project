# Pipeline to detect differentially expressed genes from bulk RNA-seq data

Below you can find detailed descriptions of the scripts in this repository:

* **Check the quality of the data**              
quality_control.sh
         
* **Download the reference genome sequence and associated annotation**           
get_reference.sh
           
* **Produce all required index files for Hisat2**            
hisat2_index.sh
          
* **Map the reads to the reference genome**           
hisat2_mapping.sh
           
* **Convert the resulting sam files to bam format**          
samtools_view.sh
           
* **Sort the bam files by genomic coordinates**         
samtools_sort.sh
           
* **Index the coordinate sorted bam files**         
samtools_index.sh
          
* **Produce a table of counts containing the number of reads per gene in each sample**        
featureCounts.sh
         
* **Reformat the table from FeatureCounts to correspond to the format expected by DESeq2**            
reformat_featureCounts.sh

* **Exploratory data analysis: Differential expression analysis and Overrepresentation analysis**           
DEAnalysis.R

* **Session Info in R**         
sessionInfo()

## Summary of the project

RNA-seq (bulk): Perform a “standard” differential gene expression workflow in a model organism. 
This involves mapping of reads to the reference genome with a splice-aware aligner, counting reads per gene, performing tests for differential expression and some visualisation. 
