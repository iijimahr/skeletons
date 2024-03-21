####
#### Makefile for default Python virtualenv
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

${LOCK_FILE}: .python-version ${DEPS_FILE}
	pyenv exec python -m venv .venv --upgrade-deps --prompt ${VENV_NAME}
	.venv/bin/python -m pip install -r ${DEPS_FILE} --compile --no-binary numpy,numba,matplotlib
	.venv/bin/python -m pip freeze > ${LOCK_FILE}
