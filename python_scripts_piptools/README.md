# pip-toolsによるPythonスクリプト環境

## 概要

- `pyenv`+`pip-tools`による仮想環境の管理。
- パッケージの指定: `pyproject.toml`
- スクリプトを実行するための環境(新たなPythonパッケージ作成のための環境ではない)。

## Install

1. Install `pyenv`
2. Generate `.venv` by `make sync`
3. Activate venv by `.venv/bin/activate`
