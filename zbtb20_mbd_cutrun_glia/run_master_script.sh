#!/bin/bash
#SBATCH --job-name=run_master_job
#SBATCH --output=run_master_%j.out
#SBATCH --error=run_master_%j.err
#SBATCH --time=48:00:00              # Max run time (adjust if needed)
#SBATCH --mem=500G                   # Memory request (adjust as needed)
#SBATCH --cpus-per-task=8            # Number of CPUs (adjust as needed)
#SBATCH --partition=common         # Replace with your partition name
#SBATCH --mail-type=ALL         # Notifications (optional)
#SBATCH --mail-user=gms50@duke.edu  # Your email (optional)

# Load any modules if needed, e.g. java or bbmap
# module load java
# module load bbmap

# Run your script
bash MASTER_script.sh
