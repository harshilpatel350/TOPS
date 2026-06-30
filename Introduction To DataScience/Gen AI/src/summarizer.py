"""
Extractive text summarizer for IPL match reports.

Uses a frequency-based extractive approach — no paid APIs, no LLMs.
"""

from __future__ import annotations

import logging
import re
from collections import Counter
from pathlib import Path
from typing import List, Optional

from src.config import OUTPUTS_DIR

logger = logging.getLogger(__name__)


# ═══════════════════════════════════════════════════════════════════════
# Stop-words (minimal built-in list to avoid NLTK dependency)
# ═══════════════════════════════════════════════════════════════════════
_STOP_WORDS = frozenset(
    "a an the and or but is are was were be been being have has had do does did "
    "will would shall should may might can could to of in for on with at by from "
    "as into through during before after above below between out off over under "
    "again further then once here there when where why how all each every both "
    "few more most other some such no nor not only own same so than too very it "
    "its he she they them their this that these those i me my we our you your "
    "his her him us who whom which what if about up".split()
)


def _tokenize(text: str) -> List[str]:
    """Lowercase and extract alphabetic tokens."""
    return re.findall(r"[a-z]+", text.lower())


def _sentence_split(text: str) -> List[str]:
    """Split text into sentences using punctuation heuristics."""
    sentences = re.split(r"(?<=[.!?])\s+", text.strip())
    return [s.strip() for s in sentences if len(s.strip()) > 10]


def extractive_summarize(text: str, num_sentences: int = 5) -> str:
    """Produce an extractive summary of *text*.

    The algorithm scores each sentence by the sum of its non-stop-word
    term frequencies, then returns the top-*num_sentences* in their
    original order.

    Args:
        text:          Input document.
        num_sentences: Number of sentences to retain.

    Returns:
        Summary string.

    Raises:
        ValueError: If *text* is empty.
    """
    if not text.strip():
        raise ValueError("Input text must not be empty.")

    sentences = _sentence_split(text)
    if len(sentences) <= num_sentences:
        return text.strip()

    # Build term-frequency table (excluding stop-words)
    words = [w for w in _tokenize(text) if w not in _STOP_WORDS]
    freq = Counter(words)

    # Score sentences
    scored: List[tuple[int, float, str]] = []
    for idx, sent in enumerate(sentences):
        tokens = [w for w in _tokenize(sent) if w not in _STOP_WORDS]
        score = sum(freq[t] for t in tokens) / (len(tokens) + 1)
        scored.append((idx, score, sent))

    # Select top sentences, preserving original order
    top = sorted(scored, key=lambda x: x[1], reverse=True)[:num_sentences]
    top_ordered = sorted(top, key=lambda x: x[0])
    summary = " ".join(s for _, _, s in top_ordered)
    logger.info(
        "Summarised %d sentences → %d sentences (%d → %d chars)",
        len(sentences),
        num_sentences,
        len(text),
        len(summary),
    )
    return summary


# ═══════════════════════════════════════════════════════════════════════
# IPL-specific wrapper
# ═══════════════════════════════════════════════════════════════════════

# Sample IPL report used when no external file is provided.
SAMPLE_IPL_REPORT: str = (
    "The Indian Premier League (IPL) 2024 season witnessed another thrilling chapter in "
    "cricket history. Mumbai Indians started the tournament strong with a convincing win "
    "against Royal Challengers Bangalore in the opening match. Chennai Super Kings, led by "
    "the legendary MS Dhoni, showed remarkable consistency throughout the league stage. "
    "The young talents like Shubman Gill and Yashasvi Jaiswal made headlines with their "
    "aggressive batting styles. Kolkata Knight Riders surprised everyone with their "
    "tactical approach under shrewd captaincy. Rajasthan Royals, powered by their overseas "
    "stars, delivered several match-winning performances. The tournament saw record-breaking "
    "viewership numbers, cementing IPL's position as the world's premier T20 league. "
    "Gujarat Titans showcased depth in their squad with multiple match-winners stepping up "
    "in crucial games. The bowling departments across all franchises showed significant "
    "improvement, with pace bowlers dominating the powerplay overs. Sunrisers Hyderabad's "
    "batting lineup proved to be the most explosive in the tournament. Delhi Capitals "
    "struggled with injuries but showed resilience in the middle phase. Lucknow Super "
    "Giants relied on their balanced combination of experience and youth. Punjab Kings "
    "entertained fans with high-scoring thrillers throughout the season. The playoff stage "
    "delivered edge-of-the-seat drama with two matches going to the last over. The final "
    "was a masterclass in T20 cricket with both teams giving their absolute best. "
    "The winning team celebrated with their passionate fanbase in a grand ceremony."
)


def summarize_ipl(
    report: Optional[str] = None,
    num_sentences: int = 5,
    save_path: Optional[Path] = None,
) -> str:
    """Summarise an IPL match report and optionally save to disk.

    Args:
        report:        Full-text IPL report; defaults to a built-in sample.
        num_sentences: Desired summary length.
        save_path:     If provided, write the summary here.

    Returns:
        Summary string.
    """
    if report is None:
        report = SAMPLE_IPL_REPORT

    summary = extractive_summarize(report, num_sentences=num_sentences)

    if save_path is None:
        save_path = OUTPUTS_DIR / "ipl_summary.txt"

    save_path = Path(save_path)
    save_path.parent.mkdir(parents=True, exist_ok=True)
    save_path.write_text(summary, encoding="utf-8")
    logger.info("IPL summary saved → %s", save_path)

    return summary
