#----------------------------------------------------------------------------
#
# makefile
#
# Copyright (c) 2010 Teng-Yok Lee
#
# Contact:
#
# Teng-Yok Lee
# The Ohio State University
# Columbus, OH
#
# All rights reserved. May not be used, modified, or copied
# without permission
#
#----------------------------------------------------------------------------

include ../user_defs.mk
include ../system_defs.mk

INCLUDE += -I. -I../Core

OBJS =  \
	LineAnimatorInOpenGL.o  PointRendererSplat.o \
	LineRenderer.o          Renderer.o \
	LineRendererInOpenGL.o  TimeLineRendererInOpenGL.o \
	PointRenderer.o         TubeRenderer.o \
	PointRendererGlyph.o    TubeRendererInOpenGL.o \
	LineRenderer_ColorScheme.o Draw.o

SRCS =  \
	LineAnimatorInOpenGL.cpp  PointRendererSplat.cpp \
	LineRenderer.cpp          Renderer.cpp \
	LineRendererInOpenGL.cpp  TimeLineRendererInOpenGL.cpp \
	PointRenderer.cpp         TubeRenderer.cpp \
	PointRendererGlyph.cpp    TubeRendererInOpenGL.cpp \
	LineRenderer_ColorScheme.cpp Draw.C

.SUFFIXES: .C,.cpp

.C.o:
	$(C++) $(CCFLAGS) $(INCLUDE)  $<

.cpp.o:
	$(C++) $(CCFLAGS) $(INCLUDE)  $<

default: all

all: librenderer.a 

librenderer.a : $(OBJS)
	rm -f $@
	ar cru $@ $(OBJS) 

clean:
	rm -f *.o *.a

depend: Makefile $(SRCS)
	makedepend -fMakefile $(CCFLAGS) $(INCLUDE) $(SRCS)

