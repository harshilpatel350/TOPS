"""
Generative Adversarial Network components.

Provides a simple generator function, a Discriminator class, a full
Generator class, and an adversarial training loop simulation that
works without a GPU and produces instructive log output.
"""

from __future__ import annotations

import logging
from typing import Dict, List

import numpy as np
import torch
import torch.nn as nn

from src.config import LATENT_DIM

logger = logging.getLogger(__name__)


# ═══════════════════════════════════════════════════════════════════════
# Simple generator (function-based, for demonstration)
# ═══════════════════════════════════════════════════════════════════════
def simple_generator(latent_dim: int = LATENT_DIM, output_dim: int = 784) -> nn.Sequential:
    """Return a minimal MLP generator as an ``nn.Sequential``.

    Architecture: ``latent_dim → 256 → 512 → output_dim (tanh)``.

    Args:
        latent_dim: Dimension of the input noise vector.
        output_dim: Dimension of the generated output (e.g. 784 for 28×28).

    Returns:
        A PyTorch ``nn.Sequential`` model.
    """
    model = nn.Sequential(
        nn.Linear(latent_dim, 256),
        nn.LeakyReLU(0.2, inplace=True),
        nn.Linear(256, 512),
        nn.LeakyReLU(0.2, inplace=True),
        nn.Linear(512, output_dim),
        nn.Tanh(),
    )
    logger.info(
        "Created simple_generator: %d → %d (params: %d)",
        latent_dim,
        output_dim,
        sum(p.numel() for p in model.parameters()),
    )
    return model


# ═══════════════════════════════════════════════════════════════════════
# Discriminator
# ═══════════════════════════════════════════════════════════════════════
class Discriminator(nn.Module):
    """MLP discriminator that classifies inputs as real or fake.

    Architecture: ``input_dim → 512 → 256 → 1 (sigmoid)``.

    Args:
        input_dim: Dimensionality of the input vector.
    """

    def __init__(self, input_dim: int = 784) -> None:
        super().__init__()
        self.model = nn.Sequential(
            nn.Linear(input_dim, 512),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Dropout(0.3),
            nn.Linear(512, 256),
            nn.LeakyReLU(0.2, inplace=True),
            nn.Dropout(0.3),
            nn.Linear(256, 1),
            nn.Sigmoid(),
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        """Return probability that *x* is real.

        Args:
            x: ``(B, input_dim)`` input tensor.

        Returns:
            ``(B, 1)`` tensor of probabilities.
        """
        return self.model(x)


# ═══════════════════════════════════════════════════════════════════════
# Full Generator class
# ═══════════════════════════════════════════════════════════════════════
class Generator(nn.Module):
    """MLP generator that maps noise to data space.

    Args:
        latent_dim: Dimension of the input noise vector.
        output_dim: Dimension of the generated output.
    """

    def __init__(self, latent_dim: int = LATENT_DIM, output_dim: int = 784) -> None:
        super().__init__()
        self.latent_dim = latent_dim
        self.model = nn.Sequential(
            nn.Linear(latent_dim, 256),
            nn.LeakyReLU(0.2, inplace=True),
            nn.BatchNorm1d(256),
            nn.Linear(256, 512),
            nn.LeakyReLU(0.2, inplace=True),
            nn.BatchNorm1d(512),
            nn.Linear(512, 1024),
            nn.LeakyReLU(0.2, inplace=True),
            nn.BatchNorm1d(1024),
            nn.Linear(1024, output_dim),
            nn.Tanh(),
        )

    def forward(self, z: torch.Tensor) -> torch.Tensor:
        """Generate fake data from noise vector *z*.

        Args:
            z: ``(B, latent_dim)`` noise tensor.

        Returns:
            ``(B, output_dim)`` generated data tensor.
        """
        return self.model(z)


# ═══════════════════════════════════════════════════════════════════════
# Adversarial training simulation
# ═══════════════════════════════════════════════════════════════════════
def adversarial_loop_simulation(
    generator: nn.Module,
    discriminator: Discriminator,
    device: torch.device,
    latent_dim: int = LATENT_DIM,
    steps: int = 200,
    batch_size: int = 64,
    lr: float = 2e-4,
) -> Dict[str, List[float]]:
    """Run a lightweight adversarial training loop on synthetic data.

    Instead of real images this uses random Gaussian vectors as "real"
    data so the loop completes quickly and demonstrates the GAN dynamics.

    Args:
        generator:     Generator module.
        discriminator: Discriminator module.
        device:        Torch device.
        latent_dim:    Noise vector dimension.
        steps:         Number of training steps.
        batch_size:    Batch size per step.
        lr:            Learning rate for both Adam optimisers.

    Returns:
        Dictionary with keys ``"d_losses"`` and ``"g_losses"``, each a
        list of per-step losses.
    """
    generator.to(device)
    discriminator.to(device)

    criterion = nn.BCELoss()
    opt_g = torch.optim.Adam(generator.parameters(), lr=lr, betas=(0.5, 0.999))
    opt_d = torch.optim.Adam(discriminator.parameters(), lr=lr, betas=(0.5, 0.999))

    d_losses: List[float] = []
    g_losses: List[float] = []

    real_label = 1.0
    fake_label = 0.0

    input_dim = list(discriminator.model.parameters())[0].shape[1]

    for step in range(1, steps + 1):
        # ── Train Discriminator ─────────────────────────────────────
        discriminator.zero_grad()

        # Real data (synthetic stand-in)
        real_data = torch.randn(batch_size, input_dim, device=device) * 0.5 + 0.5
        label_real = torch.full((batch_size, 1), real_label, device=device)
        output_real = discriminator(real_data)
        loss_d_real = criterion(output_real, label_real)

        # Fake data
        noise = torch.randn(batch_size, latent_dim, device=device)
        fake_data = generator(noise).detach()

        # Normalise generator output to [0,1] for discriminator
        fake_data_norm = (fake_data + 1.0) / 2.0

        label_fake = torch.full((batch_size, 1), fake_label, device=device)
        output_fake = discriminator(fake_data_norm)
        loss_d_fake = criterion(output_fake, label_fake)

        loss_d = loss_d_real + loss_d_fake
        loss_d.backward()
        opt_d.step()

        # ── Train Generator ─────────────────────────────────────────
        generator.zero_grad()
        noise = torch.randn(batch_size, latent_dim, device=device)
        fake_data = generator(noise)
        fake_data_norm = (fake_data + 1.0) / 2.0
        output = discriminator(fake_data_norm)
        loss_g = criterion(output, label_real)
        loss_g.backward()
        opt_g.step()

        d_losses.append(loss_d.item())
        g_losses.append(loss_g.item())

        if step % 50 == 0 or step == 1:
            logger.info(
                "Step %3d/%d  |  D_loss: %.4f  |  G_loss: %.4f",
                step,
                steps,
                loss_d.item(),
                loss_g.item(),
            )

    return {"d_losses": d_losses, "g_losses": g_losses}


def generate_gan_samples(
    generator: nn.Module,
    device: torch.device,
    n: int = 16,
    latent_dim: int = LATENT_DIM,
) -> np.ndarray:
    """Generate *n* samples from a trained generator.

    Args:
        generator:  Trained generator module.
        device:     Torch device.
        n:          Number of samples.
        latent_dim: Noise vector dimension.

    Returns:
        ``(n, 28, 28)`` NumPy array of generated images scaled to [0, 1].
    """
    generator.eval()
    with torch.no_grad():
        noise = torch.randn(n, latent_dim, device=device)
        samples = generator(noise).cpu().numpy()
    # Tanh output → [0, 1]
    samples = (samples + 1.0) / 2.0
    return samples.reshape(n, 28, 28)
