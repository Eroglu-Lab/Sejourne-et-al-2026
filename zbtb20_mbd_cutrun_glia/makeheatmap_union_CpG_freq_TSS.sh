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

plotHeatmap -m "$matDir"/union_CpG_TSS.mat.gz \
        -o "$outDir"/union_TSS_CpG_freq_unclustered.svg \
        --colorMap "Blues" 'bwr' 'bwr' 'bwr' 'bwr' \
        --outFileSortedRegions "$outDir2"/union_TSS_sorted_CpG_freq_unclustered.bed \
        --outFileNameMatrix "$outDir3"/union_TSS_sorted_CpG_freq_unclustered.gz \
	--whatToShow 'plot, heatmap and colorbar' \
	--heatmapHeight 10 \
	--sortUsing max \
	--sortUsingSamples 1 \
	--yMin 0 0 0 -1 -1 --yMax 0.5 22 22 2.5 2.5 \
	--zMin 0 0 0 0 0 --zMax 0.6 20 20 5 5 \
	--samplesLabel CpG_freq Zbtb20_WT Zbtb20_KO MeCP2_WT MeCP2_KO \
	#--verbose \
