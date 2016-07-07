#!/bin/bash
#SBATCH --output=output_clearmap.out
#SBATCH --error=error_clearmap.err
#SBATCH --job-name=clearmap
#SBATCH --mem=200GB
#SBATCH --cpus-per-task=6

srun python ClearMap/Scripts/process_template.py
