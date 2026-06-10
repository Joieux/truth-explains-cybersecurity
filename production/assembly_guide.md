# Assembly Guide
## The repeatable episode workflow — DaVinci Resolve

---

## BEFORE YOU START

| Asset | Where to get it |
|-------|----------------|
| Narration MP3 | Generate in ElevenLabs → save to audio/epXX_narration.mp3 |
| Story scene images | Generate in ChatGPT using prompts/epXX/ → save to clips/epXX/ as JPG |
| Library clips | clips/library/ — at-lib-01 through 09. CANON: these match the Aurora Reid design (see branding/character_bank.md). Generate once, reuse always — use them as connective inserts from EP02 onward. Her near-black jacket and warm amber grade make them color-neutral, so they work in any color-tagged episode (see branding/infosec_color_wheel.md). EP01 did not use them (its scene art predates the design). |

---

## STEP 1 — GENERATE NARRATION IN ELEVENLABS

1. Open the episode script from scripts/
2. Copy the full script text
3. Go to ElevenLabs → use the locked voice settings in voice/elevenlabs_settings.md
4. Generate and download the MP3
5. Save as: audio/epXX_narration.mp3
6. Note the total duration in seconds — you will need this when cutting

---

## STEP 2 — GENERATE STORY SCENE IMAGES IN CHATGPT

1. Open the episode prompts from prompts/epXX/
2. Start a new ChatGPT conversation and upload the character reference image from branding/character_reference/auntie_truth_ref.png
3. Send the session setup prompt first — ask ChatGPT to lock the character before generating anything
4. Paste one scene prompt at a time — one image per scene, no duplicates
5. Save each image to clips/epXX/ using the file names in the prompts file (JPG or PNG)

---

## STEP 3 — SET UP DAVINCI PROJECT

1. Open DaVinci Resolve → New Project → name it truth-explains-epXX
2. Project Settings (gear icon, bottom right):
   - Timeline resolution: 1920 × 1080
   - Timeline frame rate: 30
3. Create Media Pool bins: narration / scenes / library-clips

---

## STEP 4 — IMPORT ASSETS

Drag into matching bins:
- audio/epXX_narration.mp3 → narration bin
- clips/epXX/*.mp4 → scenes bin
- clips/library/at-lib-0X.mp4 (as needed) → library-clips bin

---

## STEP 5 — BUILD THE TIMELINE

**Track layout:**

| Track | Contents |
|-------|----------|
| V2 | Intro card (1.5 sec), Outro card (4 sec) |
| V1 | All clips in sequence |
| A1 | Narration MP3 |

**Assembly order:**

```
[INTRO CARD — 1.5 sec]
[Story scenes in sequence — see prompts/epXX/ for order]
[OUTRO CARD — 4 sec]
```

**EP01 note:** Library clips (at-lib-*.mp4) are not used in EP01 due to style mismatch.
Scene images are animated with Ken Burns camera moves in DaVinci (slow zoom or pan per image).

---

## STEP 6 — CUT TO THE NARRATION

This is the most important step. Do not rush it.

1. Place the narration MP3 on A1 starting after the intro card
2. Play through once and mark where each scene should start
3. Drag clips to match
4. Use J-cuts: the next clip's video starts 0.5–1 sec before the audio cue
   - Right-click a cut point → Roll to adjust video and audio independently
   - Never cut picture and audio at the exact same frame — it looks hard

**The rule:** if Auntie Truth is mid-sentence and a new scene is coming,
let the sentence finish on the current clip, then cut the video early.
The audio leads. The picture follows.

---

## STEP 7 — INTRO AND OUTRO CARDS

Create in DaVinci Fusion (Effects → Fusion Composition):

**Intro (1.5 sec):**
- Background: warm charcoal (#2C2420)
- Line 1: Truth Explains — large, clean sans-serif
- Line 2: Cybersecurity explained by Truth, with patience. — smaller
- Fade in 0.5 sec → hold → fade out 0.5 sec

**Outro (4 sec):**
- Same background and text
- Add: Subscribe · New episodes every week
- Same fade treatment

Tip: render these once as MP4s and reuse them every episode.

---

## STEP 8 — COLOR AND AUDIO

**Color (Colour page):**
- Warm grade on Auntie Truth's apartment scenes: lift shadows toward amber slightly
- Scammer scene: slightly cooler — the contrast is intentional
- Library clips: match the warm apartment temperature

**Audio (Fairlight page):**
- Narration: -12 dB starting point
- Background music (if used): -24 dB under narration, -18 dB on outro
- Limiter on master bus: ceiling -1 dB

---

## STEP 9 — EXPORT

Deliver page settings:
- Format: MP4
- Codec: H.264
- Resolution: 1920 × 1080
- Quality: 20,000 kb/s
- Audio: AAC 320 kb/s

Save to: renders/epXX_truth_explains_final.mp4

---

## STEP 10 — UPLOAD TO YOUTUBE

Standard upload order:
1. Upload the render
2. Title, description, tags (write these when you write the script)
3. Thumbnail
4. Add to playlist: Truth Explains — Foundations
5. End screen: subscribe + next episode card
6. Schedule or publish
