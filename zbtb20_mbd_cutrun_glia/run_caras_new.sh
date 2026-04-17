#!/bin/bash
#SBATCH --mail-user=gm50@duke.edu                       # User email to receive updates
#SBATCH --mail-type=ALL                                        # Get an email when the job begins, ends, or if it fails
#SBATCH -J run_caras                                  # Name for job
#SBATCH -o run_caras_j%j.out                            # File to write STDOUT to
#SBATCH -e run_caras_j%j.err                            # File to write error output to
#SBATCH -N 1                                                   # Number of nodes/computers
#SBATCH -n 16                                                  # Number of cores
#SBATCH -t 48:00:00                                            # Ask for no more than 48 hours
#SBATCH --mem=16gb                                             # Ask for no more than 16 GB of memory

module load FastQC/0.11.7
module load BBMap/38.63

# Set variables (edit these paths and values as needed)
ANALYSIS="bulk"
MODE="paired"
GENOME_DIR="/hpc/dctrl/gms50/tools/caras/caras_installation/caras_scripts/genomes/"
OUTPUT_DIR="/hpc/dctrl/gms50/cut_and_run/caras_output"
SET_NAME="zbtb20_wt"
REF="mm10"
NORM_REF="eColiK12"
SAMPLE_TABLE="/hpc/dctrl/gms50/cut_and_run/caras_output/zbtb20_wt_sample_table.tsv"


# Run the CARAS Python script
 python /hpc/dctrl/gms50/tools/caras/caras_installation/caras_scripts/caras.py \
  --analysis "$ANALYSIS" \
  --mode "$MODE" \
  --ref "$REF" \
  --genome "$GENOME_DIR" \
  --norm_ref "$NORM_REF" \
  --output "$OUTPUT_DIR" \
  --setname "$SET_NAME" \
  --sample_table "$SAMPLE_TABLE" \
  --goann \
  --pathann \
  --deltemp \
  --homer_motif 5 \
  --meme_motif 5 