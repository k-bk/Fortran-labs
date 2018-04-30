# compiler
FC = gfortran

# compile flags
FCFLAGS = -std=f2008 -fimplicit-none -cpp -Wall

# link flags
FFLAGS = 

# object files 
OBJ = matrix.o main.o

# program name
PROGRAM = fdm

.PHONY: all clean

all: $(PROGRAM) 

$(PROGRAM): $(OBJ)
	$(FC) -o $@ $^ $(FFLAGS)

%.o: %.f90
	$(FC) -c $< $(FCFLAGS)

clean:
	rm -f $(PROGRAM) *.mod *.o
