###
### Common configurations
###

## Build level
DEBUG_LEVEL := 1  # Debug version
# DEBUG_LEVEL := 0  # Release version (Optimized)

## Files removed by `make clean`
CLEAN_FILES := *.d *.o *~ *.out

## Compiler
CXX := clang++
# CXX := g++-14

## Compiler options
CXXFLAGS := -Wall -Wextra -Werror -std=c++17
ifeq ($(DEBUG_LEVEL), 1)
CXXFLAGS += -O0 -fsanitize=undefined
ifeq ($(CXX), clang++)
CXXFLAGS += -fsanitize=address -g  # debugging (for clang)
endif
else
CXXFLAGS += -O2 -march=native -DNDEBUG
endif

## Add include directory of project
CPPFLAGS += -I$(PROJECT_ROOT)/src -I$(PROJECT_ROOT)/test

## Add third party libraries
CPPFLAGS += -I$(PROJECT_ROOT)/third_party/doctest

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
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) -c $< -o $@

%.d: %.cpp
	$(DEP_CXX) $(CPPFLAGS) -MM $< -MF $@
