####
#### Makefile for new Python project
####

VENV_NAME = default
PYTHON_VERSION = 3.12
DEPS_FILE  = pyproject.toml
LOCK_FILE = requirements.txt

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
	.venv/bin/python -m pip install pip-tools
	.venv/bin/pip-compile --output-file=${LOCK_FILE} ${DEPS_FILE}
	.venv/bin/pip-sync ${LOCK_FILE}
