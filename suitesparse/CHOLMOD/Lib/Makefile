#===============================================================================
# CHOLOMD/Lib/Makefile: for compiling the CHOLMOD library
#===============================================================================

default: all

ccode: all

include ../../UFconfig/UFconfig.mk

C = $(CC) $(CFLAGS) $(CHOLMOD_CONFIG)

all: libcholmod.a

library: libcholmod.a

purge: distclean

distclean: clean
	- $(RM) libcholmod.a

clean:
	- $(RM) $(CLEAN)

#-------------------------------------------------------------------------------
# ../Include/ directory contains all include files:
#-------------------------------------------------------------------------------

INC =   ../Include/cholmod.h \
	../Include/cholmod_blas.h \
	../Include/cholmod_check.h \
	../Include/cholmod_cholesky.h \
	../Include/cholmod_complexity.h \
	../Include/cholmod_config.h \
	../Include/cholmod_core.h \
	../Include/cholmod_internal.h \
	../Include/cholmod_matrixops.h \
	../Include/cholmod_modify.h \
	../Include/cholmod_partition.h \
	../Include/cholmod_supernodal.h \
	../Include/cholmod_template.h

#-------------------------------------------------------------------------------
# The 7 CHOLMOD library modules (int, double)
#-------------------------------------------------------------------------------

CORE = cholmod_aat.o cholmod_add.o cholmod_band.o \
	cholmod_change_factor.o cholmod_common.o cholmod_complex.o \
	cholmod_copy.o cholmod_dense.o cholmod_error.o cholmod_factor.o \
	cholmod_memory.o cholmod_sparse.o \
	cholmod_transpose.o cholmod_triplet.o

CHECK = cholmod_check.o cholmod_read.o cholmod_write.o

CHOLESKY = cholmod_amd.o cholmod_analyze.o cholmod_colamd.o \
	cholmod_etree.o cholmod_factorize.o cholmod_postorder.o \
	cholmod_rcond.o cholmod_resymbol.o cholmod_rowcolcounts.o \
	cholmod_rowfac.o cholmod_solve.o cholmod_spsolve.o

MATRIXOPS = cholmod_drop.o cholmod_horzcat.o cholmod_norm.o \
	cholmod_scale.o cholmod_sdmult.o cholmod_ssmult.o \
	cholmod_submatrix.o cholmod_vertcat.o cholmod_symmetry.o

PARTITION = cholmod_ccolamd.o cholmod_csymamd.o \
	cholmod_metis.o cholmod_nesdis.o cholmod_camd.o

MODIFY = cholmod_rowadd.o cholmod_rowdel.o cholmod_updown.o

SUPERNODAL = cholmod_super_numeric.o cholmod_super_solve.o \
	cholmod_super_symbolic.o

DI = $(CORE) $(CHECK) $(CHOLESKY) $(MATRIXOPS) $(MODIFY) $(SUPERNODAL) \
	$(PARTITION)

#-------------------------------------------------------------------------------
# CHOLMOD library modules (long, double)
#-------------------------------------------------------------------------------

LCORE = cholmod_l_aat.o cholmod_l_add.o cholmod_l_band.o \
	cholmod_l_change_factor.o cholmod_l_common.o cholmod_l_complex.o \
	cholmod_l_copy.o cholmod_l_dense.o cholmod_l_error.o \
	cholmod_l_factor.o cholmod_l_memory.o \
	cholmod_l_sparse.o cholmod_l_transpose.o cholmod_l_triplet.o

LCHECK = cholmod_l_check.o cholmod_l_read.o cholmod_l_write.o

LCHOLESKY = cholmod_l_amd.o cholmod_l_analyze.o cholmod_l_colamd.o \
	cholmod_l_etree.o cholmod_l_factorize.o cholmod_l_postorder.o \
	cholmod_l_rcond.o cholmod_l_resymbol.o cholmod_l_rowcolcounts.o \
	cholmod_l_rowfac.o cholmod_l_solve.o cholmod_l_spsolve.o

LMATRIXOPS = cholmod_l_drop.o cholmod_l_horzcat.o cholmod_l_norm.o \
	cholmod_l_scale.o cholmod_l_sdmult.o cholmod_l_ssmult.o \
	cholmod_l_submatrix.o cholmod_l_vertcat.o cholmod_l_symmetry.o

LPARTITION = cholmod_l_ccolamd.o cholmod_l_csymamd.o \
	cholmod_l_metis.o cholmod_l_nesdis.o cholmod_l_camd.o

LMODIFY = cholmod_l_rowadd.o cholmod_l_rowdel.o cholmod_l_updown.o

LSUPERNODAL = cholmod_l_super_numeric.o cholmod_l_super_solve.o \
	cholmod_l_super_symbolic.o

DL = $(LCORE) $(LCHECK) $(LCHOLESKY) $(LMATRIXOPS) $(LMODIFY) $(LSUPERNODAL) \
	$(LPARTITION)

#-------------------------------------------------------------------------------

# to compile just the double/int version, use OBJ = $(DI)
OBJ = $(DI) $(DL)

libcholmod.a: $(OBJ)
	$(AR) libcholmod.a $(OBJ)
	$(RANLIB) libcholmod.a

$(OBJ): $(INC)

I = -I../../AMD/Include -I../../AMD/Source -I../../COLAMD/Include \
	-I$(METIS_PATH) -I../../CCOLAMD/Include -I../../CAMD/Include \
	-I../Include -I../../UFconfig

#-------------------------------------------------------------------------------
# Check Module:
#-------------------------------------------------------------------------------

cholmod_check.o: ../Check/cholmod_check.c
	$(C) -c $(I) $<

cholmod_read.o: ../Check/cholmod_read.c
	$(C) -c $(I) $<

cholmod_write.o: ../Check/cholmod_write.c
	$(C) -c $(I) $<

#-------------------------------------------------------------------------------

cholmod_l_check.o: ../Check/cholmod_check.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_read.o: ../Check/cholmod_read.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_write.o: ../Check/cholmod_write.c
	$(C) -DDLONG -c $(I) $< -o $@


#-------------------------------------------------------------------------------
# Core Module:
#-------------------------------------------------------------------------------

cholmod_common.o: ../Core/cholmod_common.c
	$(C) -c $(I) $<

cholmod_dense.o: ../Core/cholmod_dense.c ../Core/t_cholmod_dense.c
	$(C) -c $(I) $<

cholmod_factor.o: ../Core/cholmod_factor.c
	$(C) -c $(I) $<

cholmod_change_factor.o: ../Core/cholmod_change_factor.c \
	../Core/t_cholmod_change_factor.c
	$(C) -c $(I) $<

cholmod_memory.o: ../Core/cholmod_memory.c
	$(C) -c $(I) $<

cholmod_sparse.o: ../Core/cholmod_sparse.c
	$(C) -c $(I) $<

cholmod_complex.o: ../Core/cholmod_complex.c
	$(C) -c $(I) $<

cholmod_transpose.o: ../Core/cholmod_transpose.c ../Core/t_cholmod_transpose.c
	$(C) -c $(I) $<

cholmod_band.o: ../Core/cholmod_band.c
	$(C) -c $(I) $<

cholmod_copy.o: ../Core/cholmod_copy.c
	$(C) -c $(I) $<

cholmod_triplet.o: ../Core/cholmod_triplet.c ../Core/t_cholmod_triplet.c
	$(C) -c $(I) $<

cholmod_error.o: ../Core/cholmod_error.c
	$(C) -c $(I) $<

cholmod_aat.o: ../Core/cholmod_aat.c
	$(C) -c $(I) $<

cholmod_add.o: ../Core/cholmod_add.c
	$(C) -c $(I) $<

#-------------------------------------------------------------------------------

cholmod_l_common.o: ../Core/cholmod_common.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_dense.o: ../Core/cholmod_dense.c ../Core/t_cholmod_dense.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_factor.o: ../Core/cholmod_factor.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_change_factor.o: ../Core/cholmod_change_factor.c \
	../Core/t_cholmod_change_factor.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_memory.o: ../Core/cholmod_memory.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_sparse.o: ../Core/cholmod_sparse.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_complex.o: ../Core/cholmod_complex.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_transpose.o: ../Core/cholmod_transpose.c ../Core/t_cholmod_transpose.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_band.o: ../Core/cholmod_band.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_copy.o: ../Core/cholmod_copy.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_triplet.o: ../Core/cholmod_triplet.c ../Core/t_cholmod_triplet.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_error.o: ../Core/cholmod_error.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_aat.o: ../Core/cholmod_aat.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_add.o: ../Core/cholmod_add.c
	$(C) -DDLONG -c $(I) $< -o $@


#-------------------------------------------------------------------------------
# Cholesky Module:
#-------------------------------------------------------------------------------

cholmod_amd.o: ../Cholesky/cholmod_amd.c
	$(C) -c $(I) $<

cholmod_analyze.o: ../Cholesky/cholmod_analyze.c
	$(C) -c $(I) $<

cholmod_colamd.o: ../Cholesky/cholmod_colamd.c
	$(C) -c $(I) $<

cholmod_etree.o: ../Cholesky/cholmod_etree.c
	$(C) -c $(I) $<

cholmod_factorize.o: ../Cholesky/cholmod_factorize.c
	$(C) -c $(I) $<

cholmod_postorder.o: ../Cholesky/cholmod_postorder.c
	$(C) -c $(I) $<

cholmod_rcond.o: ../Cholesky/cholmod_rcond.c
	$(C) -c $(I) $<

cholmod_resymbol.o: ../Cholesky/cholmod_resymbol.c
	$(C) -c $(I) $<

cholmod_rowcolcounts.o: ../Cholesky/cholmod_rowcolcounts.c
	$(C) -c $(I) $<

cholmod_solve.o: ../Cholesky/cholmod_solve.c ../Cholesky/t_cholmod_lsolve.c \
	../Cholesky/t_cholmod_ltsolve.c ../Cholesky/t_cholmod_solve.c
	$(C) -c $(I) $<

cholmod_spsolve.o: ../Cholesky/cholmod_spsolve.c
	$(C) -c $(I) $<

cholmod_rowfac.o: ../Cholesky/cholmod_rowfac.c ../Cholesky/t_cholmod_rowfac.c
	$(C) -c $(I) $<

#-------------------------------------------------------------------------------

cholmod_l_amd.o: ../Cholesky/cholmod_amd.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_analyze.o: ../Cholesky/cholmod_analyze.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_colamd.o: ../Cholesky/cholmod_colamd.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_etree.o: ../Cholesky/cholmod_etree.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_factorize.o: ../Cholesky/cholmod_factorize.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_postorder.o: ../Cholesky/cholmod_postorder.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_rcond.o: ../Cholesky/cholmod_rcond.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_resymbol.o: ../Cholesky/cholmod_resymbol.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_rowcolcounts.o: ../Cholesky/cholmod_rowcolcounts.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_solve.o: ../Cholesky/cholmod_solve.c ../Cholesky/t_cholmod_lsolve.c \
	../Cholesky/t_cholmod_ltsolve.c ../Cholesky/t_cholmod_solve.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_spsolve.o: ../Cholesky/cholmod_spsolve.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_rowfac.o: ../Cholesky/cholmod_rowfac.c ../Cholesky/t_cholmod_rowfac.c
	$(C) -DDLONG -c $(I) $< -o $@

#-------------------------------------------------------------------------------
# Partition Module:
#-------------------------------------------------------------------------------

cholmod_ccolamd.o: ../Partition/cholmod_ccolamd.c
	$(C) -c $(I) $<

cholmod_csymamd.o: ../Partition/cholmod_csymamd.c
	$(C) -c $(I) $<

cholmod_camd.o: ../Partition/cholmod_camd.c
	$(C) -c $(I) $<

cholmod_metis.o: ../Partition/cholmod_metis.c
	$(C) -c $(I) $<

cholmod_nesdis.o: ../Partition/cholmod_nesdis.c
	$(C) -c $(I) $<

#-------------------------------------------------------------------------------

cholmod_l_ccolamd.o: ../Partition/cholmod_ccolamd.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_csymamd.o: ../Partition/cholmod_csymamd.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_camd.o: ../Partition/cholmod_camd.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_metis.o: ../Partition/cholmod_metis.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_nesdis.o: ../Partition/cholmod_nesdis.c
	$(C) -DDLONG -c $(I) $< -o $@


#-------------------------------------------------------------------------------
# MatrixOps Module:
#-------------------------------------------------------------------------------

cholmod_horzcat.o: ../MatrixOps/cholmod_horzcat.c
	$(C) -c $(I) $<

cholmod_norm.o: ../MatrixOps/cholmod_norm.c
	$(C) -c $(I) $<

cholmod_scale.o: ../MatrixOps/cholmod_scale.c
	$(C) -c $(I) $<

cholmod_drop.o: ../MatrixOps/cholmod_drop.c
	$(C) -c $(I) $<

cholmod_sdmult.o: ../MatrixOps/cholmod_sdmult.c \
	../MatrixOps/t_cholmod_sdmult.c
	$(C) -c $(I) $<

cholmod_ssmult.o: ../MatrixOps/cholmod_ssmult.c
	$(C) -c $(I) $<

cholmod_submatrix.o: ../MatrixOps/cholmod_submatrix.c
	$(C) -c $(I) $<

cholmod_vertcat.o: ../MatrixOps/cholmod_vertcat.c
	$(C) -c $(I) $<

cholmod_symmetry.o: ../MatrixOps/cholmod_symmetry.c
	$(C) -c $(I) $<

#-------------------------------------------------------------------------------

cholmod_l_horzcat.o: ../MatrixOps/cholmod_horzcat.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_norm.o: ../MatrixOps/cholmod_norm.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_scale.o: ../MatrixOps/cholmod_scale.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_drop.o: ../MatrixOps/cholmod_drop.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_sdmult.o: ../MatrixOps/cholmod_sdmult.c \
	../MatrixOps/t_cholmod_sdmult.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_ssmult.o: ../MatrixOps/cholmod_ssmult.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_submatrix.o: ../MatrixOps/cholmod_submatrix.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_vertcat.o: ../MatrixOps/cholmod_vertcat.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_symmetry.o: ../MatrixOps/cholmod_symmetry.c
	$(C) -DDLONG -c $(I) $< -o $@

#-------------------------------------------------------------------------------
# Modify Module:
#-------------------------------------------------------------------------------

cholmod_rowadd.o: ../Modify/cholmod_rowadd.c
	$(C) -c $(I) $<

cholmod_rowdel.o: ../Modify/cholmod_rowdel.c
	$(C) -c $(I) $<

cholmod_updown.o: ../Modify/cholmod_updown.c \
	../Modify/t_cholmod_updown.c ../Modify/t_cholmod_updown_numkr.c
	$(C) -c $(I) $<

#-------------------------------------------------------------------------------

cholmod_l_rowadd.o: ../Modify/cholmod_rowadd.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_rowdel.o: ../Modify/cholmod_rowdel.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_updown.o: ../Modify/cholmod_updown.c \
	../Modify/t_cholmod_updown.c ../Modify/t_cholmod_updown_numkr.c
	$(C) -DDLONG -c $(I) $< -o $@


#-------------------------------------------------------------------------------
# Supernodal Module:
#-------------------------------------------------------------------------------

cholmod_super_numeric.o: ../Supernodal/cholmod_super_numeric.c \
	../Supernodal/t_cholmod_super_numeric.c
	$(C) -c $(I) $<

cholmod_super_symbolic.o: ../Supernodal/cholmod_super_symbolic.c
	$(C) -c $(I) $<

cholmod_super_solve.o: ../Supernodal/cholmod_super_solve.c \
	../Supernodal/t_cholmod_super_solve.c
	$(C) -c $(I) $<

#-------------------------------------------------------------------------------

cholmod_l_super_numeric.o: ../Supernodal/cholmod_super_numeric.c \
	../Supernodal/t_cholmod_super_numeric.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_super_symbolic.o: ../Supernodal/cholmod_super_symbolic.c
	$(C) -DDLONG -c $(I) $< -o $@

cholmod_l_super_solve.o: ../Supernodal/cholmod_super_solve.c \
	../Supernodal/t_cholmod_super_solve.c
	$(C) -DDLONG -c $(I) $< -o $@
