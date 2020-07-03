#----------------------------------------------------------------------------
#
# Examples makefile
#
# Tom Peterka
# Argonne National Laboratory
# 9700 S. Cass Ave.
# Argonne, IL 60439
# tpeterka@mcs.anl.gov
#
# All rights reserved. May not be used, modified, or copied
# without permission
#
#----------------------------------------------------------------------------

include ../../user_defs.mk
include ../../system_defs.mk

INCLUDE += -I. -I../../bil/src -I../../Core -I../../anlcom -I../../renderer -I../libgcb

LIBS += -L../../bil -L../../Core -L../../anlcom -lanlcom -lOSUFlow -L../../renderer -lrenderer -L../libgcb -llibgcb
ifeq ($(BIL), YES)
LIBS += -lbil
endif
ifeq ($(PNETCDF), YES)
LIBS += -lpnetcdf
endif
ifeq ($(HDF5), YES)
LIBS += -lhdf5
endif

.SUFFIXES: .cpp.c

.cpp.o:
	$(C++) $(CCFLAGS) $(INCLUDE)  $<
.c.o:
	$(CC) $(CCFLAGS) $(INCLUDE) $<

default: all

all: gcbGlyph gcbLineAnimator gcbPathline gcbPoints gcbStreamline gcbTemplate \
	gcbTube gcbStreamlineDynamicColor gcbTubeDynamicColor

gcbGlyph: gcbGlyph.o
	$(C++) -o gcbGlyph gcbGlyph.o -L. $(LIBS) 

gcbLineAnimator: gcbLineAnimator.o
	$(C++) -o gcbLineAnimator gcbLineAnimator.o -L. $(LIBS) 

gcbPathline: gcbPathline.o
	$(C++) -o gcbPathline gcbPathline.o -L. $(LIBS) 

gcbPoints: gcbPoints.o
	$(C++) -o gcbPoints gcbPoints.o -L. $(LIBS) 

gcbStreamline: gcbStreamline.o
	$(C++) -o gcbStreamline gcbStreamline.o -L. $(LIBS) 

gcbStreamlineDynamicColor: gcbStreamlineDynamicColor.o
	$(C++) -o gcbStreamlineDynamicColor gcbStreamlineDynamicColor.o -L. $(LIBS) 
	
gcbTemplate: gcbTemplate.o
	$(C++) -o gcbTemplate gcbTemplate.o -L. $(LIBS) 

gcbTube: gcbTube.o
	$(C++) -o gcbTube gcbTube.o -L. $(LIBS) 

gcbTubeDynamicColor: gcbTubeDynamicColor.o
	$(C++) -o gcbTubeDynamicColor gcbTubeDynamicColor.o -L. $(LIBS) 
	
clean:
	rm -f *.o

depend: Makefile $(SRCS)
	makedepend -fMakefile $(CCFLAGS) $(INCLUDE) $(SRCS)
