####
#### Control project development
####

.PHONY: all
all:

.PHONY: build
build:
	make -C src
	make -C tests

.PHONY: run
run:
	make -C src run

.PHONY: run-tests
run-tests:
	make -C tests run

.PHONY: clean
clean:
	make -C src clean
	make -C tests clean
