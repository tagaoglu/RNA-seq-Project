# Script Name: featureCounts.sh

#!/bin/bash


#SBATCH --mail-user=tugba.agaoglu@students.unibe.ch
#SBATCH --mail-type=begin,end
#SBATCH --job-name=featureCounts
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=1000M
#SBATCH --time=2:00:00
#SBATCH --partition=pcourse80
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_output/output_featureCounts_%j.o
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_error/error_featureCounts_%j.e


# Load modules 
module add UHTS/Analysis/subread/2.0.1


# Create a working directory and go to there 
mkdir /data/courses/rnaseq/toxoplasma_de/tagaoglu/3_featureCounts
cd /data/courses/rnaseq/toxoplasma_de/tagaoglu/3_featureCounts

# Create text output file (for count matrix)
touch featureCounts.txt


ANNOTATION_FILE=/data/courses/rnaseq/toxoplasma_de/annotation/Mus_musculus.GRCm38.101.gtf
TEXT_OUTPUT=/data/courses/rnaseq/toxoplasma_de/tagaoglu/3_featureCounts/featureCounts.txt
INPUT_FILES=/data/courses/rnaseq/toxoplasma_de/mapping/*.sorted.bam


# Count the number of reads per gene
featureCounts -p —s 2 -a ${ANNOTATION_FILE} -o ${TEXT_OUTPUT} ${INPUT_FILES}
