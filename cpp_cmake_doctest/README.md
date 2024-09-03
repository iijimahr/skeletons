# Skeleton of C++ project with doctest and CMake

## About

- Skeleton of C++ project with unit testing by `doctest`
- `doctest`: <https://github.com/doctest/doctest>
- Use GNU Make

## Usage

```bash
# Set build options
$ export CXX="/opt/homebrew/opt/llvm/bin/clang++"
$ export CXX_FLAGS="-Wall -Wextra -std=c++17 -O0 -fsanitize=undefined"  # debug
# $ export CXX_FLAGS="-Wall -Wextra -std=c++17 -O2 -march=native"  # release

# Build
$ cmake -B build . && cd build
$ make
```
