#!/bin/bash
#SBATCH --job-name=bad
#SBATCH --time=01:00:00          # total run time limit (HH:MM:SS)
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=8               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=1G         # memory per cpu-core (4G is default)
###SBATCH --mail-type=begin        # send email when job begins
###SBATCH --mail-type=end          # send email when job ends
#SBATCH --mail-type=ALL
#SBATCH --mail-user=polyachenkoya@princeton.edu
#SBATCH --output=bad.out
#SBATCH --constraint=cascade,skylake
#========================================

module purge
module load intel/19.1.1.217
module load intel-mpi/intel/2019.7
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export SRUN_CPUS_PER_TASK=$SLURM_CPUS_PER_TASK

cmd="$HOME/.local/bin/lmp_della_2022_3_my -sf intel -in bad.in"

srun $cmd || $cmd