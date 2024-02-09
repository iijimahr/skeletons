####
#### Makefile for default Python virtualenv
#### last update: 2024.02.09
####

VENV_NAME = default
PYTHON_VERSION = 3.12
DEPS_FILE = requirements.txt
LOCK_FILE = requirements.lock

.PHONY: all
all:

.PHONY: clean
clean:
	rm -rf .python-version .venv

.PHONY: sync
sync: ${LOCK_FILE}

.python-version: Makefile
	make clean
	pyenv local ${PYTHON_VERSION}

requirements.lock: .python-version ${DEPS_FILE}
	python -m venv .venv --upgrade-deps --prompt ${VENV_NAME}
	.venv/bin/python -m pip install -r ${DEPS_FILE}
	.venv/bin/python -m pip freeze > ${LOCK_FILE}
