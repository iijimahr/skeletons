####
#### Makefile for default Python virtualenv
#### last update: 2024.02.09
####

VENV_NAME = default
PYTHON_VERSION = 3.12

.PHONY: all
all:

.PHONY: sync
sync:
	pyenv local ${PYTHON_VERSION}
	python -m venv .venv --prompt ${VENV_NAME}
	.venv/bin/python -m pip install -U pip
	.venv/bin/python -m pip install -r requirements.txt
	.venv/bin/python -m pip freeze > requirements.lock

.PHONY: clean
clean:
	rm -rf .venv .python-version
