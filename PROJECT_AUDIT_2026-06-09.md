# Truth Explains — Project Audit
**Date:** June 9, 2026 · **Auditor:** Alfred

Audit of structure, pipeline status, and content across the full project folder. Issues are numbered and ordered by severity. Nothing here is fatal — EP01 shipped, which is the hard part. But the paperwork has fallen well behind the work.

---

## A. Status & documentation accuracy (the big one)

### Issue 1 — The README says EP01 isn't made. The tracker says it's published.
README's episode table shows EP01 clips as "⬜ Generate," edit and publish unchecked. Meanwhile the Launch Tracker records EP01 **published on YouTube** (https://youtu.be/ZVV8AzCSAOk), plus Shorts, Instagram, a Reel, and a Substack article — and `renders/` contains five finished exports including the 557 MB YouTube master. The README is now actively misleading as the project's front page.
**Fix:** Update the README table (EP01 → all ✅ except note TikTok still private), or better, delete the status table from README entirely and declare the Launch Tracker xlsx the single source of truth for status. Two status systems will always drift.

### Issue 2 — Three different production workflows are documented as current.
- README: clips generated in **Runway Gen-4** as MP4s
- `production/assembly_guide.md` Step 2: scene **images generated in ChatGPT** as JPGs, animated with Ken Burns in DaVinci
- `prompts/ep01/ep01_scene_prompts.md`: full Runway prompt set with Runway settings and a clip inventory marked "⬜ Generate" — even though `clips/ep01/` holds 50+ finished JPGs and `clips/ep01_animated/` holds 24 animated MP4s

What actually happened (judging by the files): ChatGPT stills + animation pass. The Runway prompt file and the README describe a workflow you've since abandoned or evolved.
**Fix:** Update README's stack table and the assembly guide to match the real EP01 pipeline. Either archive the Runway prompts file or mark it superseded at the top. The clip inventory table in it is 100% stale.

### Issue 3 — Two conflicting character designs are both documented as canon.
- `branding/character_bank.md`: black **square-frame** glasses, purple/black **windbreaker**, gold loc cuffs, USB pendant, neon **MAPPA-style** studio with server racks
- `prompts/ep01/`: gold **cat-eye** glasses, **indigo tech denim jacket**, warm home apartment, **Boondocks-inspired** cel-shading

The assembly guide itself admits library clips don't match "the new character design." So the character bank — the document whose entire job is visual consistency — describes the old design. Anyone (including future-you, or me) generating EP02 art from the character bank will produce the wrong Auntie Truth.
**Fix:** Rewrite `character_bank.md` to the design actually used in EP01, and move the old anchor to an "archived / v1" section. This is the highest-leverage fix before EP02 art begins.

### Issue 4 — Design system contradicts the actual brand.
`branding/design_system.md` says avoid "hacker imagery," "nothing flashy," "warm neutral backgrounds, human scale visuals like desks and notebooks." The actual channel is an anime character in a neon-accented studio. The doc reads like an earlier, plainer concept of the channel. Same drift as Issue 3, softer consequence — mostly affects thumbnails/carousels, which currently look fine.
**Fix:** One pass to reconcile design_system.md with what EP01 and the carousel actually look like.

---

## B. File hygiene

### Issue 5 — Duplicate and misnamed files in `clips/ep01_animated/` (verified by checksum)
Exact byte-for-byte duplicates:
- `ep0-s0-opening-animated.mp4` = `ep01-at01-hey-family-animated.mp4` (one is misnamed — these are different scenes by name)
- `ap01-s8c-update-animated.mp4` = `ep01-s8c-updates-animated.mp4`
- `ep01-s8b-2fa-animated.mp4` = `ep01-s8b-2fa-fixed-animated.mp4` ("fixed" version is identical — the fix may never have been saved)

Also in that folder: a raw Runway filename ~110 characters long ("Gen-4_5 - Auntie Truth sits still…"), a stray `.zip`, typo'd prefixes (`ap01`, `dp01`, `ep0`, `p01`), `…shields-animted.mp4`, and `…passwords-animated_1.mp4`. Your own `file_naming.md` says: lowercase, underscores, two-digit episodes, no exceptions — this folder breaks every rule it has.
**Fix:** Delete the three duplicates (~7 MB), unzip-or-delete the zip, rename the rest to the `ep01-sX-slug` pattern. Fifteen minutes of work; I'm happy to do it on your word.

### Issue 6 — `audio/` is a mix of episode audio, drafts, and unrenamed stock music
Three full copies of EP01 narration (`.mp3`, `.wav`, `.aiff` — ~90 MB for what the MP3 covers), four variants of the "hey family" line including the typo'd `ep01_at01_hey_family_audo.wav`, plus eight stock-music files still wearing their Pixabay-style names (`angelacreates-pink-fuzzy-cats-and-mushrooms-300624.mp3`). Nothing wrong per se, but you can't tell at a glance which music is licensed-and-chosen vs. just downloaded.
**Fix:** Make `audio/music/` for the stock tracks (renamed, e.g. `music_midnight_groove.mp3`), keep one master narration format per episode, archive or delete superseded takes.

### Issue 7 — Small naming items
- **"Luanch Tracker"** folder → "Launch Tracker" (it's also a typo in a folder name you'll type often)
- Renders don't match the documented pattern: `ep01-truth-explains-final_youtube.mp4` (hyphens) vs. the documented `epXX_truth_explains_final.mp4`; the tracker's Assets sheet lists a third name (`ep01_truth_explains_youtube.mp4`) that doesn't exist on disk
- `prompts/library/` is empty but README promises "9 Auntie Truth library clips" prompts there (the clips exist; the prompts were never saved)

---

## C. Content review (scripts EP01–EP10)

### Issue 8 — Three different voice templates across ten scripts
- EP01: opens "Hey, family." — closes "We've got this!" with next-episode tease
- EP02–05: opens "Hey there. I heard you had some questions…" — includes the "Awnt Truth style" catchphrase — closes "We're building understanding, not rushing perfection"
- EP06–10: opens "Welcome. I'm Auntie Truth…" — no catchphrase — closes "We're learning how to move smarter online"

Any one of these is fine. Three of them means the channel hasn't picked its ritual yet, and rituals are exactly what faceless channels build loyalty on. EP01 is also the only script with em-dash-heavy, performance-style writing; EP02–10 are sparse short lines.
**Fix:** Pick one open/close (EP01's "Hey, family" open + a tease-the-next-episode close is the strongest of the three) and normalize EP02–10 before recording them. Cheap now, expensive after narration is generated.
Note: "Awnt" may be a deliberate phonetic spelling for ElevenLabs — if so, document that in `voice/elevenlabs_settings.md` so it doesn't get "corrected" later.

### Issue 9 — EP02 and EP07 are substantially the same episode
EP02 "Passwords and Password Managers" and EP07 "Password Managers" overlap heavily — both explain reuse risk, both end with the identical rollout plan (email → bank → socials). Publishing both as-is will feel like a rerun.
**Fix options:** (A) Refocus EP07 as a hands-on setup walkthrough and retitle it ("Setting up your password manager, step by step"), keeping EP02 as the *why*. (B) Merge them and write a new EP07 topic (browser safety, account recovery, and "what to do after a breach" are gaps in the current ten). I'd lean A — less rework, and a how-to episode performs well.

### Issue 10 — Small script flags
- EP01 ends "We've got this!" — your own voice doc says avoid exclamation points (ElevenLabs reads them hot). EP02–10 correctly use "We've got this."
- EP01's narration text in the prompts file doesn't match the final script wording (e.g., "forty tabs open" appears in prompts but not in the script's final phrasing) — consistent with the script being revised after prompts were written. No action needed for EP01 (it shipped), just a reminder that prompts inherit script drift.
- Technical accuracy across all ten scripts: **sound.** Credential stuffing, SIM swap, authenticator-over-SMS, passkeys, backup separation, code-sharing scams — all correctly explained at the right level. EP10's pivot to "cybersecurity careers" is a different audience promise than EP01–09's personal-safety framing; worth knowing that's intentional.

---

## D. What's genuinely in good shape

The EP01 prompt file is excellent craft — character anchor repeated per prompt, edit order, J-cut guidance. The assembly guide is a real, repeatable SOP. Scripts are accurate and warm. The Launch Tracker is well-structured (statuses, assets sheet, dashboard formulas). The carousel set is named cleanly and consistently. The foundation is strong; the documentation just needs to catch up to the velocity.

---

## Recommended order of operations

1. Fix Issue 3 (character bank) — blocks EP02 art
2. Fix Issue 1 (README/tracker single source of truth) — blocks sane planning
3. Issue 8 + 9 (voice template + EP07) — before any EP02 narration is generated
4. Issues 5–7 (file cleanup) — anytime, 30 minutes total
5. Issues 2 + 4 (workflow + design docs) — when convenient
