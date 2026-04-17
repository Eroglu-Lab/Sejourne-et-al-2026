#!/bin/bash
#SBATCH --mail-user=gms50@duke.edu                       # User email to receive updates
#SBATCH --mail-type=ALL                                        # Get an email when the job begins, ends, or if it fails
#SBATCH -J findmotifs                                   # Name for job
#SBATCH -o findmotifs_j%j.out                            # File to write STDOUT to
#SBATCH -e findmotifs_j%j.err                            # File to write error output to
#SBATCH -N 1                                                   # Number of nodes/computers
#SBATCH -n 16                                                  # Number of cores
#SBATCH -t 48:00:00                                            # Ask for no more than 48 hours
#SBATCH --mem=40gb                                             # Ask for no more than 16 GB of memory

findMotifsGenome.pl /hpc/dctrl/gms50/cut_and_run/homer/bedfiles/zbtb20_wt_promoters_TSS_1.5kb.bed mm10 /hpc/dctrl/gms50/cut_and_run/homer/wt_motifs/ -bg /hpc/dctrl/gms50/cut_and_run/homer/bedfiles/snrnaseq_promoters_TSS_3kb.bed -size 200 -mis 4 -mask

findMotifsGenome.pl /hpc/dctrl/gms50/cut_and_run/homer/bedfiles/zbtb20_ko_promoters_TSS_1.5kb.bed mm10 /hpc/dctrl/gms50/cut_and_run/homer/ko_motifs/ -bg /hpc/dctrl/gms50/cut_and_run/homer/bedfiles/snrnaseq_promoters_TSS_3kb.bed -size 200 -mis 4 -mask
