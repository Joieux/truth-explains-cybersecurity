# ElevenLabs voice settings for Auntie Truth

Set these in the ElevenLabs app (or as voice_settings if calling the API):

stability 0.48 · similarity_boost 0.82 · style 0.30 · speaker_boost ON

## Two delivery modes

LOCKED (teaching, explanation — the default above)
stability 0.48 · style 0.30
Calm, consistent, warm. Use for the body of every episode.

EXPRESSIVE (hype moments, opens, closes, empowerment beats)
stability 0.35–0.40 · style 0.45
More performance, more variation between takes. Generate these sections
separately, 2–3 takes each, pick the best, join in DaVinci.

## What the model responds to

- Line breaks = pauses. Keep them. (Already the rule.)
- Questions get a natural lift. Open big sections with one.
- Dashes create beats. Ellipses create suspense pauses.
- A short line after long lines reads as energy. Use the snap.
- CAPS on a single word = emphasis. Use like hot sauce — 2–3 words per episode.

## What the model can NOT see

- *Italics/asterisks* in scripts are performance cues for the editor only.
  STRIP THEM before pasting into ElevenLabs, and convert the few words that
  matter most to CAPS.

## Exclamation points

Default: none. ElevenLabs reads "!" hot and inconsistent.
Exception: maximum ONE per episode, at a true peak, and only if a calm
take didn't land. Rhythm does the energy. The settings do the vibrance.

## Worth one test

If the account is on the v3 model, inline audio tags like [excited] or
[warm] may work with the cloned voice. Test once on a throwaway paragraph
before relying on them.
