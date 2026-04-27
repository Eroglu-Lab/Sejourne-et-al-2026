#!/bin/bash
#SBATCH --mail-user=gms50@duke.edu                       # User email to receive updates
#SBATCH --mail-type=ALL                                        # Get an email when the job begins, ends, or if it fails
#SBATCH -J plotProfile                                  # Name for job
#SBATCH -o profile_j%j.out                            # File to write STDOUT to
#SBATCH -e profile_j%j.err                            # File to write error output to
#SBATCH -N 1                                                   # Number of nodes/computers
#SBATCH -n 16                                                  # Number of cores
#SBATCH -t 48:00:00                                            # Ask for no more than 48 hours
#SBATCH --mem=40gb                                             # Ask for no more than 40 GB of memory

matDir="./matrices"

outDir="plots"
outDir2="clustered_bedfiles"
outDir3="matrix_tables"

mkdir -p $outDir
mkdir -p $outDir2
mkdir -p $outDir3

plotProfile -m "$matDir"/matrix_compare_zbtb20_union_grouped_TSS_zbonly.gz \
        -o "$outDir"/zbtb20_union_TSS_grouped_profile_zbonly.svg \
        --perGroup \
	--samplesLabel WT KO \
	--legendLocation best \
	--plotHeight 4 \
	--plotWidth 8 \
	--colors dodgerblue red \
	#--verbose \
