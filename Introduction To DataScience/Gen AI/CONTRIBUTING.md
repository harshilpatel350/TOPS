# Contributing to Generative AI Lab

Thank you for your interest in contributing! This guide will help you get
started.

---

## Getting Started

1. **Fork** this repository.
2. **Clone** your fork locally:

   ```bash
   git clone https://github.com/<your-username>/generative-ai-lab.git
   cd generative-ai-lab
   ```

3. **Create a virtual environment** (Python 3.12):

   ```bash
   python -m venv venv
   # Windows
   venv\Scripts\activate
   # macOS / Linux
   source venv/bin/activate
   ```

4. **Install dependencies**:

   ```bash
   pip install -r requirements.txt
   pip install -e ".[dev]"
   ```

5. **Create a feature branch**:

   ```bash
   git checkout -b feature/my-awesome-feature
   ```

---

## Coding Standards

| Guideline       | Expectation                                            |
| ---------------- | ------------------------------------------------------ |
| Style            | PEP 8 (max line length 99)                             |
| Type hints       | Required on all public functions                       |
| Docstrings       | Google-style docstrings on every module, class, method  |
| Logging          | Use `logging` — never bare `print()` for diagnostics   |
| Error handling   | Explicit exceptions; never silent `except: pass`       |
| Tests            | Pytest; every new utility must have a corresponding test|
| Relative paths   | Use `pathlib.Path` with project-relative references     |

---

## Commit Messages

Follow the [Conventional Commits](https://www.conventionalcommits.org/)
specification:

```
feat: add VAE latent-space interpolation notebook
fix: correct BCE loss dimension in autoencoder
docs: update README installation steps
test: add unit tests for playlist filter
```

---

## Pull-Request Checklist

- [ ] Code follows PEP 8 with type hints and docstrings.
- [ ] All notebooks run top-to-bottom without errors.
- [ ] New tests pass (`pytest`).
- [ ] CHANGELOG.md is updated.
- [ ] No paid APIs or proprietary dependencies introduced.

---

## Reporting Issues

Open an issue with:

1. A descriptive title.
2. Steps to reproduce (if bug).
3. Expected vs. actual behavior.
4. Python version and OS.

---

## Code of Conduct

Be respectful, inclusive, and constructive. Harassment of any kind is not
tolerated.

---

Thank you for helping make **Generative AI Lab** better!
