import React from "react";
import {
  AbsoluteFill,
  Audio,
  Video,
  Series,
  Sequence,
  staticFile,
  useCurrentFrame,
  useVideoConfig,
  interpolate,
} from "remotion";
// Note: React import retained for JSX transform compatibility
import { IntroOutro } from "../components/IntroOutro";
import { colors } from "../theme/colors";
import { EP01_CLIPS, CUT_TIMES_SEC, TOTAL_AUDIO_DURATION_SEC } from "./manifest";

const FPS = 30;

// Intro: 1.5s · Outro: 4s (per intro_outro_spec.md)
const INTRO_FRAMES = Math.round(1.5 * FPS);
const OUTRO_FRAMES = Math.round(4 * FPS);

/**
 * Derive per-clip durations in frames from the CUT_TIMES_SEC array.
 * Each clip runs from its cut time until the next one.
 * The final clip runs until the audio ends.
 */
function getClipDurations(): number[] {
  return CUT_TIMES_SEC.map((startSec, i) => {
    const endSec =
      i < CUT_TIMES_SEC.length - 1
        ? CUT_TIMES_SEC[i + 1]
        : TOTAL_AUDIO_DURATION_SEC;
    return Math.max(1, Math.round((endSec - startSec) * FPS));
  });
}

/** Total duration in frames: intro + all clips + outro */
export function getVideo01v2Duration(): number {
  const clipFrames = getClipDurations().reduce((sum, d) => sum + d, 0);
  return INTRO_FRAMES + clipFrames + OUTRO_FRAMES;
}

// ─────────────────────────────────────────────────────────────────────────────
// Placeholder scene — shows when a clip file hasn't been generated yet.
// Replace with real Veo clips by dropping MP4s into the correct public/clips/ path.
// ─────────────────────────────────────────────────────────────────────────────

const ClipPlaceholder: React.FC<{ label: string }> = ({ label }) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  const opacity = interpolate(frame, [0, fps * 0.2], [0, 1], {
    extrapolateRight: "clamp",
  });

  return (
    <AbsoluteFill
      style={{
        backgroundColor: colors.warmCharcoal,
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        gap: 16,
        opacity,
      }}
    >
      {/* Clip ID badge */}
      <div
        style={{
          backgroundColor: colors.mutedGold,
          color: colors.deepBrown,
          fontFamily: "monospace",
          fontSize: 13,
          fontWeight: 700,
          padding: "4px 12px",
          borderRadius: 4,
          letterSpacing: "0.08em",
          textTransform: "uppercase",
        }}
      >
        PENDING · VEO CLIP
      </div>

      {/* Clip label */}
      <p
        style={{
          color: colors.softCream,
          fontFamily: "sans-serif",
          fontSize: 22,
          fontWeight: 500,
          margin: 0,
          textAlign: "center",
          maxWidth: 720,
          lineHeight: 1.5,
        }}
      >
        {label}
      </p>

      {/* File path hint */}
      <p
        style={{
          color: colors.mutedGold,
          fontFamily: "monospace",
          fontSize: 13,
          margin: 0,
          opacity: 0.7,
        }}
      >
        Drop clip into public/clips/
      </p>
    </AbsoluteFill>
  );
};

// ─────────────────────────────────────────────────────────────────────────────
// Single clip — plays a video file looped + muted, or shows placeholder.
// All audio comes from ElevenLabs narration track below.
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Per-type readiness flags.
 * Flip LIBRARY_READY = true once all at-lib-*.mp4 files are in public/clips/library/.
 * Flip BROLL_READY = true once all b-roll-*.mp4 files are in public/clips/ep01/.
 * This way you can preview library clips while b-roll is still being generated.
 */
const LIBRARY_READY = true;  // ← all 9 library clips generated and in place
const BROLL_READY = true;   // ← b-roll not yet generated — flip when ep01/ clips are dropped in

const ClipScene: React.FC<{ src: string; label: string; type: "library" | "broll" }> = ({ src, label, type }) => {
  const isReady = type === "library" ? LIBRARY_READY : BROLL_READY;

  if (!isReady) {
    return <ClipPlaceholder label={label} />;
  }

  return (
    <AbsoluteFill style={{ backgroundColor: colors.deepBrown }}>
      <Video
        src={staticFile(src)}
        muted
        loop
        style={{ width: "100%", height: "100%", objectFit: "cover" }}
      />
    </AbsoluteFill>
  );
};

// ─────────────────────────────────────────────────────────────────────────────
// Main composition
// ─────────────────────────────────────────────────────────────────────────────

export const Video01v2: React.FC = () => {
  const clipDurations = getClipDurations();

  return (
    <AbsoluteFill style={{ backgroundColor: colors.deepBrown }}>
      {/* ── ElevenLabs narration ── starts after the intro, runs under all 25 clips */}
      <Sequence from={INTRO_FRAMES}>
        <Audio src={staticFile("audio/ep01_narration.mp3")} />
      </Sequence>

      <Series>
        {/* ── Intro card ── no voiceover ── */}
        <Series.Sequence durationInFrames={INTRO_FRAMES} premountFor={FPS}>
          <IntroOutro type="intro" />
        </Series.Sequence>

        {/* ── 25 Veo clips, each sized to its narration window ── */}
        {EP01_CLIPS.map((clip, i) => (
          <Series.Sequence
            key={clip.id}
            durationInFrames={clipDurations[i]}
            premountFor={FPS}
          >
            <ClipScene src={clip.src} label={clip.label} type={clip.type} />
          </Series.Sequence>
        ))}

        {/* ── Outro card ── */}
        <Series.Sequence durationInFrames={OUTRO_FRAMES} premountFor={FPS}>
          <IntroOutro type="outro" />
        </Series.Sequence>
      </Series>
    </AbsoluteFill>
  );
};
