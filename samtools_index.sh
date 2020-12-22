# Script Name: samtools_index.sh

# Since this job was split between our group, this script was written just for 4 samples 
# and sbatch command should be run like this: sbatch hisat2_mapping.sh SRR7821951 SRR7821952 SRR7821953 SRR7821969


#!/bin/bash


#SBATCH --mail-user=tugba.agaoglu@students.unibe.ch
#SBATCH --mail-type=begin_,end
#SBATCH --job-name=samtools_index
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --mem-per-cpu=4000M
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_output/output_samtools_index_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_error/error_samtools_index_%j.e
#SBATCH --array=0-3


# Sample names passed as arguments. Do not introduce extensions in the sbatch command.
SAMPLES=("$@")


# Load modules 
module add UHTS/Analysis/samtools/1.10


# Go to the working directory
cd /data/courses/rnaseq/toxoplasma_de/tagaoglu/2_map_reads


# Index the coordinate sorted bam files with samtools
samtools index sorted_bam_files/${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sorted.bam
