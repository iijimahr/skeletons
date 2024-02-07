####
#### Makefile for Python project
#### last update: 2024.02.06
####

PYTHON_VERSION = 3.12

.PHONY: sync
sync:
	if [ ! -e .python-version ]; then pyenv local ${PYTHON_VERSION}; fi
	if [ ! -e .venv ]; then poetry env use ${PYTHON_VERSION}; fi
	poetry install --no-root

.PHONY: clean
clean:
	rm -rf .venv .python-version
	rm -f poetry.lock
