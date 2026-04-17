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
  -S CpG_bigwigs/*.bw \
  -R testFiles/ucsc_union_cpg.bed \
  --referencePoint TSS \
  -b 1500 -a 1500 \
  --binSize 10 \
  -o "$outDir"/ucsc_union_CpG_TSS.mat.gz \
  --verbose \
