# Script Name: samtools_sort.sh

# Since this job was split between our group, this script was written just for 4 samples 
# and sbatch command should be run like this: sbatch hisat2_mapping.sh SRR7821951 SRR7821952 SRR7821953 SRR7821969


#!/bin/bash


#SBATCH --mail-user=tugba.agaoglu@students.unibe.ch
#SBATCH --mail-type=begin_,end
#SBATCH --job-name=samtools_sort
#SBATCH --cpus-per-task=4
#SBATCH --time=1:00:00
#SBATCH --mem-per-cpu=25000M
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_output/output_samtools_sort_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_error/error_samtools_sort_%j.e
#SBATCH --array=0-3


# Sample names passed as arguments. Do not introduce extensions in the sbatch command.
SAMPLES=("$@")


# Load modules 
module add UHTS/Analysis/samtools/1.10


# Create a working directory and go to the working directory
mkdir /data/courses/rnaseq/toxoplasma_de/tagaoglu/2_map_reads/sorted_bam_files
cd /data/courses/rnaseq/toxoplasma_de/tagaoglu/2_map_reads


# Sort the bam files by genomic coordinates with samtools
samtools sort -m 25000M -@ 4 -o sorted_bam_files/${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sorted.bam -T temp bam_files/${SAMPLES[$SLURM_ARRAY_TASK_ID]}.bam
