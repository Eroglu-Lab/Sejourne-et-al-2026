#!/bin/bash
#SBATCH --mail-user=gms50@duke.edu                       # User email to receive updates
#SBATCH --mail-type=ALL                                        # Get an email when the job begins, ends, or if it fails
#SBATCH -J bw2matrix                                  # Name for job
#SBATCH -o bw2m_j%j.out                            # File to write STDOUT to
#SBATCH -e bw2m_j%j.err                            # File to write error output to
#SBATCH -N 1                                                   # Number of nodes/computers
#SBATCH -n 16                                                  # Number of cores
#SBATCH -t 48:00:00                                            # Ask for no more than 48 hours
#SBATCH --mem=40gb                                             # Ask for no more than 16 GB of memory

outDir="matrices"

mkdir -p $outDir

## computeMatrix in reference-point mode (reference point = center)
computeMatrix reference-point \
       --referencePoint TSS \
       -R testFiles/zbtb20_astro_promoters_TSS.bed \
       -S zbtb20_h3k4me3_bigwigs/*merged.normalized.normalized.bw \
       --skipZeros \
       --upstream 1500 --downstream 1500 \
       -o "$outDir"/matrix_compare_zbtb20_TSS.gz \
       --verbose \
