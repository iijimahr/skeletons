###
### Common configurations
###

## Build level (0: Debug, else: Release)
BUILD_LEVEL ?= 0

## Files removed by `make clean`
CLEAN_FILES := *.d *.o *~ *.out

## Compiler
CXX := clang++

## Add include directory of project
CPPFLAGS := -I$(PROJECT_ROOT)/src -I$(PROJECT_ROOT)/test

## Add third party libraries
CPPFLAGS += -isystem $(PROJECT_ROOT)/third_party/doctest

## Compiler options
CXXFLAGS := -Wall -Wextra -Werror -std=c++17 -pipe

## Add BUILD_LEVEL dependent options
ifeq ($(BUILD_LEVEL), 0)
CXXFLAGS += -O0 -fsanitize=undefined,address
else
CXXFLAGS += -O2 -march=native
CPPFLAGS += -DNDEBUG
endif

# Dependency generation
DEP_CXX := $(CXX)

## Intermediate files
OBJS := $(SRCS:.cpp=.o)
DEPS := $(SRCS:.cpp=.d)


.PHONY: all
all: $(TRGT)

.PHONY: run
run: $(TRGT)
	$(RUN_COMMAND)

.PHONY: clean
clean:
	rm -f $(CLEAN_FILES)

$(TRGT): $(OBJS)
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $(LDFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -o $@ -c $<

%.d: %.cpp
	$(DEP_CXX) $(CPPFLAGS) -MF $@ -MM $<
