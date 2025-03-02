#!/bin/bash

# shellcheck disable=all

# Load HPC modules
ml --force purge
ml Stages/2024 GCC OpenMPI CUDA/12 cuDNN MPI-settings/CUDA
ml Python CMake HDF5 PnetCDF libaio mpi4py

# Activate Python virtual env
source .venv/bin/activate
