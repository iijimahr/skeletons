# デフォルトのPython仮想環境

## 概要

デフォルト/グローバルで常に使うPython環境の準備方法はいくつかある。

0. OSデフォルトやパッケージマネージャで導入したPythonインタープリタを利用
1. Anacondaを利用
2. 自分で仮想環境を管理
3. 自分でインタープリタ・仮想環境両方を管理
4. コンテナ等を使って周辺環境ごと管理

0はあとで色々不都合が出るので特殊な事情を除いて避ける。
1以降なら各自の目的・スキルによって選べばよい。
数字が大きくなるほど環境構築準備時の手間は増えるが、自分で明示的に管理出来る。

この仮想環境は、activate等せず直接`PATH`に入れて常に使える状態で運用することを想定している。
基本はこの仮想環境を使い、必要に応じてプロジェクト別の仮想環境を準備する方針。
プロジェクトの仮想環境を使う場合、`python`はプロジェクトルートで呼ぶ。
`PATH`をいじるため、Ryeとの共存には向かない。

パッケージの指定は `requirements.txt` で行う。

## インタープリタの管理

- Anaconda
- pyenv (この環境で利用)
- Rye

## パッケージの管理

- Anaconda
- pip (この環境で利用)
- pip-tools
- Poetry
- Rye
- uv

## Install

1. Install `pyenv` command
2. Generate `.venv` by `make sync`
3. Add `PATH` environment variable to shell config (e.g., `.bashrc`)
   - bash: `export PATH="/<somewhere>/python_default/venv/bin:$PATH"`
4. (Optional) Add `PATH` to use `venv` in current (project) directory if exist
   - bash: `export PATH="venv/bin:$PATH"`
