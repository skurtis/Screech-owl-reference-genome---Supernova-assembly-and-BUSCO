#!/bin/bash 
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -p general
#SBATCH -e BUSCO_all_reads_%j.err           			# File to which STDERR will be written
#SBATCH -o BUSCO_all_reads_%j.out         			# File to which STDOUT will be written
#SBATCH -J BUSCO_all_reads                		# Job name
#SBATCH --mem=64000                     # Memory requested
#SBATCH -t 7-00:00:00                # Runtime in HH:MM:SS

source new-modules.sh
module purge
module load centos6/0.0.1-fasrc01
module load BUSCO/3.0.2-fasrc01 # Already a package
export BUSCO_CONFIG_FILE="/n/holylfs/LABS/edwards_lab/Users/skurtis/WGS_Supernova/BUSCO/config.ini"
# cp -r /n/sw/fasrcsw/apps/Core/augustus/3.0.3-fasrc02/config /n/holylfs/LABS/edwards_lab/Users/skurtis/WGS_Supernova/BUSCO/BUSCO_config
# The above copies the module information for Augustus into working directory
export AUGUSTUS_CONFIG_PATH="/n/holylfs/LABS/edwards_lab/Users/skurtis/WGS_Supernova/BUSCO/BUSCO_config/config"

run_BUSCO.py -c16 -o Masio_pseudohap2a1_BUSCO1 -i /n/holylfs/LABS/edwards_lab/Users/skurtis/WGS_Supernova/Masio_pseudohap2.1.fasta -l /n/holylfs/LABS/edwards_lab/Users/skurtis/WGS_Supernova/BUSCO/odb9_Zalb/aves_odb9 -m geno

# The above script runs the first pseudohaplotype file (the reference genome FASTA file) through BUSCO using the zebra finch as a reference. BUSCO checks for quality and completeness of the genome assembly. 
