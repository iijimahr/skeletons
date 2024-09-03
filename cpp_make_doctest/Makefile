####
#### Control project development
####

.PHONY: all
all:
	make build

.PHONY: build
build:
	make -C src
	make -C test

.PHONY: run
run:
	make -C src run

.PHONY: test
test:
	make -C test run

.PHONY: clean
clean:
	make -C src clean
	make -C test clean
