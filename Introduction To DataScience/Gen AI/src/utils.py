"""
General-purpose utilities — seeding, device selection, model helpers.
"""

from __future__ import annotations

import logging
import random
import sys
from pathlib import Path
from typing import Any

import numpy as np
import torch

from src.config import RANDOM_SEED

logger = logging.getLogger(__name__)


# ── Reproducibility ────────────────────────────────────────────────────
def seed_everything(seed: int = RANDOM_SEED) -> None:
    """Set random seeds for Python, NumPy, and PyTorch for reproducibility.

    Args:
        seed: Integer seed value.
    """
    random.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)
    if torch.cuda.is_available():
        torch.cuda.manual_seed_all(seed)
    logger.info("Random seed set to %d", seed)


# ── Device ─────────────────────────────────────────────────────────────
def get_device() -> torch.device:
    """Return the best available device (CUDA → MPS → CPU).

    Returns:
        ``torch.device`` instance.
    """
    if torch.cuda.is_available():
        device = torch.device("cuda")
    elif hasattr(torch.backends, "mps") and torch.backends.mps.is_available():
        device = torch.device("mps")
    else:
        device = torch.device("cpu")
    logger.info("Using device: %s", device)
    return device


# ── Logging setup ──────────────────────────────────────────────────────
def setup_logging(level: int = logging.INFO) -> None:
    """Configure root logger with a consistent format.

    Args:
        level: Logging level (default ``logging.INFO``).
    """
    logging.basicConfig(
        level=level,
        format="%(asctime)s | %(name)-28s | %(levelname)-7s | %(message)s",
        datefmt="%Y-%m-%d %H:%M:%S",
        stream=sys.stdout,
    )


# ── File helpers ───────────────────────────────────────────────────────
def save_text(text: str, filepath: Path) -> Path:
    """Write *text* to *filepath*, creating parent dirs as needed.

    Args:
        text:     Content to write.
        filepath: Destination path.

    Returns:
        The resolved ``Path`` that was written.
    """
    filepath = Path(filepath)
    filepath.parent.mkdir(parents=True, exist_ok=True)
    filepath.write_text(text, encoding="utf-8")
    logger.info("Saved text file → %s (%d chars)", filepath, len(text))
    return filepath.resolve()


def count_parameters(model: torch.nn.Module) -> int:
    """Return total number of trainable parameters.

    Args:
        model: A PyTorch ``nn.Module``.

    Returns:
        Integer count of trainable parameters.
    """
    return sum(p.numel() for p in model.parameters() if p.requires_grad)


def format_number(n: int | float) -> str:
    """Return a human-friendly string for large numbers.

    Args:
        n: A numeric value.

    Returns:
        Formatted string, e.g. ``"1.23 M"`` or ``"456 K"``.
    """
    if abs(n) >= 1e6:
        return f"{n / 1e6:.2f} M"
    if abs(n) >= 1e3:
        return f"{n / 1e3:.1f} K"
    return str(n)


def validate_positive_int(value: Any, name: str = "value") -> int:
    """Validate and return a positive integer.

    Args:
        value: The value to validate.
        name:  Name shown in the error message.

    Returns:
        The validated integer.

    Raises:
        ValueError: If *value* is not a positive integer.
    """
    if not isinstance(value, int) or value <= 0:
        raise ValueError(f"{name} must be a positive integer, got {value!r}")
    return value
