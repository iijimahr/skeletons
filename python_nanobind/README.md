# nanobindのスケルトン

## 概要

- C++とPythonのバインディング方法は様々
  - nanobind
  - pybind11
  - Boost.Python
  - ctypes
  - Python/C API (`Python.h`で直接書く)
- 本環境はnanobindを利用(比較的容易&高速)
  - GitHub: <https://github.com/wjakob/nanobind>

## Usage

1. Setup venv by `make sync`
2. Build and test module by `make`
