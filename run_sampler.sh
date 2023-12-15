#!/bin/bash

#SBATCH --time 4:00:00
#SBATCH --mem 128G
#SBATCH --nodes 1
#SBATCH --ntasks 1
#SBATCH --cpus-per-task 50
#SBATCH --job-name shsampler
#SBATCH --array=1 #-40 #Run 40 copies of the code = 4000 samples
#SBATCH --partition cosma8-serial
#SBATCH --account dp270
#SBATCH --output /cosma/home/dp270/dc-bull2/shsampler-%J.out

source ~/.bashrc
conda deactivate
conda activate hera_sim

SCRIPT="/cosma/home/dp270/dc-bull2/hydra-sh/vis_realified.py"
export HYDRA_DATA_SEED=20

echo $@

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
python -u $SCRIPT "$@" -dir=shrealisations -data_seed=$HYDRA_DATA_SEED -jobid=$SLURM_ARRAY_TASK_ID
