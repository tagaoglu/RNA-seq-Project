# Script name: quality_control.sh

#!/bin/bash         

#SBATCH --job-name=quality_control       
#SBATCH --output=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_output/output_fastqc_%j.o       
#SBATCH --error=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_error/error_fastqc_%j.e        
#SBATCH --ntasks=1      
#SBATCH --cpus-per-task=1       
#SBATCH --mem-per-cpu=1000        
#SBATCH --time=02:00:00       
#SBATCH --mail-user=tugba.agaoglu@students.unibe.ch         
#SBATCH --mail-type=begin,end        
#SBATCH --partition=pcourse80           


# Load modules         
module add UHTS/Quality_control/fastqc/0.11.7
module add UHTS/Analysis/MultiQC/1.8


# Create and go to the TP directory        
mkdir /data/courses/rnaseq/toxoplasma_de/tagaoglu/1_quality_checks         
cd /data/courses/rnaseq/toxoplasma_de/tagaoglu/1_quality_checks 


# Link the reads/sample locally           
ln -s /data/courses/rnaseq/toxoplasma_de/reads/*.fastq.gz . 


# Check quality of your data with fastqc        
fastqc -t 2 *.fastq.gz 


# Use multiqc to combine all results           
multiqc .

