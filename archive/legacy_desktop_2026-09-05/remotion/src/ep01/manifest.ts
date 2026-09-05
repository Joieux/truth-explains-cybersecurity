/**
 * EP01 Manifest — What Is Cybersecurity, Really?
 *
 * Reconstructed from production script and clip inventory.
 * Narration: ElevenLabs · Duration: 303.7 seconds
 *
 * ─────────────────────────────────────────────────────────────
 * ⚠️  CUT TIMES NEED YOUR EAR
 * ─────────────────────────────────────────────────────────────
 * The CUT_TIMES_SEC values below are estimates based on the
 * production script pacing. They will get Remotion compiling
 * and give you a rough preview — but they will not be perfect.
 *
 * TO FINALIZE:
 *   1. Run: npm start  (inside remotion/)
 *   2. Select Video01v2 in Remotion Studio
 *   3. Listen and watch where each clip cuts
 *   4. Adjust the matching value in CUT_TIMES_SEC
 *   5. Save — Remotion hot-reloads, no restart needed
 *
 * MISSING CLIPS (show placeholder until generated):
 *   - clips/ep01/b-roll-07b.mp4  (Integrity padlock breach)
 *   - clips/ep01/b-roll-10.mp4   (Four protection rings)
 *   See: veo_prompts/runway_broll_prompts_ep01.md for the prompts.
 * ─────────────────────────────────────────────────────────────
 */

export interface ClipEntry {
  id: string;
  src: string;
  label: string;
  type: "library" | "broll";
}

/**
 * Full 26-clip sequence for EP01.
 * Order matches: veo_prompts/video_01_veo_prompts_v2.md -> Part 2
 */
export const EP01_CLIPS: ClipEntry[] = [
  // -- Sequence 1 - Opening
  {
    id: "lib-01",
    src: "clips/library/at-lib-01.mp4",
    label: "AT-LIB-01 - Warm Opening Greeting",
    type: "library",
  },
  {
    id: "lib-02-open",
    src: "clips/library/at-lib-02.mp4",
    label: "AT-LIB-02 - The Auntie Sip (opening transition)",
    type: "library",
  },

  // -- Sequence 2 - The Door Analogy
  {
    id: "broll-01",
    src: "clips/ep01/b-roll-01.mp4",
    label: "B-ROLL 01 - Door / Peephole Check",
    type: "broll",
  },
  {
    id: "broll-02",
    src: "clips/ep01/b-roll-02.mp4",
    label: "B-ROLL 02 - Man Refuses Keys to Stranger",
    type: "broll",
  },
  {
    id: "lib-06-a",
    src: "clips/library/at-lib-06.mp4",
    label: "AT-LIB-06 - Confident Gesture - There It Is",
    type: "library",
  },

  // -- Sequence 3 - Your Digital Life
  {
    id: "broll-03",
    src: "clips/ep01/b-roll-03.mp4",
    label: "B-ROLL 03 - Digital Life Flat-Lay",
    type: "broll",
  },
  {
    id: "lib-07",
    src: "clips/library/at-lib-07.mp4",
    label: "AT-LIB-07 - Pointing Direct - Here's the Thing",
    type: "library",
  },

  // -- Sequence 4 - The Real Scammer
  {
    id: "lib-05",
    src: "clips/library/at-lib-05.mp4",
    label: "AT-LIB-05 - The Head Shake - That's Not It",
    type: "library",
  },
  {
    id: "broll-04",
    src: "clips/ep01/b-roll-04.mp4",
    label: "B-ROLL 04 - The Unremarkable Scammer",
    type: "broll",
  },
  {
    id: "broll-05",
    src: "clips/ep01/b-roll-05.mp4",
    label: "B-ROLL 05 - Email Template Auto-Sending",
    type: "broll",
  },

  // -- Sequence 5 - Who Gets Caught
  {
    id: "broll-06a",
    src: "clips/ep01/b-roll-06a.mp4",
    label: "B-ROLL 06A - Tired Vignette",
    type: "broll",
  },
  {
    id: "broll-06b",
    src: "clips/ep01/b-roll-06b.mp4",
    label: "B-ROLL 06B - Rushing Vignette",
    type: "broll",
  },
  {
    id: "broll-06c",
    src: "clips/ep01/b-roll-06c.mp4",
    label: "B-ROLL 06C - Distracted / 40-Tabs Vignette",
    type: "broll",
  },
  {
    id: "lib-03-a",
    src: "clips/library/at-lib-03.mp4",
    label: "AT-LIB-03 - Leaning In - Real Talk (empathy moment)",
    type: "library",
  },

  // -- Sequence 6 - The CIA Triad
  {
    id: "lib-04",
    src: "clips/library/at-lib-04.mp4",
    label: "AT-LIB-04 - Counting on Fingers - Three Things",
    type: "library",
  },
  {
    id: "broll-07a",
    src: "clips/ep01/b-roll-07a.mp4",
    label: "B-ROLL 07A - Gold Padlock Snapping Shut (Confidentiality)",
    type: "broll",
  },
  {
    id: "broll-07b",
    src: "clips/ep01/b-roll-07b.mp4",
    label: "B-ROLL 07B - Padlock Cracked - Breach (Integrity) [MISSING]",
    type: "broll",
  },
  {
    id: "broll-08",
    src: "clips/ep01/b-roll-08.mp4",
    label: "B-ROLL 08 - Gradebook Tampered",
    type: "broll",
  },
  {
    id: "broll-09",
    src: "clips/ep01/b-roll-09.mp4",
    label: "B-ROLL 09 - Ransomware Lockout (Availability)",
    type: "broll",
  },

  // -- Sequence 7 - Layers, Not Panic
  {
    id: "lib-03-b",
    src: "clips/library/at-lib-03.mp4",
    label: "AT-LIB-03 - Leaning In - Reassuring (layers moment)",
    type: "library",
  },
  {
    id: "broll-10",
    src: "clips/ep01/b-roll-10.mp4",
    label: "B-ROLL 10 - Four Protection Rings [MISSING]",
    type: "broll",
  },

  // -- Sequence 8 - The Aunt Truth Rule
  {
    id: "lib-08",
    src: "clips/library/at-lib-08.mp4",
    label: "AT-LIB-08 - Stop Gesture - The Firm Pause",
    type: "library",
  },
  {
    id: "broll-11",
    src: "clips/ep01/b-roll-11.mp4",
    label: "B-ROLL 11 - Hand Doesn't Click",
    type: "broll",
  },

  // -- Sequence 9 - The Close
  {
    id: "lib-06-b",
    src: "clips/library/at-lib-06.mp4",
    label: "AT-LIB-06 - Confident Gesture - Close (reuse)",
    type: "library",
  },
  {
    id: "lib-02-close",
    src: "clips/library/at-lib-02.mp4",
    label: "AT-LIB-02 - The Auntie Sip - Close (reuse)",
    type: "library",
  },
  {
    id: "lib-09",
    src: "clips/library/at-lib-09.mp4",
    label: "AT-LIB-09 - Warm Close - We've Got This",
    type: "library",
  },
];

/**
 * Cut times in seconds from audio start (after the intro card).
 * 26 entries, one per clip in EP01_CLIPS, same order.
 *
 * ESTIMATES -- tune in Remotion Studio after first preview.
 * Edit a value, save the file, preview hot-reloads instantly.
 */
export const CUT_TIMES_SEC: number[] = [
  // Seq 1 - Opening
  0,      // lib-01    "Hey, family. Real glad you're here."
  5,      // lib-02    Sip / settling in

  // Seq 2 - Door Analogy
  10,     // broll-01  "You lock your door every night..."
  22,     // broll-02  "You would never hand your house keys..."
  35,     // lib-06    Confident gesture -- landing the analogy

  // Seq 3 - Digital Life
  40,     // broll-03  "Your phone, your laptop, your email..."
  62,     // lib-07    Pointing -- "And since your whole life is on there"

  // Seq 4 - Real Scammer
  67,     // lib-05    Head shake -- "They're not what the movies told you"
  75,     // broll-04  "Just a regular person. Might be in sweats..."
  92,     // broll-05  "Same template. Different name. Hit send."

  // Seq 5 - Who Gets Caught
  108,    // broll-06a "Usually the person who's tired."
  117,    // broll-06b "The one who's rushing."
  125,    // broll-06c "The one who's got forty tabs open..."
  134,    // lib-03    Leaning in -- "And that's why I'm telling you this."

  // Seq 6 - CIA Triad
  142,    // lib-04    Counting fingers -- "Three things. Just three."
  152,    // broll-07a "Confidentiality -- keeping private things private."
  168,    // broll-07b "If someone who shouldn't see it can see it..."
  183,    // broll-08  "Integrity -- keeping your information accurate..."
  201,    // broll-09  "Availability -- being able to get to your own stuff..."

  // Seq 7 - Layers, Not Panic
  219,    // lib-03    Leaning in -- "You protect yourself with layers."
  227,    // broll-10  "Strong password. Password manager. Two-factor..."

  // Seq 8 - Aunt Truth Rule
  240,    // lib-08    Stop gesture -- "If something feels urgent -- stop."
  250,    // broll-11  "That one second where you pause..."

  // Seq 9 - The Close
  264,    // lib-06    Confident gesture -- "You've already got what it takes"
  274,    // lib-02    Auntie sip -- satisfied, unhurried
  284,    // lib-09    Warm wave -- "Alright, family. That's enough for today."
];

/**
 * Total narration duration in seconds.
 * Confirmed via ffprobe: 303.672 sec.
 * Rounded up 1 second for safe outro padding.
 */
export const TOTAL_AUDIO_DURATION_SEC = 305;
