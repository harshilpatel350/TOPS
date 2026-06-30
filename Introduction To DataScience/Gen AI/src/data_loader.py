"""
Data loading utilities for Fashion-MNIST.

Provides functions to download, transform, and return PyTorch DataLoaders
for training and testing splits.
"""

from __future__ import annotations

import logging
from typing import Tuple

import torch
from torch.utils.data import DataLoader
from torchvision import datasets, transforms

from src.config import DATASETS_DIR, DEFAULT_BATCH_SIZE

logger = logging.getLogger(__name__)


def get_fashion_mnist_loaders(
    batch_size: int = DEFAULT_BATCH_SIZE,
    flatten: bool = False,
    download: bool = True,
) -> Tuple[DataLoader, DataLoader]:
    """Return (train_loader, test_loader) for Fashion-MNIST.

    Args:
        batch_size: Mini-batch size.
        flatten:    If ``True`` each 28×28 image is flattened to 784.
        download:   Download the dataset if not already cached.

    Returns:
        A 2-tuple of ``DataLoader`` objects (train, test).
    """
    transform_list = [transforms.ToTensor()]
    if flatten:
        transform_list.append(transforms.Lambda(lambda x: x.view(-1)))
    transform = transforms.Compose(transform_list)

    logger.info("Loading Fashion-MNIST (batch_size=%d, flatten=%s)", batch_size, flatten)

    train_dataset = datasets.FashionMNIST(
        root=str(DATASETS_DIR),
        train=True,
        download=download,
        transform=transform,
    )
    test_dataset = datasets.FashionMNIST(
        root=str(DATASETS_DIR),
        train=False,
        download=download,
        transform=transform,
    )

    train_loader = DataLoader(train_dataset, batch_size=batch_size, shuffle=True)
    test_loader = DataLoader(test_dataset, batch_size=batch_size, shuffle=False)

    logger.info("Train samples: %d | Test samples: %d", len(train_dataset), len(test_dataset))
    return train_loader, test_loader


def add_noise(images: torch.Tensor, noise_factor: float = 0.5) -> torch.Tensor:
    """Add Gaussian noise to a batch of images and clamp to [0, 1].

    Args:
        images:       Tensor of shape ``(B, C, H, W)`` or ``(B, D)``.
        noise_factor: Standard-deviation multiplier for the noise.

    Returns:
        Noisy images clamped to [0, 1].
    """
    noisy = images + noise_factor * torch.randn_like(images)
    return torch.clamp(noisy, 0.0, 1.0)


FASHION_MNIST_CLASSES: list[str] = [
    "T-shirt/top",
    "Trouser",
    "Pullover",
    "Dress",
    "Coat",
    "Sandal",
    "Shirt",
    "Sneaker",
    "Bag",
    "Ankle boot",
]
