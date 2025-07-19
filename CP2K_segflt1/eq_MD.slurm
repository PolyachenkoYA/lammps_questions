#!/bin/bash
#SBATCH --job-name=Mo-S_2-cellOpt-PBE-rVV10-Cell4x4x1-T300.0-Strn0.0-SM1-0.0-Lz50.0-3-MD       # create a short name for your job
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1              # total number of tasks across all nodes
#SBATCH --cpus-per-task=8        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem=37676M       # memory per cpu-core (4G is default)
#SBATCH --time=24:00:00          # total run time limit (HH:MM:SS)
#SBATCH --mail-type=all
#SBATCH --mail-user=yp1065@princeton.edu
###SBATCH --output=OUTPUTFILEPATH

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

module purge
#source ~/.bashrc_cp2k
module use --append /scratch/gpfs/USERNAME/modulefiles/
module load cp2k/cpu-container-2025.1

path_mode="slurm"
#path_mode="auto"

if [ "${path_mode}" = "auto" ]; then
  cont_suff=""
  cont_suff="_cont"
  cont_suff="_cont_2"

  basename="eq_MD"
  
  basename="${basename}${cont_suff}"
  inname="${basename}.inp"

else
  basename="eq_MD"

  inname="eq_MD.inp"
fi

outname="${basename}.out"

# ========== run ========
rm ${outname}
srun cp2k.psmp -i ${inname} -o ${outname}
