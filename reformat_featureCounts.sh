# Script Name: reformat_featureCounts.sh

tail -n+2 featureCounts.txt | cut -f1,7-22 > counts.txt
sed -ie 's/\/data\/courses\/rnaseq\/toxoplasma_de\/mapping\///g' counts.txt; sed -ie 's/\.sorted\.bam//g' counts.txt
