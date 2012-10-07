source /data/apps/scripts/xintel.sh
export MPI_ROOT=/usr/mpi/intel/openmpi-1.4.3
source $MPI_ROOT/bin/mpivars.sh
export OMPI_CC=icc
export OMPI_CXX=icpc
export OMPI_F77=ifort
export OMPI_FC=ifort
