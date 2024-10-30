####
#### Make executable
####

## Root directory of project
PROJECT_ROOT := ..

## Source files
SRCS := main.f90

## Module/Include files
LIB_SRCS := libs.f90

## Target executable
TRGT := a.out

## Run executable
RUN_COMMAND := ./$(TRGT)

## Intermediate files
OBJS := $(SRCS:.f90=.o)
LIB_OBJS := $(LIB_SRCS:.f90=.o)

-include ../variables.mk

.PHONY: all
all: $(TRGT)

.PHONY: run
run: $(TRGT)
	$(RUN_COMMAND)

.PHONY: clean
clean:
	rm -rf *.mod *.o *~ *.out

$(TRGT): $(OBJS) $(LIB_OBJS)
	$(FC) $(FFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.f90
	$(FC) $(FFLAGS) $(CPPFLAGS) -o $@ -c $<

$(OBJS): $(LIB_OBJS)

