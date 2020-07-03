#----------------------------------------------------------------------------
#
# makefile system definitions
#
#----------------------------------------------------------------------------
#
# users: set your architecture, options, and paths in user_defs.h
# you should not need to touch this or other makefiles in the project
#
#----------------------------------------------------------------------------

# includes

INCLUDE =
ifeq ($(PNETCDF), YES)
INCLUDE += -I$(NETCDF_INC)
endif

INCLUDE += $(MISC_INC) # no extra symbols such as -I are prepended for MISC_INC

# libraries

LIBS = -lm


ifeq ($(ARCH), MAC_OSX_OMPI)
ifeq ($(GRAPHICS), YES)
LIBS += -framework GLUT -framework OpenGL
endif
endif
ifeq ($(ARCH), MAC_OSX_MPICH)
ifeq ($(GRAPHICS), YES)
LIBS += -framework GLUT -framework OpenGL
endif
endif
ifeq ($(ARCH), LINUX)
ifeq ($(GRAPHICS), YES)
LIBS += -lglut -lGLU -lGL
endif
endif
ifeq ($(ARCH), LINUX_SERIAL)
ifeq ($(GRAPHICS), YES)
LIBS += -lglut -lGLU -lGL
endif
endif
LIBS += $(MISC_LIB) # no extra symbols such as -l are prepended for MISC_LIB

# compiler flags

CCFLAGS = -g -c
CCFLAGS += -D_OSUFLOW

# additional compiler flags and paths for each architecture

ifeq ($(ARCH), MAC_OSX_OMPI) # mac osx w/ open mpi
C++ = g++
CC  = gcc
CCFLAGS += -DMAC_OSX_OMPI
ifeq ($(MPI), YES)
CCFLAGS += -D_MPI
endif
endif

ifeq ($(ARCH), MAC_OSX_MPICH) # mac osx w/ mpich
C++ = mpicxx
CC = mpicc
CCFLAGS += -DMAC_OSX_MPICH
ifeq ($(MPI), YES)
CCFLAGS += -D_MPI
endif
endif

ifeq ($(ARCH), LINUX_SERIAL) # linux serial (used by Han-Wei)
C++ = g++
CC  = gcc
CCFLAGS += -DLINUX
LIBS =
endif

ifeq ($(ARCH), LINUX) # linux generic
C++ = mpicxx
CC = mpicc
ifeq ($(MPE), YES)
C++   = mpecxx -mpilog
endif
CCFLAGS += -DLINUX
ifeq ($(MPI), YES)
CCFLAGS += -D_MPI -DMPICH_IGNORE_CXX_SEEK -DMPICH_SKIP_MPICXX
endif
endif



# additional compiler flags

ifeq ($(GRAPHICS), YES)
CCFLAGS += -DGRAPHICS
endif
ifeq ($(MPE), YES)
CCFLAGS += -DMPE
endif
ifeq ($(BYTE_SWAP), YES)
CCFLAGS += -DBYTE_SWAP
endif
ifeq ($(DEBUG), YES)
CCFLAGS += -DDEBUG
endif
ifeq ($(WARNINGS), YES)
CCFLAGS += -Wall -Wextra
endif

