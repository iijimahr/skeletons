# matplotlibのスケルトン

## 事前準備

- `matplotlib`が使えるPython環境をシェルから`python`で呼べること

## 使い方

- `plot_*.py`をコピー・編集
- `python plot_*.py`で描画

## 共通のスタイル設定

- 作業ディレクトリの`matplotlibrc`を自動で呼んで設定してくれる
- 現在利用される`matplotlibrc`ファイルの確認
  - `python -c "import matplotlib as mpl; print(mpl.matplotlib_fname())"`
