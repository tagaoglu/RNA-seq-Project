# Quality Check
# Script Name: fastqc_control.sh


#!/bin/bash         

#SBATCH --job-name=fastqc_sample1         
#SBATCH —output=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_output/output_fastqc_%j.o       
#SBATCH —error=/data/courses/rnaseq/toxoplasma_de/tagaoglu/messages_error/error_fastqc_%j.e        
#SBATCH --ntasks=1      
#SBATCH —cpus-per-task=1       
#SBATCH --mem-per-cpu=1000        
#SBATCH --time=02:00:00       
#SBATCH --mail-user=tugba.agaoglu@students.unibe.ch         
#SBATCH --mail-type=begin,end        
#SBATCH --partition=pcourse80           


#load modules         
module add UHTS/Quality_control/fastqc/0.11.7
module add UHTS/Analysis/MultiQC/1.8


#create and go to the TP directory        
mkdir /data/courses/rnaseq/toxoplasma_de/tagaoglu/1_quality_checks         
cd /data/courses/rnaseq/toxoplasma_de/tagaoglu/1_quality_checks 


#link the reads/sample locally           
ln -s /data/courses/rnaseq/toxoplasma_de/reads/*.fastq.gz . 


#check quality of your data with fastqc        
fastqc -t 2 *.fastq.gz 


#use multiqc to combine all results           
multiqc .
