# RyeによるPython仮想環境

## 概要

- `rye`による仮想環境の管理
- パッケージの指定: `pyproject.toml`
- スクリプトを実行するための環境(新たなPythonパッケージ作成のための環境ではない)

## Ryeの特徴

- `pyenv`を使わずインタープリタまで管理可能
- `uv`を使った高速なパッケージ管理が可能(2024-03-21時点では設定が必要)
- `PATH`環境変数は常にryeのインタープリタを指すように設定
  - `rye`が現在のディレクトリから適切にインタープリタを選んでくれる

## Install

1. Install `rye`
2. Generate `.venv` by `make sync`
3. Move to project directory to activate venv
