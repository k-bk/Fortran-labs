# compiler
FC = gfortran

# compile flags
FCFLAGS = -std=f2008 -fimplicit-none -cpp -Wall

# link flags
FFLAGS = 

# object files 
OBJ = matrix.o matrix_test.o main.o 

# compilation modifiers
K = 8

# output file
OUT = result.txt

# program name
PROGRAM = fdm
 
##################

.PHONY: all clean

all: $(PROGRAM)

$(PROGRAM): $(OBJ)
	$(FC) -o $@ $^ $(FFLAGS)

%.o: %.f90
	$(FC) -c $< $(FCFLAGS) -D_KIND=$(K)

test:
	touch $(OUT)
	for number in 10 100 1000 ; do \
	    echo "N = $$number, K = $(K)" >> $(OUT) ; \
	    ./$(PROGRAM) $$number >> $(OUT) ; \
	done

clean:
	rm -f $(PROGRAM) *.mod *.o
