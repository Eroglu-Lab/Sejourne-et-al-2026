#!/bin/bash
#SBATCH --mail-user=gms50@duke.edu                       # User email to receive updates
#SBATCH --mail-type=ALL                                        # Get an email when the job begins, ends, or if it fails
#SBATCH -J bwcompare                                  # Name for job
#SBATCH -o compare_bw_j%j.out                            # File to write STDOUT to
#SBATCH -e compare_bw_j%j.err                            # File to write error output to
#SBATCH -N 1                                                   # Number of nodes/computers
#SBATCH -n 16                                                  # Number of cores
#SBATCH -t 48:00:00                                            # Ask for no more than 48 hours
#SBATCH --mem=40gb                                             # Ask for no more than 16 GB of memory

bwDir="/hpc/dctrl/gms50/cut_and_run/deeptools/zbtb20_mecp2_bigwigs"

bigwigCompare -b1 "$bwDir"/05_mecp2_wt_chip_merged.normalized.normalized.bw \
        -b2 "$bwDir"/06_mecp2_wt_ctrl_merged.normalized.normalized.bw \
        -o "$bwDir"/03_mecp2_wt_merged.difference.bw \
	--operation subtract
wait

bigwigCompare -b1 "$bwDir"/07_mecp2_ko_chip_merged.normalized.normalized.bw \
        -b2 "$bwDir"/08_mecp2_ko_ctrl_merged.normalized.normalized.bw \
        -o "$bwDir"/04_mecp2_ko_merged.difference.bw \
	--operation subtract
