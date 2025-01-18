#!/usr/bin/env bash

# Creates file that looks like
# sample,fq1,fq2
# SampleName,../rel/path/to/fq_R1.fastq.gz,../rel/path/to/fq_R2.fastq.gz,../path/to/refgenome.fa

echo sample,fq1,fq2,refgenome > fastp_table.csv
parallel echo {},reads/{}_R1.fastq.gz,reads/{}_R2.fastq.gz :::: sample_names.txt >> fastp_table.csv