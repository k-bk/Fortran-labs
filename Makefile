# compiler
FC = gfortran

# compile flags
FCFLAGS = -std=f2008 -fimplicit-none -cpp -Wall

# link flags
FFLAGS = 

# source files
SRCS = matrix

# program name
PROGRAM = fdm

.PHONY: all clean

all: $(PROGRAM) 

$(PROGRAM):
	$(FC) -o $@ $(SRCS).f90 $(FFLAGS) 

clean:
	rm -f $(PROGRAM)
