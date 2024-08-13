#!/bin/sh
#SBATCH -n 64                    # Number of cores
#SBATCH -N 1
#SBATCH -p general      # Partition to submit to
#SBATCH -t 7-00:00              # Runtime in D-HH:M
#SBATCH --mem=256000               # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -J supernova_assemble
#SBATCH -o supernova_assemble_%j.out      # File to which STDOUT will be written
#SBATCH -e supernova_assemble_%j.err      # File to which STDERR will be written

module load supernova

supernova run --id Mega_asio_25805 --fastqs /n/holylfs/LABS/edwards_lab/Users/skurtis/ChromiumReads --maxreads 'all' 

# This is the FIRST STEP of running the Supernova assembler. Raw sequencing reads are fed into the Supernova assembler, which then generates the assembly folder and files.