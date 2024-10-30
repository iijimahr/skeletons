###
### Makefile: Common variables
###

## Build level (0: Debug, else: Relase)
BUILD_LEVEL ?= 0

## Compiler
FC := gfortran

## Add include directory of project
CPPFLAGS := -I$(PROJECT_ROOT)/src -I$(PROJECT_ROOT)/tests -cpp

## Compiler options
FFLAGS := -Wall -Wextra -Werror -std=f2018 -ffree-line-length-none -pipe
ifeq ($(BUILD_LEVEL),0)
FFLAGS += -O0 -fcheck=all
else
FFLAGS += -O2 -march=native
CPPFLAGS += -DNDEBUG
endif

## Linker options
LDFLAGS :=

