# Script name: 

# Since this job was split between our group, this script was written just for 4 samples 
# and sbatch command should be run like this:
# sbatch hisat2_mapping.sh SRR7821951 SRR7821952 SRR7821953 SRR7821969

#!/bin/bash


#SBATCH --mail-user=tugba.agaoglu@students.unibe.ch
#SBATCH --mail-type=begin_,end
#SBATCH --job-name=hisat2_mapping
#SBATCH --cpus-per-task=4
#SBATCH --time=2:00:00
#SBATCH --mem-per-cpu=8000M
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_output/output_hisat2_mapping_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_error/error_hisat2_mapping_%j.e
#SBATCH --array=0-3


# Sample names passed as arguments. Do not introduce extensions in the sbatch command.
SAMPLES=("$@")


# Load modules 
module add UHTS/Aligner/hisat/2.2.1


# Create a working directory and go to the working directory
mkdir /data/courses/rnaseq/toxoplasma_de/tagaoglu/2_map_reads/hisat2_mapping
cd /data/courses/rnaseq/toxoplasma_de/tagaoglu/2_map_reads


READ_1=/data/courses/rnaseq/toxoplasma_de/reads/${SAMPLES[$SLURM_ARRAY_TASK_ID]}_1.fastq.gz
READ_2=/data/courses/rnaseq/toxoplasma_de/reads/${SAMPLES[$SLURM_ARRAY_TASK_ID]}_2.fastq.gz


# Map reads onto reference (paired-end) with hisat2
hisat2 -p 4 --rna-strandness RF -x hisat2_index/Mus_musculus.GRCm38 -1 ${READ_1} -2 ${READ_2} -S hisat2_mapping/${SAMPLES[$SLURM_ARRAY_TASK_ID]}.sam
