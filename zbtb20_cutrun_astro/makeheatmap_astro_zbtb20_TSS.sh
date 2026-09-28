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

plotHeatmap -m "$matDir"//matrix_compare_zbtb20_TSS.gz \
        -o "$outDir"/astro_zbtb20_TSS.pdf \
        --colorMap 'cool' \
	--heatmapHeight 10 \
        --outFileSortedRegions "$outDir2"/astro_zbtb20_TSS.bed \
        --outFileNameMatrix "$outDir3"/astro_zbtb20_TSS.gz \
	--whatToShow 'plot, heatmap and colorbar' \
	--zMin 0 0 0 --zMax 15 15 15 \
	--yMax 40 40 40 \
	--sortUsingSamples 1 \
	--sortUsing max \
	#--clusterUsingSamples 1 \
	#--kmeans 2 \
	#--perGroup \
	#--samplesLabel MeCP2_WT GST_WT MeCP2_KO GST_KO \
	#--verbose \
