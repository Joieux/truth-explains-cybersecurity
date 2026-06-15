# Truth Explains

Cybersecurity explained by Truth, with patience.

## What this channel is

Truth Explains is a faceless educational YouTube channel built around
a single animated character — Auntie Truth (Aurora Reid) — who explains
cybersecurity slowly, clearly, and without hype. The audience is beginners,
career switchers, and curious learners who want understanding before tools.

Episodes are organized by the **Cybersecurity Color Wheel** — see
`branding/infosec_color_wheel.md`. One character, one outfit; only her
jacket color changes per topic area.

## The production stack

| Tool | Purpose |
|------|---------|
| ElevenLabs | Narration (settings + delivery modes in voice/) |
| ChatGPT (image gen) | Scene stills from prompts/ + character reference |
| Animation pass | Selected stills animated to MP4 (clips/epXX_animated/) |
| DaVinci Resolve | Assembly, Ken Burns on stills, color, audio, export |

## Folder structure

```
scripts/            — Episode scripts (epXX_*.md; _v2 = energy-pass rewrites)
prompts/            — Scene image prompts, one folder per episode
clips/              — Generated stills (epXX/) and animated MP4s (epXX_animated/)
  library/          — 9 canon Auntie Truth clips — color-neutral, reuse always
audio/              — Narration exports + music/
renders/            — Final exports (YouTube, TikTok, Instagram, Shorts)
production/         — Assembly guide, naming rules, checklist
branding/           — Character bank, color wheel system, design system, jacket prompts
voice/              — ElevenLabs settings and delivery modes
Campaigns/          — Campaign assets by campaign
Instagram Carousel/ — Carousel slide sets
Luanch Tracker/     — truth_explains_launch_tracker.xlsx
```

## Episode and post status

**The Launch Tracker spreadsheet is the single source of truth for status**
(`Luanch Tracker/truth_explains_launch_tracker.xlsx`). No post goes live
without its row. This README only summarizes:

- EP01 "What cybersecurity is, for real" — **published** (YouTube, Shorts,
  Instagram, Substack; TikTok uploaded private pending crop v2)
- EP02–EP10 — scripts written; EP02 and EP03 have v2 energy-pass rewrites
- Campaign 01 "The Pause Is the Power" — carousel + static live, TikTok queued

## The workflow (every episode)

1. Script (v2 voice standard — see EP02/EP03 v2) → color tag from the wheel
2. Narration in ElevenLabs → two delivery modes, see voice/elevenlabs_settings.md
3. Scene stills in ChatGPT from prompts/epXX/ → clips/epXX/
4. Animate key scenes → clips/epXX_animated/
5. DaVinci: narration on A1, stills with Ken Burns, J-cuts, intro/outro cards
6. Export per platform → renders/
7. Add tracker rows → publish → add live links to tracker
