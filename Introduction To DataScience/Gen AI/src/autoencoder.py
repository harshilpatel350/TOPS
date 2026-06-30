"""
Autoencoder and Variational Autoencoder architectures for Fashion-MNIST.

All models expect single-channel 28×28 images and operate with a
configurable latent dimension.
"""

from __future__ import annotations

import logging
from typing import List, Literal, Tuple

import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.utils.data import DataLoader
from tqdm import tqdm

from src.config import DEFAULT_EPOCHS, DEFAULT_LEARNING_RATE, LATENT_DIM

logger = logging.getLogger(__name__)

INPUT_DIM: int = 28 * 28  # Fashion-MNIST flattened


# ═══════════════════════════════════════════════════════════════════════
# Standard Autoencoder
# ═══════════════════════════════════════════════════════════════════════
class Autoencoder(nn.Module):
    """Fully-connected autoencoder with configurable loss function.

    Args:
        latent_dim:    Size of the bottleneck representation.
        loss_function: ``"mse"`` for mean-squared-error or ``"bce"`` for
                       binary cross-entropy.
    """

    def __init__(
        self,
        latent_dim: int = LATENT_DIM,
        loss_function: Literal["mse", "bce"] = "mse",
    ) -> None:
        super().__init__()
        self.latent_dim = latent_dim
        self.loss_function = loss_function

        # Encoder
        self.encoder = nn.Sequential(
            nn.Linear(INPUT_DIM, 512),
            nn.ReLU(inplace=True),
            nn.Linear(512, 256),
            nn.ReLU(inplace=True),
            nn.Linear(256, latent_dim),
            nn.ReLU(inplace=True),
        )

        # Decoder
        self.decoder = nn.Sequential(
            nn.Linear(latent_dim, 256),
            nn.ReLU(inplace=True),
            nn.Linear(256, 512),
            nn.ReLU(inplace=True),
            nn.Linear(512, INPUT_DIM),
            nn.Sigmoid(),
        )

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        """Forward pass through encoder → decoder.

        Args:
            x: Input tensor ``(B, 784)``.

        Returns:
            Reconstructed tensor ``(B, 784)``.
        """
        z = self.encoder(x)
        return self.decoder(z)

    def compute_loss(self, x: torch.Tensor, x_hat: torch.Tensor) -> torch.Tensor:
        """Compute reconstruction loss.

        Args:
            x:     Original input.
            x_hat: Reconstructed input.

        Returns:
            Scalar loss tensor.
        """
        if self.loss_function == "bce":
            return F.binary_cross_entropy(x_hat, x, reduction="mean")
        return F.mse_loss(x_hat, x, reduction="mean")


# ═══════════════════════════════════════════════════════════════════════
# Variational Autoencoder
# ═══════════════════════════════════════════════════════════════════════
class VAE(nn.Module):
    """Variational Autoencoder with Gaussian latent space.

    Args:
        latent_dim: Dimension of the latent vector *z*.
    """

    def __init__(self, latent_dim: int = LATENT_DIM) -> None:
        super().__init__()
        self.latent_dim = latent_dim

        # Encoder
        self.fc1 = nn.Linear(INPUT_DIM, 512)
        self.fc2 = nn.Linear(512, 256)
        self.fc_mu = nn.Linear(256, latent_dim)
        self.fc_logvar = nn.Linear(256, latent_dim)

        # Decoder
        self.fc3 = nn.Linear(latent_dim, 256)
        self.fc4 = nn.Linear(256, 512)
        self.fc5 = nn.Linear(512, INPUT_DIM)

    def encode(self, x: torch.Tensor) -> Tuple[torch.Tensor, torch.Tensor]:
        """Encode input to latent distribution parameters.

        Args:
            x: ``(B, 784)`` input.

        Returns:
            ``(mu, logvar)`` each of shape ``(B, latent_dim)``.
        """
        h = F.relu(self.fc1(x))
        h = F.relu(self.fc2(h))
        return self.fc_mu(h), self.fc_logvar(h)

    @staticmethod
    def reparameterize(mu: torch.Tensor, logvar: torch.Tensor) -> torch.Tensor:
        """Reparameterization trick: z = μ + σ · ε.

        Args:
            mu:     Mean of the latent distribution.
            logvar: Log-variance of the latent distribution.

        Returns:
            Sampled latent vector ``z``.
        """
        std = torch.exp(0.5 * logvar)
        eps = torch.randn_like(std)
        return mu + std * eps

    def decode(self, z: torch.Tensor) -> torch.Tensor:
        """Decode latent vector to reconstruction.

        Args:
            z: ``(B, latent_dim)`` latent vector.

        Returns:
            Reconstructed ``(B, 784)`` tensor.
        """
        h = F.relu(self.fc3(z))
        h = F.relu(self.fc4(h))
        return torch.sigmoid(self.fc5(h))

    def forward(
        self, x: torch.Tensor
    ) -> Tuple[torch.Tensor, torch.Tensor, torch.Tensor]:
        """Full forward pass.

        Args:
            x: ``(B, 784)`` input.

        Returns:
            ``(x_hat, mu, logvar)``.
        """
        mu, logvar = self.encode(x)
        z = self.reparameterize(mu, logvar)
        x_hat = self.decode(z)
        return x_hat, mu, logvar

    @staticmethod
    def loss_function(
        x_hat: torch.Tensor,
        x: torch.Tensor,
        mu: torch.Tensor,
        logvar: torch.Tensor,
    ) -> torch.Tensor:
        """ELBO loss = Reconstruction (BCE) + KL divergence.

        Args:
            x_hat:  Reconstructed input.
            x:      Original input.
            mu:     Latent mean.
            logvar: Latent log-variance.

        Returns:
            Scalar loss.
        """
        bce = F.binary_cross_entropy(x_hat, x, reduction="sum")
        kld = -0.5 * torch.sum(1 + logvar - mu.pow(2) - logvar.exp())
        return bce + kld

    def sample(self, n: int, device: torch.device) -> torch.Tensor:
        """Generate *n* images by sampling from the prior N(0, I).

        Args:
            n:      Number of images to generate.
            device: Target device.

        Returns:
            ``(n, 1, 28, 28)`` tensor of generated images.
        """
        z = torch.randn(n, self.latent_dim, device=device)
        samples = self.decode(z)
        return samples.view(n, 1, 28, 28)


# ═══════════════════════════════════════════════════════════════════════
# Training helpers
# ═══════════════════════════════════════════════════════════════════════
def train_autoencoder(
    model: Autoencoder,
    train_loader: DataLoader,
    device: torch.device,
    epochs: int = DEFAULT_EPOCHS,
    lr: float = DEFAULT_LEARNING_RATE,
) -> List[float]:
    """Train a standard autoencoder.

    Args:
        model:        ``Autoencoder`` instance.
        train_loader: DataLoader yielding ``(images, labels)``.
        device:       Torch device.
        epochs:       Number of training epochs.
        lr:           Learning rate.

    Returns:
        List of per-epoch average losses.
    """
    model.to(device)
    optimizer = torch.optim.Adam(model.parameters(), lr=lr)
    losses: List[float] = []

    for epoch in range(1, epochs + 1):
        model.train()
        epoch_loss = 0.0
        for images, _ in tqdm(train_loader, desc=f"Epoch {epoch}/{epochs}", leave=False):
            images = images.view(images.size(0), -1).to(device)
            x_hat = model(images)
            loss = model.compute_loss(images, x_hat)
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            epoch_loss += loss.item() * images.size(0)

        avg = epoch_loss / len(train_loader.dataset)  # type: ignore[arg-type]
        losses.append(avg)
        logger.info("Epoch %d/%d  |  Loss: %.6f", epoch, epochs, avg)

    return losses


def train_vae(
    model: VAE,
    train_loader: DataLoader,
    device: torch.device,
    epochs: int = DEFAULT_EPOCHS,
    lr: float = DEFAULT_LEARNING_RATE,
) -> List[float]:
    """Train a Variational Autoencoder.

    Args:
        model:        ``VAE`` instance.
        train_loader: DataLoader yielding ``(images, labels)``.
        device:       Torch device.
        epochs:       Number of training epochs.
        lr:           Learning rate.

    Returns:
        List of per-epoch average losses.
    """
    model.to(device)
    optimizer = torch.optim.Adam(model.parameters(), lr=lr)
    losses: List[float] = []

    for epoch in range(1, epochs + 1):
        model.train()
        epoch_loss = 0.0
        for images, _ in tqdm(train_loader, desc=f"Epoch {epoch}/{epochs}", leave=False):
            images = images.view(images.size(0), -1).to(device)
            x_hat, mu, logvar = model(images)
            loss = model.loss_function(x_hat, images, mu, logvar)
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()
            epoch_loss += loss.item()

        avg = epoch_loss / len(train_loader.dataset)  # type: ignore[arg-type]
        losses.append(avg)
        logger.info("Epoch %d/%d  |  ELBO Loss: %.4f", epoch, epochs, avg)

    return losses
