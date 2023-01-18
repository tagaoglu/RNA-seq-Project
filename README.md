# Pipeline to detect differentially expressed genes from bulk RNA-seq data

Below you can find detailed descriptions of the scripts in this repository:

* **quality_control.sh**              
to check the quality of the data
         
* **get_reference.sh**           
to download the reference genome sequence and associated annotation
           
* **hisat2_index.sh**            
to produce all required index files for Hisat2
          
* **hisat2_mapping.sh**           
to map the reads to the reference genome
           
* **samtools_view.sh**          
to convert the resulting sam files to bam format
           
* **samtools_sort.sh**         
to sort the bam files by genomic coordinates
           
* **samtools_index.sh**         
to index the coordinate sorted bam files
          
* **featureCounts.sh**        
to produce a table of counts containing the number of reads per gene in each sample
         
* **reformat_featureCounts.sh**            
to reformat the table from FeatureCounts to correspond to the format expected by DESeq2

* **DEAnalysis.R**           
R codes for Exploratory data analysis, Differential expression analysis and Overrepresentation analysis

* **sessionInfo()**         
Session Info in R
