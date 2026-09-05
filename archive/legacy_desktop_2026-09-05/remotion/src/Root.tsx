import React from "react";
import { Composition } from "remotion";
import { Video01, video01Duration } from "./compositions";
import { Video01v2, getVideo01v2Duration } from "./ep01";
import { videoConfig } from "./theme";

export const RemotionRoot: React.FC = () => {
  return (
    <>
      {/**
       * Video01v2 — PRODUCTION VERSION
       * Real Veo clips + ElevenLabs narration.
       * To render: npx remotion render Video01v2
       * To preview: npm start → select "Video01v2" in Remotion Studio
       *
       * Before rendering:
       *   1. Drop narration into: public/audio/ep01_narration.mp3
       *   2. Drop clips into: public/clips/library/ and public/clips/ep01/
       *   3. Update cut times in: src/ep01/manifest.ts
       *   4. Update TOTAL_AUDIO_DURATION_SEC in manifest.ts
       */}
      <Composition
        id="Video01v2"
        component={Video01v2}
        durationInFrames={getVideo01v2Duration()}
        fps={videoConfig.fps}
        width={videoConfig.width}
        height={videoConfig.height}
        defaultProps={{}}
      />

      {/**
       * Video01-Legacy — original programmatic composition
       * Kept for reference. Not the production render.
       */}
      <Composition
        id="Video01-Legacy"
        component={Video01}
        durationInFrames={video01Duration}
        fps={videoConfig.fps}
        width={videoConfig.width}
        height={videoConfig.height}
        defaultProps={{
          audioSrc: undefined,
        }}
      />
    </>
  );
};
