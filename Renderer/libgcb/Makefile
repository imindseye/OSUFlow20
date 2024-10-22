# Makefile - libgcb.dsp

include ../../user_defs.mk
include ../../system_defs.mk

ProjectName=libgcb
ProjectDir=.
ConfigurationName=Release

ifndef CFG
CFG=libgw - Win32 Release
endif
CC=gcc
CFLAGS=-I ~/lib/include -I ~/lib/include/opencv -I ~/mylib/include -I /usr/local/cuda/include
CXX=g++
CXXFLAGS=$(CFLAGS)
RC=windres -O COFF
ifeq "$(CFG)"  "libgcb - Win32 Debug"
CFLAGS+=-g -W -O0 -D_DEBUG -D_LIB -D_CRT_TERMINATE_DEFINED -D_UNICODE
AR=ar
TARGET=lib$(ProjectName).a
ARFLAGS=rus
else
ifeq "$(CFG)"  "libgcb - Win32 Release"
CFLAGS+=-g -W -DNDEBUG -D_LIB -D"_UNICODE" PRECOMP_VC7_TOBEREMOVED
AR=ar
TARGET=lib$(ProjectName).a
ARFLAGS=rus
endif
endif

ifndef TARGET
TARGET=lib$(ProjectName).a
endif

.PHONY: all
all: $(TARGET)

%.o: %.c
	$(CC) $(CFLAGS) $(CPPFLAGS) $(CCFLAGS) $(INCLUDE) -o $@ -c $<

%.o: %.cc
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $(CCFLAGS) $(INCLUDE) -o $@ -c $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $(CCFLAGS) $(INCLUDE) -o $@ -c $<

%.o: %.cxx
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $(CCFLAGS) $(INCLUDE) -o $@ -c $<

%.res: %.rc
	$(RC) $(CPPFLAGS) $(CCFLAGS) $(INCLUDE) -o $@ -i $<

SOURCE_FILES= \
	gcb.cpp

RESOURCE_FILES=

SRCS=$(SOURCE_FILES) $(HEADER_FILES) $(RESOURCE_FILES)  \
	ReadMe.txt

OBJS=$(patsubst %.rc,%.res,$(patsubst %.cxx,%.o,$(patsubst %.cpp,%.o,$(patsubst %.cc,%.o,$(patsubst %.c,%.o,$(filter %.c %.cc %.cpp %.cxx %.rc,$(SRCS)))))))

$(TARGET): $(OBJS) $(CUSTOM_OUTPUTS)
	$(AR) $(ARFLAGS) $@ $(OBJS)

.PHONY: clean
clean:
	-rm -f $(OBJS) $(TARGET) $(CUSTOM_OUTPUTS) $(ProjectName).dep

.PHONY: depends
depends:
	-$(CXX) $(CXXFLAGS) $(CPPFLAGS) -MM $(filter %.c %.cc %.cpp %.cxx,$(SRCS)) > $(ProjectName).dep

-include $(ProjectName).dep

