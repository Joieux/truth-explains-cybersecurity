#!/usr/bin/env python3

from pathlib import Path
import argparse
import hashlib
import json
import re
import sys

FORBIDDEN_TERMS = (
    "human approved",
    "human-approved",
    "accuracy corrected",
    "accuracy-corrected",
    "final narration",
    "authoritative recording copy",
    "production narration lock",
    "production status",
    "media generation gate",
    "final release gate",
    "cybersecurity notes",
    "findings and minimal corrections",
    "factually inaccurate",
    "materially misleading",
    "stylistic preference",
    "voice-locked wording",
    "canonical reference preflight",
    "filesystem reinspection",
    "recording copy",
    "superseded",
)

def sha256_text(text: str) -> str:
    return hashlib.sha256(text.encode("utf-8")).hexdigest()

def validate_payload(
    path: Path,
    expected_opening: str | None = None,
    expected_closing: str | None = None,
):
    path = path.resolve()

    if not path.exists():
        raise ValueError(f"TTS payload missing: {path}")

    if path.suffix.lower() != ".txt":
        raise ValueError(
            "TTS PROVIDER GATE REJECT: provider input must be a narration-only .txt file. "
            "Markdown and production documents are forbidden."
        )

    normalized = str(path).replace("\\", "/")

    if "/production/tts/" not in normalized:
        raise ValueError(
            "TTS PROVIDER GATE REJECT: payload is not inside the episode production/tts directory."
        )

    text = path.read_text(encoding="utf-8")

    if not text.strip():
        raise ValueError("TTS PROVIDER GATE REJECT: empty payload.")

    lower = text.lower()

    hits = [term for term in FORBIDDEN_TERMS if term in lower]

    if hits:
        raise ValueError(
            "TTS PROVIDER GATE REJECT: production metadata detected: "
            + ", ".join(hits)
        )

    if re.search(r"(?m)^\s*#{1,6}\s+", text):
        raise ValueError(
            "TTS PROVIDER GATE REJECT: Markdown heading detected."
        )

    if re.search(r"(?m)^\s*\|.*\|\s*$", text):
        raise ValueError(
            "TTS PROVIDER GATE REJECT: Markdown table detected."
        )

    if expected_opening and not text.startswith(expected_opening):
        raise ValueError(
            f"TTS PROVIDER GATE REJECT: opening mismatch. Expected {expected_opening!r}"
        )

    if expected_closing and not text.rstrip().endswith(expected_closing):
        raise ValueError(
            f"TTS PROVIDER GATE REJECT: closing mismatch. Expected {expected_closing!r}"
        )

    return {
        "path": str(path),
        "characters": len(text),
        "words": len(text.split()),
        "sha256": sha256_text(text),
        "metadata_gate": "PASS",
        "provider_safe": True,
    }

def main():
    parser = argparse.ArgumentParser(
        description="Validate a narration-only payload before any paid TTS request."
    )
    parser.add_argument("payload")
    parser.add_argument("--opening")
    parser.add_argument("--closing")
    args = parser.parse_args()

    try:
        result = validate_payload(
            Path(args.payload),
            expected_opening=args.opening,
            expected_closing=args.closing,
        )
    except ValueError as e:
        print(str(e))
        sys.exit(1)

    print(json.dumps(result, indent=2))
    print("TTS PROVIDER GATE: PASS")
    print("No API call was made.")

if __name__ == "__main__":
    main()
