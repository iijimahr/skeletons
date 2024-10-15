####
#### Control project development
####

.PHONY: all
all:
	make init
	make build

.PHONY: init
init:
	make -C third_party

.PHONY: build
build:
	make -C src
	make -C tests

.PHONY: run
run:
	make -C src run

.PHONY: test
test:
	make -C tests run

.PHONY: clean
clean:
	make -C src clean
	make -C tests clean
