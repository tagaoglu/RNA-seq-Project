# This repository has been designed for RNA-seq project.

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

* R codes ...

* **sessionInfo()** (reports the version numbers of R and all the packages used in this project)
R version 4.0.3 (2020-10-10)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS Catalina 10.15.7

Matrix products: default
BLAS:   /System/Library/Frameworks/Accelerate.framework/Versions/A/Frameworks/vecLib.framework/Versions/A/libBLAS.dylib
LAPACK: /Library/Frameworks/R.framework/Versions/4.0/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] parallel  stats4    stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] dplyr_1.0.2                 ggrepel_0.9.0               ggplot2_3.3.2              
 [4] GOSemSim_2.16.1             ggupset_0.3.0               ggnewscale_0.4.4           
 [7] enrichplot_1.10.1           org.Mm.eg.db_3.12.0         AnnotationDbi_1.52.0       
[10] clusterProfiler_3.18.0      DESeq2_1.30.0               SummarizedExperiment_1.20.0
[13] Biobase_2.50.0              MatrixGenerics_1.2.0        matrixStats_0.57.0         
[16] GenomicRanges_1.42.0        GenomeInfoDb_1.26.2         IRanges_2.24.1             
[19] S4Vectors_0.28.1            BiocGenerics_0.36.0        

loaded via a namespace (and not attached):
 [1] bitops_1.0-6           bit64_4.0.5            RColorBrewer_1.1-2     httr_1.4.2            
 [5] tools_4.0.3            R6_2.5.0               DBI_1.1.0              colorspace_2.0-0      
 [9] withr_2.3.0            tidyselect_1.1.0       gridExtra_2.3          bit_4.0.4             
[13] compiler_4.0.3         scatterpie_0.1.5       DelayedArray_0.16.0    labeling_0.4.2        
[17] shadowtext_0.0.7       scales_1.1.1           genefilter_1.72.0      stringr_1.4.0         
[21] digest_0.6.27          DOSE_3.16.0            XVector_0.30.0         pkgconfig_2.0.3       
[25] rlang_0.4.9            rstudioapi_0.13        RSQLite_2.2.1          generics_0.1.0        
[29] farver_2.0.3           BiocParallel_1.24.1    RCurl_1.98-1.2         magrittr_2.0.1        
[33] GO.db_3.12.1           GenomeInfoDbData_1.2.4 Matrix_1.2-18          Rcpp_1.0.5            
[37] munsell_0.5.0          viridis_0.5.1          lifecycle_0.2.0        stringi_1.5.3         
[41] ggraph_2.0.4           MASS_7.3-53            zlibbioc_1.36.0        plyr_1.8.6            
[45] qvalue_2.22.0          grid_4.0.3             blob_1.2.1             DO.db_2.9             
[49] crayon_1.3.4           lattice_0.20-41        graphlayouts_0.7.1     cowplot_1.1.0         
[53] splines_4.0.3          annotate_1.68.0        locfit_1.5-9.4         pillar_1.4.7          
[57] fgsea_1.16.0           igraph_1.2.6           geneplotter_1.68.0     reshape2_1.4.4        
[61] fastmatch_1.1-0        XML_3.99-0.5           glue_1.4.2             downloader_0.4        
[65] data.table_1.13.4      BiocManager_1.30.10    vctrs_0.3.6            tweenr_1.0.1          
[69] gtable_0.3.0           purrr_0.3.4            polyclip_1.10-0        tidyr_1.1.2           
[73] ggforce_0.3.2          xtable_1.8-4           tidygraph_1.2.0        survival_3.2-7        
[77] viridisLite_0.3.0      tibble_3.0.4           rvcheck_0.1.8          memoise_1.1.0         
[81] ellipsis_0.3.1        
