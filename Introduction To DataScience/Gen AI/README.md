<div align="center">

# 🧪 Generative AI Lab

**A production-quality, GitHub-ready Generative AI Laboratory**

[![Python 3.12](https://img.shields.io/badge/python-3.12-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Code Style: PEP 8](https://img.shields.io/badge/code%20style-PEP%208-orange.svg)](https://peps.python.org/pep-0008/)

*Hands-on notebooks covering Autoencoders, VAEs, GANs, Diffusion Models, and industry applications — all free, open-source, and executable on CPU.*

</div>

---

## Table of Contents

- [Features](#features)
- [Repository Structure](#repository-structure)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Learning Roadmap](#learning-roadmap)
- [Session Overview](#session-overview)
- [Testing](#testing)
- [Screenshots](#screenshots)
- [Future Improvements](#future-improvements)
- [Contributing](#contributing)
- [License](#license)
- [References](#references)

---

## Features

- **7 comprehensive Jupyter notebooks** with theory, code, visualisations, and interview questions.
- **Reusable `src/` modules** — no code duplication across notebooks.
- **Zero paid APIs** — everything runs locally with free/open-source libraries.
- **Cross-platform** — Windows, Linux, and macOS.
- **Production coding standards** — PEP 8, type hints, docstrings, logging, error handling.
- **Pytest test suite** for utilities and chatbot.
- **Fashion-MNIST** as the primary dataset (auto-downloaded).

---

## Repository Structure

```text
generative-ai-lab/
├── assets/                     # Static assets (diagrams, logos)
├── datasets/                   # Auto-downloaded datasets (git-ignored)
├── generated_images/           # Model-generated images
├── notebooks/
│   ├── session01_intro_to_generative_models.ipynb
│   ├── session02_autoencoder_and_vae.ipynb
│   ├── session03_gan.ipynb
│   ├── session04_diffusion_models.ipynb
│   ├── session05_industry_applications.ipynb
│   ├── genai_intro.ipynb
│   └── comparison_traditional_ai_vs_genai.ipynb
├── outputs/                    # Text outputs (ipl_summary.txt, etc.)
├── prompts/
│   └── chatbot_prompts.json
├── reports/                    # Generated reports
├── src/
│   ├── __init__.py
│   ├── config.py               # Centralised paths and constants
│   ├── data_loader.py          # Fashion-MNIST loader
│   ├── autoencoder.py          # AE (MSE/BCE) + VAE + training
│   ├── gan.py                  # Generator, Discriminator, training loop
│   ├── diffusion.py            # Forward/reverse diffusion
│   ├── chatbot.py              # Rule-based restaurant chatbot
│   ├── summarizer.py           # Extractive IPL summariser
│   ├── playlist.py             # Playlist filter
│   ├── prompt_engineering.py   # Prompt examples and templates
│   ├── utils.py                # Seeding, device, logging, helpers
│   └── visualization.py        # Plotting utilities
├── tests/
│   ├── __init__.py
│   ├── test_utils.py
│   └── test_chatbot.py
├── .gitignore
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE                     # MIT
├── README.md
├── generate_notebooks.py       # Notebook generator script
├── pyproject.toml
├── requirements.txt
└── setup.cfg
```

---

## Installation

### Prerequisites

- **Python 3.12** or later
- **pip** (comes with Python)

### Step-by-step

```bash
# 1. Clone the repository
git clone https://github.com/your-username/generative-ai-lab.git
cd generative-ai-lab

# 2. Create a virtual environment
python -m venv venv

# 3. Activate the virtual environment
# Windows
venv\Scripts\activate
# macOS / Linux
source venv/bin/activate

# 4. Install dependencies
pip install -r requirements.txt

# 5. (Optional) Install in development mode
pip install -e ".[dev]"

# 6. Launch Jupyter
jupyter notebook
```

> **Note:** Fashion-MNIST (~30 MB) is downloaded automatically on first run.

---

## Quick Start

```bash
# Run all tests
pytest

# Open a specific notebook
jupyter notebook notebooks/session02_autoencoder_and_vae.ipynb

# Generate notebooks from scratch (if needed)
python generate_notebooks.py
```

---

## Learning Roadmap

```
Week 1  ──►  genai_intro.ipynb
             comparison_traditional_ai_vs_genai.ipynb
             Session 01 — Introduction to Generative Models

Week 2  ──►  Session 02 — Autoencoders & VAEs

Week 3  ──►  Session 03 — GANs

Week 4  ──►  Session 04 — Diffusion Models

Week 5  ──►  Session 05 — Industry Applications
```

Each session includes:
- 📝 Theory and mathematical background
- 🏗️ Architecture diagrams (Mermaid)
- 💻 Fully executable code
- 📊 Visualisations and interpretation
- 🎯 Summary and key takeaways
- 🎤 Interview questions
- 📚 Academic references

---

## Session Overview

| # | Session | Key Topics |
|---|---------|-----------|
| 0 | **GenAI Intro** | AI hierarchy, GenAI landscape, market trends |
| 0 | **Traditional vs GenAI** | Side-by-side comparison, radar charts, use-case mapping |
| 1 | **Intro to Generative Models** | Model families, timelines, ChatGPT Q&A, pandas tables |
| 2 | **Autoencoders & VAEs** | Fashion-MNIST, MSE vs BCE, denoising, VAE sampling, loss plots |
| 3 | **GANs** | simple_generator(), Discriminator, adversarial loop, variant comparison |
| 4 | **Diffusion Models** | Forward diffusion, reverse approximation, noise visualisation |
| 5 | **Industry Applications** | IPL summariser, restaurant chatbot, playlist filter, prompt engineering |

---

## Testing

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=src --cov-report=term-missing

# Run specific test file
pytest tests/test_chatbot.py -v
```

---

## Screenshots

> Generated images, loss plots, and visualisations are produced when running the notebooks.
> Run any session notebook to populate `generated_images/` and see results inline.

**Example outputs you will see:**
- Fashion-MNIST reconstruction comparison (MSE vs BCE)
- VAE-generated images from latent sampling
- GAN training loss curves (generator vs discriminator)
- Diffusion noise progression (clean → noisy → denoised)
- Radar chart: Traditional AI vs Generative AI

---

## Future Improvements

- [ ] Add convolutional architectures (Conv-AE, DCGAN)
- [ ] Implement a proper DDPM training loop with U-Net
- [ ] Add conditional generation (class-conditional VAE/GAN)
- [ ] Integrate a local LLM (e.g., LLaMA.cpp) for the chatbot
- [ ] Add Streamlit/Gradio demos for interactive exploration
- [ ] Implement FID and IS metrics for generation quality evaluation
- [ ] Add MLflow experiment tracking
- [ ] Create Docker support for reproducible environments

---

## Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for
guidelines on code style, commit messages, and the pull-request process.

---

## License

This project is licensed under the **MIT License** — see [LICENSE](LICENSE) for details.

---

## References

1. Goodfellow, I. et al. (2014). *Generative Adversarial Nets*. NeurIPS.
2. Kingma, D. P. & Welling, M. (2014). *Auto-Encoding Variational Bayes*. ICLR.
3. Ho, J. et al. (2020). *Denoising Diffusion Probabilistic Models*. NeurIPS.
4. Vaswani, A. et al. (2017). *Attention Is All You Need*. NeurIPS.
5. Brown, T. et al. (2020). *Language Models are Few-Shot Learners*. NeurIPS.
6. Rombach, R. et al. (2022). *High-Resolution Image Synthesis with Latent Diffusion Models*. CVPR.
7. Xiao, H., Rasul, K. & Vollgraf, R. (2017). *Fashion-MNIST*. arXiv.
8. Wei, J. et al. (2022). *Chain-of-Thought Prompting Elicits Reasoning in LLMs*. NeurIPS.

---

<div align="center">

**Built with ❤️ for learning Generative AI**

</div>
