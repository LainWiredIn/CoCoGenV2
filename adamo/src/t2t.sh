#!/usr/bin/env bash

#module load generic anaconda3/2020.11
module load volta nvidia/cuda11.2-cudnn8.1.0

CONDA_BASE=$(conda info --base)
source $CONDA_BASE/etc/profile.d/conda.sh

conda activate env

# @AdaMo basts 0shot
sbatch t2t_adamo.job basic4basts java train @  # 4871918
sbatch t2t_adamo.job basic4basts python train @  # 4871919

# @AdaMo sit noisy
sbatch t2t_noisy.job basic java train = 0.09  # 4872072
sbatch t2t_noisy.job basic python train = 0.09  # 4872076

conda deactivate
