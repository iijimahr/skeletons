####
#### Make and run unit tests
####

## Root directory of project
PROJECT_ROOT := ..

## Source files
SRCS := $(wildcard test_*.f90)

## Module/Include files
LIB_SRCS := $(PROJECT_ROOT)/src/libs.f90

## Target executable
TRGT := $(SRCS:.f90=.out)

## Intermediate files
OBJS := $(SRCS:.f90=.o)
LIB_OBJS := $(LIB_SRCS:.f90=.o)

-include ../variables.mk

.PHONY: all
all: $(TRGT)

.PHONY: run
run: $(TRGT)
	@echo === RUN ALL TESTS: BEGIN ===
	@for ex_file in $(TRGT); do ./$${ex_file}; done
	@echo === RUN ALL TESTS: END ===

.PHONY: clean
clean:
	rm -rf *.mod *.o *~ *.out

%.out: %.o $(LIB_OBJS)
	$(FC) $(FFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.f90
	$(FC) $(FFLAGS) $(CPPFLAGS) -o $@ -c $<

$(OBJS): $(LIB_OBJS)

