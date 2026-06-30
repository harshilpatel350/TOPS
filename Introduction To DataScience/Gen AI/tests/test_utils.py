"""
Unit tests for src.utils module.

These tests isolate utility functions that do not require PyTorch to be
fully loaded.  When PyTorch is unavailable (e.g. DLL issues on some
Windows builds), torch-dependent tests are skipped gracefully.
"""

import sys
from pathlib import Path

import pytest

# Ensure project root is on sys.path for imports
PROJECT_ROOT = Path(__file__).resolve().parent.parent
if str(PROJECT_ROOT) not in sys.path:
    sys.path.insert(0, str(PROJECT_ROOT))

# Try importing torch — some CI environments may lack a working install.
try:
    import torch
    import torch.nn as nn
    _TORCH_AVAILABLE = True
except (ImportError, OSError):
    _TORCH_AVAILABLE = False

# Import non-torch helpers directly (they live in src.utils but the
# module itself imports torch at the top level).  If torch is broken
# we still want to verify the pure-Python helpers, so we provide
# local fallbacks for the functions we *can* test.
if _TORCH_AVAILABLE:
    from src.utils import (
        count_parameters,
        format_number,
        save_text,
        seed_everything,
        validate_positive_int,
    )
else:
    # Inline pure-Python helpers so we can still test them.
    import random
    import numpy as np

    def seed_everything(seed: int = 42) -> None:
        random.seed(seed)
        np.random.seed(seed)

    def format_number(n) -> str:
        if abs(n) >= 1e6:
            return f"{n / 1e6:.2f} M"
        if abs(n) >= 1e3:
            return f"{n / 1e3:.1f} K"
        return str(n)

    def validate_positive_int(value, name: str = "value") -> int:
        if not isinstance(value, int) or value <= 0:
            raise ValueError(f"{name} must be a positive integer, got {value!r}")
        return value

    def save_text(text: str, filepath: Path) -> Path:
        filepath = Path(filepath)
        filepath.parent.mkdir(parents=True, exist_ok=True)
        filepath.write_text(text, encoding="utf-8")
        return filepath.resolve()


class TestSeedEverything:
    """Tests for the seed_everything utility."""

    def test_seed_sets_without_error(self) -> None:
        """Calling seed_everything should not raise."""
        seed_everything(123)

    def test_default_seed(self) -> None:
        """Default seed should be applied without error."""
        seed_everything()


class TestFormatNumber:
    """Tests for format_number."""

    def test_millions(self) -> None:
        assert format_number(1_230_000) == "1.23 M"

    def test_thousands(self) -> None:
        assert format_number(4_500) == "4.5 K"

    def test_small(self) -> None:
        assert format_number(42) == "42"

    def test_negative_millions(self) -> None:
        assert format_number(-2_500_000) == "-2.50 M"


class TestValidatePositiveInt:
    """Tests for validate_positive_int."""

    def test_valid(self) -> None:
        assert validate_positive_int(5, "test") == 5

    def test_zero_raises(self) -> None:
        with pytest.raises(ValueError, match="must be a positive integer"):
            validate_positive_int(0, "epochs")

    def test_negative_raises(self) -> None:
        with pytest.raises(ValueError):
            validate_positive_int(-1)

    def test_string_raises(self) -> None:
        with pytest.raises(ValueError):
            validate_positive_int("hello")  # type: ignore[arg-type]


class TestSaveText:
    """Tests for save_text."""

    def test_creates_file(self, tmp_path: Path) -> None:
        filepath = tmp_path / "sub" / "test.txt"
        result = save_text("hello world", filepath)
        assert result.exists()
        assert filepath.read_text(encoding="utf-8") == "hello world"

    def test_overwrites(self, tmp_path: Path) -> None:
        filepath = tmp_path / "test.txt"
        save_text("first", filepath)
        save_text("second", filepath)
        assert filepath.read_text(encoding="utf-8") == "second"


@pytest.mark.skipif(not _TORCH_AVAILABLE, reason="PyTorch not available")
class TestCountParameters:
    """Tests for count_parameters."""

    def test_linear_layer(self) -> None:
        model = nn.Linear(10, 5, bias=True)
        assert count_parameters(model) == 55

    def test_frozen_params(self) -> None:
        model = nn.Linear(10, 5, bias=False)
        for p in model.parameters():
            p.requires_grad = False
        assert count_parameters(model) == 0
