###
### nanobindによるC++とPythonのバインディング
### 2024-03-19: initial commit
###

VENV_NAME = default
PYTHON_VERSION = 3.12
DEPS_FILE  = pyproject.toml
LOCK_FILE = requirements.txt

.PHONY: all
all:
	make cmake
	@echo
	@echo ========================================
	python main.py

.PHONY: clean
clean:
	rm -rf build
	rm -f *.so

.PHONY: clean_env
clean_env:
	rm -f .python-version ${LOCK_FILE}
	rm -rf .venv

.PHONY: cmake
cmake:
	cmake -S . -B build
	cmake --build build
	ln -sf build/*.so .

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
