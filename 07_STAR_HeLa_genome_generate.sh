#!/bin/bash

#SBATCH --mem-per-cpu=150000
#SBATCH -p bigmem
#SBATCH --mail-user=john.casement@ncl.ac.uk
#SBATCH --mail-type=FAIL,TIME_LIMIT
#SBATCH -n 11
#SBATCH -o logs/%x.%j.out
#SBATCH -A scbsu

STAR=/nobackup/proj/scbsu/software/STAR-2.6.0a/bin/Linux_x86_64/STAR
BASE_DIR=/nobackup/proj/scbsu/James_Clark
mkdir -p ${BASE_DIR}/genome/STAR_HeLa_index

${STAR} --runThreadN 11 \
        --runMode genomeGenerate \
        --genomeDir ${BASE_DIR}/genome/STAR_HeLa_index \
        --genomeFastaFiles ${BASE_DIR}/genome/GRCh38.primary_assembly.genome.fa \
        --sjdbGTFfile ${BASE_DIR}/genome/gencode.v29.annotation.gtf \
        --sjdbOverhang 99 \
--limitGenomeGenerateRAM=150000000000
