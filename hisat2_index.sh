#!/bin/bash


#SBATCH --mail-user=tugba.agaoglu@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --job-name=hisat2_index
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8000M
#SBATCH --time=3:00:00
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_output/output_hisat2_index_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_error/error_hisat2_index_%j.e


# Load modules 
module add UHTS/Aligner/hisat/2.2.1


# Create a working directory and go to there 
mkdir /data/courses/rnaseq/toxoplasma_de/tagaoglu/2_map_reads
mkdir /data/courses/rnaseq/toxoplasma_de/tagaoglu/2_map_reads/hisat2_index
cd /data/courses/rnaseq/toxoplasma_de/tagaoglu/2_map_reads


REF_GENOME=/data/courses/rnaseq/toxoplasma_de/tagaoglu/genome/Mus_musculus.GRCm38.dna.primary_assembly.fa


# Index REF for hisat2
hisat2-build -p 1 ${REF_GENOME} hisat2_index/Mus_musculus.GRCm38
