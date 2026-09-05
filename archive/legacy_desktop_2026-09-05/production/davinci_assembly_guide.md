# DaVinci Resolve Assembly Guide
## From clips and narration to finished EP01 — the repeatable framework

This replaces the Remotion-based assembly workflow.
DaVinci handles the edit. ElevenLabs handles the voice. Runway/Veo handles the visuals.

---

## THE SHIFT — FROM CUTS TO A STORY

The old approach generated 26 short, disconnected clips — one per concept.
It felt like a slide deck. Each clip was a new person, a new place, a new world.

The new approach generates fewer, longer scenes with recurring characters
and connected environments. The narration runs uninterrupted underneath.
The video tells one story, not twenty-six.

**The rule going forward:**
Same woman. Same apartment. Same street. Same visual world — across the whole episode.
The viewer should feel like they are watching one person's evening, not a stock footage reel.

---

## WHAT YOU NEED BEFORE YOU START

| Asset | Status | Where |
|-------|--------|-------|
| ElevenLabs narration | ✅ Done | remotion/public/audio/ep01_narration.mp3 |
| DaVinci Resolve installed | ⬜ Download free | blackmagicdesign.com/products/davinciresolve |
| Story scenes generated | ⬜ Generate | → Step 1 below |
| Auntie Truth library clips | ✅ Done | remotion/public/clips/library/ |

---

## THE NEW SCENE STRUCTURE FOR EP01

Instead of 26 clips, EP01 now has 7 scenes plus Auntie Truth.
Every scene follows one woman — Maya — through a single evening at home.

Maya is a Black woman in her late 30s, natural hair pulled back,
wearing a soft hoodie and joggers. Her apartment is warm — wood floors,
a couch with throw pillows, plants by the window, a laptop on the coffee table.

This is her world. Every scene lives in it.

| Scene | Narration cue | Duration | What we see |
|-------|--------------|----------|-------------|
| S1 | "You lock your door every night..." | ~20 sec | Maya at her front door at night, checking the peephole, turning the deadbolt |
| S2 | "Your phone, your laptop, your email..." | ~25 sec | Maya on her couch, laptop open, phone nearby — her whole life on one surface |
| S3 | "Just a regular person. Might be in sweats..." | ~20 sec | The scammer's apartment — messy, unglamorous, chips bag, same email template |
| S4 | "Usually the person who's tired..." | ~25 sec | Maya again — eyes heavy, scrolling late, a suspicious email appears on screen |
| S5 | "Confidentiality, Integrity, Availability..." | ~30 sec | Simple animated icons over Maya's apartment — warm, not clinical |
| S6 | "If something feels urgent — stop." | ~20 sec | Maya's thumb hovers over a link. She sets the phone face-down. Exhales. |
| S7 | "You've already got what it takes..." | ~15 sec | Maya closes the laptop, leans back, relaxed. The apartment glows warm. |

---

## STEP 1 — GENERATE THE 7 STORY SCENES

**Where:** Runway Gen-4 or Google Flow Veo 3.1
**Settings:** Fast mode, 1080p, 8–10 seconds per generation
**Key rule:** Use the same character description in every prompt — this is what creates continuity.

---

### CHARACTER ANCHOR — paste this into every single prompt

```
Maya: Black woman, late 30s, natural hair pulled back loosely,
wearing a soft sage green hoodie and dark joggers.
Her apartment: warm wood floors, a cream couch with terracotta throw pillows,
fiddle-leaf fig plant by the window, warm lamp light, a lived-in but cozy space.
Evening. Quiet. No drama.
```

---

### SCENE 1 — The Door

**File name:** `ep01-s1-door.mp4`
**Target duration:** 20–25 seconds (generate 2–3 clips of 8–10 sec, chain in DaVinci)
**Narration it covers:** *"You lock your door every night, and you check who's there before you open it. You would never hand your house keys to somebody you just met on the street."*

```
Maya — Black woman, late 30s, natural hair pulled back loosely, sage green hoodie,
dark joggers — walks slowly to her apartment front door at night.
She leans forward and looks through the peephole. POV cut: the hallway outside,
quiet and empty. She pulls back, nods to herself. Her hand reaches for the deadbolt
and locks it with one deliberate turn. She exhales softly and turns back toward
the warm light of her apartment. Calm. Habitual. Safe.

Cel-shaded animation, bold black outlines, flat warm colors, Boondocks-inspired,
anime-influenced western cartoon style, fluid motion, warm interior lighting.
```

---

### SCENE 2 — The Surface

**File name:** `ep01-s2-surface.mp4`
**Target duration:** 20–25 seconds
**Narration it covers:** *"Your phone, your laptop, your email, your bank, your photos, your whole identity — all of that is a door now. Everything you've worked for, sitting on a device you sometimes use half-asleep on the couch."*

```
Maya is curled on her cream couch, legs tucked under her.
Her laptop is open on the coffee table. Her phone sits beside it, screen lit
with notification badges — email, bank app, photos app, a text thread.
She glances at the phone absently, not alarmed. Just a regular evening.
The camera slowly pulls back to show everything on the table — her whole
digital life, in arm's reach, unguarded.

Cel-shaded animation, bold black outlines, flat warm colors, Boondocks-inspired,
anime-influenced western cartoon style, fluid motion, warm lamp light.
```

---

### SCENE 3 — The Scammer

**File name:** `ep01-s3-scammer.mp4`
**Target duration:** 20 seconds
**Narration it covers:** *"Just a regular person. Might be in sweats right now. Eating some chips. Same template. Different name. Hit send. Move on. All day long."*

```
A different apartment entirely — smaller, messier, less warm.
A forgettable man in a plain grey t-shirt and sweatpants sits at a folding desk.
He eats chips from a bag with one hand and types with the other, barely looking
at his screen. Multiple email draft windows are open, all identical except for
the names. He clicks send. Moves to the next tab. Clicks send again.
No urgency. No drama. Just boring, repetitive, effortless harm.
A bored orange cat sleeps on laundry in the corner.

Cel-shaded animation, bold black outlines, flat warm colors, Boondocks-inspired,
anime-influenced western cartoon style, fluid motion, cooler dimmer lighting
to contrast with Maya's warm apartment.
```

---

### SCENE 4 — The Almost

**File name:** `ep01-s4-almost.mp4`
**Target duration:** 25–30 seconds
**Narration it covers:** *"Usually the person who's tired. The one who's rushing. The one who's got forty tabs open. We've all been there. And that is exactly what they're counting on."*

```
Maya is back on her couch, later now. The lamp is still on but her eyes
are heavier. Her laptop has many tabs open — visible at the top of the screen.
Her phone lights up with a message: urgent text, red warning icon,
"Your account will be suspended." Her thumb moves toward the link.
She pauses. Squints. Something feels off. Her thumb hovers.
She sets the phone face-down on the cushion beside her.
She rubs her eyes. The moment passes.

Cel-shaded animation, bold black outlines, flat warm colors, Boondocks-inspired,
anime-influenced western cartoon style, fluid motion. Slightly dimmer lamp light
to signal tiredness, but still her warm apartment.
```

---

### SCENE 5 — The Three Things

**File name:** `ep01-s5-triad.mp4`
**Target duration:** 25–30 seconds
**Narration it covers:** *"Every cybersecurity threat on this earth comes down to three things. Confidentiality. Integrity. Availability."*

```
Maya's apartment, but simplified to near-abstract. Her phone, laptop and a
document float gently in front of her living room backdrop.
Three icons appear one at a time above them, warm gold outlines:
First — a padlock snapping shut (Confidentiality).
Second — a checkmark over a document (Integrity).
Third — a hand reaching through to touch a file (Availability).
Each icon pulses once as it appears. Simple, grounded, not clinical.
The apartment background keeps it warm.

Cel-shaded animation, bold black outlines, flat warm colors, Boondocks-inspired,
anime-influenced western cartoon style, smooth icon motion, warm lamp light.
```

---

### SCENE 6 — The Pause

**File name:** `ep01-s6-pause.mp4`
**Target duration:** 20 seconds
**Narration it covers:** *"If something feels urgent — stop. If someone is rushing you — stop. That urgency you feel was engineered. The pause is the power."*

```
Close on Maya's hand holding her phone. The screen shows the same urgent
red message from before — "CLICK NOW or your account will be closed!!!"
Her thumb moves toward the link. It stops. One full beat of stillness.
Then she slowly lowers the phone face-down onto the coffee table.
The screen goes dark. She exhales — barely visible, just her shoulders
dropping slightly. The lamp glows warm. Her apartment is quiet.
She picked right.

Cel-shaded animation, bold black outlines, flat warm colors, Boondocks-inspired,
anime-influenced western cartoon style, fluid motion, warm and still.
```

---

### SCENE 7 — The Close

**File name:** `ep01-s7-close.mp4`
**Target duration:** 15 seconds
**Narration it covers:** *"You don't have to become a hacker to protect yourself. You just need habits that make you harder to fool. And you've already got what it takes."*

```
Maya closes her laptop with a quiet click. She leans back into the couch cushions,
arms relaxed, eyes soft. She glances toward the window — the plant, the lamp,
the warmth of her apartment. A small, private smile.
The camera pulls back slowly. Her world is ordinary. And it is protected.
Slow fade to warm dark.

Cel-shaded animation, bold black outlines, flat warm colors, Boondocks-inspired,
anime-influenced western cartoon style, slow gentle motion, very warm lamp light.
```

---

## STEP 2 — GENERATE AUNTIE TRUTH REACTION CLIPS (optional per episode)

Library clips are already in: `remotion/public/clips/library/`

Use these as brief cut-aways when Auntie Truth is making a key point.
They do not need to be long — 3 to 5 seconds is enough before cutting back to Maya's world.

Recommended cuts for EP01:
- AT-LIB-05 (head shake) → into Scene 3 (the scammer reveal)
- AT-LIB-08 (stop gesture) → into Scene 6 (the pause moment)
- AT-LIB-09 (warm close) → at the very end after Scene 7

---

## STEP 3 — SET UP DAVINCI RESOLVE PROJECT

1. Open DaVinci Resolve → New Project → name it `truth-explains-ep01`
2. Go to **Project Settings** (gear icon, bottom right):
   - Timeline resolution: **1920 × 1080**
   - Timeline frame rate: **30**
   - Playback frame rate: **30**
3. In the **Media Pool**, create bins:
   - `narration`
   - `scenes`
   - `library-clips`
   - `intro-outro`

---

## STEP 4 — IMPORT ASSETS

Drag these into the matching bins:

**narration bin:**
`remotion/public/audio/ep01_narration.mp3`

**scenes bin:**
```
ep01-s1-door.mp4
ep01-s2-surface.mp4
ep01-s3-scammer.mp4
ep01-s4-almost.mp4
ep01-s5-triad.mp4
ep01-s6-pause.mp4
ep01-s7-close.mp4
```

**library-clips bin:**
```
remotion/public/clips/library/at-lib-05.mp4
remotion/public/clips/library/at-lib-08.mp4
remotion/public/clips/library/at-lib-09.mp4
```

---

## STEP 5 — BUILD THE TIMELINE

Switch to the **Edit** page (second icon along the bottom).

**Layer order (top to bottom in the timeline):**

| Track | Contents |
|-------|----------|
| V2 | Intro card, Outro card (text, created in Fusion) |
| V1 | All video clips in sequence |
| A1 | ep01_narration.mp3 |

**Assembly order:**

```
[INTRO CARD — 1.5 sec]
[AT-LIB-01 — opening greeting — ~5 sec]
[S1 — door — ~20 sec]
[S2 — surface — ~22 sec]
[AT-LIB-05 — head shake — 4 sec] ← cut-away before scammer reveal
[S3 — scammer — ~18 sec]
[S4 — almost — ~25 sec]
[AT-LIB-04 — counting fingers — 4 sec] ← "three things" cue
[S5 — three things — ~25 sec]
[AT-LIB-08 — stop gesture — 4 sec] ← pause cue
[S6 — pause — ~18 sec]
[S7 — close — ~14 sec]
[AT-LIB-09 — warm close — 5 sec]
[OUTRO CARD — 4 sec]
```

---

## STEP 6 — CUT TO THE NARRATION (the most important step)

This is where the story gets locked to the voice.

1. Play the narration from the beginning
2. Watch and listen — when a new scene should start, press **I** to mark in
3. Do not rush this. One pass through the full audio is enough to set all cuts
4. Drag clips to match the marks
5. Use **J-cuts** wherever possible:
   - The next scene's video starts slightly before the previous audio line ends
   - This eliminates hard cuts and makes the edit feel like one continuous story
   - In DaVinci: right-click a cut point → "Add Transition" or manually drag the video edge left

**J-cut rule of thumb:** If Auntie Truth is still mid-sentence and a new scene
is about to start, let her finish the sentence visually on the previous clip,
then cut the video 0.5–1 second before the next narration beat begins.
Never cut picture and audio at the exact same frame.

---

## STEP 7 — CREATE INTRO AND OUTRO CARDS

In DaVinci, go to the **Fusion** page to create text cards.

**Intro card (1.5 sec):**
- Background: deep warm charcoal (#2C2420 or match color_palette.md)
- Text line 1: `Truth Explains` — large, confident
- Text line 2: `Cybersecurity explained by Truth, with patience.` — smaller, calm
- Animation: fade in over 0.5 sec, hold, fade out 0.5 sec

**Outro card (4 sec):**
- Same background and text
- Add below: `Subscribe · New episodes every week`
- Same fade in / hold / fade out

Or: export these once from Remotion as standalone MP4s and import like any other clip.
That is faster and keeps Fusion simple.

---

## STEP 8 — COLOR AND AUDIO POLISH

**Color (Colour page):**
- Add a subtle warm grade across all Maya scenes: lift shadows toward amber
- Keep the scammer scene (S3) slightly cooler — this contrast matters
- Match the library clips to the scene color temperature

**Audio (Fairlight page):**
- Set narration track level to -12 dB (starting point)
- If you add background music later: music at -24 dB under narration, -18 dB on outro
- Add a gentle Limiter on the master bus — ceiling at -1 dB

---

## STEP 9 — EXPORT

Go to the **Deliver** page.

Settings:
- Format: MP4
- Codec: H.264
- Resolution: 1920 × 1080
- Quality: Restrict to 20,000 kb/s (YouTube uploads handle this well)
- Audio: AAC 320 kb/s

Click **Add to Render Queue → Start Render**

Output lands wherever you set your export path. Recommended:
`renders/ep01_truth_explains_final.mp4`

---

## STEP 10 — UPLOAD TO YOUTUBE

Metadata: `production/ep01_youtube_metadata.md`

Upload order:
1. Upload the render
2. Paste title, description, tags from metadata file
3. Upload thumbnail
4. Add to playlist: Truth Explains — Foundations
5. Set end screen: subscribe button + EP02 card
6. Schedule or publish

---

## WHAT CHANGES EACH EPISODE

| One-time setup | Repeats each episode |
|---------------|---------------------|
| DaVinci project template | New story scenes (6–8 per episode) |
| Intro / outro cards | Updated narration MP3 |
| Library clips | Cut to narration in timeline |
| Maya character anchor | Export and upload |

**Per-episode generation cost:**
6–8 scenes × ~3 clips per scene × 20 credits = ~480–640 credits
This is higher than the old b-roll approach but the result is a cohesive story,
not a disconnected slide deck. Quality over quantity.

---

## SCENE GENERATION TIPS FOR FUTURE EPISODES

**Always use the Maya character anchor** — paste it at the top of every prompt.
Continuity of character is what makes it feel like a story.

**Generate 2–3 versions of each scene** and pick the best one.
Do not use the first output if the character drifted.

**Chain clips for longer scenes** — generate 8–10 sec clips and cut them together
in DaVinci to build a 20–25 sec scene. A slow zoom followed by a closer angle
feels more cinematic than one static shot.

**Scene 3 (The Scammer) is the only scene without Maya.**
Keep that character consistent across all episodes too — same forgettable man,
same messy apartment. Recurring villain = recurring recognition.
