# Truth Explains Cybersecurity — Project Consolidation & Autonomous Production Roadmap

## Project Goal

Establish `truth-explains-cybersecurity` as the single authoritative GitHub repository for the Truth Explains Cybersecurity / Aunt Truth series.

First consolidate and clean the existing GitHub repository and Desktop project folders without losing production work.

After cleanup, evolve the project toward an autonomous production pipeline capable of taking an Aunt Truth script and producing a complete animated episode with minimal or no human intervention.

---

# PHASE 1 — Protect Current Work

## Authoritative Git Repository

Repository:

`Joieux/truth-explains-cybersecurity`

Local working copy:

`~/Desktop/truth-explains-cybersecurity`

Current verified state:

- Branch: `master`
- Commit: `8faeb07`
- Commit message: `Update production pipeline and Episode 02 structure`
- Working tree: clean
- GitHub remote verified

## Existing Desktop Project Folders

Do NOT delete or overwrite these folders until consolidation is complete:

1. `~/Desktop/truth-explains-cybersecurity`
   - Official Git working copy
   - Keep

2. `~/Desktop/Truth Explains NEW`
   - Contains production assets not currently present in GitHub
   - Includes additional Episode 02 stills, animation clips, Runway clips and completed render
   - Preserve until media migration and repository consolidation are verified

3. `~/Desktop/Truth Explains`
   - Older development/project version
   - Contains legacy material and separate Git history
   - Preserve until final comparison and archival decision

---

# PHASE 2 — Clean GitHub Repository

- [ ] Review current repository structure
- [ ] Review `.gitignore`
- [ ] Identify media/binary files already tracked by Git
- [ ] Identify unnecessary generated files
- [ ] Identify duplicate files
- [ ] Identify obsolete scripts
- [ ] Identify obsolete production documentation
- [ ] Identify legacy Aunt Truth material
- [ ] Identify current canonical scripts
- [ ] Review `README.md`
- [ ] Review repository branch strategy
- [ ] Determine whether `master` remains primary or should become `main`
- [ ] Review repository for accidentally committed media
- [ ] Review repository for files that should be externally stored
- [ ] Create cleanup branch before repository modifications
- [ ] Perform cleanup
- [ ] Validate repository after cleanup
- [ ] Commit cleanup
- [ ] Push and verify GitHub

---

# PHASE 3 — Consolidate `Truth Explains NEW`

## Preserve Production Work

Known NEW-only Episode 02 material includes:

- Still images
- Beat images
- Animated Beat 01
- Runway clips
- Keys animation
- Max bark animation
- Additional visual sequences
- Completed Episode 02 render

Completed render currently located at:

`Truth Explains NEW/renders/ep02-truth-explains-passwords-youtube.mp4.mov`

## Repository Content

- [ ] Identify lightweight files in NEW missing from Git
- [ ] Copy appropriate scripts
- [ ] Copy appropriate prompts
- [ ] Copy production metadata
- [ ] Copy workflow documentation
- [ ] Copy templates where appropriate
- [ ] Do NOT blindly copy entire 2.2 GB directory
- [ ] Verify copied files with Git status/diff

---

# PHASE 4 — Resolve Branding Differences

Do not automatically overwrite branding files.

Review:

- [ ] `branding/character_bank.md`
- [ ] `branding/character_bank_v2.md`
- [ ] `branding/color_palette.md`
- [ ] `branding/design_system.md`
- [ ] Character references
- [ ] Style guides
- [ ] Brand assets
- [ ] Determine canonical Aunt Truth character specification
- [ ] Determine canonical color palette
- [ ] Determine canonical design system
- [ ] Merge useful differences
- [ ] Remove superseded versions only after verification

---

# PHASE 5 — Separate Git From Production Media

GitHub will contain:

- Scripts
- Prompts
- Production rules
- Episode specifications
- Storyboards
- Asset manifests
- Automation code
- Agent instructions
- Documentation
- Tests
- Lightweight configuration

GitHub should NOT become the primary storage location for:

- Final video renders
- Runway videos
- Generated animation clips
- Large PNG collections
- Raw audio
- Music libraries
- SFX libraries
- Resolve project media
- Large ZIP archives
- Other large generated binaries

- [ ] Inventory existing production media
- [ ] Determine total storage requirements
- [ ] Identify media accidentally tracked by Git
- [ ] Design external media directory
- [ ] Select cloud/object storage
- [ ] Move media safely
- [ ] Verify checksums before deleting original copies
- [ ] Update `production/media_paths.md`
- [ ] Create media asset manifests
- [ ] Add appropriate media patterns to `.gitignore`
- [ ] Test media retrieval

---

# PHASE 6 — Desktop Cleanup

Only begin deletion after repository and media verification.

Target end state:

Desktop should NOT contain three competing Truth Explains projects.

Preferred active project:

`~/Desktop/truth-explains-cybersecurity`

- [ ] Verify everything needed from `Truth Explains NEW` has been preserved
- [ ] Verify Episode 02 production assets
- [ ] Verify completed Episode 02 render
- [ ] Verify branding assets
- [ ] Verify scripts
- [ ] Verify prompts
- [ ] Verify campaign material
- [ ] Verify launch tracker
- [ ] Verify bundle/archive material
- [ ] Compare legacy `Truth Explains` against authoritative repo
- [ ] Identify anything unique worth preserving
- [ ] Archive or migrate unique legacy material
- [ ] Verify archive
- [ ] Remove obsolete Desktop project folders only after explicit approval

---

# PHASE 7 — Validate Episode 02

Episode 02 is considered completed production work and must not be damaged during consolidation.

- [ ] Verify final EP02 script
- [ ] Verify voiceover
- [ ] Verify still images
- [ ] Verify animations
- [ ] Verify Runway clips
- [ ] Verify music
- [ ] Verify SFX
- [ ] Verify final render
- [ ] Create EP02 asset manifest
- [ ] Record relationships between script beats and generated assets
- [ ] Preserve EP02 as a reference production example

---

# PHASE 8 — Update Aunt Truth Creative Direction

Future episodes should use Aunt Truth primarily as the narrator/voice guiding the story.

Animation and supporting visuals should carry most of the visual storytelling.

Aunt Truth should appear visually when her presence improves:

- Humor
- Reaction
- Emphasis
- Character continuity
- Signature moments
- Opening/closing identity

She should not automatically be the visual focal point of every scene.

- [ ] Update character rules
- [ ] Update episode template
- [ ] Update visual-generation rules
- [ ] Update storyboard rules
- [ ] Review EP03–EP10 scripts against new direction
- [ ] Preserve completed EP02 rather than unnecessarily rebuilding it

---

# PHASE 9 — Agent-Ready Media Architecture

Design media storage so an AI production agent can retrieve and create assets programmatically.

Target model:

GitHub = production intelligence

External object storage = production media

Local machine = working cache

- [ ] Evaluate object-storage providers
- [ ] Define storage naming convention
- [ ] Define episode directory convention
- [ ] Define asset identifiers
- [ ] Define asset metadata
- [ ] Define media retrieval API
- [ ] Define upload workflow
- [ ] Define versioning strategy
- [ ] Define archive strategy
- [ ] Define backup strategy

---

# PHASE 10 — Structured Episode Specification

Develop a machine-readable episode specification.

Potential format:

`episode.yaml`

Each episode should eventually define:

- Narration
- Beats
- Scenes
- Aunt Truth visibility
- Character actions
- Visual requirements
- Existing assets
- Generated assets
- Animation instructions
- Music cues
- SFX cues
- On-screen text
- Timing
- Transitions
- Source citations where applicable
- Output formats

- [ ] Design schema
- [ ] Convert EP02 into reference specification
- [ ] Validate specification against finished EP02
- [ ] Create reusable episode template
- [ ] Test on EP03

---

# PHASE 11 — Autonomous Aunt Truth Production Agent

Long-term target:

**SCRIPT → FINISHED ANIMATED EPISODE**

Agent responsibilities:

1. Read script
2. Understand narrative
3. Divide script into production beats
4. Generate storyboard
5. Search existing asset library
6. Reuse appropriate assets
7. Generate missing imagery
8. Generate animation/video
9. Generate Aunt Truth voiceover
10. Select/generate music
11. Select/generate SFX
12. Assemble timeline
13. Add on-screen text
14. Apply branding
15. Apply intro/outro
16. Render episode
17. Perform automated QA
18. Produce final master
19. Produce platform variants
20. Store production assets
21. Update episode manifest

---

# PHASE 12 — Automated Quality Assurance

The production agent should validate:

- Brand consistency
- Aunt Truth character consistency
- Voice consistency
- Script accuracy
- Cybersecurity accuracy
- Visual continuity
- Audio levels
- Music placement
- SFX placement
- Caption accuracy
- On-screen text
- Resolution
- Aspect ratio
- Duration
- Missing assets
- Broken media references
- Final render integrity

Human review should eventually become exception-based rather than required for every production step.

---

# Target End State

One authoritative Git repository:

`truth-explains-cybersecurity`

One organized external production-media library.

No duplicate active Desktop project folders.

A completed and preserved Episode 02 production reference.

Aunt Truth primarily functions as the voice and personality explaining cybersecurity while animation, visual storytelling and music carry the episode.

Ultimately:

**Aunt Truth script in → complete animated episode out.**
