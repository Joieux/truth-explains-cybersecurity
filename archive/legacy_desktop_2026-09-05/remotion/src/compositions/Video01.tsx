import React from "react";
import { AbsoluteFill, Audio, staticFile } from "remotion";
import { TransitionSeries, linearTiming } from "@remotion/transitions";
import { fade } from "@remotion/transitions/fade";
import { AuntiesDesk, FocusScene, CIATriad, IntroOutro } from "../components";
import { colors, fonts, fontSizes, fontWeights } from "../theme";

/**
 * Video 01: What Cybersecurity Is
 *
 * Script structure:
 * - [Visual: Auntie's Desk - Opening Frame] - Opening greeting
 * - [Visual: Focus Scene - The Safety Shield] - Digital life analogy
 * - [Visual: Focus Scene - The Pillars] - CIA Triad explanation
 * - [Visual: Pull back to Auntie's Desk] - Closing
 *
 * Uses TransitionSeries for smooth fade transitions between scenes
 */

// Scene durations (in frames at 30fps)
// Adjust these to match your audio timing
const sceneDurations = {
  intro: 45, // 1.5 seconds
  openingDesk: 300, // 10 seconds - greeting
  safetyShield: 450, // 15 seconds - digital life analogy
  pillars: 600, // 20 seconds - CIA triad
  closingDesk: 240, // 8 seconds - closing
  outro: 90, // 3 seconds
} as const;

// Transition duration (0.5 seconds)
const transitionDuration = 15;

interface Video01Props {
  audioSrc?: string;
}

export const Video01: React.FC<Video01Props> = ({ audioSrc }) => {
  return (
    <AbsoluteFill style={{ backgroundColor: colors.deepBrown }}>
      {/* Audio track */}
      {audioSrc && <Audio src={staticFile(audioSrc)} />}

      <TransitionSeries>
        {/* Intro */}
        <TransitionSeries.Sequence durationInFrames={sceneDurations.intro}>
          <IntroOutro type="intro" />
        </TransitionSeries.Sequence>

        <TransitionSeries.Transition
          presentation={fade()}
          timing={linearTiming({ durationInFrames: transitionDuration })}
        />

        {/* Opening - Auntie's Desk */}
        <TransitionSeries.Sequence durationInFrames={sceneDurations.openingDesk}>
          <AuntiesDesk showAuntie={true} />
        </TransitionSeries.Sequence>

        <TransitionSeries.Transition
          presentation={fade()}
          timing={linearTiming({ durationInFrames: transitionDuration })}
        />

        {/* Focus Scene - The Safety Shield */}
        <TransitionSeries.Sequence durationInFrames={sceneDurations.safetyShield}>
          <FocusScene title="Protecting Your Digital Life">
            <p
              style={{
                fontFamily: fonts.primary,
                fontSize: fontSizes.body,
                color: colors.softCream,
                textAlign: "center",
                maxWidth: 900,
                lineHeight: 1.8,
              }}
            >
              You lock the door to your home, right?
              <br />
              You check who's knocking before you let 'em in.
              <br />
              <br />
              <span style={{ color: colors.mutedGold, fontWeight: fontWeights.semiBold }}>
                That's it. That's the whole energy.
              </span>
            </p>
          </FocusScene>
        </TransitionSeries.Sequence>

        <TransitionSeries.Transition
          presentation={fade()}
          timing={linearTiming({ durationInFrames: transitionDuration })}
        />

        {/* Focus Scene - The Pillars (CIA Triad) */}
        <TransitionSeries.Sequence durationInFrames={sceneDurations.pillars}>
          <CIATriad highlightPillar="all" />
        </TransitionSeries.Sequence>

        <TransitionSeries.Transition
          presentation={fade()}
          timing={linearTiming({ durationInFrames: transitionDuration })}
        />

        {/* Closing - Auntie's Desk */}
        <TransitionSeries.Sequence durationInFrames={sceneDurations.closingDesk}>
          <AuntiesDesk showAuntie={true} animateCoffeeSip={true} />
        </TransitionSeries.Sequence>

        <TransitionSeries.Transition
          presentation={fade()}
          timing={linearTiming({ durationInFrames: transitionDuration })}
        />

        {/* Outro */}
        <TransitionSeries.Sequence durationInFrames={sceneDurations.outro}>
          <IntroOutro type="outro" />
        </TransitionSeries.Sequence>
      </TransitionSeries>
    </AbsoluteFill>
  );
};

// Total duration calculation (accounting for transitions)
// Each transition overlaps by its duration, reducing total time
const numTransitions = 6;
export const video01Duration =
  Object.values(sceneDurations).reduce((a, b) => a + b, 0) -
  numTransitions * transitionDuration;
