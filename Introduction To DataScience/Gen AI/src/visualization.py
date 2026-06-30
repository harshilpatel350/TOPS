"""
Visualization helpers — plotting reconstructions, loss curves, grids.
"""

from __future__ import annotations

import logging
from pathlib import Path
from typing import List, Optional, Sequence

import matplotlib.pyplot as plt
import numpy as np
import torch
from PIL import Image

from src.config import GENERATED_IMAGES_DIR

logger = logging.getLogger(__name__)


def plot_loss_curves(
    train_losses: Sequence[float],
    val_losses: Optional[Sequence[float]] = None,
    title: str = "Training Loss",
    save_path: Optional[Path] = None,
) -> None:
    """Plot training (and optionally validation) loss over epochs.

    Args:
        train_losses: Per-epoch training loss values.
        val_losses:   Per-epoch validation loss values (optional).
        title:        Plot title.
        save_path:    If given, save the figure to this path.
    """
    fig, ax = plt.subplots(figsize=(8, 4))
    epochs = range(1, len(train_losses) + 1)
    ax.plot(epochs, train_losses, label="Train Loss", linewidth=2)
    if val_losses is not None:
        ax.plot(epochs, val_losses, label="Val Loss", linewidth=2, linestyle="--")
    ax.set_xlabel("Epoch")
    ax.set_ylabel("Loss")
    ax.set_title(title)
    ax.legend()
    ax.grid(True, alpha=0.3)
    fig.tight_layout()
    if save_path is not None:
        save_path = Path(save_path)
        save_path.parent.mkdir(parents=True, exist_ok=True)
        fig.savefig(save_path, dpi=150, bbox_inches="tight")
        logger.info("Loss plot saved → %s", save_path)
    plt.show()


def plot_image_grid(
    images: torch.Tensor | np.ndarray,
    nrow: int = 8,
    title: str = "",
    save_path: Optional[Path] = None,
) -> None:
    """Display a grid of images.

    Args:
        images:    ``(N, 1, H, W)`` or ``(N, H, W)`` tensor / ndarray.
        nrow:      Number of images per row.
        title:     Figure title.
        save_path: Optional path to save the figure.
    """
    if isinstance(images, torch.Tensor):
        images = images.detach().cpu().numpy()
    if images.ndim == 4 and images.shape[1] == 1:
        images = images.squeeze(1)

    n = len(images)
    ncol = nrow
    nrows_grid = max(1, (n + ncol - 1) // ncol)

    fig, axes = plt.subplots(nrows_grid, ncol, figsize=(ncol * 1.5, nrows_grid * 1.5))
    if nrows_grid == 1:
        axes = [axes] if ncol == 1 else list(axes)
    else:
        axes = [ax for row in axes for ax in row]

    for i, ax in enumerate(axes):
        if i < n:
            ax.imshow(images[i], cmap="gray")
        ax.axis("off")

    if title:
        fig.suptitle(title, fontsize=14)
    fig.tight_layout()
    if save_path is not None:
        save_path = Path(save_path)
        save_path.parent.mkdir(parents=True, exist_ok=True)
        fig.savefig(save_path, dpi=150, bbox_inches="tight")
        logger.info("Image grid saved → %s", save_path)
    plt.show()


def plot_reconstruction_comparison(
    originals: torch.Tensor,
    reconstructed: torch.Tensor,
    n: int = 8,
    title: str = "Original vs Reconstructed",
    save_path: Optional[Path] = None,
) -> None:
    """Show original images on top and reconstructions on the bottom.

    Args:
        originals:     ``(B, 1, 28, 28)`` tensor.
        reconstructed: ``(B, 1, 28, 28)`` tensor.
        n:             Number of image pairs to display.
        title:         Figure title.
        save_path:     Optional save path.
    """
    originals = originals[:n].detach().cpu().squeeze(1).numpy()
    reconstructed = reconstructed[:n].detach().cpu().squeeze(1).numpy()

    fig, axes = plt.subplots(2, n, figsize=(n * 1.5, 3))
    for i in range(n):
        axes[0, i].imshow(originals[i], cmap="gray")
        axes[0, i].axis("off")
        axes[1, i].imshow(reconstructed[i], cmap="gray")
        axes[1, i].axis("off")
    axes[0, 0].set_title("Original", fontsize=10)
    axes[1, 0].set_title("Reconstructed", fontsize=10)
    fig.suptitle(title, fontsize=14)
    fig.tight_layout()
    if save_path is not None:
        save_path = Path(save_path)
        save_path.parent.mkdir(parents=True, exist_ok=True)
        fig.savefig(save_path, dpi=150, bbox_inches="tight")
        logger.info("Reconstruction comparison saved → %s", save_path)
    plt.show()


def save_generated_images(
    images: torch.Tensor | np.ndarray,
    prefix: str = "generated",
    directory: Optional[Path] = None,
) -> List[Path]:
    """Save individual generated images as PNG files.

    Args:
        images:    ``(N, 1, H, W)`` or ``(N, H, W)`` array.
        prefix:    Filename prefix.
        directory: Target directory (defaults to ``generated_images/``).

    Returns:
        List of saved file paths.
    """
    if directory is None:
        directory = GENERATED_IMAGES_DIR
    directory = Path(directory)
    directory.mkdir(parents=True, exist_ok=True)

    if isinstance(images, torch.Tensor):
        images = images.detach().cpu().numpy()
    if images.ndim == 4 and images.shape[1] == 1:
        images = images.squeeze(1)

    saved: List[Path] = []
    for i, img in enumerate(images):
        arr = (img * 255).clip(0, 255).astype(np.uint8)
        path = directory / f"{prefix}_{i + 1:03d}.png"
        Image.fromarray(arr, mode="L").save(path)
        saved.append(path)
        logger.info("Saved image → %s", path)
    return saved


def plot_noise_progression(
    images: List[np.ndarray] | List[torch.Tensor],
    titles: Optional[List[str]] = None,
    save_path: Optional[Path] = None,
) -> None:
    """Plot a row of images showing noise progression.

    Args:
        images:    List of single-channel images.
        titles:    Optional per-image titles.
        save_path: Optional save path.
    """
    n = len(images)
    fig, axes = plt.subplots(1, n, figsize=(n * 2, 2.5))
    if n == 1:
        axes = [axes]
    for i, ax in enumerate(axes):
        img = images[i]
        if isinstance(img, torch.Tensor):
            img = img.detach().cpu().squeeze().numpy()
        ax.imshow(img, cmap="gray")
        if titles:
            ax.set_title(titles[i], fontsize=9)
        ax.axis("off")
    fig.suptitle("Noise Progression", fontsize=13)
    fig.tight_layout()
    if save_path is not None:
        save_path = Path(save_path)
        save_path.parent.mkdir(parents=True, exist_ok=True)
        fig.savefig(save_path, dpi=150, bbox_inches="tight")
        logger.info("Noise progression saved → %s", save_path)
    plt.show()
