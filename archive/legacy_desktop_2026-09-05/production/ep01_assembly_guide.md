# EP01 Assembly Guide
## From zero to YouTube render — the repeatable framework

This is the master playbook for EP01. Every future episode follows the
same steps — just swap the manifest, clips, and metadata.

---

## WHAT YOU NEED BEFORE YOU START

| Asset | Status | Where |
|-------|--------|-------|
| EP01 production script | ✅ Done | scripts/video_01_production_script.md |
| EP01 Veo prompts v2 | ✅ Done | veo_prompts/video_01_veo_prompts_v2.md |
| Remotion project | ✅ Set up | remotion/ |
| ElevenLabs narration | ⬜ Generate | → Step 1 below |
| 9 Library clips | ⬜ Generate | → Step 2 below |
| 11 EP01 b-roll clips | ⬜ Generate | → Step 3 below |

---

## STEP 1 — GENERATE ELEVENLABS NARRATION

**Where:** ElevenLabs.io → Text to Speech

**What to paste:** The clean narration block at the bottom of:
`scripts/video_01_production_script.md`
(The block labeled "CLEAN ELEVENLABS NARRATION BLOCK — no annotations")

**Voice and settings (LOCKED — do not change per episode):**

| Setting | Value |
|---------|-------|
| Voice ID | zWoalRDt5TZrmW4ROIA7 |
| Model | eleven_multilingual_v2 |
| Stability | 0.38 |
| Similarity Boost | 0.86 |
| Style | 0.42 |
| Speaker Boost | On |
| Speed | Do not set — script pacing controls rhythm |

Full settings reference: `voice:elevenlabs-settings.md`

**What to save:**
1. Download the MP3
2. Note the total duration in seconds (check in your audio player)
3. Drop the file here: `remotion/public/audio/ep01_narration.mp3`

**Then:** Open `remotion/src/ep01/manifest.ts` and update:
```typescript
export const TOTAL_AUDIO_DURATION_SEC = [YOUR DURATION HERE];
```

---

## STEP 2 — GENERATE LIBRARY CLIPS IN VEO (one-time session)

**Where:** Google Flow → Veo 3.1

**Before you start:**
- Upload `branding/assets/aunt_truth_definitive.png` as character reference
- This locks Auntie's look across all 9 clips

**Settings:**
- Mode: Fast (NOT Quality — saves 80 credits per clip)
- Outputs per prompt: 1

**What to generate:** AT-LIB-01 through AT-LIB-09
Full prompts are in: `veo_prompts/video_01_veo_prompts_v2.md` → Part 1

**Naming convention — save exactly as:**
```
at-lib-01.mp4   ← Warm opening greeting
at-lib-02.mp4   ← The Auntie Sip
at-lib-03.mp4   ← Leaning In
at-lib-04.mp4   ← Counting on fingers
at-lib-05.mp4   ← The head shake
at-lib-06.mp4   ← Confident gesture
at-lib-07.mp4   ← Pointing direct
at-lib-08.mp4   ← Stop / firm pause
at-lib-09.mp4   ← Warm close
```

**Where to drop them:** `remotion/public/clips/library/`

**Credit cost:** 9 clips × 20 credits = 180 credits. One-time.
These clips serve EVERY episode from now on. Never regenerate them.

---

## STEP 3 — GENERATE EP01 B-ROLL CLIPS IN VEO

**Where:** Google Flow → Veo 3.1

**Settings:**
- Mode: Fast
- Outputs per prompt: 1
- No character reference needed for b-roll (no Auntie in these)

**What to generate:** B-ROLL 01 through B-ROLL 11
Full prompts are in: `veo_prompts/video_01_veo_prompts_v2.md` → Part 2

**Naming convention — save exactly as:**
```
b-roll-01.mp4   ← Door / peephole check
b-roll-02.mp4   ← Man refuses keys to stranger
b-roll-03.mp4   ← Digital life flatlay
b-roll-04.mp4   ← Unremarkable scammer in apartment
b-roll-05.mp4   ← Email template auto-sending
b-roll-06.mp4   ← Triptych — tired / rushed / distracted
b-roll-07a.mp4  ← Gold padlock snapping shut (Confidentiality)
b-roll-07b.mp4  ← Padlock with crack (Integrity)
b-roll-08.mp4   ← Gradebook tampered
b-roll-09.mp4   ← Laptop screen goes red (Availability)
b-roll-10.mp4   ← Four protection rings
b-roll-11.mp4   ← Hand hovers over suspicious link
```

**Where to drop them:** `remotion/public/clips/ep01/`

**Credit cost:** 11 clips × 20 credits = 220 credits.

---

## STEP 4 — SET CUT TIMES IN THE MANIFEST

**File:** `remotion/src/ep01/manifest.ts`

Listen to your ElevenLabs narration and note when each visual cut should happen.
Update the `CUT_TIMES_SEC` array — each value is seconds from the audio start.

```typescript
// Example of what filled-in times look like:
export const CUT_TIMES_SEC: number[] = [
  0,      // Clip 01 starts at 0:00 — "Hey family!"
  6.2,    // Clip 02 starts at 0:06 — door peephole
  13.8,   // Clip 03 starts at 0:14 — keys refused
  // ...
];
```

**Tip:** Use any audio player that shows seconds (VLC, QuickTime, Audacity).
Play the narration and write down the timestamp each time a new visual should start.

---

## STEP 5 — PREVIEW IN REMOTION STUDIO

```bash
cd "Desktop/Truth Explains/remotion"
npm start
```

In Remotion Studio, select **Video01v2** from the dropdown.

Watch the full preview. Check:
- [ ] Audio starts after the intro card
- [ ] Each clip cuts at the right moment in the narration
- [ ] No clip slot is too short (clips loop, so short is fine — long means a clip holds too long)
- [ ] Intro and outro look right

**To adjust:** Edit `CUT_TIMES_SEC` in manifest.ts. Save. Remotion hot-reloads.

---

## STEP 6 — RENDER THE FINAL VIDEO

```bash
cd "Desktop/Truth Explains/remotion"
npm run build
```

This runs: `remotion render Video01v2`

Output lands in: `remotion/out/Video01v2.mp4`

**Render settings (already configured):**
- Resolution: 1920 × 1080 (1080p)
- FPS: 30
- Format: JPEG frames → MP4

**Approximate render time:** 3-8 minutes depending on your machine.

---

## STEP 7 — UPLOAD TO YOUTUBE

**Metadata file:** `production/ep01_youtube_metadata.md`

Upload order in YouTube Studio:
1. Upload `remotion/out/Video01v2.mp4`
2. Paste title, description, tags from metadata file
3. Add chapters (update timestamps to match final render)
4. Upload thumbnail
5. Add to playlist: Truth Explains — Foundations
6. Set end screen: subscribe button + EP02 card
7. Schedule premiere OR publish immediately
8. After publish: paste pinned comment

---

## FUTURE EPISODES — WHAT CHANGES, WHAT DOESN'T

| What you do once | What repeats each episode |
|-----------------|--------------------------|
| Generate 9 library clips | Generate episode b-roll |
| Set up Remotion project | Update manifest.ts |
| Create `public/clips/library/` | Create `public/clips/epXX/` |
| | Generate ElevenLabs narration |
| | Set CUT_TIMES_SEC |
| | Update TOTAL_AUDIO_DURATION_SEC |
| | Write YouTube metadata |
| | Render and upload |

**Per-episode Remotion files to create:**
- `src/epXX/manifest.ts` — copy from ep01, update clip list + cut times
- `src/epXX/VideoXXv2.tsx` — copy from ep01, change imports and clip list
- Register in `src/Root.tsx`

---

## FOLDER STRUCTURE REFERENCE

```
remotion/
├── public/
│   ├── audio/
│   │   └── ep01_narration.mp3       ← ElevenLabs output
│   ├── clips/
│   │   ├── library/                 ← Generate ONCE
│   │   │   ├── at-lib-01.mp4
│   │   │   └── ... (9 clips)
│   │   └── ep01/                    ← EP01-specific b-roll
│   │       ├── b-roll-01.mp4
│   │       └── ... (11 clips)
│   └── assets/                      ← Branding images (already here)
│       ├── aunt_truth_definitive.png
│       └── auntie_desk_setup.png
└── src/
    ├── ep01/
    │   ├── manifest.ts              ← Edit cut times here
    │   ├── Video01v2.tsx            ← The composition
    │   └── index.ts
    ├── components/                  ← Reusable: IntroOutro, etc.
    ├── theme/                       ← Colors, fonts, config
    └── Root.tsx                     ← Register compositions here
```

---

## CREDIT TRACKER

| Session | What | Clips | Credits |
|---------|------|-------|---------|
| Library session (one-time) | 9 AT library clips | 9 | 180 |
| EP01 session | B-roll 01–11 | 11 | 220 |
| EP02 session | B-roll 01–08 | 8 | 160 |
| Each future episode | ~8-11 b-roll clips | ~10 | ~200 |

Library clips are done. Done is done. Don't regenerate them.
