/**
 * Truth Explains Motion Rules
 * Based on design_system.md - Keep motion slow, fade in/out, no bouncing
 */

// Duration in frames (at 30fps)
export const durations = {
  fadeIn: 15, // 0.5 seconds
  fadeOut: 15, // 0.5 seconds
  sceneTransition: 30, // 1 second
  introMax: 60, // 2 seconds max
  outroMax: 150, // 5 seconds max
} as const;

// Easing - smooth and calm, no bouncing
export const easings = {
  // Use with interpolate()
  smooth: (t: number) => t * t * (3 - 2 * t), // smoothstep
} as const;
