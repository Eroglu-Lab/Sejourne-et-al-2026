#!/bin/bash
#SBATCH --mail-user=gms50@duke.edu                       # User email to receive updates
#SBATCH --mail-type=ALL                                        # Get an email when the job begins, ends, or if it fails
#SBATCH -J makeHeatmap                                  # Name for job
#SBATCH -o heatmap_j%j.out                            # File to write STDOUT to
#SBATCH -e heatmap_j%j.err                            # File to write error output to
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

plotProfile -m "$outDir3"/union_TSS_sorted_CpG_freq_unclustered.gz \
        -o "$outDir"/union_TSS_CpG_freq_unclustered_zb_pergroup.svg \
	--yMin 0 --yMax 22 \
	--colors gray dodgerblue red dodgerblue red \
	--plotWidth 6 \
	--perGroup \
	#--samplesLabel Zbtb20 \
	#--verbose \
