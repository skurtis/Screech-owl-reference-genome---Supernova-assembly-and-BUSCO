#!/bin/sh
#SBATCH -n 16                    # Number of cores
#SBATCH -N 1
#SBATCH -p general      # Partition to submit to
#SBATCH -t 3-00:00              # Runtime in D-HH:M
#SBATCH --mem=64000               # Memory pool for all cores (see also --mem-per-cpu)
#SBATCH -J supernova_assemble
#SBATCH -o supernova_assemble_%j.out      # File to which STDOUT will be written
#SBATCH -e supernova_assemble_%j.err      # File to which STDERR will be written

module load supernova

supernova mkoutput --style=pseudohap2 --asmdir=/n/holylfs/LABS/edwards_lab/Users/skurtis/WGS_Supernova/Masio_assembly2_general/Mega_asio_25805/outs/assembly --outprefix=Masio_pseudohap2 --headers=short

# This is the SECOND STEP of the Supernova assembler. The assembly files are processed, and the genome assembly FASTA file is created. The pseudohap2 option allows for both pseudohaplotypes to be extracted. Only the first pseudohaplotype is used in downstream analyses.