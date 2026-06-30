"""
Prompt engineering examples and templates.

Demonstrates zero-shot, few-shot, chain-of-thought, and role-based
prompting strategies with pre-generated responses (no paid API calls).
"""

from __future__ import annotations

import logging
from dataclasses import dataclass
from typing import List

logger = logging.getLogger(__name__)


@dataclass
class PromptExample:
    """A single prompt-engineering example.

    Attributes:
        technique:   Name of the prompting technique.
        prompt:      The prompt text sent to the model.
        response:    The generated (or pre-recorded) response.
        explanation: Why this technique works.
    """

    technique: str
    prompt: str
    response: str
    explanation: str


# ═══════════════════════════════════════════════════════════════════════
# Curated examples
# ═══════════════════════════════════════════════════════════════════════
PROMPT_EXAMPLES: List[PromptExample] = [
    PromptExample(
        technique="Zero-Shot Prompting",
        prompt="Classify the following movie review as Positive or Negative:\n"
               "\"The cinematography was breathtaking but the plot was predictable.\"",
        response="Positive — While the reviewer notes a predictable plot, the emphasis on "
                 "'breathtaking' cinematography suggests an overall favourable impression.",
        explanation=(
            "Zero-shot prompting gives the model a task without examples. "
            "It relies on the model's pre-training to understand the task format."
        ),
    ),
    PromptExample(
        technique="Few-Shot Prompting",
        prompt=(
            "Classify movie reviews:\n\n"
            "Review: 'Absolutely loved every minute!' → Positive\n"
            "Review: 'Worst film I have ever seen.' → Negative\n"
            "Review: 'A decent effort with some flaws.' → Neutral\n\n"
            "Review: 'The acting was superb and the story kept me engaged.' → "
        ),
        response="Positive — The review praises both acting and story engagement.",
        explanation=(
            "Few-shot prompting provides labelled examples before the actual query. "
            "This guides the model's output format and decision boundary."
        ),
    ),
    PromptExample(
        technique="Chain-of-Thought (CoT)",
        prompt=(
            "A farmer has 15 apples. He sells 4 to a neighbour and buys 7 more "
            "from the market. How many apples does he have now? Think step by step."
        ),
        response=(
            "Step 1: Start with 15 apples.\n"
            "Step 2: Sell 4 → 15 − 4 = 11 apples.\n"
            "Step 3: Buy 7 → 11 + 7 = 18 apples.\n"
            "Answer: The farmer has 18 apples."
        ),
        explanation=(
            "Chain-of-thought prompting asks the model to show intermediate reasoning. "
            "This reduces errors on multi-step problems by forcing explicit logic."
        ),
    ),
    PromptExample(
        technique="Role-Based Prompting",
        prompt=(
            "You are a senior data scientist at a Fortune 500 company. "
            "Explain the difference between supervised and unsupervised learning "
            "to a non-technical stakeholder in 3 sentences."
        ),
        response=(
            "Supervised learning is like teaching with an answer key — we give the "
            "model labelled examples so it learns to predict outcomes. Unsupervised "
            "learning, on the other hand, lets the model discover hidden patterns in "
            "data without any labels. Think of it as the difference between a guided "
            "tour and free exploration."
        ),
        explanation=(
            "Assigning a role constrains the model's tone, depth, and vocabulary. "
            "It produces more targeted, audience-appropriate responses."
        ),
    ),
    PromptExample(
        technique="Instruction Tuning Style",
        prompt=(
            "### Instruction\n"
            "Summarise the following paragraph in exactly two bullet points.\n\n"
            "### Input\n"
            "Machine learning models require large datasets for training. "
            "Data quality is as important as quantity. Noisy data can lead to "
            "poor generalisation, while clean, representative data improves "
            "model accuracy and robustness.\n\n"
            "### Response"
        ),
        response=(
            "• Large, high-quality datasets are essential for effective ML training.\n"
            "• Clean and representative data boosts accuracy, while noisy data hurts generalisation."
        ),
        explanation=(
            "The Instruction / Input / Response format mirrors fine-tuning templates "
            "used in InstructGPT-style models. It provides clear structural cues."
        ),
    ),
    PromptExample(
        technique="Persona + Constraint Prompting",
        prompt=(
            "You are a Michelin-star chef. Suggest a 3-course dinner menu using "
            "only Indian ingredients. Each course must be described in one sentence."
        ),
        response=(
            "Starter: Spiced beetroot tikki with tamarind chutney and micro coriander.\n"
            "Main: Slow-cooked lamb rogan josh with saffron pilaf and raita.\n"
            "Dessert: Cardamom panna cotta drizzled with rose syrup and crushed pistachios."
        ),
        explanation=(
            "Combining a persona with explicit constraints (ingredient origin, "
            "course count, sentence limit) yields creative yet focused output."
        ),
    ),
]


def get_all_examples() -> List[PromptExample]:
    """Return the full list of curated prompt-engineering examples.

    Returns:
        List of ``PromptExample`` dataclass instances.
    """
    return PROMPT_EXAMPLES


def get_example_by_technique(technique: str) -> List[PromptExample]:
    """Filter examples by technique name (case-insensitive substring match).

    Args:
        technique: Technique name or substring.

    Returns:
        Matching ``PromptExample`` list.
    """
    return [
        ex for ex in PROMPT_EXAMPLES if technique.lower() in ex.technique.lower()
    ]


def format_example(example: PromptExample) -> str:
    """Format a single example as a readable string.

    Args:
        example: A ``PromptExample`` instance.

    Returns:
        Multi-line formatted string.
    """
    return (
        f"{'═' * 60}\n"
        f"Technique: {example.technique}\n"
        f"{'─' * 60}\n"
        f"PROMPT:\n{example.prompt}\n\n"
        f"RESPONSE:\n{example.response}\n\n"
        f"EXPLANATION:\n{example.explanation}\n"
        f"{'═' * 60}"
    )
