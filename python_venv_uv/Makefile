####
#### Makefile for new Python project
####

VENV_NAME = default
VENV_DIR = venv
PYTHON_VERSION = 3.12
DEPS_FILE  = pyproject.toml
LOCK_FILE = requirements.txt

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
	pyenv exec python -m venv $(VENV_DIR) --upgrade-deps --prompt $(VENV_NAME)
	$(VENV_DIR)/bin/python -m pip install uv
	$(VENV_DIR)/bin/uv pip compile $(DEPS_FILE) -o $(LOCK_FILE)
	$(VENV_DIR)/bin/uv pip sync $(DEPS_FILE)
