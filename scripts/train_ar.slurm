#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --job-name=train_vall-e
#SBATCH --output=/home/s6kogase/vall-e/out/train-ar-%j.out
#SBATCH --error=/home/s6kogase/vall-e/out/train-ar-%j.err
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=8
#SBATCH --partition=A100medium

source ${HOME}/.bashrc

source module_load

echo "Hello from job $SLURM_JOB_ID on $(hostname) at $(date)."

python -m vall_e.train yaml=config/ljspeech/ar.yml

echo "Goodbye from job $SLURM_JOB_ID on $(hostname) at $(date)."