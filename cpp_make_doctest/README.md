# Skelton of C++ project with doctest and Make

## About

- Skelton of C++ project with unit testing by `doctest`
- `doctest`: <https://github.com/doctest/doctest>
- Use GNU Make

## Usage

```bash
# Download doctest
$ git clone https://github.com/doctest/doctest third_party/doctest
$ cd third_party/doctest && git checkout tags/v2.4.10 && cd -

# Choose compiler and other options
$ vi config.mk

# Develop app
$ make run  # run app
$ make test  # run unit test
```
