###
### Install third party libraries
###

LIBS = doctest

.PHONY: all
all: ${LIBS}

doctest:
	git clone https://github.com/doctest/doctest
	cd doctest && git checkout tags/v2.4.10 && cd -

.PHONY: clean
clean:
	rm -rf ${LIBS}
