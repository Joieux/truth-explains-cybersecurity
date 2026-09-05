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

interface FocusSceneProps {
  title: string;
  image?: string;
  children?: React.ReactNode;
}

/**
 * Focus Scene - Used for concept explanations
 * One idea per screen, large readable text, whitespace is your friend
 *
 * Animations:
 * - Title fades in and slides down
 * - Image fades in with subtle scale
 * - Children content fades in last
 */
export const FocusScene: React.FC<FocusSceneProps> = ({
  title,
  image,
  children,
}) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // Title animation (0 - 0.6s)
  const titleOpacity = interpolate(frame, [0, fps * 0.6], [0, 1], {
    extrapolateRight: "clamp",
  });
  const titleY = interpolate(frame, [0, fps * 0.6], [-20, 0], {
    extrapolateRight: "clamp",
  });

  // Image animation (0.4s - 1s)
  const imageStartFrame = fps * 0.4;
  const imageOpacity = interpolate(
    frame,
    [imageStartFrame, imageStartFrame + fps * 0.6],
    [0, 1],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );
  const imageScale = interpolate(
    frame,
    [imageStartFrame, imageStartFrame + fps * 0.6],
    [0.95, 1],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );

  // Children animation (0.8s - 1.4s)
  const childrenStartFrame = fps * 0.8;
  const childrenOpacity = interpolate(
    frame,
    [childrenStartFrame, childrenStartFrame + fps * 0.6],
    [0, 1],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );
  const childrenY = interpolate(
    frame,
    [childrenStartFrame, childrenStartFrame + fps * 0.6],
    [15, 0],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
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
        gap: 40,
      }}
    >
      {/* Title */}
      <h1
        style={{
          fontFamily: fonts.primary,
          fontSize: fontSizes.title,
          fontWeight: fontWeights.semiBold,
          color: colors.softCream,
          textAlign: "center",
          margin: 0,
          opacity: titleOpacity,
          transform: `translateY(${titleY}px)`,
        }}
      >
        {title}
      </h1>

      {/* Optional image */}
      {image && (
        <Img
          src={staticFile(image)}
          style={{
            maxWidth: "60%",
            maxHeight: "50%",
            objectFit: "contain",
            opacity: imageOpacity,
            transform: `scale(${imageScale})`,
          }}
        />
      )}

      {/* Optional additional content */}
      {children && (
        <div
          style={{
            opacity: childrenOpacity,
            transform: `translateY(${childrenY}px)`,
          }}
        >
          {children}
        </div>
      )}
    </AbsoluteFill>
  );
};
