#!/bin/bash
#SBATCH --job-name=abf_test       # create a short name for your job
#SBATCH --nodes=1                # node count
###SBATCH --ntasks=14               # total number of tasks across all nodes
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=4G         # memory per cpu-core (4G is default)
#SBATCH --time=01:00:00          # total run time limit (HH:MM:SS)
###SBATCH --mail-type=begin        # send email when job begins
###SBATCH --mail-type=end          # send email when job ends
###SBATCH --mail-user=yp1065@princeton.edu
#SBATCH --constraint=cascade,skylake

module purge
module load intel/19.1.1.217
module load intel-mpi/intel/2019.7
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

#$HOME/.local/bin/lmp_della_2022_3_host
#cmd=" lmp_della_2022_3_CV_my -in test.in "
#cmd=" lmp_della_2022_3_CV_dipole_ser_my -in in.colvars-bigint "
cmd=" /home/yp1065/software/lammps-static/bin/lmp -in in.colvars-bigint "

srun ${cmd} || ${cmd}
### 2 commands are because
### 1) it tries to run as a production MPI
### 2) only if 'srun' fails (this is what || does) - it tries to run aka in a terminal

