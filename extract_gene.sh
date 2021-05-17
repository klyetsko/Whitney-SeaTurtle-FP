#!/bin/bash
#SBATCH --job-name=extract_gene
#SBATCH --nodes=1
#SBATCH --mem=1gb
#SBATCH --time=30:00
#SBATCH --output=extract_gene-%j.log
pwd;hostname;date
grep '>' extract_Ackermann_Ref_ChHV5.txt | awk 'BEGIN {FS="_";OFS=""} {print $7,"_",$8}' extract_headers.txt
while read line; do
for SAMPLE in "$@"; do
printf "%s%s\n" ">" $SAMPLE >> ${line}_tmp.txt
perl -pe '$. > 1 and /^>/ ? print "\n" : chomp' extract_${SAMPLE}.txt | grep "$line" -A 1 | xargs printf "%s\n" >> ${line}_tmp.txt
done
grep -P "_[0-9]+_[0-9]+" -v ${line}_tmp.txt > ${line}.txt
done < extract_headers.txt
rm *tmp.txt
date
