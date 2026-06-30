"""
Simplified diffusion model utilities.

Implements:
- Forward diffusion process (adding noise over *T* timesteps).
- Reverse-process approximation (iterative denoising).
- Noise-schedule helpers.

These are *educational* implementations designed to run on CPU in
seconds rather than requiring hours of GPU training.
"""

from __future__ import annotations

import logging
from typing import List, Tuple

import numpy as np
import torch

from src.config import GENERATED_IMAGES_DIR

logger = logging.getLogger(__name__)


# ═══════════════════════════════════════════════════════════════════════
# Noise schedule
# ═══════════════════════════════════════════════════════════════════════
def linear_beta_schedule(timesteps: int = 300, beta_start: float = 1e-4, beta_end: float = 0.02) -> torch.Tensor:
    """Return a linearly spaced β schedule.

    Args:
        timesteps:  Number of diffusion steps *T*.
        beta_start: Starting noise level.
        beta_end:   Ending noise level.

    Returns:
        1-D tensor of shape ``(timesteps,)``.
    """
    return torch.linspace(beta_start, beta_end, timesteps)


def precompute_schedule(betas: torch.Tensor) -> dict[str, torch.Tensor]:
    """Precompute α, ᾱ, and √ᾱ tensors from the β schedule.

    Args:
        betas: 1-D tensor of noise levels.

    Returns:
        Dictionary containing ``alphas``, ``alphas_cumprod``,
        ``sqrt_alphas_cumprod``, and ``sqrt_one_minus_alphas_cumprod``.
    """
    alphas = 1.0 - betas
    alphas_cumprod = torch.cumprod(alphas, dim=0)
    return {
        "betas": betas,
        "alphas": alphas,
        "alphas_cumprod": alphas_cumprod,
        "sqrt_alphas_cumprod": torch.sqrt(alphas_cumprod),
        "sqrt_one_minus_alphas_cumprod": torch.sqrt(1.0 - alphas_cumprod),
    }


# ═══════════════════════════════════════════════════════════════════════
# Forward diffusion (q)
# ═══════════════════════════════════════════════════════════════════════
def forward_diffusion(
    x0: torch.Tensor,
    t: int,
    schedule: dict[str, torch.Tensor],
) -> Tuple[torch.Tensor, torch.Tensor]:
    """Apply forward diffusion to an image at timestep *t*.

    q(x_t | x_0) = √ᾱ_t · x_0 + √(1 − ᾱ_t) · ε

    Args:
        x0:       Clean image tensor ``(1, H, W)`` or ``(H, W)``.
        t:        Timestep index (0-based).
        schedule: Precomputed schedule dictionary.

    Returns:
        ``(noisy_image, noise)`` tuple.
    """
    noise = torch.randn_like(x0)
    sqrt_alpha_bar = schedule["sqrt_alphas_cumprod"][t]
    sqrt_one_minus = schedule["sqrt_one_minus_alphas_cumprod"][t]
    x_t = sqrt_alpha_bar * x0 + sqrt_one_minus * noise
    return x_t, noise


def forward_diffusion_sequence(
    x0: torch.Tensor,
    timesteps: List[int],
    schedule: dict[str, torch.Tensor],
) -> List[torch.Tensor]:
    """Return noisy images at each of the given timesteps.

    Useful for visualising the progressive noising process.

    Args:
        x0:        Clean image tensor.
        timesteps: Sorted list of timestep indices to snapshot.
        schedule:  Precomputed schedule dictionary.

    Returns:
        List of noisy image tensors (one per timestep).
    """
    images: List[torch.Tensor] = []
    for t in timesteps:
        noisy, _ = forward_diffusion(x0, t, schedule)
        images.append(noisy)
    return images


# ═══════════════════════════════════════════════════════════════════════
# Reverse diffusion approximation
# ═══════════════════════════════════════════════════════════════════════
def reverse_diffusion_approximation(
    x_t: torch.Tensor,
    schedule: dict[str, torch.Tensor],
    start_t: int | None = None,
) -> Tuple[torch.Tensor, List[torch.Tensor]]:
    """Approximate the reverse diffusion by iteratively removing noise.

    This is a *simplified* pedagogical implementation: at each step
    it subtracts the estimated noise component scaled by the schedule.

    Args:
        x_t:     Noisy image at timestep *start_t*.
        schedule: Precomputed schedule dictionary.
        start_t: Starting timestep (defaults to the last step).

    Returns:
        ``(denoised_image, intermediate_snapshots)``.
    """
    if start_t is None:
        start_t = len(schedule["betas"]) - 1

    x = x_t.clone()
    snapshots: List[torch.Tensor] = []

    snapshot_interval = max(1, start_t // 5)

    for t in reversed(range(0, start_t + 1)):
        beta_t = schedule["betas"][t]
        alpha_t = schedule["alphas"][t]
        alpha_bar_t = schedule["alphas_cumprod"][t]

        # Simplified denoising step
        noise_estimate = (x - torch.sqrt(alpha_bar_t) * x.clamp(-1, 1)) / (
            torch.sqrt(1.0 - alpha_bar_t) + 1e-8
        )
        x = (x - beta_t / (torch.sqrt(1.0 - alpha_bar_t) + 1e-8) * noise_estimate) / (
            torch.sqrt(alpha_t) + 1e-8
        )
        x = torch.clamp(x, 0.0, 1.0)

        if t % snapshot_interval == 0:
            snapshots.append(x.clone())

    return x, snapshots


# ═══════════════════════════════════════════════════════════════════════
# Convenience wrappers
# ═══════════════════════════════════════════════════════════════════════
def generate_diffusion_samples(
    n: int = 5,
    image_size: int = 28,
    timesteps: int = 300,
) -> np.ndarray:
    """Generate *n* images using the simplified diffusion process.

    The function:
    1. Starts from pure noise.
    2. Runs the reverse approximation.
    3. Returns the denoised images.

    Args:
        n:          Number of images to generate.
        image_size: Spatial dimension (square).
        timesteps:  Total diffusion steps.

    Returns:
        ``(n, image_size, image_size)`` NumPy array in [0, 1].
    """
    betas = linear_beta_schedule(timesteps)
    schedule = precompute_schedule(betas)

    generated: List[np.ndarray] = []
    for i in range(n):
        noise = torch.randn(1, image_size, image_size)
        denoised, _ = reverse_diffusion_approximation(noise, schedule)
        generated.append(denoised.squeeze().numpy())
        logger.info("Generated diffusion sample %d/%d", i + 1, n)

    return np.stack(generated)
