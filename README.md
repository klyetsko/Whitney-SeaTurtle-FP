# Whitney-SeaTurtle-FP
Code written to manipulate transcriptomic and genomic files for the study of fibropapillomatosis in green sea turtles

Any questions, please contact Kelsey Yetsko at klyetsko@gmail.com

# extract_gene.sh
Whole genome sequence data from tumor and non-tumor samples from sea turtle patients (multiple species) were first aligned to the Chelonid alphaherpesvirus 5 (ChHV5) reference genome [GenBank accession number: HQ878327.2] using Bowtie2. 

The resulting BAM alignment files were used as input for Ococo (v0.1.2.6) to generate consensus sequences for each sample. The reference ChHV5 genome was also selected as the ‘backbone’ of the new consensus sequences. The strategy for building the consensus sequences was performed on a majority basis, with Ococo inferring single nucleotide polymorphisms (SNPs) on a majority basis, and then constructing a new consensus sequence for downstream analysis on aligned reads. 

The resulting consensus sequences were used to generate the nucleotide diversity and identify positive and reduced selection processes of each ChHV5 gene. Each gene was isolated from each genome sequence using extractseq (version 5.0.0) on Galaxy, inputting gene regions and opting to extract each region to a new sequence. This produced the text files in FASTA format that were used as input for the script archived here.

This script extracts each individual gene from each extractseq output file and combines them into a single file per gene (so for the ChHV5 genome, 104 files total, one for each gene). The sequences in each file are separated by sample of origin based on the headers in the extractseq file used as input, and are in FASTA format. 

These gene text files are then used as input into DNASP (v5) for gene-by-gene analysis to a reference genome.

Included in this repository are the script, extract_gene.sh, the extractseq file generated from the ChHV5 reference genome (extract_Ackermann_Ref_ChHV5.txt) and is used to generate the extract_headers.txt file, and an example input file (generated from extractseq) in order to see how the input files should be formatted and to test code (extract_INPUT_EXAMPLE.txt). 

To run the script in a bash environment, you would type the following:

> sbatch extract_gene.sh [SAMPLE NAME]

To run the script in a bash environment using the example input file, you would type the following:

> sbatch extract_gene.sh INPUT_EXAMPLE

You should have the extract_Ackermann_Ref_ChHV5.txt and your input files in the same directory as you run the extract_gene.sh command
