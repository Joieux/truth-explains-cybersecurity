# Media paths for Truth Explains

This repository stores scripts, prompts, production rules, manifests, automation,
and other lightweight production intelligence. Binary production media lives in
a separate local library and must not be committed to Git.

## Current local media root

`/Users/truth/Documents/Codex/truth-explains-media`

Set this location for local tools:

```shell
export TRUTH_EXPLAINS_MEDIA_ROOT="/Users/truth/Documents/Codex/truth-explains-media"
```

The path can later be moved to an external disk or cloud-synced directory without
changing the repository layout. Update this file and the environment variable if
that happens.

## Library layout

- `audio/`: narration, raw audio, and processed audio
- `branding/`: character, channel, and brand-reference media
- `campaigns/`: campaign and social assets
- `clips/`: generated and edited clips
- `episodes/`: episode-specific stills, beats, animation, and voiceover
- `legacy-projects/`: preserved media from older production projects
- `music/`: licensed or generated music
- `renders/`: final and intermediate renders
- `shared-assets/`: reusable media not tied to one episode
- `voice/`: voice-reference media
- `_manifests/`: SHA-256 inventories and source-to-canonical-path mappings

## Verification and naming

`production/media_manifest.csv` records every canonical media file with its
SHA-256 checksum, byte size, selected source, and canonical library path.

Use episode-prefixed names for new assets, such as:

- `ep03_scene04_phishing_link_v1.png`
- `ep03_narration_v1.wav`
- `ep03_truth_explains_phishing_youtube_v1.mp4`

Do not commit audio, video, generated still collections, music, project archives,
or final renders. Commit their manifest entries instead.
