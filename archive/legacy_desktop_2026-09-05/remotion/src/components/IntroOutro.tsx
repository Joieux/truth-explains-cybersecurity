import React from "react";
import {
  AbsoluteFill,
  useCurrentFrame,
  useVideoConfig,
  interpolate,
  Sequence,
} from "remotion";
import { colors, fonts, fontSizes, fontWeights } from "../theme";

interface IntroOutroProps {
  type: "intro" | "outro";
}

/**
 * Intro/Outro - Channel branding
 * Based on intro_outro_spec.md
 * Intro: 1-2 seconds, fade in/out
 * Outro: 3-5 seconds, fade in/out
 *
 * Animations:
 * - Container fades in
 * - Channel name fades in with slight scale
 * - Tagline fades in after, slides up
 */
export const IntroOutro: React.FC<IntroOutroProps> = ({ type }) => {
  const frame = useCurrentFrame();
  const { fps, durationInFrames } = useVideoConfig();

  // Container fade in (0 - 0.4s)
  const containerOpacity = interpolate(frame, [0, fps * 0.4], [0, 1], {
    extrapolateRight: "clamp",
  });

  // Fade out at the end (last 0.3s)
  const fadeOutStart = durationInFrames - fps * 0.3;
  const fadeOutOpacity = interpolate(
    frame,
    [fadeOutStart, durationInFrames],
    [1, 0],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );

  const finalOpacity = Math.min(containerOpacity, fadeOutOpacity);

  // Channel name animation (0.2s - 0.6s)
  const nameStartFrame = fps * 0.2;
  const nameOpacity = interpolate(
    frame,
    [nameStartFrame, nameStartFrame + fps * 0.4],
    [0, 1],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );
  const nameScale = interpolate(
    frame,
    [nameStartFrame, nameStartFrame + fps * 0.4],
    [0.95, 1],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );

  // Tagline animation (0.5s - 0.9s)
  const taglineStartFrame = fps * 0.5;
  const taglineOpacity = interpolate(
    frame,
    [taglineStartFrame, taglineStartFrame + fps * 0.4],
    [0, 1],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );
  const taglineY = interpolate(
    frame,
    [taglineStartFrame, taglineStartFrame + fps * 0.4],
    [10, 0],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );

  return (
    <AbsoluteFill
      style={{
        backgroundColor: colors.deepBrown,
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        gap: 24,
        opacity: finalOpacity,
      }}
    >
      {/* Channel name */}
      <h1
        style={{
          fontFamily: fonts.primary,
          fontSize: fontSizes.hero,
          fontWeight: fontWeights.semiBold,
          color: colors.softCream,
          margin: 0,
          opacity: nameOpacity,
          transform: `scale(${nameScale})`,
        }}
      >
        Truth Explains
      </h1>

      {/* Tagline */}
      <p
        style={{
          fontFamily: fonts.primary,
          fontSize: fontSizes.large,
          fontWeight: fontWeights.regular,
          color: colors.mutedGold,
          margin: 0,
          opacity: taglineOpacity,
          transform: `translateY(${taglineY}px)`,
        }}
      >
        Cybersecurity explained by Truth, with patience.
      </p>
    </AbsoluteFill>
  );
};
