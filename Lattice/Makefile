#----------------------------------------------------------------------------
#
# Lattice makefile
#
#----------------------------------------------------------------------------

include ../user_defs.mk

# override the user defs to force serial mode
ifeq ($(SERIAL), YES)
MPI = NO
MPE = NO
BIL = NO
PNETCDF = NO
HDF5 = NO
ZOLTAN = NO
endif

include ../system_defs.mk

INCLUDE += -I. -I../Core 

OBJS = 	Lattice.o    calc_subvolume.o  
HDRS = 	Lattice.h    calc_subvolume.h
SRCS = 	Lattice.C	 calc_subvolume.o 

.SUFFIXES: .C

.C.o: $(HDRS)
	$(C++) $(CCFLAGS) $(INCLUDE)  $<

all: liblattice.a

liblattice.a: $(OBJS)
	rm -f $@
	ar cru $@ $(OBJS) 

clean:
	rm -f *.o *.a

