"""
Template of image plot
"""

import os

import common as cmn
import matplotlib.pyplot as plt
import numpy as np

## Base name of this file
this_file, _ = os.path.splitext(os.path.basename(__file__))


def read_data() -> dict:
    x = np.linspace(0.0, 2.0 * np.pi, 20)
    y = np.linspace(0.0, 2.0 * np.pi, 500)
    return {
        "x": x,
        "y": y,
        "u": np.einsum("i,j->ij", np.cos(y), np.sin(x)),  # C-order
    }


def plot_data(fig_type="png") -> None:
    fig_file = os.path.join(cmn.fig_dir, f"{this_file}.{fig_type}")

    fig = plt.figure(figsize=(4.5, 4.0))

    ax = fig.add_subplot()
    dt = read_data()
    rasterized = fig_type in ["svg", "pdf"]  # rasterize in vector format
    im = ax.pcolormesh(
        dt["x"],
        dt["y"],
        dt["u"],
        vmin=-1.1,
        vmax=1.1,
        rasterized=rasterized,
    )
    plt.colorbar(im, ax=ax, shrink=0.8, pad=0.02)
    ax.set_xlabel(r"$x$")
    ax.set_ylabel(r"$y$")
    ax.set_xlim(0.0, 2.0 * np.pi)
    ax.set_ylim(0.0, 2.0 * np.pi)
    ax.set_title(r"$u = \sin(x) \cos(y)$")
    ax.set_aspect("equal")

    fig.savefig(fig_file)
    print(f"saved: {fig_file}")


if __name__ == "__main__":
    plot_data()
    plot_data(fig_type="pdf")
