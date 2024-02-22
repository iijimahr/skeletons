####
#### Makefile for new Python project
####

PYTHON_VERSION = 3.12

.PHONY: all
all:

.PHONY: sync
sync:
	if [ ! -e .python-version ]; then rye pin ${PYTHON_VERSION}; fi
	rye sync

.PHONY: clean
clean:
	rm -rf .venv .python-version
	rm -f requirements.lock requirements-dev.lock
