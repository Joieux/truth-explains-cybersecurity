import React from "react";
import { AbsoluteFill, interpolate, useCurrentFrame } from "remotion";
import { durations } from "../theme";

interface FadeInProps {
  children: React.ReactNode;
  delay?: number;
  duration?: number;
}

/**
 * Fade in wrapper - matches Truth Explains motion rules
 * Smooth fade, no bouncing
 */
export const FadeIn: React.FC<FadeInProps> = ({
  children,
  delay = 0,
  duration = durations.fadeIn,
}) => {
  const frame = useCurrentFrame();

  const opacity = interpolate(frame, [delay, delay + duration], [0, 1], {
    extrapolateLeft: "clamp",
    extrapolateRight: "clamp",
  });

  return <AbsoluteFill style={{ opacity }}>{children}</AbsoluteFill>;
};
