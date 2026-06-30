"""
Playlist filter — filter songs by genre, mood, artist, or decade.

No external APIs; works with an in-memory curated catalogue.
"""

from __future__ import annotations

import logging
from dataclasses import dataclass
from typing import List, Optional

import pandas as pd

logger = logging.getLogger(__name__)


@dataclass
class Song:
    """Represents a single song entry.

    Attributes:
        title:  Song title.
        artist: Performing artist.
        genre:  Musical genre.
        mood:   Mood tag (e.g. ``"happy"``, ``"chill"``, ``"energetic"``).
        year:   Release year.
        bpm:    Beats per minute.
    """

    title: str
    artist: str
    genre: str
    mood: str
    year: int
    bpm: int


# ═══════════════════════════════════════════════════════════════════════
# Curated catalogue
# ═══════════════════════════════════════════════════════════════════════
CATALOGUE: List[Song] = [
    Song("Blinding Lights", "The Weeknd", "Synthpop", "energetic", 2020, 171),
    Song("Shape of You", "Ed Sheeran", "Pop", "happy", 2017, 96),
    Song("Bohemian Rhapsody", "Queen", "Rock", "dramatic", 1975, 72),
    Song("Billie Jean", "Michael Jackson", "Pop", "groovy", 1983, 117),
    Song("Stairway to Heaven", "Led Zeppelin", "Rock", "mellow", 1971, 63),
    Song("Lose Yourself", "Eminem", "Hip-Hop", "energetic", 2002, 171),
    Song("Rolling in the Deep", "Adele", "Pop", "dramatic", 2011, 105),
    Song("Hotel California", "Eagles", "Rock", "mellow", 1977, 75),
    Song("Uptown Funk", "Bruno Mars", "Funk", "happy", 2014, 115),
    Song("Someone Like You", "Adele", "Pop", "sad", 2011, 67),
    Song("Smells Like Teen Spirit", "Nirvana", "Grunge", "energetic", 1991, 117),
    Song("Let It Be", "The Beatles", "Rock", "mellow", 1970, 68),
    Song("Bad Guy", "Billie Eilish", "Electropop", "chill", 2019, 135),
    Song("Shallow", "Lady Gaga", "Pop", "dramatic", 2018, 96),
    Song("Old Town Road", "Lil Nas X", "Country Rap", "happy", 2019, 136),
    Song("Thinking Out Loud", "Ed Sheeran", "Pop", "romantic", 2014, 79),
    Song("Stressed Out", "Twenty One Pilots", "Alternative", "chill", 2015, 85),
    Song("Sunflower", "Post Malone", "Pop", "chill", 2018, 90),
    Song("Levitating", "Dua Lipa", "Disco Pop", "energetic", 2020, 103),
    Song("Watermelon Sugar", "Harry Styles", "Pop", "happy", 2020, 95),
]


# ═══════════════════════════════════════════════════════════════════════
# Filter functions
# ═══════════════════════════════════════════════════════════════════════
def catalogue_to_dataframe(songs: Optional[List[Song]] = None) -> pd.DataFrame:
    """Convert a list of ``Song`` objects to a pandas DataFrame.

    Args:
        songs: Song list (defaults to the built-in ``CATALOGUE``).

    Returns:
        DataFrame with columns ``title, artist, genre, mood, year, bpm``.
    """
    if songs is None:
        songs = CATALOGUE
    data = [
        {
            "title": s.title,
            "artist": s.artist,
            "genre": s.genre,
            "mood": s.mood,
            "year": s.year,
            "bpm": s.bpm,
        }
        for s in songs
    ]
    df = pd.DataFrame(data)
    logger.info("Created playlist DataFrame with %d songs", len(df))
    return df


def filter_by_genre(df: pd.DataFrame, genre: str) -> pd.DataFrame:
    """Filter playlist by genre (case-insensitive substring match).

    Args:
        df:    Playlist DataFrame.
        genre: Genre substring to match.

    Returns:
        Filtered DataFrame.
    """
    mask = df["genre"].str.contains(genre, case=False, na=False)
    result = df[mask]
    logger.info("Genre filter '%s': %d → %d songs", genre, len(df), len(result))
    return result


def filter_by_mood(df: pd.DataFrame, mood: str) -> pd.DataFrame:
    """Filter playlist by mood (case-insensitive exact match).

    Args:
        df:   Playlist DataFrame.
        mood: Mood tag (e.g. ``"happy"``).

    Returns:
        Filtered DataFrame.
    """
    mask = df["mood"].str.lower() == mood.lower()
    result = df[mask]
    logger.info("Mood filter '%s': %d → %d songs", mood, len(df), len(result))
    return result


def filter_by_artist(df: pd.DataFrame, artist: str) -> pd.DataFrame:
    """Filter playlist by artist name (case-insensitive substring match).

    Args:
        df:     Playlist DataFrame.
        artist: Artist name or substring.

    Returns:
        Filtered DataFrame.
    """
    mask = df["artist"].str.contains(artist, case=False, na=False)
    result = df[mask]
    logger.info("Artist filter '%s': %d → %d songs", artist, len(df), len(result))
    return result


def filter_by_decade(df: pd.DataFrame, decade_start: int) -> pd.DataFrame:
    """Filter playlist to a specific decade.

    Args:
        df:           Playlist DataFrame.
        decade_start: Start year of the decade (e.g. ``2010``).

    Returns:
        Filtered DataFrame.
    """
    mask = (df["year"] >= decade_start) & (df["year"] < decade_start + 10)
    result = df[mask]
    logger.info(
        "Decade filter %ds: %d → %d songs", decade_start, len(df), len(result)
    )
    return result


def filter_by_bpm_range(
    df: pd.DataFrame, min_bpm: int = 0, max_bpm: int = 300
) -> pd.DataFrame:
    """Filter playlist by BPM range.

    Args:
        df:      Playlist DataFrame.
        min_bpm: Minimum BPM (inclusive).
        max_bpm: Maximum BPM (inclusive).

    Returns:
        Filtered DataFrame.
    """
    mask = (df["bpm"] >= min_bpm) & (df["bpm"] <= max_bpm)
    result = df[mask]
    logger.info(
        "BPM filter [%d–%d]: %d → %d songs", min_bpm, max_bpm, len(df), len(result)
    )
    return result
