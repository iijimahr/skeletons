####
#### Makefile for default Python project
#### last update: 2024.02.06
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
