#!/usr/bin/env python3
"""
Notebook generator — creates all 7 .ipynb notebooks for generative-ai-lab.

Run this script from the repository root:
    python generate_notebooks.py

It writes fully-formed Jupyter notebooks into the notebooks/ directory.
"""

import json
from pathlib import Path

NOTEBOOKS_DIR = Path(__file__).resolve().parent / "notebooks"
NOTEBOOKS_DIR.mkdir(parents=True, exist_ok=True)

METADATA = {
    "kernelspec": {
        "display_name": "Python 3",
        "language": "python",
        "name": "python3",
    },
    "language_info": {
        "name": "python",
        "version": "3.12.0",
        "mimetype": "text/x-python",
        "file_extension": ".py",
    },
}


def md(source: str) -> dict:
    """Create a markdown cell."""
    return {"cell_type": "markdown", "metadata": {}, "source": source.split("\n")}


def code(source: str) -> dict:
    """Create a code cell."""
    lines = source.split("\n")
    return {
        "cell_type": "code",
        "execution_count": None,
        "metadata": {},
        "outputs": [],
        "source": lines,
    }


def make_notebook(cells: list[dict]) -> dict:
    return {"cells": cells, "metadata": METADATA, "nbformat": 4, "nbformat_minor": 5}


def save_notebook(nb: dict, name: str) -> None:
    path = NOTEBOOKS_DIR / name
    with open(path, "w", encoding="utf-8") as f:
        json.dump(nb, f, indent=1, ensure_ascii=False)
    print(f"  [OK] {path}")


# ═══════════════════════════════════════════════════════════════════════════
# SESSION 01 — Introduction to Generative Models
# ═══════════════════════════════════════════════════════════════════════════
def session01() -> dict:
    cells = [
        md("# Session 01 — Introduction to Generative Models\n\n"
           "**Date:** 2025  \n"
           "**Author:** Generative AI Lab"),

        md("## Objectives\n\n"
           "1. Understand what generative AI is and how it differs from discriminative AI.\n"
           "2. Survey the landscape of generative model families.\n"
           "3. Explore real-world applications of generative models.\n"
           "4. Practice prompt-based interactions with ChatGPT-style Q&A.\n"
           "5. Build comparison tables using pandas."),

        md("## Theory\n\n"
           "### What is Generative AI?\n\n"
           "**Generative AI** refers to algorithms that can create new data samples — text, images, audio, code — "
           "that resemble the training distribution. Unlike **discriminative models** (which learn decision boundaries), "
           "generative models learn the joint probability distribution $P(X)$ or $P(X|Y)$ and can *sample* from it.\n\n"
           "### Key Families\n\n"
           "| Family | Core Idea | Example |\n"
           "|--------|-----------|--------|\n"
           "| Autoencoders / VAEs | Compress → latent space → reconstruct | Fashion-MNIST generation |\n"
           "| GANs | Generator vs Discriminator game | StyleGAN, DeepFake |\n"
           "| Diffusion Models | Iterative denoising from Gaussian noise | DALL·E 2, Stable Diffusion |\n"
           "| Transformers (LLMs) | Autoregressive token prediction | GPT-4, LLaMA |\n"
           "| Flow-based Models | Invertible transformations | Glow, RealNVP |\n\n"
           "### Architecture Diagram\n\n"
           "```mermaid\n"
           "graph LR\n"
           "    A[Input Data] --> B[Encoder / Feature Extraction]\n"
           "    B --> C[Latent Space z]\n"
           "    C --> D[Decoder / Generator]\n"
           "    D --> E[Generated Output]\n"
           "    style C fill:#f9f,stroke:#333\n"
           "```"),

        md("## Learning Outcomes\n\n"
           "After completing this session you will be able to:\n"
           "- Define generative AI and distinguish it from discriminative AI.\n"
           "- List five families of generative models with examples.\n"
           "- Explain the encoder–decoder paradigm.\n"
           "- Use pandas DataFrames for structured comparisons."),

        md("---\n## Part 1 — Generative AI Landscape (Pandas Tables)"),

        code("import sys\n"
             "from pathlib import Path\n"
             "\n"
             "# Ensure repo root is on the path\n"
             "PROJECT_ROOT = Path.cwd().parent if Path.cwd().name == 'notebooks' else Path.cwd()\n"
             "if str(PROJECT_ROOT) not in sys.path:\n"
             "    sys.path.insert(0, str(PROJECT_ROOT))\n"
             "\n"
             "import pandas as pd\n"
             "import matplotlib.pyplot as plt\n"
             "import numpy as np\n"
             "\n"
             "print('Environment ready ✓')"),

        code("# Comparison table: Generative model families\n"
             "families = pd.DataFrame({\n"
             "    'Model Family': ['Autoencoders', 'VAEs', 'GANs', 'Diffusion Models', 'Transformers (LLMs)', 'Flow-based Models'],\n"
             "    'Core Mechanism': [\n"
             "        'Encoder-decoder reconstruction',\n"
             "        'Probabilistic latent space (ELBO)',\n"
             "        'Adversarial min-max game',\n"
             "        'Iterative denoising',\n"
             "        'Autoregressive token prediction',\n"
             "        'Invertible normalising flows',\n"
             "    ],\n"
             "    'Output Type': ['Images', 'Images', 'Images/Video', 'Images', 'Text/Code', 'Images'],\n"
             "    'Key Strength': [\n"
             "        'Simple architecture',\n"
             "        'Smooth latent space',\n"
             "        'High-quality images',\n"
             "        'State-of-the-art quality',\n"
             "        'Language understanding',\n"
             "        'Exact likelihood',\n"
             "    ],\n"
             "    'Key Weakness': [\n"
             "        'Blurry outputs',\n"
             "        'Blurry outputs',\n"
             "        'Training instability',\n"
             "        'Slow sampling',\n"
             "        'High compute cost',\n"
             "        'Limited scalability',\n"
             "    ],\n"
             "    'Notable Example': ['Denoising AE', 'β-VAE', 'StyleGAN', 'Stable Diffusion', 'GPT-4', 'Glow'],\n"
             "})\n"
             "families.index = range(1, len(families) + 1)\n"
             "families.index.name = '#'\n"
             "families"),

        md("### Interpretation\n\n"
           "The table above shows that each generative model family occupies a different "
           "trade-off in quality, speed, and training stability. **Diffusion models** currently "
           "lead in image quality, while **Transformers** dominate text generation."),

        md("---\n## Part 2 — Timeline of Generative AI Milestones"),

        code("milestones = pd.DataFrame({\n"
             "    'Year': [2013, 2014, 2014, 2017, 2018, 2020, 2021, 2022, 2023, 2024],\n"
             "    'Milestone': [\n"
             "        'VAE introduced (Kingma & Welling)',\n"
             "        'GAN introduced (Goodfellow et al.)',\n"
             "        'Conditional GAN (cGAN)',\n"
             "        'Transformer architecture (Vaswani et al.)',\n"
             "        'GPT-1 released (OpenAI)',\n"
             "        'GPT-3 (175B parameters)',\n"
             "        'DALL·E (text-to-image)',\n"
             "        'Stable Diffusion (open-source)',\n"
             "        'GPT-4 (multimodal)',\n"
             "        'Sora (text-to-video)',\n"
             "    ],\n"
             "    'Category': ['VAE', 'GAN', 'GAN', 'Transformer', 'Transformer',\n"
             "                 'Transformer', 'Diffusion', 'Diffusion', 'Transformer', 'Diffusion'],\n"
             "})\n"
             "milestones.index = range(1, len(milestones) + 1)\n"
             "milestones.index.name = '#'\n"
             "milestones"),

        code("# Visualise milestones\n"
             "fig, ax = plt.subplots(figsize=(12, 4))\n"
             "colors = {'VAE': '#e74c3c', 'GAN': '#3498db', 'Transformer': '#2ecc71', 'Diffusion': '#9b59b6'}\n"
             "for _, row in milestones.iterrows():\n"
             "    ax.scatter(row['Year'], 0.5, c=colors[row['Category']], s=120, zorder=5)\n"
             "    ax.annotate(row['Milestone'], (row['Year'], 0.5),\n"
             "               textcoords='offset points', xytext=(0, 15 if _ % 2 == 0 else -25),\n"
             "               fontsize=7, ha='center', rotation=30)\n"
             "\n"
             "for cat, color in colors.items():\n"
             "    ax.scatter([], [], c=color, label=cat, s=80)\n"
             "ax.legend(loc='lower right', fontsize=9)\n"
             "ax.set_xlim(2012, 2025)\n"
             "ax.set_yticks([])\n"
             "ax.set_title('Generative AI Milestones Timeline', fontsize=14)\n"
             "ax.grid(axis='x', alpha=0.3)\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("---\n## Part 3 — ChatGPT-Style Q&A (Prompt + Response + Explanation)\n\n"
           "Below are prompts that would be sent to ChatGPT, along with the generated responses "
           "and explanations. No API is called — these are documented for educational purposes."),

        code("# ChatGPT-style Q&A table\n"
             "qa_data = [\n"
             "    {\n"
             "        'Prompt': 'Explain Generative AI in simple terms.',\n"
             "        'Generated Answer': (\n"
             "            'Generative AI is a type of artificial intelligence that can create new content — '\n"
             "            'such as text, images, music, or code — by learning patterns from existing data. '\n"
             "            'Think of it as an AI that can imagine and produce things that never existed before, '\n"
             "            'similar to how a human artist creates a new painting after studying many artworks.'\n"
             "        ),\n"
             "        'Explanation': (\n"
             "            'This uses a zero-shot prompt. The model draws on its pre-training to provide '\n"
             "            'an accessible analogy (artist → AI) that makes the concept tangible.'\n"
             "        ),\n"
             "    },\n"
             "    {\n"
             "        'Prompt': 'What is the difference between a GAN and a VAE?',\n"
             "        'Generated Answer': (\n"
             "            'A GAN uses two neural networks (generator and discriminator) that compete in a '\n"
             "            'minimax game — the generator tries to create realistic data while the discriminator '\n"
             "            'tries to distinguish real from fake. A VAE, on the other hand, uses an encoder to '\n"
             "            'map data to a probabilistic latent space and a decoder to reconstruct it, optimised '\n"
             "            'via the Evidence Lower Bound (ELBO). GANs tend to produce sharper images but are '\n"
             "            'harder to train; VAEs offer smoother latent spaces but may produce blurrier outputs.'\n"
             "        ),\n"
             "        'Explanation': (\n"
             "            'A direct comparison prompt. The model structures its answer by first explaining '\n"
             "            'each architecture and then contrasting their strengths/weaknesses.'\n"
             "        ),\n"
             "    },\n"
             "    {\n"
             "        'Prompt': 'List 5 real-world applications of generative AI.',\n"
             "        'Generated Answer': (\n"
             "            '1. **Content Creation** — generating marketing copy, blog posts, and social media content.\\n'\n"
             "            '2. **Drug Discovery** — designing novel molecular structures for pharmaceuticals.\\n'\n"
             "            '3. **Image Synthesis** — creating product mockups, fashion designs, and art.\\n'\n"
             "            '4. **Code Generation** — auto-completing code, writing boilerplate, and debugging.\\n'\n"
             "            '5. **Personalised Education** — generating custom quizzes, explanations, and study plans.'\n"
             "        ),\n"
             "        'Explanation': (\n"
             "            'A list-format prompt that constrains the model to exactly 5 items. '\n"
             "            'The model uses bold formatting and diverse domains to show breadth.'\n"
             "        ),\n"
             "    },\n"
             "    {\n"
             "        'Prompt': 'Explain the concept of latent space as if I am 10 years old.',\n"
             "        'Generated Answer': (\n"
             "            'Imagine you have a magic box. You put a picture of a cat into the box, and '\n"
             "            'the box squishes it down into a tiny secret code — just a few numbers. '\n"
             "            'That secret code is the \"latent space\". Now, if you give the box a different '\n"
             "            'secret code, it can draw a brand new picture that looks like a cat but is '\n"
             "            'totally unique! The latent space is where all those secret codes live.'\n"
             "        ),\n"
             "        'Explanation': (\n"
             "            'Role/audience-constrained prompt (explain to a child). The model uses '\n"
             "            'concrete metaphors (magic box, secret code) to convey an abstract concept.'\n"
             "        ),\n"
             "    },\n"
             "    {\n"
             "        'Prompt': (\n"
             "            'You are a machine learning professor. Compare discriminative and generative '\n"
             "            'models in a table format with columns: Aspect, Discriminative, Generative.'\n"
             "        ),\n"
             "        'Generated Answer': (\n"
             "            '| Aspect | Discriminative | Generative |\\n'\n"
             "            '|--------|---------------|------------|\\n'\n"
             "            '| Goal | Learn P(Y|X) | Learn P(X) or P(X,Y) |\\n'\n"
             "            '| Task | Classification/Regression | Data generation |\\n'\n"
             "            '| Examples | SVM, Logistic Reg, CNN | VAE, GAN, GPT |\\n'\n"
             "            '| Training data | Labelled | Labelled or unlabelled |\\n'\n"
             "            '| Output | Class label or value | New data sample |'\n"
             "        ),\n"
             "        'Explanation': (\n"
             "            'A role-based + format-constrained prompt. Assigning the professor role '\n"
             "            'ensures technical accuracy, and requesting a table keeps the answer structured.'\n"
             "        ),\n"
             "    },\n"
             "]\n"
             "\n"
             "qa_df = pd.DataFrame(qa_data)\n"
             "qa_df.index = range(1, len(qa_df) + 1)\n"
             "qa_df.index.name = '#'\n"
             "\n"
             "# Display each Q&A\n"
             "for i, row in qa_df.iterrows():\n"
             "    print(f\"{'='*70}\")\n"
             "    print(f\"Q{i} PROMPT: {row['Prompt']}\")\n"
             "    print(f\"{'─'*70}\")\n"
             "    print(f\"ANSWER: {row['Generated Answer']}\")\n"
             "    print(f\"{'─'*70}\")\n"
             "    print(f\"EXPLANATION: {row['Explanation']}\")\n"
             "    print()"),

        code("# Display as DataFrame\n"
             "qa_df"),

        md("---\n## Part 4 — Discriminative vs Generative Visual Comparison"),

        code("comparison = pd.DataFrame({\n"
             "    'Aspect': ['Objective', 'Learns', 'Example Models', 'Use Case', 'Data Need', 'Output'],\n"
             "    'Discriminative': [\n"
             "        'Predict label Y from input X',\n"
             "        'Decision boundary P(Y|X)',\n"
             "        'Logistic Regression, SVM, ResNet',\n"
             "        'Classification, Detection',\n"
             "        'Labelled datasets',\n"
             "        'Class probability',\n"
             "    ],\n"
             "    'Generative': [\n"
             "        'Generate new data samples',\n"
             "        'Data distribution P(X)',\n"
             "        'VAE, GAN, GPT, Diffusion',\n"
             "        'Image synthesis, Text generation',\n"
             "        'Labelled or unlabelled',\n"
             "        'New data sample',\n"
             "    ],\n"
             "})\n"
             "comparison.index = range(1, len(comparison) + 1)\n"
             "comparison.index.name = '#'\n"
             "comparison"),

        md("---\n## Part 5 — Applications of Generative AI"),

        code("applications = pd.DataFrame({\n"
             "    'Domain': ['Healthcare', 'Entertainment', 'Finance', 'Education', 'Manufacturing',\n"
             "               'Retail', 'Cybersecurity', 'Legal'],\n"
             "    'Application': [\n"
             "        'Drug molecule generation',\n"
             "        'AI-generated music and art',\n"
             "        'Synthetic data for fraud detection',\n"
             "        'Personalised tutoring and quiz generation',\n"
             "        'Generative design for 3D parts',\n"
             "        'Virtual try-on and product mockups',\n"
             "        'Adversarial attack simulation',\n"
             "        'Contract summarisation and drafting',\n"
             "    ],\n"
             "    'Model Used': ['VAE/GAN', 'Transformer/Diffusion', 'GAN', 'LLM',\n"
             "                   'GAN/Diffusion', 'GAN', 'GAN', 'LLM'],\n"
             "    'Impact Level': ['High', 'High', 'Medium', 'High', 'Medium', 'Medium', 'High', 'Medium'],\n"
             "})\n"
             "applications.index = range(1, len(applications) + 1)\n"
             "applications.index.name = '#'\n"
             "applications"),

        code("# Visualise impact distribution\n"
             "fig, axes = plt.subplots(1, 2, figsize=(12, 4))\n"
             "\n"
             "# By model type\n"
             "model_counts = applications['Model Used'].value_counts()\n"
             "axes[0].barh(model_counts.index, model_counts.values, color='#3498db')\n"
             "axes[0].set_title('Applications by Model Type')\n"
             "axes[0].set_xlabel('Count')\n"
             "\n"
             "# By impact level\n"
             "impact_counts = applications['Impact Level'].value_counts()\n"
             "axes[1].pie(impact_counts.values, labels=impact_counts.index,\n"
             "            autopct='%1.0f%%', colors=['#2ecc71', '#f39c12'])\n"
             "axes[1].set_title('Impact Level Distribution')\n"
             "\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("---\n## Summary\n\n"
           "- Generative AI learns data distributions to **create** new samples.\n"
           "- Five major families: Autoencoders, VAEs, GANs, Diffusion Models, Transformers.\n"
           "- Each family has distinct trade-offs in quality, speed, and stability.\n"
           "- Real-world impact spans healthcare, finance, education, and beyond.\n"
           "- Prompt engineering (zero-shot, few-shot, role-based) is key to effective LLM use."),

        md("---\n## Interview Questions\n\n"
           "1. **What is the fundamental difference between generative and discriminative models?**\n"
           "2. **Explain the reparameterization trick in VAEs.**\n"
           "3. **Why do GANs suffer from mode collapse? How can it be mitigated?**\n"
           "4. **What is the role of the noise schedule in diffusion models?**\n"
           "5. **Compare zero-shot and few-shot prompting with examples.**\n"
           "6. **How does the ELBO objective relate to the VAE training process?**\n"
           "7. **What are the ethical concerns around deepfakes generated by GANs?**\n"
           "8. **Explain chain-of-thought prompting and when to use it.**\n"
           "9. **What makes diffusion models produce higher-quality images than GANs?**\n"
           "10. **How would you evaluate the quality of a generative model?**"),

        md("---\n## References\n\n"
           "1. Goodfellow, I. et al. (2014). *Generative Adversarial Nets*. NeurIPS.\n"
           "2. Kingma, D. P. & Welling, M. (2014). *Auto-Encoding Variational Bayes*. ICLR.\n"
           "3. Ho, J. et al. (2020). *Denoising Diffusion Probabilistic Models*. NeurIPS.\n"
           "4. Vaswani, A. et al. (2017). *Attention Is All You Need*. NeurIPS.\n"
           "5. Brown, T. et al. (2020). *Language Models are Few-Shot Learners*. NeurIPS.\n"
           "6. Rombach, R. et al. (2022). *High-Resolution Image Synthesis with Latent Diffusion Models*. CVPR."),
    ]
    return make_notebook(cells)


# ═══════════════════════════════════════════════════════════════════════════
# SESSION 02 — Autoencoders and VAE
# ═══════════════════════════════════════════════════════════════════════════
def session02() -> dict:
    cells = [
        md("# Session 02 — Autoencoders & Variational Autoencoders\n\n"
           "**Dataset:** Fashion-MNIST  \n"
           "**Frameworks:** PyTorch, matplotlib"),

        md("## Objectives\n\n"
           "1. Load and explore Fashion-MNIST.\n"
           "2. Build and train a standard Autoencoder with **MSE** loss.\n"
           "3. Build and train a standard Autoencoder with **BCE** loss.\n"
           "4. Compare reconstructions from both loss functions.\n"
           "5. Implement a **Denoising Autoencoder**.\n"
           "6. Build and train a **Variational Autoencoder (VAE)**.\n"
           "7. Sample from the latent space to generate new images.\n"
           "8. Plot all loss curves."),

        md("## Theory\n\n"
           "### Autoencoder\n"
           "An autoencoder learns to compress input $x$ into a low-dimensional latent code $z = f_\\theta(x)$ "
           "and reconstruct it as $\\hat{x} = g_\\phi(z)$.\n\n"
           "**MSE Loss:** $\\mathcal{L} = \\frac{1}{n}\\sum(x - \\hat{x})^2$ — treats pixel errors uniformly.\n\n"
           "**BCE Loss:** $\\mathcal{L} = -\\sum[x \\log \\hat{x} + (1-x)\\log(1-\\hat{x})]$ — better for binary/normalized images.\n\n"
           "### Variational Autoencoder\n"
           "A VAE adds a probabilistic twist: the encoder outputs $\\mu$ and $\\log\\sigma^2$ that parametrise "
           "a Gaussian. The **reparameterisation trick** $z = \\mu + \\sigma \\cdot \\epsilon$ enables back-prop.\n\n"
           "**ELBO Loss:** $\\mathcal{L} = \\text{Reconstruction} + D_{KL}(q(z|x) \\| p(z))$\n\n"
           "```mermaid\n"
           "graph LR\n"
           "    X[Input x] --> E[Encoder]\n"
           "    E --> MU[μ]\n"
           "    E --> LV[log σ²]\n"
           "    MU --> RP[Reparameterize]\n"
           "    LV --> RP\n"
           "    RP --> Z[z]\n"
           "    Z --> D[Decoder]\n"
           "    D --> XH[x̂]\n"
           "    style Z fill:#f9f,stroke:#333\n"
           "```"),

        md("## Learning Outcomes\n\n"
           "- Implement encoder-decoder architectures in PyTorch.\n"
           "- Understand the effect of loss function choice on reconstruction quality.\n"
           "- Apply noise augmentation for denoising autoencoders.\n"
           "- Sample from a learned latent space using the reparameterisation trick.\n"
           "- Interpret loss curves and reconstruction quality."),

        md("---\n## Setup"),

        code("import sys\n"
             "from pathlib import Path\n"
             "\n"
             "PROJECT_ROOT = Path.cwd().parent if Path.cwd().name == 'notebooks' else Path.cwd()\n"
             "if str(PROJECT_ROOT) not in sys.path:\n"
             "    sys.path.insert(0, str(PROJECT_ROOT))\n"
             "\n"
             "import torch\n"
             "import matplotlib.pyplot as plt\n"
             "import numpy as np\n"
             "\n"
             "from src.utils import seed_everything, get_device, setup_logging\n"
             "from src.config import GENERATED_IMAGES_DIR, ensure_dirs\n"
             "from src.data_loader import get_fashion_mnist_loaders, add_noise, FASHION_MNIST_CLASSES\n"
             "from src.autoencoder import Autoencoder, VAE, train_autoencoder, train_vae\n"
             "from src.visualization import (\n"
             "    plot_loss_curves, plot_image_grid,\n"
             "    plot_reconstruction_comparison, save_generated_images\n"
             ")\n"
             "\n"
             "setup_logging()\n"
             "seed_everything(42)\n"
             "ensure_dirs()\n"
             "device = get_device()\n"
             "print(f'Device: {device}')"),

        md("---\n## 1. Load Fashion-MNIST"),

        code("train_loader, test_loader = get_fashion_mnist_loaders(batch_size=64, flatten=True)\n"
             "\n"
             "# Peek at a batch\n"
             "sample_batch, sample_labels = next(iter(test_loader))\n"
             "print(f'Batch shape: {sample_batch.shape}')\n"
             "print(f'Label examples: {[FASHION_MNIST_CLASSES[l] for l in sample_labels[:5].tolist()]}')"),

        code("# Visualise samples (unflatten for display)\n"
             "plot_image_grid(sample_batch[:16].view(-1, 1, 28, 28), nrow=8,\n"
             "                title='Fashion-MNIST Samples')"),

        md("---\n## 2. Autoencoder with MSE Loss"),

        code("ae_mse = Autoencoder(latent_dim=16, loss_function='mse')\n"
             "print(f'AE (MSE) parameters: {sum(p.numel() for p in ae_mse.parameters()):,}')\n"
             "\n"
             "mse_losses = train_autoencoder(ae_mse, train_loader, device, epochs=10, lr=1e-3)"),

        code("plot_loss_curves(mse_losses, title='Autoencoder — MSE Loss')"),

        code("# Reconstructions\n"
             "ae_mse.eval()\n"
             "with torch.no_grad():\n"
             "    test_batch = sample_batch[:8].to(device)\n"
             "    recon_mse = ae_mse(test_batch)\n"
             "\n"
             "plot_reconstruction_comparison(\n"
             "    test_batch.view(-1, 1, 28, 28),\n"
             "    recon_mse.view(-1, 1, 28, 28),\n"
             "    title='MSE Autoencoder Reconstruction'\n"
             ")"),

        md("---\n## 3. Autoencoder with BCE Loss"),

        code("ae_bce = Autoencoder(latent_dim=16, loss_function='bce')\n"
             "bce_losses = train_autoencoder(ae_bce, train_loader, device, epochs=10, lr=1e-3)"),

        code("plot_loss_curves(bce_losses, title='Autoencoder — BCE Loss')"),

        code("# Reconstructions\n"
             "ae_bce.eval()\n"
             "with torch.no_grad():\n"
             "    recon_bce = ae_bce(test_batch)\n"
             "\n"
             "plot_reconstruction_comparison(\n"
             "    test_batch.view(-1, 1, 28, 28),\n"
             "    recon_bce.view(-1, 1, 28, 28),\n"
             "    title='BCE Autoencoder Reconstruction'\n"
             ")"),

        md("---\n## 4. Reconstruction Comparison — MSE vs BCE"),

        code("fig, axes = plt.subplots(3, 8, figsize=(14, 5))\n"
             "for i in range(8):\n"
             "    axes[0, i].imshow(test_batch[i].cpu().view(28, 28), cmap='gray')\n"
             "    axes[0, i].axis('off')\n"
             "    axes[1, i].imshow(recon_mse[i].cpu().view(28, 28), cmap='gray')\n"
             "    axes[1, i].axis('off')\n"
             "    axes[2, i].imshow(recon_bce[i].cpu().view(28, 28), cmap='gray')\n"
             "    axes[2, i].axis('off')\n"
             "\n"
             "axes[0, 0].set_title('Original', fontsize=10)\n"
             "axes[1, 0].set_title('MSE', fontsize=10)\n"
             "axes[2, 0].set_title('BCE', fontsize=10)\n"
             "fig.suptitle('Reconstruction Comparison: MSE vs BCE', fontsize=14)\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("### Interpretation\n\n"
           "- **MSE** minimises pixel-level squared error and tends to produce smoother/blurrier results.\n"
           "- **BCE** treats each pixel as a Bernoulli variable and often preserves sharper edges on binary-like images.\n"
           "- For Fashion-MNIST (normalised to [0,1]), BCE generally gives crisper reconstructions."),

        md("---\n## 5. Denoising Autoencoder"),

        code("# Train a denoising AE: input noisy, target clean\n"
             "ae_denoise = Autoencoder(latent_dim=16, loss_function='mse')\n"
             "ae_denoise.to(device)\n"
             "optimizer = torch.optim.Adam(ae_denoise.parameters(), lr=1e-3)\n"
             "\n"
             "denoise_losses = []\n"
             "for epoch in range(1, 11):\n"
             "    ae_denoise.train()\n"
             "    epoch_loss = 0.0\n"
             "    for images, _ in train_loader:\n"
             "        clean = images.to(device)\n"
             "        noisy = add_noise(clean, noise_factor=0.5)\n"
             "        recon = ae_denoise(noisy)\n"
             "        loss = ae_denoise.compute_loss(clean, recon)\n"
             "        optimizer.zero_grad()\n"
             "        loss.backward()\n"
             "        optimizer.step()\n"
             "        epoch_loss += loss.item() * clean.size(0)\n"
             "    avg = epoch_loss / len(train_loader.dataset)\n"
             "    denoise_losses.append(avg)\n"
             "    print(f'Epoch {epoch}/10 | Denoise Loss: {avg:.6f}')\n"
             "\n"
             "plot_loss_curves(denoise_losses, title='Denoising Autoencoder Loss')"),

        code("# Show denoising results\n"
             "ae_denoise.eval()\n"
             "noisy_test = add_noise(test_batch, noise_factor=0.5)\n"
             "with torch.no_grad():\n"
             "    denoised = ae_denoise(noisy_test)\n"
             "\n"
             "fig, axes = plt.subplots(3, 8, figsize=(14, 5))\n"
             "for i in range(8):\n"
             "    axes[0, i].imshow(test_batch[i].cpu().view(28, 28), cmap='gray')\n"
             "    axes[0, i].axis('off')\n"
             "    axes[1, i].imshow(noisy_test[i].cpu().view(28, 28), cmap='gray')\n"
             "    axes[1, i].axis('off')\n"
             "    axes[2, i].imshow(denoised[i].cpu().view(28, 28), cmap='gray')\n"
             "    axes[2, i].axis('off')\n"
             "\n"
             "axes[0, 0].set_title('Clean', fontsize=10)\n"
             "axes[1, 0].set_title('Noisy', fontsize=10)\n"
             "axes[2, 0].set_title('Denoised', fontsize=10)\n"
             "fig.suptitle('Denoising Autoencoder Results', fontsize=14)\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("---\n## 6. Variational Autoencoder (VAE)"),

        code("vae = VAE(latent_dim=16)\n"
             "print(f'VAE parameters: {sum(p.numel() for p in vae.parameters()):,}')\n"
             "\n"
             "vae_losses = train_vae(vae, train_loader, device, epochs=10, lr=1e-3)"),

        code("plot_loss_curves(vae_losses, title='VAE ELBO Loss')"),

        code("# VAE Reconstructions\n"
             "vae.eval()\n"
             "with torch.no_grad():\n"
             "    recon_vae, _, _ = vae(test_batch.to(device))\n"
             "\n"
             "plot_reconstruction_comparison(\n"
             "    test_batch.view(-1, 1, 28, 28),\n"
             "    recon_vae.view(-1, 1, 28, 28),\n"
             "    title='VAE Reconstruction'\n"
             ")"),

        md("---\n## 7. Latent Sampling — Generate New Images"),

        code("# Sample 5 images from the VAE latent space\n"
             "vae.eval()\n"
             "with torch.no_grad():\n"
             "    generated = vae.sample(5, device)\n"
             "\n"
             "plot_image_grid(generated, nrow=5, title='VAE Generated Images (5 samples)')\n"
             "\n"
             "# Save generated images\n"
             "saved_paths = save_generated_images(generated, prefix='vae_generated')\n"
             "print(f'Saved {len(saved_paths)} images to {GENERATED_IMAGES_DIR}')"),

        code("# Generate a larger grid for visual appeal\n"
             "with torch.no_grad():\n"
             "    generated_16 = vae.sample(16, device)\n"
             "\n"
             "plot_image_grid(generated_16, nrow=8, title='VAE — 16 Generated Samples')"),

        md("---\n## 8. All Loss Curves Combined"),

        code("fig, ax = plt.subplots(figsize=(10, 5))\n"
             "epochs = range(1, 11)\n"
             "ax.plot(epochs, mse_losses, 'o-', label='AE (MSE)', linewidth=2)\n"
             "ax.plot(epochs, bce_losses, 's-', label='AE (BCE)', linewidth=2)\n"
             "ax.plot(epochs, denoise_losses, '^-', label='Denoising AE', linewidth=2)\n"
             "ax.plot(epochs, vae_losses, 'D-', label='VAE (ELBO)', linewidth=2)\n"
             "ax.set_xlabel('Epoch')\n"
             "ax.set_ylabel('Loss')\n"
             "ax.set_title('Training Loss Comparison — All Models')\n"
             "ax.legend()\n"
             "ax.grid(True, alpha=0.3)\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("### Interpretation\n\n"
           "- MSE and BCE losses converge rapidly for standard autoencoders.\n"
           "- The denoising AE shows higher initial loss (noisy inputs) but learns robust features.\n"
           "- VAE ELBO loss is on a different scale because it includes the KL-divergence term.\n"
           "- All models converge within 10 epochs on Fashion-MNIST."),

        md("---\n## Summary\n\n"
           "| Model | Loss | Key Feature |\n"
           "|-------|------|------------|\n"
           "| AE (MSE) | Mean Squared Error | Pixel-level reconstruction |\n"
           "| AE (BCE) | Binary Cross-Entropy | Sharper edges on binary images |\n"
           "| Denoising AE | MSE on clean targets | Learns robust, noise-invariant features |\n"
           "| VAE | ELBO (BCE + KLD) | Smooth latent space, generative sampling |"),

        md("---\n## Interview Questions\n\n"
           "1. Why does an autoencoder with too-large a latent dimension memorise instead of generalise?\n"
           "2. Explain the reparameterisation trick. Why is it necessary?\n"
           "3. What happens if you set the KL weight to zero in a VAE?\n"
           "4. Compare MSE vs BCE loss for image reconstruction tasks.\n"
           "5. How does a denoising autoencoder differ from a standard autoencoder in terms of learned representations?\n"
           "6. What is posterior collapse in VAEs and how can it be prevented?\n"
           "7. How would you evaluate generation quality beyond visual inspection?\n"
           "8. Can autoencoders be used for anomaly detection? Explain."),

        md("---\n## References\n\n"
           "1. Kingma, D. P. & Welling, M. (2014). *Auto-Encoding Variational Bayes*. ICLR.\n"
           "2. Vincent, P. et al. (2008). *Extracting and Composing Robust Features with Denoising Autoencoders*. ICML.\n"
           "3. Xiao, H., Rasul, K. & Vollgraf, R. (2017). *Fashion-MNIST: a Novel Image Dataset for Benchmarking ML Algorithms*.\n"
           "4. Doersch, C. (2016). *Tutorial on Variational Autoencoders*. arXiv:1606.05908."),
    ]
    return make_notebook(cells)


# ═══════════════════════════════════════════════════════════════════════════
# SESSION 03 — GANs
# ═══════════════════════════════════════════════════════════════════════════
def session03() -> dict:
    cells = [
        md("# Session 03 — Generative Adversarial Networks (GANs)\n\n"
           "**Framework:** PyTorch"),

        md("## Objectives\n\n"
           "1. Build a `simple_generator()` function.\n"
           "2. Implement a `Discriminator` class.\n"
           "3. Run an adversarial training loop simulation.\n"
           "4. Visualise generator and discriminator losses.\n"
           "5. Compare GAN variants through research."),

        md("## Theory\n\n"
           "### Generative Adversarial Networks\n\n"
           "A GAN consists of two networks trained simultaneously:\n"
           "- **Generator G**: maps noise $z \\sim \\mathcal{N}(0, I)$ to fake data.\n"
           "- **Discriminator D**: classifies inputs as real or fake.\n\n"
           "The training objective is a minimax game:\n\n"
           "$$\\min_G \\max_D \\; \\mathbb{E}_{x \\sim p_{data}}[\\log D(x)] + \\mathbb{E}_{z \\sim p_z}[\\log(1 - D(G(z)))]$$\n\n"
           "```mermaid\n"
           "graph LR\n"
           "    Z[Noise z] --> G[Generator]\n"
           "    G --> FD[Fake Data]\n"
           "    RD[Real Data] --> D[Discriminator]\n"
           "    FD --> D\n"
           "    D --> P[Real / Fake?]\n"
           "    style G fill:#2ecc71,stroke:#333\n"
           "    style D fill:#e74c3c,stroke:#333\n"
           "```"),

        md("## Learning Outcomes\n\n"
           "- Implement generator and discriminator architectures.\n"
           "- Understand the adversarial training dynamic.\n"
           "- Interpret GAN loss curves.\n"
           "- Compare GAN variants (DCGAN, WGAN, StyleGAN)."),

        md("---\n## Setup"),

        code("import sys\n"
             "from pathlib import Path\n"
             "\n"
             "PROJECT_ROOT = Path.cwd().parent if Path.cwd().name == 'notebooks' else Path.cwd()\n"
             "if str(PROJECT_ROOT) not in sys.path:\n"
             "    sys.path.insert(0, str(PROJECT_ROOT))\n"
             "\n"
             "import torch\n"
             "import matplotlib.pyplot as plt\n"
             "import pandas as pd\n"
             "import numpy as np\n"
             "\n"
             "from src.utils import seed_everything, get_device, setup_logging\n"
             "from src.config import ensure_dirs\n"
             "from src.gan import (\n"
             "    simple_generator, Discriminator, Generator,\n"
             "    adversarial_loop_simulation, generate_gan_samples,\n"
             ")\n"
             "from src.visualization import plot_image_grid, save_generated_images\n"
             "\n"
             "setup_logging()\n"
             "seed_everything(42)\n"
             "ensure_dirs()\n"
             "device = get_device()\n"
             "print(f'Device: {device}')"),

        md("---\n## 1. simple_generator()"),

        code("gen_simple = simple_generator(latent_dim=16, output_dim=784)\n"
             "print(gen_simple)\n"
             "\n"
             "# Test forward pass\n"
             "z_test = torch.randn(4, 16)\n"
             "out = gen_simple(z_test)\n"
             "print(f'\\nInput shape:  {z_test.shape}')\n"
             "print(f'Output shape: {out.shape}')\n"
             "print(f'Output range: [{out.min().item():.3f}, {out.max().item():.3f}]')"),

        code("# Visualise random generator output (untrained — expected to be noise)\n"
             "random_images = (out.detach() + 1) / 2  # Tanh → [0,1]\n"
             "plot_image_grid(random_images.view(-1, 1, 28, 28), nrow=4,\n"
             "                title='Untrained Generator Output (Random Noise)')"),

        md("---\n## 2. Discriminator Class"),

        code("disc = Discriminator(input_dim=784)\n"
             "print(disc)\n"
             "\n"
             "# Test forward pass\n"
             "fake_input = torch.randn(4, 784)\n"
             "d_out = disc(fake_input)\n"
             "print(f'\\nInput shape:  {fake_input.shape}')\n"
             "print(f'Output shape: {d_out.shape}')\n"
             "print(f'Probabilities: {d_out.detach().squeeze().tolist()}')"),

        md("---\n## 3. Adversarial Loop Simulation"),

        code("gen = Generator(latent_dim=16, output_dim=784)\n"
             "disc = Discriminator(input_dim=784)\n"
             "\n"
             "history = adversarial_loop_simulation(\n"
             "    generator=gen,\n"
             "    discriminator=disc,\n"
             "    device=device,\n"
             "    latent_dim=16,\n"
             "    steps=200,\n"
             "    batch_size=64,\n"
             "    lr=2e-4,\n"
             ")\n"
             "print(f'\\nTraining complete — {len(history[\"d_losses\"])} steps')"),

        code("# Plot GAN losses\n"
             "fig, ax = plt.subplots(figsize=(10, 4))\n"
             "ax.plot(history['d_losses'], label='Discriminator Loss', alpha=0.7)\n"
             "ax.plot(history['g_losses'], label='Generator Loss', alpha=0.7)\n"
             "ax.set_xlabel('Step')\n"
             "ax.set_ylabel('Loss')\n"
             "ax.set_title('GAN Training — Adversarial Loss Curves')\n"
             "ax.legend()\n"
             "ax.grid(True, alpha=0.3)\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("### Interpretation\n\n"
           "- The discriminator loss should decrease as it gets better at classifying real vs fake.\n"
           "- The generator loss should decrease as its outputs fool the discriminator more often.\n"
           "- In an ideal equilibrium both losses stabilise around $\\log 2 \\approx 0.693$.\n"
           "- This simulation uses synthetic data so convergence patterns differ from real datasets."),

        code("# Generate and save samples from the trained generator\n"
             "samples = generate_gan_samples(gen, device, n=16, latent_dim=16)\n"
             "plot_image_grid(\n"
             "    torch.tensor(samples).unsqueeze(1), nrow=8,\n"
             "    title='GAN Generated Samples (after training simulation)'\n"
             ")\n"
             "\n"
             "saved = save_generated_images(torch.tensor(samples).unsqueeze(1), prefix='gan_generated')\n"
             "print(f'Saved {len(saved)} GAN samples')"),

        md("---\n## 4. GAN Comparison Research"),

        code("gan_comparison = pd.DataFrame({\n"
             "    'GAN Variant': ['Vanilla GAN', 'DCGAN', 'WGAN', 'WGAN-GP', 'StyleGAN', 'CycleGAN', 'Pix2Pix'],\n"
             "    'Year': [2014, 2016, 2017, 2017, 2019, 2017, 2017],\n"
             "    'Key Innovation': [\n"
             "        'Original adversarial framework',\n"
             "        'Convolutional architecture with batch norm',\n"
             "        'Wasserstein distance as loss',\n"
             "        'Gradient penalty instead of clipping',\n"
             "        'Style-based generator with AdaIN',\n"
             "        'Unpaired image-to-image translation',\n"
             "        'Paired image-to-image translation',\n"
             "    ],\n"
             "    'Architecture': [\n"
             "        'MLP',\n"
             "        'CNN (strided convolutions)',\n"
             "        'CNN + weight clipping',\n"
             "        'CNN + gradient penalty',\n"
             "        'Progressive growing CNN',\n"
             "        'Two generator-discriminator pairs',\n"
             "        'U-Net generator + PatchGAN disc.',\n"
             "    ],\n"
             "    'Best For': [\n"
             "        'Proof of concept',\n"
             "        'Image generation',\n"
             "        'Stable training',\n"
             "        'High-quality image generation',\n"
             "        'Face synthesis',\n"
             "        'Domain transfer (horse↔zebra)',\n"
             "        'Supervised image translation',\n"
             "    ],\n"
             "})\n"
             "gan_comparison.index = range(1, len(gan_comparison) + 1)\n"
             "gan_comparison.index.name = '#'\n"
             "gan_comparison"),

        code("# Visualise GAN timeline\n"
             "fig, ax = plt.subplots(figsize=(12, 3))\n"
             "years = gan_comparison['Year']\n"
             "names = gan_comparison['GAN Variant']\n"
             "colors = plt.cm.viridis(np.linspace(0.2, 0.9, len(names)))\n"
             "\n"
             "for i, (y, n) in enumerate(zip(years, names)):\n"
             "    ax.scatter(y, 0.5, c=[colors[i]], s=150, zorder=5)\n"
             "    offset = 15 if i % 2 == 0 else -20\n"
             "    ax.annotate(n, (y, 0.5), textcoords='offset points',\n"
             "               xytext=(0, offset), ha='center', fontsize=9)\n"
             "\n"
             "ax.set_xlim(2013, 2020)\n"
             "ax.set_yticks([])\n"
             "ax.set_title('Evolution of GAN Architectures', fontsize=13)\n"
             "ax.grid(axis='x', alpha=0.3)\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("---\n## Summary\n\n"
           "- Built a `simple_generator()` and a `Discriminator` class.\n"
           "- Ran an adversarial training simulation and visualised the loss dynamics.\n"
           "- Compared 7 major GAN variants across architecture, innovation, and use case.\n"
           "- Observed that GAN training is inherently unstable — various tricks (WGAN, spectral norm) improve it."),

        md("---\n## Interview Questions\n\n"
           "1. Explain the minimax objective of GANs.\n"
           "2. What is mode collapse and how can it be detected?\n"
           "3. Why was the Wasserstein distance introduced in WGAN?\n"
           "4. Compare DCGAN and StyleGAN architectures.\n"
           "5. How does a conditional GAN differ from a vanilla GAN?\n"
           "6. What is the gradient penalty in WGAN-GP?\n"
           "7. Can GANs be used for data augmentation? Explain.\n"
           "8. What metrics (FID, IS) are used to evaluate GAN quality?"),

        md("---\n## References\n\n"
           "1. Goodfellow, I. et al. (2014). *Generative Adversarial Nets*. NeurIPS.\n"
           "2. Radford, A. et al. (2016). *Unsupervised Representation Learning with DCGANs*. ICLR.\n"
           "3. Arjovsky, M. et al. (2017). *Wasserstein GAN*. ICML.\n"
           "4. Karras, T. et al. (2019). *A Style-Based Generator Architecture for GANs*. CVPR.\n"
           "5. Zhu, J. et al. (2017). *Unpaired Image-to-Image Translation using Cycle-Consistent GANs*. ICCV."),
    ]
    return make_notebook(cells)


# ═══════════════════════════════════════════════════════════════════════════
# SESSION 04 — Diffusion Models
# ═══════════════════════════════════════════════════════════════════════════
def session04() -> dict:
    cells = [
        md("# Session 04 — Diffusion Models\n\n"
           "**Framework:** PyTorch (CPU-friendly educational implementation)"),

        md("## Objectives\n\n"
           "1. Understand the forward diffusion process.\n"
           "2. Implement a reverse-process approximation.\n"
           "3. Visualise noise progression across timesteps.\n"
           "4. Generate and save images using the simplified pipeline."),

        md("## Theory\n\n"
           "### Diffusion Models\n\n"
           "Diffusion models work in two phases:\n\n"
           "**Forward process (q):** Gradually add Gaussian noise to data over $T$ timesteps:\n"
           "$$q(x_t | x_{t-1}) = \\mathcal{N}(x_t; \\sqrt{1-\\beta_t}\\,x_{t-1},\\; \\beta_t I)$$\n\n"
           "**Reverse process (p):** Learn to denoise step-by-step:\n"
           "$$p_\\theta(x_{t-1} | x_t) = \\mathcal{N}(x_{t-1}; \\mu_\\theta(x_t, t),\\; \\sigma_t^2 I)$$\n\n"
           "```mermaid\n"
           "graph LR\n"
           "    X0[Clean Image x₀] -->|add noise| X1[x₁]\n"
           "    X1 -->|add noise| X2[x₂]\n"
           "    X2 -->|...| XT[Pure Noise xₜ]\n"
           "    XT -->|denoise| XR2[x̂₂]\n"
           "    XR2 -->|denoise| XR1[x̂₁]\n"
           "    XR1 -->|denoise| XR0[Generated x̂₀]\n"
           "    style X0 fill:#2ecc71\n"
           "    style XT fill:#e74c3c\n"
           "    style XR0 fill:#3498db\n"
           "```"),

        md("## Learning Outcomes\n\n"
           "- Implement a linear β noise schedule.\n"
           "- Apply forward diffusion to real images.\n"
           "- Approximate the reverse process.\n"
           "- Visualise the noising and denoising pipeline.\n"
           "- Save generated images to disk."),

        md("---\n## Setup"),

        code("import sys\n"
             "from pathlib import Path\n"
             "\n"
             "PROJECT_ROOT = Path.cwd().parent if Path.cwd().name == 'notebooks' else Path.cwd()\n"
             "if str(PROJECT_ROOT) not in sys.path:\n"
             "    sys.path.insert(0, str(PROJECT_ROOT))\n"
             "\n"
             "import torch\n"
             "import matplotlib.pyplot as plt\n"
             "import numpy as np\n"
             "\n"
             "from src.utils import seed_everything, setup_logging\n"
             "from src.config import GENERATED_IMAGES_DIR, ensure_dirs\n"
             "from src.data_loader import get_fashion_mnist_loaders\n"
             "from src.diffusion import (\n"
             "    linear_beta_schedule, precompute_schedule,\n"
             "    forward_diffusion, forward_diffusion_sequence,\n"
             "    reverse_diffusion_approximation, generate_diffusion_samples,\n"
             ")\n"
             "from src.visualization import (\n"
             "    plot_noise_progression, plot_image_grid, save_generated_images\n"
             ")\n"
             "\n"
             "setup_logging()\n"
             "seed_everything(42)\n"
             "ensure_dirs()\n"
             "print('Setup complete ✓')"),

        md("---\n## 1. Noise Schedule"),

        code("T = 300\n"
             "betas = linear_beta_schedule(T)\n"
             "schedule = precompute_schedule(betas)\n"
             "\n"
             "fig, axes = plt.subplots(1, 3, figsize=(15, 3))\n"
             "\n"
             "axes[0].plot(betas.numpy(), color='#e74c3c')\n"
             "axes[0].set_title('β schedule')\n"
             "axes[0].set_xlabel('Timestep')\n"
             "\n"
             "axes[1].plot(schedule['alphas_cumprod'].numpy(), color='#3498db')\n"
             "axes[1].set_title('ᾱ (cumulative product of α)')\n"
             "axes[1].set_xlabel('Timestep')\n"
             "\n"
             "axes[2].plot(schedule['sqrt_one_minus_alphas_cumprod'].numpy(), color='#2ecc71')\n"
             "axes[2].set_title('√(1 − ᾱ) — noise level')\n"
             "axes[2].set_xlabel('Timestep')\n"
             "\n"
             "for ax in axes:\n"
             "    ax.grid(True, alpha=0.3)\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("---\n## 2. Forward Diffusion"),

        code("# Get a sample image from Fashion-MNIST\n"
             "train_loader, _ = get_fashion_mnist_loaders(batch_size=1)\n"
             "sample_img, sample_label = next(iter(train_loader))\n"
             "x0 = sample_img.squeeze(0)  # (1, 28, 28)\n"
             "print(f'Original image shape: {x0.shape}')"),

        code("# Forward diffusion at selected timesteps\n"
             "timesteps_to_show = [0, 25, 50, 100, 150, 200, 250, 299]\n"
             "noisy_images = forward_diffusion_sequence(x0, timesteps_to_show, schedule)\n"
             "\n"
             "plot_noise_progression(\n"
             "    noisy_images,\n"
             "    titles=[f't={t}' for t in timesteps_to_show],\n"
             "    save_path=GENERATED_IMAGES_DIR / 'noise_progression.png'\n"
             ")"),

        md("### Interpretation\n\n"
           "As $t$ increases, the image becomes progressively noisier. By $t = T-1$ the image is "
           "nearly indistinguishable from pure Gaussian noise. The forward process is fixed (not learned) — "
           "only the reverse process requires training."),

        md("---\n## 3. Reverse Diffusion Approximation"),

        code("# Start from the fully noised image and run reverse process\n"
             "noisy_final, _ = forward_diffusion(x0, T - 1, schedule)\n"
             "denoised, snapshots = reverse_diffusion_approximation(noisy_final, schedule)\n"
             "\n"
             "print(f'Snapshots captured: {len(snapshots)}')\n"
             "print(f'Denoised image range: [{denoised.min():.3f}, {denoised.max():.3f}]')"),

        code("# Show reverse process snapshots\n"
             "reverse_titles = [f'Step {i+1}' for i in range(len(snapshots))]\n"
             "plot_noise_progression(\n"
             "    snapshots,\n"
             "    titles=reverse_titles,\n"
             "    save_path=GENERATED_IMAGES_DIR / 'reverse_diffusion.png'\n"
             ")"),

        code("# Side-by-side: Original → Noised → Denoised\n"
             "fig, axes = plt.subplots(1, 3, figsize=(9, 3))\n"
             "axes[0].imshow(x0.squeeze().numpy(), cmap='gray')\n"
             "axes[0].set_title('Original')\n"
             "axes[1].imshow(noisy_final.squeeze().numpy(), cmap='gray')\n"
             "axes[1].set_title('Fully Noised')\n"
             "axes[2].imshow(denoised.squeeze().numpy(), cmap='gray')\n"
             "axes[2].set_title('Reverse Denoised')\n"
             "for ax in axes:\n"
             "    ax.axis('off')\n"
             "fig.suptitle('Forward → Reverse Diffusion', fontsize=13)\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("---\n## 4. Generate & Save Images"),

        code("# Generate 5 images using the simplified diffusion process\n"
             "generated = generate_diffusion_samples(n=5, image_size=28, timesteps=300)\n"
             "print(f'Generated shape: {generated.shape}')\n"
             "\n"
             "plot_image_grid(\n"
             "    torch.tensor(generated).unsqueeze(1), nrow=5,\n"
             "    title='Diffusion Model — Generated Samples',\n"
             "    save_path=GENERATED_IMAGES_DIR / 'diffusion_generated_grid.png'\n"
             ")\n"
             "\n"
             "# Save individual images\n"
             "saved = save_generated_images(\n"
             "    torch.tensor(generated).unsqueeze(1),\n"
             "    prefix='diffusion_generated'\n"
             ")\n"
             "print(f'\\nSaved {len(saved)} images:')\n"
             "for p in saved:\n"
             "    print(f'  → {p}')"),

        md("### Note on Quality\n\n"
           "This is a *simplified educational* diffusion implementation. Real diffusion models "
           "(DDPM, Score-based) train a neural network to predict the noise $\\epsilon_\\theta(x_t, t)$ "
           "and require thousands of GPU hours. The outputs here demonstrate the **process**, not "
           "production quality."),

        md("---\n## Summary\n\n"
           "- Implemented a linear β schedule and precomputed α/ᾱ tensors.\n"
           "- Applied forward diffusion to Fashion-MNIST images.\n"
           "- Ran a simplified reverse-diffusion denoising loop.\n"
           "- Visualised noise progression and saved all generated images.\n"
           "- Real diffusion models (Stable Diffusion) train a U-Net to predict noise."),

        md("---\n## Interview Questions\n\n"
           "1. Explain the forward and reverse processes in a diffusion model.\n"
           "2. What is the role of the noise schedule (β)?\n"
           "3. How does DDPM differ from score-based generative models?\n"
           "4. Why are diffusion models slower at inference than GANs?\n"
           "5. What is classifier-free guidance?\n"
           "6. Compare diffusion models with GANs in terms of quality, diversity, and speed.\n"
           "7. How does latent diffusion (Stable Diffusion) improve efficiency?\n"
           "8. What is the connection between diffusion models and denoising score matching?"),

        md("---\n## References\n\n"
           "1. Ho, J. et al. (2020). *Denoising Diffusion Probabilistic Models*. NeurIPS.\n"
           "2. Song, Y. & Ermon, S. (2020). *Score-Based Generative Modeling through SDEs*. ICLR.\n"
           "3. Rombach, R. et al. (2022). *High-Resolution Image Synthesis with Latent Diffusion Models*. CVPR.\n"
           "4. Nichol, A. & Dhariwal, P. (2021). *Improved Denoising Diffusion Probabilistic Models*. ICML."),
    ]
    return make_notebook(cells)


# ═══════════════════════════════════════════════════════════════════════════
# SESSION 05 — Industry Applications
# ═══════════════════════════════════════════════════════════════════════════
def session05() -> dict:
    cells = [
        md("# Session 05 — Industry Applications of Generative AI\n\n"
           "**Focus:** Practical applications using free/local tools — no paid APIs."),

        md("## Objectives\n\n"
           "1. Build an IPL match summariser.\n"
           "2. Create a restaurant chatbot.\n"
           "3. Implement a playlist filter.\n"
           "4. Demonstrate prompt engineering techniques.\n"
           "5. Generate `ipl_summary.txt`.\n"
           "6. Discuss industry challenges."),

        md("## Theory\n\n"
           "### Generative AI in Industry\n\n"
           "Generative AI is transforming industries beyond image generation:\n\n"
           "| Sector | Application | Impact |\n"
           "|--------|------------|--------|\n"
           "| Sports | Automated commentary and match summaries | Faster content delivery |\n"
           "| Hospitality | AI chatbots for ordering and recommendations | Reduced staffing costs |\n"
           "| Entertainment | Personalised playlist curation | Higher user engagement |\n"
           "| Marketing | Prompt-engineered content generation | Scalable campaigns |\n\n"
           "```mermaid\n"
           "graph TD\n"
           "    A[Generative AI] --> B[Text Generation]\n"
           "    A --> C[Image Generation]\n"
           "    A --> D[Code Generation]\n"
           "    B --> E[Summarisation]\n"
           "    B --> F[Chatbots]\n"
           "    B --> G[Content Creation]\n"
           "    C --> H[Product Design]\n"
           "    D --> I[Developer Tools]\n"
           "```"),

        md("## Learning Outcomes\n\n"
           "- Build practical NLP applications without paid APIs.\n"
           "- Design rule-based chatbots with intent detection.\n"
           "- Apply extractive summarisation to domain-specific text.\n"
           "- Use pandas for data filtering and analysis.\n"
           "- Understand prompt engineering patterns."),

        md("---\n## Setup"),

        code("import sys\n"
             "from pathlib import Path\n"
             "\n"
             "PROJECT_ROOT = Path.cwd().parent if Path.cwd().name == 'notebooks' else Path.cwd()\n"
             "if str(PROJECT_ROOT) not in sys.path:\n"
             "    sys.path.insert(0, str(PROJECT_ROOT))\n"
             "\n"
             "import pandas as pd\n"
             "\n"
             "from src.utils import setup_logging\n"
             "from src.config import OUTPUTS_DIR, ensure_dirs\n"
             "from src.summarizer import summarize_ipl, SAMPLE_IPL_REPORT\n"
             "from src.chatbot import RestaurantChatbot\n"
             "from src.playlist import (\n"
             "    catalogue_to_dataframe, filter_by_genre, filter_by_mood,\n"
             "    filter_by_artist, filter_by_decade, filter_by_bpm_range,\n"
             ")\n"
             "from src.prompt_engineering import (\n"
             "    get_all_examples, format_example,\n"
             ")\n"
             "\n"
             "setup_logging()\n"
             "ensure_dirs()\n"
             "print('All modules loaded ✓')"),

        md("---\n## 1. IPL Match Summariser"),

        code("# Display the full report\n"
             "print('FULL IPL REPORT')\n"
             "print('=' * 70)\n"
             "print(SAMPLE_IPL_REPORT)\n"
             "print(f'\\nTotal characters: {len(SAMPLE_IPL_REPORT)}')"),

        code("# Generate and save summary\n"
             "summary = summarize_ipl(num_sentences=5)\n"
             "print('\\nGENERATED SUMMARY')\n"
             "print('=' * 70)\n"
             "print(summary)\n"
             "print(f'\\nSummary characters: {len(summary)}')\n"
             "print(f'Compression ratio: {len(summary)/len(SAMPLE_IPL_REPORT):.1%}')"),

        code("# Verify ipl_summary.txt was created\n"
             "summary_path = OUTPUTS_DIR / 'ipl_summary.txt'\n"
             "assert summary_path.exists(), 'ipl_summary.txt not found!'\n"
             "print(f'✓ ipl_summary.txt saved at: {summary_path}')\n"
             "print(f'  Content: {summary_path.read_text(encoding=\"utf-8\")[:200]}...')"),

        md("---\n## 2. Restaurant Chatbot"),

        code("bot = RestaurantChatbot(name='GenAI Bistro')\n"
             "\n"
             "# Simulate a conversation\n"
             "conversation = [\n"
             "    'Hello!',\n"
             "    'Show me the menu',\n"
             "    'What do you recommend?',\n"
             "    'I want Margherita Pizza',\n"
             "    'Add Caesar Salad please',\n"
             "    'I would like a Mango Lassi',\n"
             "    'Can I get the bill?',\n"
             "    'Thank you, goodbye!',\n"
             "]\n"
             "\n"
             "for msg in conversation:\n"
             "    print(f'👤 USER: {msg}')\n"
             "    response = bot.respond(msg)\n"
             "    print(f'🤖 BOT:  {response}')\n"
             "    print()"),

        code("# Conversation analysis\n"
             "conv_analysis = pd.DataFrame({\n"
             "    'User Message': conversation,\n"
             "    'Detected Intent': [bot.detect_intent(m) for m in conversation],\n"
             "})\n"
             "conv_analysis.index = range(1, len(conv_analysis) + 1)\n"
             "conv_analysis.index.name = 'Turn'\n"
             "conv_analysis"),

        md("---\n## 3. Playlist Filter"),

        code("# Full catalogue\n"
             "playlist_df = catalogue_to_dataframe()\n"
             "print(f'Total songs: {len(playlist_df)}')\n"
             "playlist_df"),

        code("# Filter by genre\n"
             "print('\\n🎵 Pop songs:')\n"
             "pop_songs = filter_by_genre(playlist_df, 'Pop')\n"
             "pop_songs"),

        code("# Filter by mood\n"
             "print('\\n😊 Happy songs:')\n"
             "happy_songs = filter_by_mood(playlist_df, 'happy')\n"
             "happy_songs"),

        code("# Filter by artist\n"
             "print('\\n🎤 Ed Sheeran songs:')\n"
             "ed_songs = filter_by_artist(playlist_df, 'Ed Sheeran')\n"
             "ed_songs"),

        code("# Filter by decade\n"
             "print('\\n📅 2010s songs:')\n"
             "decade_songs = filter_by_decade(playlist_df, 2010)\n"
             "decade_songs"),

        code("# Filter by BPM range (workout songs)\n"
             "print('\\n🏃 Workout songs (BPM 100-180):')\n"
             "workout_songs = filter_by_bpm_range(playlist_df, 100, 180)\n"
             "workout_songs"),

        md("---\n## 4. Prompt Engineering Examples"),

        code("examples = get_all_examples()\n"
             "for ex in examples:\n"
             "    print(format_example(ex))\n"
             "    print()"),

        code("# Summary table\n"
             "prompt_summary = pd.DataFrame({\n"
             "    'Technique': [ex.technique for ex in examples],\n"
             "    'Use Case': [\n"
             "        'Simple classification/generation',\n"
             "        'Guided output with examples',\n"
             "        'Multi-step reasoning',\n"
             "        'Audience-targeted responses',\n"
             "        'Structured instruction following',\n"
             "        'Creative constrained generation',\n"
             "    ],\n"
             "    'When to Use': [\n"
             "        'Model has strong zero-shot capability',\n"
             "        'Output format needs to be specific',\n"
             "        'Math, logic, or multi-step problems',\n"
             "        'Different audiences need different depth',\n"
             "        'Fine-tuning or batch processing',\n"
             "        'Creative tasks with boundaries',\n"
             "    ],\n"
             "})\n"
             "prompt_summary.index = range(1, len(prompt_summary) + 1)\n"
             "prompt_summary.index.name = '#'\n"
             "prompt_summary"),

        md("---\n## 5. Industry Challenges"),

        code("challenges = pd.DataFrame({\n"
             "    'Challenge': [\n"
             "        'Hallucination',\n"
             "        'Bias and Fairness',\n"
             "        'Data Privacy',\n"
             "        'Intellectual Property',\n"
             "        'Computational Cost',\n"
             "        'Evaluation Difficulty',\n"
             "        'Regulatory Compliance',\n"
             "        'Adversarial Attacks',\n"
             "    ],\n"
             "    'Description': [\n"
             "        'Models generate plausible but factually incorrect content',\n"
             "        'Training data biases are reflected in outputs',\n"
             "        'Models may memorise and leak sensitive training data',\n"
             "        'Unclear ownership of AI-generated content',\n"
             "        'Large models require expensive GPU infrastructure',\n"
             "        'No single metric captures generation quality comprehensively',\n"
             "        'Varying global regulations (EU AI Act, etc.)',\n"
             "        'Models vulnerable to prompt injection and jailbreaking',\n"
             "    ],\n"
             "    'Mitigation': [\n"
             "        'RAG, fact-checking, human-in-the-loop',\n"
             "        'Diverse training data, bias auditing',\n"
             "        'Differential privacy, data deduplication',\n"
             "        'Clear licensing, watermarking',\n"
             "        'Model distillation, quantisation',\n"
             "        'Multi-metric evaluation (FID, BLEU, human eval)',\n"
             "        'Compliance frameworks, transparency reports',\n"
             "        'Input validation, guardrails, red-teaming',\n"
             "    ],\n"
             "})\n"
             "challenges.index = range(1, len(challenges) + 1)\n"
             "challenges.index.name = '#'\n"
             "challenges"),

        md("---\n## Summary\n\n"
           "- **IPL Summariser:** Extractive approach using term-frequency scoring — no LLM needed.\n"
           "- **Restaurant Chatbot:** Rule-based intent detection handles menus, orders, and billing.\n"
           "- **Playlist Filter:** Pandas-powered filtering by genre, mood, artist, decade, and BPM.\n"
           "- **Prompt Engineering:** Six techniques demonstrated with prompts, responses, and explanations.\n"
           "- **Industry Challenges:** Eight key challenges with mitigation strategies."),

        md("---\n## Interview Questions\n\n"
           "1. How does extractive summarisation differ from abstractive?\n"
           "2. What are the limitations of rule-based chatbots vs LLM-powered ones?\n"
           "3. Explain the concept of prompt engineering and why it matters.\n"
           "4. What is RAG and how does it reduce hallucination?\n"
           "5. How would you evaluate a chatbot's effectiveness?\n"
           "6. What ethical considerations arise from generative AI in media?\n"
           "7. Compare zero-shot, few-shot, and chain-of-thought prompting.\n"
           "8. How can differential privacy protect user data in generative models?"),

        md("---\n## References\n\n"
           "1. Lewis, P. et al. (2020). *Retrieval-Augmented Generation for Knowledge-Intensive NLP*. NeurIPS.\n"
           "2. Wei, J. et al. (2022). *Chain-of-Thought Prompting Elicits Reasoning in LLMs*. NeurIPS.\n"
           "3. EU Artificial Intelligence Act (2024). *Official Regulation*.\n"
           "4. Bender, E. et al. (2021). *On the Dangers of Stochastic Parrots*. FAccT."),
    ]
    return make_notebook(cells)


# ═══════════════════════════════════════════════════════════════════════════
# genai_intro.ipynb
# ═══════════════════════════════════════════════════════════════════════════
def genai_intro() -> dict:
    cells = [
        md("# Introduction to Generative AI\n\n"
           "A standalone gentle introduction to the world of Generative AI."),

        md("## Objectives\n\n"
           "1. Define Generative AI and its scope.\n"
           "2. Understand the difference between AI, ML, DL, and GenAI.\n"
           "3. Explore the key building blocks.\n"
           "4. See real-world examples."),

        md("## Theory\n\n"
           "### The AI Hierarchy\n\n"
           "```mermaid\n"
           "graph TD\n"
           "    AI[Artificial Intelligence] --> ML[Machine Learning]\n"
           "    ML --> DL[Deep Learning]\n"
           "    DL --> GenAI[Generative AI]\n"
           "    style GenAI fill:#f9f,stroke:#333\n"
           "```\n\n"
           "**Artificial Intelligence (AI):** Broad field of creating intelligent systems.  \n"
           "**Machine Learning (ML):** Subset of AI — learning from data.  \n"
           "**Deep Learning (DL):** Subset of ML — using neural networks with many layers.  \n"
           "**Generative AI (GenAI):** Subset of DL — creating new data (text, images, audio, code).\n\n"
           "### How Generative AI Works\n\n"
           "1. **Training Phase:** Model learns patterns from a large corpus.\n"
           "2. **Inference Phase:** Model generates new content conditioned on a prompt.\n"
           "3. **Evaluation:** Generated content is assessed for quality, diversity, and faithfulness."),

        md("## Learning Outcomes\n\n"
           "- Place Generative AI within the AI landscape.\n"
           "- Explain how generative models differ from predictive models.\n"
           "- Identify real-world GenAI applications."),

        md("---\n## Code Examples"),

        code("import sys\n"
             "from pathlib import Path\n"
             "\n"
             "PROJECT_ROOT = Path.cwd().parent if Path.cwd().name == 'notebooks' else Path.cwd()\n"
             "if str(PROJECT_ROOT) not in sys.path:\n"
             "    sys.path.insert(0, str(PROJECT_ROOT))\n"
             "\n"
             "import pandas as pd\n"
             "import matplotlib.pyplot as plt\n"
             "import numpy as np\n"
             "\n"
             "print('Ready ✓')"),

        code("# AI sub-fields comparison\n"
             "hierarchy = pd.DataFrame({\n"
             "    'Level': ['Artificial Intelligence', 'Machine Learning', 'Deep Learning', 'Generative AI'],\n"
             "    'Definition': [\n"
             "        'Systems that mimic human intelligence',\n"
             "        'Algorithms that learn from data',\n"
             "        'Neural networks with multiple layers',\n"
             "        'Models that create new content',\n"
             "    ],\n"
             "    'Example': ['Expert Systems', 'Random Forest', 'CNNs for ImageNet', 'ChatGPT, DALL·E'],\n"
             "    'Data Need': ['Rules + Knowledge', 'Structured data', 'Large labelled datasets', 'Massive unlabelled corpora'],\n"
             "})\n"
             "hierarchy.index = range(1, len(hierarchy) + 1)\n"
             "hierarchy.index.name = '#'\n"
             "hierarchy"),

        code("# GenAI capabilities\n"
             "capabilities = pd.DataFrame({\n"
             "    'Modality': ['Text', 'Image', 'Audio', 'Video', 'Code', '3D'],\n"
             "    'Example Model': ['GPT-4, LLaMA', 'DALL·E, Midjourney', 'MusicGen, Bark', 'Sora, Runway', 'Codex, StarCoder', 'Point-E, DreamFusion'],\n"
             "    'Input': ['Prompt text', 'Text description', 'Text/melody', 'Text description', 'Natural language', 'Text/image'],\n"
             "    'Output': ['Generated text', 'Generated image', 'Generated audio', 'Generated video', 'Generated code', 'Generated 3D model'],\n"
             "})\n"
             "capabilities.index = range(1, len(capabilities) + 1)\n"
             "capabilities.index.name = '#'\n"
             "capabilities"),

        code("# Visualise GenAI market growth (illustrative)\n"
             "years = [2020, 2021, 2022, 2023, 2024, 2025]\n"
             "market_size = [8, 12, 20, 45, 67, 100]  # billions USD (illustrative)\n"
             "\n"
             "fig, ax = plt.subplots(figsize=(8, 4))\n"
             "ax.bar(years, market_size, color='#3498db', alpha=0.8)\n"
             "ax.plot(years, market_size, 'ro-', linewidth=2)\n"
             "ax.set_xlabel('Year')\n"
             "ax.set_ylabel('Market Size (Billion USD)')\n"
             "ax.set_title('Generative AI Market Growth (Illustrative)')\n"
             "ax.grid(axis='y', alpha=0.3)\n"
             "for y, m in zip(years, market_size):\n"
             "    ax.annotate(f'${m}B', (y, m), textcoords='offset points',\n"
             "               xytext=(0, 10), ha='center', fontsize=9)\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("---\n## Summary\n\n"
           "- Generative AI sits at the cutting edge of the AI → ML → DL hierarchy.\n"
           "- It can generate text, images, audio, video, code, and 3D models.\n"
           "- The market is growing exponentially with applications across all industries.\n"
           "- Understanding the fundamentals is essential for any AI practitioner."),

        md("---\n## Interview Questions\n\n"
           "1. What distinguishes generative AI from traditional AI?\n"
           "2. Name three modalities that generative AI can produce.\n"
           "3. What is the training-inference distinction in GenAI?\n"
           "4. Why has GenAI grown so rapidly since 2022?\n"
           "5. What are the ethical implications of content generated by AI?"),

        md("---\n## References\n\n"
           "1. McKinsey (2023). *The Economic Potential of Generative AI*.\n"
           "2. Google Research (2023). *Gemini: A Family of Highly Capable Multimodal Models*.\n"
           "3. OpenAI (2023). *GPT-4 Technical Report*.\n"
           "4. Stanford HAI (2024). *AI Index Report*."),
    ]
    return make_notebook(cells)


# ═══════════════════════════════════════════════════════════════════════════
# comparison_traditional_ai_vs_genai.ipynb
# ═══════════════════════════════════════════════════════════════════════════
def comparison_notebook() -> dict:
    cells = [
        md("# Traditional AI vs Generative AI — A Comprehensive Comparison\n\n"
           "This notebook provides a detailed side-by-side analysis using tables, "
           "visualisations, and code examples."),

        md("## Objectives\n\n"
           "1. Define traditional AI and generative AI.\n"
           "2. Compare across multiple dimensions using pandas DataFrames.\n"
           "3. Visualise the differences.\n"
           "4. Understand when to use each paradigm."),

        md("## Theory\n\n"
           "### Traditional AI\n"
           "Traditional AI systems are designed for **analysis and prediction**. They classify, "
           "detect, recommend, and predict based on learned patterns. The output is typically "
           "a label, score, or decision.\n\n"
           "### Generative AI\n"
           "Generative AI systems are designed for **creation**. They generate new text, images, "
           "audio, or other data types that are statistically similar to the training data.\n\n"
           "```mermaid\n"
           "graph LR\n"
           "    subgraph Traditional AI\n"
           "        I1[Input] --> M1[Model] --> O1[Prediction / Label]\n"
           "    end\n"
           "    subgraph Generative AI\n"
           "        I2[Prompt / Noise] --> M2[Model] --> O2[New Content]\n"
           "    end\n"
           "```"),

        md("## Learning Outcomes\n\n"
           "- Articulate the core differences between traditional and generative AI.\n"
           "- Use pandas for structured multi-dimensional comparisons.\n"
           "- Create effective comparison visualisations.\n"
           "- Choose the right AI paradigm for a given problem."),

        md("---\n## Code"),

        code("import sys\n"
             "from pathlib import Path\n"
             "\n"
             "PROJECT_ROOT = Path.cwd().parent if Path.cwd().name == 'notebooks' else Path.cwd()\n"
             "if str(PROJECT_ROOT) not in sys.path:\n"
             "    sys.path.insert(0, str(PROJECT_ROOT))\n"
             "\n"
             "import pandas as pd\n"
             "import matplotlib.pyplot as plt\n"
             "import numpy as np\n"
             "\n"
             "print('Ready ✓')"),

        code("# Core comparison table\n"
             "comparison = pd.DataFrame({\n"
             "    'Dimension': [\n"
             "        'Primary Goal',\n"
             "        'Output Type',\n"
             "        'Learning Paradigm',\n"
             "        'Model Examples',\n"
             "        'Data Requirements',\n"
             "        'Evaluation Metrics',\n"
             "        'Interpretability',\n"
             "        'Compute Cost',\n"
             "        'Risk Profile',\n"
             "        'Industry Maturity',\n"
             "    ],\n"
             "    'Traditional AI': [\n"
             "        'Analyse, classify, predict',\n"
             "        'Labels, scores, decisions',\n"
             "        'Supervised / Unsupervised',\n"
             "        'SVM, Random Forest, XGBoost, LSTM',\n"
             "        'Structured, labelled datasets',\n"
             "        'Accuracy, Precision, Recall, F1',\n"
             "        'Often interpretable (SHAP, LIME)',\n"
             "        'Low to moderate',\n"
             "        'Bias in predictions',\n"
             "        'Mature, well-understood',\n"
             "    ],\n"
             "    'Generative AI': [\n"
             "        'Create new content',\n"
             "        'Text, images, audio, video, code',\n"
             "        'Self-supervised / Unsupervised',\n"
             "        'GPT, DALL·E, Stable Diffusion, VAE',\n"
             "        'Massive unstructured corpora',\n"
             "        'FID, BLEU, Human Eval, Perplexity',\n"
             "        'Often a black box',\n"
             "        'Very high (GPU clusters)',\n"
             "        'Hallucination, IP concerns, misuse',\n"
             "        'Rapidly evolving',\n"
             "    ],\n"
             "})\n"
             "comparison.index = range(1, len(comparison) + 1)\n"
             "comparison.index.name = '#'\n"
             "comparison"),

        code("# Use-case mapping\n"
             "use_cases = pd.DataFrame({\n"
             "    'Use Case': [\n"
             "        'Email spam detection',\n"
             "        'Marketing copy generation',\n"
             "        'Fraud detection',\n"
             "        'Product image creation',\n"
             "        'Customer churn prediction',\n"
             "        'Chatbot conversation',\n"
             "        'Disease diagnosis',\n"
             "        'Drug molecule design',\n"
             "        'Recommendation system',\n"
             "        'Code auto-completion',\n"
             "    ],\n"
             "    'AI Type': [\n"
             "        'Traditional', 'Generative', 'Traditional', 'Generative',\n"
             "        'Traditional', 'Generative', 'Traditional', 'Generative',\n"
             "        'Traditional', 'Generative',\n"
             "    ],\n"
             "    'Complexity': [\n"
             "        'Low', 'Medium', 'Medium', 'High',\n"
             "        'Medium', 'High', 'High', 'Very High',\n"
             "        'Medium', 'High',\n"
             "    ],\n"
             "})\n"
             "use_cases.index = range(1, len(use_cases) + 1)\n"
             "use_cases.index.name = '#'\n"
             "use_cases"),

        code("# Visualisation: radar chart comparing dimensions\n"
             "categories = ['Quality', 'Speed', 'Cost', 'Interpretability', 'Flexibility', 'Data Need']\n"
             "trad_scores = [7, 9, 8, 8, 4, 6]\n"
             "gen_scores  = [9, 5, 3, 3, 9, 4]\n"
             "\n"
             "# Close the polygon\n"
             "categories_plot = categories + [categories[0]]\n"
             "trad_plot = trad_scores + [trad_scores[0]]\n"
             "gen_plot  = gen_scores + [gen_scores[0]]\n"
             "\n"
             "angles = np.linspace(0, 2 * np.pi, len(categories), endpoint=False).tolist()\n"
             "angles += angles[:1]\n"
             "\n"
             "fig, ax = plt.subplots(figsize=(7, 7), subplot_kw=dict(polar=True))\n"
             "ax.plot(angles, trad_plot, 'o-', linewidth=2, label='Traditional AI', color='#3498db')\n"
             "ax.fill(angles, trad_plot, alpha=0.15, color='#3498db')\n"
             "ax.plot(angles, gen_plot, 'o-', linewidth=2, label='Generative AI', color='#e74c3c')\n"
             "ax.fill(angles, gen_plot, alpha=0.15, color='#e74c3c')\n"
             "ax.set_xticks(angles[:-1])\n"
             "ax.set_xticklabels(categories, fontsize=11)\n"
             "ax.set_ylim(0, 10)\n"
             "ax.set_title('Traditional AI vs Generative AI', fontsize=14, y=1.08)\n"
             "ax.legend(loc='upper right', bbox_to_anchor=(1.3, 1.1))\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        code("# Bar chart: use-case distribution\n"
             "fig, ax = plt.subplots(figsize=(8, 4))\n"
             "counts = use_cases['AI Type'].value_counts()\n"
             "ax.bar(counts.index, counts.values, color=['#3498db', '#e74c3c'])\n"
             "ax.set_ylabel('Number of Use Cases')\n"
             "ax.set_title('Use Cases: Traditional vs Generative AI')\n"
             "ax.grid(axis='y', alpha=0.3)\n"
             "fig.tight_layout()\n"
             "plt.show()"),

        md("### Interpretation\n\n"
           "- Traditional AI excels at **structured prediction** tasks with high speed and interpretability.\n"
           "- Generative AI excels at **creative and flexible** tasks but at higher computational cost.\n"
           "- Many real-world solutions combine both: e.g., RAG systems use traditional retrieval + generative responses.\n"
           "- The choice depends on the problem's nature, data availability, and business constraints."),

        md("---\n## Summary\n\n"
           "| Aspect | Traditional AI | Generative AI |\n"
           "|--------|---------------|---------------|\n"
           "| **Goal** | Predict / Classify | Create / Generate |\n"
           "| **Strengths** | Speed, interpretability | Creativity, flexibility |\n"
           "| **Weaknesses** | Limited to learned patterns | High cost, hallucination |\n"
           "| **Best For** | Structured decision-making | Content creation, design |"),

        md("---\n## Interview Questions\n\n"
           "1. When would you choose traditional AI over generative AI?\n"
           "2. Can generative AI be used for classification tasks? How?\n"
           "3. What is the computational cost difference between training a Random Forest vs GPT-4?\n"
           "4. How does interpretability differ between a decision tree and a transformer?\n"
           "5. Give an example of a hybrid system using both traditional and generative AI.\n"
           "6. What evaluation metrics are unique to generative AI?"),

        md("---\n## References\n\n"
           "1. Russell, S. & Norvig, P. (2021). *Artificial Intelligence: A Modern Approach* (4th ed.).\n"
           "2. Goodfellow, I. et al. (2016). *Deep Learning*. MIT Press.\n"
           "3. Bommasani, R. et al. (2021). *On the Opportunities and Risks of Foundation Models*. Stanford.\n"
           "4. Google (2023). *Gemini Technical Report*."),
    ]
    return make_notebook(cells)


# ═══════════════════════════════════════════════════════════════════════════
# Main — generate all notebooks
# ═══════════════════════════════════════════════════════════════════════════
def main() -> None:
    print("Generating notebooks...\n")

    notebooks = [
        ("session01_intro_to_generative_models.ipynb", session01()),
        ("session02_autoencoder_and_vae.ipynb", session02()),
        ("session03_gan.ipynb", session03()),
        ("session04_diffusion_models.ipynb", session04()),
        ("session05_industry_applications.ipynb", session05()),
        ("genai_intro.ipynb", genai_intro()),
        ("comparison_traditional_ai_vs_genai.ipynb", comparison_notebook()),
    ]

    for name, nb in notebooks:
        save_notebook(nb, name)

    print(f"\n[OK] All {len(notebooks)} notebooks generated in {NOTEBOOKS_DIR}")


if __name__ == "__main__":
    main()
