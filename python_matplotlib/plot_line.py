"""
Template of line plot
"""

import os

import common as cmn
import matplotlib.pyplot as plt
import numpy as np

## Base name of this file
this_file, _ = os.path.splitext(os.path.basename(__file__))


def read_data() -> dict:
    x = np.linspace(-np.pi, np.pi, 10000)
    return {
        "x": x,
        "sin": np.sin(x),
        "cos": np.cos(x),
        "tan": np.tan(x),
    }


def plot_data(fig_type="png") -> None:
    fig_file = os.path.join(cmn.fig_dir, f"{this_file}.{fig_type}")

    dt = read_data()

    fig = plt.figure(figsize=(8, 4))
    nrows, ncols = 1, 2

    ax = fig.add_subplot(nrows, ncols, 1)
    ax.plot(dt["x"], dt["sin"], label=r"$y=\sin(x)$")
    ax.plot(dt["x"], dt["cos"], label=r"$y=\cos(x)$")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_xlim(-np.pi, np.pi)
    ax.set_ylim(-1.05, 1.05)
    ax.legend(frameon=False)

    ax = fig.add_subplot(nrows, ncols, 2)
    ax.plot(dt["x"], dt["tan"], label=r"$y=\tan(x)$")
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_xlim(-0.49 * np.pi, 0.49 * np.pi)
    ax.set_ylim(-10, 10)
    ax.legend(frameon=False)

    fig.suptitle("Trigonometric functions")

    fig.savefig(fig_file)
    print(f"saved: {fig_file}")


if __name__ == "__main__":
    plot_data()
    plot_data(fig_type="pdf")
