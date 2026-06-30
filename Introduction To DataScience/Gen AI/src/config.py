"""
Configuration — centralised paths and constants.

All paths are relative to the repository root so the code is portable
across Windows, Linux, and macOS.
"""

from pathlib import Path

# ── Repository root (two levels up from src/config.py) ──────────────────
ROOT_DIR: Path = Path(__file__).resolve().parent.parent

# ── Directory layout ────────────────────────────────────────────────────
ASSETS_DIR: Path = ROOT_DIR / "assets"
DATASETS_DIR: Path = ROOT_DIR / "datasets"
GENERATED_IMAGES_DIR: Path = ROOT_DIR / "generated_images"
NOTEBOOKS_DIR: Path = ROOT_DIR / "notebooks"
OUTPUTS_DIR: Path = ROOT_DIR / "outputs"
PROMPTS_DIR: Path = ROOT_DIR / "prompts"
REPORTS_DIR: Path = ROOT_DIR / "reports"

# ── Training defaults ──────────────────────────────────────────────────
DEFAULT_BATCH_SIZE: int = 64
DEFAULT_LEARNING_RATE: float = 1e-3
DEFAULT_EPOCHS: int = 10
LATENT_DIM: int = 16
IMAGE_SIZE: int = 28  # Fashion-MNIST native resolution
NOISE_FACTOR: float = 0.5
RANDOM_SEED: int = 42


def ensure_dirs() -> None:
    """Create every project directory if it does not already exist."""
    for d in (
        ASSETS_DIR,
        DATASETS_DIR,
        GENERATED_IMAGES_DIR,
        NOTEBOOKS_DIR,
        OUTPUTS_DIR,
        PROMPTS_DIR,
        REPORTS_DIR,
    ):
        d.mkdir(parents=True, exist_ok=True)
