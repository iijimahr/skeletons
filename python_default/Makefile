####
#### Makefile for default Python virtualenv
####

VENV_NAME = default
VENV_DIR = venv
PYTHON_VERSION = 3.12
DEPS_FILE = requirements.txt
LOCK_FILE = requirements.lock

.PHONY: all
all:

.PHONY: clean
clean:
	rm -rf .python-version $(VENV_DIR)

.PHONY: sync
sync: $(LOCK_FILE)

.python-version: Makefile
	make clean
	pyenv local $(PYTHON_VERSION)

$(LOCK_FILE): .python-version $(DEPS_FILE)
	pyenv exec python -m venv venv --upgrade-deps --prompt $(VENV_NAME)
	$(VENV_DIR)/bin/python -m pip install -r $(DEPS_FILE) --compile --no-binary numpy,numba,matplotlib
	$(VENV_DIR)/bin/python -m pip freeze > $(LOCK_FILE)
