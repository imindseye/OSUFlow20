#----------------------------------------------------------------------------
#
# top-level makefile
#

#----------------------------------------------------------------------------

include user_defs.mk
include system_defs.mk

package = osuflow
version = 2.0

prefix = /usr/local
export prefix

tarname = $(package)
distdir = $(tarname)-$(version)


all clean:
	cd Core && $(MAKE) $@ # serial flow library
	cd Lattice && $(MAKE) $@ # serial flow library

serial:
	cd Core && $(MAKE) clean
	cd Core && $(MAKE) SERIAL=YES # serial flow library
	cd Lattice && $(MAKE) clean
	cd Lattice && $(MAKE) SERIAL=YES # serial flow library


.PHONY: FORCE all clean check dist distcheck install uninstall

