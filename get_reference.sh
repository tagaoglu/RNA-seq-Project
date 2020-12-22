#!/bin/bash

# Create and go to the TP directory 
mkdir /data/courses/rnaseq/toxoplasma_de/tagaoglu/genome 
cd /data/courses/rnaseq/toxoplasma_de/tagaoglu/genome

# Download reference genome files
rsync -av rsync://ftp.ensembl.org/ensembl/pub/release-101/fasta/mus_musculus/dna/Mus_musculus.GRCm38.dna.primary_assembly.fa.gz .
rsync -av rsync://ftp.ensembl.org/ensembl/pub/release-101/fasta/mus_musculus/dna/CHECKSUMS .


# Check if downloaded files are intact 
sum Mus_musculus.GRCm38.dna.primary_assembly.fa.gz
grep Mus_musculus.GRCm38.dna.primary_assembly.fa.gz CHECKSUMS


# Create and go to the TP directory 
mkdir /data/courses/rnaseq/toxoplasma_de/tagaoglu/annotation 
cd /data/courses/rnaseq/toxoplasma_de/tagaoglu/annotation


# Download annotation files
rsync -av rsync://ftp.ensembl.org/ensembl/pub/release-101/gtf/mus_musculus/Mus_musculus.GRCm38.101.gtf.gz .
rsync -av rsync://ftp.ensembl.org/ensembl/pub/release-101/gtf/mus_musculus/CHECKSUMS .


# Check if downloaded files are intact 
sum Mus_musculus.GRCm38.101.gtf.gz
grep Mus_musculus.GRCm38.101.gtf.gz CHECKSUMS
