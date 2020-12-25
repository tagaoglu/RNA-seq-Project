# Go to the directory where the data is stored
setwd("~/Desktop")

# Install packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

BiocManager::install("DESeq2")
BiocManager::install("clusterProfiler")
BiocManager::install("S4Vectors")
BiocManager::install("AnnotationDbi")
BiocManager::install("org.Mm.eg.db")
BiocManager::install("enrichplot")
BiocManager::install("ggnewscale")
BiocManager::install("ggupset")
BiocManager::install("GOSemSim")
install.packages("ggplot2")
install.packages("ggrepel")


# view documentation for the version of this package installed
browseVignettes("DESeq2")
browseVignettes("clusterProfiler")
browseVignettes("enrichplot")


library(DESeq2)
library(clusterProfiler)
library(org.Mm.eg.db)
library(enrichplot)
library(ggnewscale)
library(ggupset)
library(GOSemSim)
library(ggplot2)
library(ggrepel)
library(dplyr)



###### EXPLORATORY DATA ANALYSIS

# Read adjusted file resulting from featureCounts
counts <- read.table("counts.txt", sep = "\t", row.names = "Geneid", header = TRUE)

# Specify experimental group for each sample
condition <- factor(c(rep("Lung_WT_Case", 5), rep("Lung_WT_Control", 3), rep("Blood_WT_Case", 5), rep("Blood_WT_Control", 3)))

coldata <- data.frame(row.names = colnames(counts), condition)

# Create DESeqDataSet object
DESeqDataSet <- DESeq2::DESeqDataSetFromMatrix(
  countData = counts,
  colData = coldata,
  design = ~ condition)

# Run DESeq2 differential expression analysis
dds <- DESeq2::DESeq(DESeqDataSet)

# Apply a regularized log transformation to remove dependence of the variance on the mean, ignoring information about experimental groups for visualisation
rlog_dds <- DESeq2::rlog(dds, blind=TRUE)

# Visualise principal components analysis (PCA) plot
DESeq2::plotPCA(rlog_dds, intgroup="condition")



###### DIFFERENTIAL EXPRESSION ANALYSIS

# Build the results tables for pairwise contrast, by setting alpha to 0.05
lung_res <- DESeq2::results(dds, contrast=c("condition", "Lung_WT_Case","Lung_WT_Control"), alpha=0.05)
blood_res <- DESeq2::results(dds, contrast=c("condition", "Blood_WT_Case","Blood_WT_Control"), alpha=0.05)

# Turn the results object into a data frame
lung_res_df <- data.frame(lung_res)
blood_res_df <- data.frame(blood_res)

# View number of differentially expressed genes with adjusted p-values less than 0.05
sum(lung_res$padj < 0.05, na.rm=TRUE)
sum(blood_res$padj < 0.05, na.rm=TRUE)

# View summary of results
DESeq2::summary(lung_res)
DESeq2::summary(blood_res)

# Plot expression of a single gene "Ifng : ENSMUSG00000055170"
# Save plotCounts to a data frame object
a <- plotCounts(dds, gene="ENSMUSG00000055170", intgroup="condition", returnData=TRUE)

# Plotting the Ifng normalized counts, using the condition
ggplot(a, aes(x = condition, y = count, color = condition)) + 
  geom_point(position=position_jitter(w = 0.1,h = 0)) +
  ggtitle("Ifng") +
  ylab("normalized count") +
  theme(plot.title = element_text(hjust = 0.5))

# Plot expression of a single gene "Stat1 : ENSMUSG00000026104"
# Save plotCounts to a data frame object
b <- plotCounts(dds, gene="ENSMUSG00000026104", intgroup="condition", returnData=TRUE)

# Plotting the Stat1 normalized counts, using the condition
ggplot(b, aes(x = condition, y = count, color = condition)) + 
  geom_point(position=position_jitter(w = 0.1,h = 0)) +
  ggtitle("Stat1") +
  ylab("normalized count") +
  theme(plot.title = element_text(hjust = 0.5))



###### OVERREPRESENTATION ANALYSIS

# Extract Ensembl IDs of all genes
lung_Genes <- rownames(lung_res)
blood_Genes <- rownames(blood_res)

# Extract Ensembl IDs of differentially expressed genes with adjusted p-values less than 0.05
lung_sigGenes <- rownames( lung_res[!is.na(lung_res$padj) & lung_res$padj<.05,] )
blood_sigGenes <- rownames( blood_res[!is.na(blood_res$padj) & blood_res$padj<.05,] )

# Identify Gene Ontology terms
# Overrepresentation analysis: lung
lung_ego <- clusterProfiler::enrichGO(
  gene          = lung_sigGenes,
  universe      = lung_Genes,
  OrgDb         = org.Mm.eg.db,
  ont           = "BP",
  keyType       = "ENSEMBL",
  readable      = TRUE)

head(lung_ego)

# Overrepresentation analysis: blood
blood_ego <- clusterProfiler::enrichGO(
  gene          = blood_sigGenes,
  universe      = blood_Genes,
  OrgDb         = org.Mm.eg.db,
  ont           = "BP",
  keyType       = "ENSEMBL",
  readable      = TRUE)

head(blood_ego)

# Display the top 10 GO terms 
dotplot(lung_ego, orderBy = "x", showCategory=10, title = "lung", font.size=10)
dotplot(blood_ego, orderBy = "x", showCategory=10, title = "blood", font.size=10)



sessionInfo()


