import React from "react";
import {
  AbsoluteFill,
  Img,
  staticFile,
  useCurrentFrame,
  useVideoConfig,
  interpolate,
} from "remotion";
import { colors, fonts, fontSizes, fontWeights } from "../theme";

interface CIATriadProps {
  highlightPillar?: "confidentiality" | "integrity" | "availability" | "all";
}

const pillars = [
  {
    key: "confidentiality",
    label: "Confidentiality",
    description: "Keep private things private",
  },
  {
    key: "integrity",
    label: "Integrity",
    description: "Keep the info accurate",
  },
  {
    key: "availability",
    label: "Availability",
    description: "Get to your stuff when needed",
  },
] as const;

/**
 * CIA Triad - The three pillars of cybersecurity
 * Used in Video 01 for the foundation explanation
 *
 * Animations:
 * - Title fades in and slides down
 * - Triad image scales up from center
 * - Each pillar fades in sequentially with slide up
 */
export const CIATriad: React.FC<CIATriadProps> = ({
  highlightPillar = "all",
}) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // Title animation - fade in and slide down (0-0.6s)
  const titleOpacity = interpolate(frame, [0, fps * 0.6], [0, 1], {
    extrapolateRight: "clamp",
  });
  const titleY = interpolate(frame, [0, fps * 0.6], [-30, 0], {
    extrapolateRight: "clamp",
  });

  // Triad image - scale up from center (0.3s - 1s)
  const imageStartFrame = fps * 0.3;
  const imageOpacity = interpolate(
    frame,
    [imageStartFrame, imageStartFrame + fps * 0.7],
    [0, 1],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );
  const imageScale = interpolate(
    frame,
    [imageStartFrame, imageStartFrame + fps * 0.7],
    [0.8, 1],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );

  // Subtle rotation animation for the triad (continuous)
  const imageRotation = interpolate(
    frame % (fps * 20), // 20 second full rotation
    [0, fps * 20],
    [0, 360],
    { extrapolateRight: "clamp" }
  );

  return (
    <AbsoluteFill
      style={{
        backgroundColor: colors.warmCharcoal,
        padding: 80,
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
        gap: 60,
      }}
    >
      {/* Title */}
      <h1
        style={{
          fontFamily: fonts.primary,
          fontSize: fontSizes.title,
          fontWeight: fontWeights.semiBold,
          color: colors.softCream,
          margin: 0,
          opacity: titleOpacity,
          transform: `translateY(${titleY}px)`,
        }}
      >
        The Three Pillars
      </h1>

      {/* CIA Triad visual */}
      <Img
        src={staticFile("assets/cia_triad_animation_optimized.png")}
        style={{
          width: 400,
          height: 400,
          objectFit: "contain",
          opacity: imageOpacity,
          transform: `scale(${imageScale}) rotate(${imageRotation * 0.05}deg)`, // very subtle rotation
        }}
      />

      {/* Pillars list */}
      <div
        style={{
          display: "flex",
          gap: 60,
          justifyContent: "center",
        }}
      >
        {pillars.map((pillar, index) => {
          const isHighlighted =
            highlightPillar === "all" || highlightPillar === pillar.key;

          // Each pillar animates in sequence (starting at 1s, 0.5s apart)
          const pillarStartFrame = fps * 1 + index * fps * 0.5;
          const pillarOpacity = interpolate(
            frame,
            [pillarStartFrame, pillarStartFrame + fps * 0.5],
            [0, isHighlighted ? 1 : 0.4],
            { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
          );
          const pillarY = interpolate(
            frame,
            [pillarStartFrame, pillarStartFrame + fps * 0.5],
            [20, 0],
            { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
          );

          // Highlight glow pulse when pillar is featured
          const glowIntensity =
            isHighlighted && highlightPillar !== "all"
              ? interpolate(
                  frame % (fps * 2),
                  [0, fps, fps * 2],
                  [0, 10, 0],
                  { extrapolateRight: "clamp" }
                )
              : 0;

          return (
            <div
              key={pillar.key}
              style={{
                opacity: pillarOpacity,
                textAlign: "center",
                maxWidth: 300,
                transform: `translateY(${pillarY}px)`,
              }}
            >
              <h2
                style={{
                  fontFamily: fonts.primary,
                  fontSize: fontSizes.large,
                  fontWeight: fontWeights.semiBold,
                  color: isHighlighted ? colors.mutedGold : colors.softCream,
                  margin: 0,
                  marginBottom: 12,
                  textShadow:
                    glowIntensity > 0
                      ? `0 0 ${glowIntensity}px ${colors.mutedGold}`
                      : "none",
                }}
              >
                {pillar.label}
              </h2>
              <p
                style={{
                  fontFamily: fonts.primary,
                  fontSize: fontSizes.body,
                  fontWeight: fontWeights.regular,
                  color: colors.softCream,
                  margin: 0,
                }}
              >
                {pillar.description}
              </p>
            </div>
          );
        })}
      </div>
    </AbsoluteFill>
  );
};
