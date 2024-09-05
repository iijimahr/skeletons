# Skeleton of C++ project with doctest and CMake

## About

- Skeleton of C++ project with unit testing by `doctest`
- `doctest`: <https://github.com/doctest/doctest>
- Use GNU Make

## Usage

```bash
# Compiler
$ export CXX="clang++"

# Compiler options (Debug)
$ export CXXFLAGS="-Wall -Wextra -std=c++17 -O0 -pipe -fsanitize=undefined,address"

# # Compiler options (Release)
# $ export CXXFLAGS="-Wall -Wextra -std=c++17 -O2 -pipe -march=native -DNDEBUG"

# Build
$ cmake -B build . && cd build
$ make
```
