"""Content validation tests for video and short scripts."""

import re

import pytest


class TestVideoScripts:
    """Validate video script structure and content."""

    def test_video_scripts_exist(self, video_scripts):
        """At least one video script exists."""
        assert len(video_scripts) > 0, "No video scripts found"

    def test_video_scripts_not_empty(self, video_scripts):
        """All video scripts have content."""
        for script in video_scripts:
            content = script.read_text()
            assert len(content.strip()) > 100, f"{script.name} is too short"

    def test_video_scripts_have_opening(self, video_scripts):
        """Video scripts have an opening greeting or visual cue."""
        opening_patterns = [
            r"\[Visual:",  # Visual cue format
            r"^title:",  # Metadata format
            r"Hey family",  # Direct greeting
            r"Welcome",  # Alternative greeting
        ]

        for script in video_scripts:
            content = script.read_text()
            has_opening = any(
                re.search(pattern, content, re.MULTILINE | re.IGNORECASE)
                for pattern in opening_patterns
            )
            assert has_opening, f"{script.name} missing opening"

    def test_video_scripts_have_closing(self, video_scripts):
        """Video scripts have a closing/call-to-action."""
        closing_patterns = [
            r"We.ve got this",  # Handle any apostrophe variant
            r"stay with me",
            r"I.ll see you",
            r"subscribe",
            r"liking.*sharing",
        ]

        for script in video_scripts:
            content = script.read_text()
            has_closing = any(
                re.search(pattern, content, re.IGNORECASE)
                for pattern in closing_patterns
            )
            assert has_closing, f"{script.name} missing closing"

    def test_video_filenames_are_sequential(self, video_scripts):
        """Video scripts follow naming pattern epXX_*.md."""
        pattern = re.compile(r"ep(\d{2})_.*\.md")

        for script in video_scripts:
            match = pattern.match(script.name)
            assert match, f"{script.name} doesn't match naming pattern"

            episode_num = int(match.group(1))
            assert 1 <= episode_num <= 99, f"{script.name} has invalid episode number"

    def test_video_scripts_reasonable_length(self, video_scripts):
        """Video scripts are within reasonable word count (200-2000 words)."""
        for script in video_scripts:
            content = script.read_text()
            word_count = len(content.split())
            assert (
                200 <= word_count <= 2000
            ), f"{script.name} has {word_count} words (expected 200-2000)"


class TestShortScripts:
    """Validate short script structure and content."""

    def test_short_scripts_exist(self, short_scripts):
        """At least one short script exists."""
        assert len(short_scripts) > 0, "No short scripts found"

    def test_short_scripts_not_empty(self, short_scripts):
        """All short scripts have content."""
        for script in short_scripts:
            content = script.read_text()
            assert len(content.strip()) > 50, f"{script.name} is too short"

    def test_short_scripts_are_brief(self, short_scripts):
        """Short scripts are appropriately brief (under 300 words)."""
        for script in short_scripts:
            content = script.read_text()
            word_count = len(content.split())
            assert (
                word_count <= 300
            ), f"{script.name} has {word_count} words (shorts should be under 300)"

    def test_short_filenames_are_sequential(self, short_scripts):
        """Short scripts follow naming pattern short_XX_*.md."""
        pattern = re.compile(r"short_(\d{2})_.*\.md")

        for script in short_scripts:
            match = pattern.match(script.name)
            assert match, f"{script.name} doesn't match naming pattern"

    def test_shorts_have_closing(self, short_scripts):
        """Short scripts have a brief closing."""
        closing_patterns = [
            r"We.ve got this",  # Handle any apostrophe variant
            r"Stay with me",
            r"I.ll see you",
            r"Auntie Truth",
            r"make sense",
        ]

        for script in short_scripts:
            content = script.read_text()
            has_closing = any(
                re.search(pattern, content, re.IGNORECASE)
                for pattern in closing_patterns
            )
            assert has_closing, f"{script.name} missing closing"


class TestContentConsistency:
    """Cross-cutting content consistency checks."""

    def test_no_placeholder_text(self, video_scripts, short_scripts):
        """No scripts contain placeholder text."""
        placeholders = [
            r"\[TODO\]",
            r"\[TBD\]",
            r"\[INSERT\]",
            r"PLACEHOLDER",
            r"XXX",
            r"FIXME",
        ]

        all_scripts = list(video_scripts) + list(short_scripts)

        for script in all_scripts:
            content = script.read_text()
            for placeholder in placeholders:
                assert not re.search(
                    placeholder, content, re.IGNORECASE
                ), f"{script.name} contains placeholder: {placeholder}"

    def test_brand_voice_consistency(self, video_scripts):
        """Video scripts maintain Auntie Truth brand voice."""
        brand_markers = [
            r"Auntie|Truth|family|baby",  # Brand terms
        ]

        for script in video_scripts:
            content = script.read_text()
            has_brand_voice = any(
                re.search(pattern, content, re.IGNORECASE) for pattern in brand_markers
            )
            assert has_brand_voice, f"{script.name} missing brand voice markers"

    def test_scripts_use_utf8(self, video_scripts, short_scripts):
        """All scripts are valid UTF-8."""
        all_scripts = list(video_scripts) + list(short_scripts)

        for script in all_scripts:
            try:
                script.read_text(encoding="utf-8")
            except UnicodeDecodeError:
                pytest.fail(f"{script.name} is not valid UTF-8")
