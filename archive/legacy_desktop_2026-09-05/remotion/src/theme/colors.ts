/**
 * Truth Explains Color Palette
 * Based on design_system.md - Quiet confidence, warm, grounded
 */

export const colors = {
  // Primary backgrounds
  warmCharcoal: "#2D2A26",
  deepBrown: "#1E1A17",

  // Primary text
  softCream: "#F5F0E8",
  offWhite: "#FAF8F5",

  // Optional accents (use sparingly)
  mutedGold: "#C4A35A",
  dustyTerracotta: "#B87A5E",

  // Utility
  transparent: "transparent",
} as const;

export type ColorKey = keyof typeof colors;
