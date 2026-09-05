import React from "react";
import {
  AbsoluteFill,
  Img,
  staticFile,
  useCurrentFrame,
  useVideoConfig,
  interpolate,
} from "remotion";
import { colors } from "../theme";

interface AuntiesDeskProps {
  showAuntie?: boolean;
  animateCoffeeSip?: boolean;
}

/**
 * Auntie's Desk - The main scene for opening/closing frames
 * Warm, grounded, human-scale visual
 *
 * Animations:
 * - Background fades in smoothly
 * - Auntie slides up gently from bottom
 * - Optional subtle "breathing" motion
 */
export const AuntiesDesk: React.FC<AuntiesDeskProps> = ({
  showAuntie = true,
  animateCoffeeSip = false,
}) => {
  const frame = useCurrentFrame();
  const { fps } = useVideoConfig();

  // Background fade in (0.5 seconds)
  const bgOpacity = interpolate(frame, [0, fps * 0.5], [0, 1], {
    extrapolateRight: "clamp",
  });

  // Auntie entrance - slides up and fades in (0.8 seconds, starts at 0.3s)
  const auntieStartFrame = fps * 0.3;
  const auntieOpacity = interpolate(
    frame,
    [auntieStartFrame, auntieStartFrame + fps * 0.8],
    [0, 1],
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );

  const auntieY = interpolate(
    frame,
    [auntieStartFrame, auntieStartFrame + fps * 0.8],
    [50, 0], // slides up 50px
    { extrapolateLeft: "clamp", extrapolateRight: "clamp" }
  );

  // Subtle breathing motion (very slow, continuous)
  const breatheScale = interpolate(
    frame % (fps * 4), // 4 second cycle
    [0, fps * 2, fps * 4],
    [1, 1.008, 1], // very subtle 0.8% scale
    { extrapolateRight: "clamp" }
  );

  // Coffee sip animation (if enabled)
  const coffeeSipRotation = animateCoffeeSip
    ? interpolate(
        frame % (fps * 3),
        [0, fps * 0.5, fps * 1, fps * 3],
        [0, -3, 0, 0], // slight tilt
        { extrapolateRight: "clamp" }
      )
    : 0;

  return (
    <AbsoluteFill
      style={{
        backgroundColor: colors.deepBrown,
        justifyContent: "center",
        alignItems: "center",
        opacity: bgOpacity,
      }}
    >
      {/* Desk setup background */}
      <Img
        src={staticFile("assets/auntie_desk_setup.png")}
        style={{
          width: "100%",
          height: "100%",
          objectFit: "cover",
        }}
      />

      {/* Auntie Truth character overlay */}
      {showAuntie && (
        <Img
          src={staticFile("assets/aunt_truth_definitive.png")}
          style={{
            position: "absolute",
            bottom: 0,
            right: "10%",
            height: "80%",
            objectFit: "contain",
            opacity: auntieOpacity,
            transform: `translateY(${auntieY}px) scale(${breatheScale}) rotate(${coffeeSipRotation}deg)`,
            transformOrigin: "bottom center",
          }}
        />
      )}
    </AbsoluteFill>
  );
};
