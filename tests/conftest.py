"""Pytest fixtures for content validation tests."""

import pytest
from pathlib import Path

PROJECT_ROOT = Path(__file__).parent.parent


@pytest.fixture
def scripts_dir():
    """Path to video scripts directory."""
    return PROJECT_ROOT / "scripts"


@pytest.fixture
def shorts_dir():
    """Path to shorts directory."""
    return PROJECT_ROOT / "shorts"


@pytest.fixture
def video_scripts(scripts_dir):
    """List of all video script files."""
    return sorted(scripts_dir.glob("video_*.md"))


@pytest.fixture
def short_scripts(shorts_dir):
    """List of all short script files."""
    return sorted(shorts_dir.glob("short_*.md"))
