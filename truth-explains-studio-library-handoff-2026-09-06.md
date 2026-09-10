# Truth Explains Cybersecurity — Studio Library Handoff
**Date:** 2026-09-06  
**Working focus:** Build a reusable animation studio library for the Truth Explains Cybersecurity / Aunt Truth series.

## 1. Project Intent

The goal is to produce the Truth Explains series as a consistent animated show, not as a collection of unrelated AI clips.

The production model should resemble a traditional limited-animation / 2D series workflow:
- reusable character masters
- reusable sets and environments
- reusable props
- reusable shot compositions
- local motion/compositing wherever practical
- generative video only when actual motion materially improves the scene

The user described the desired production feel as **“Boondocks-type animation.”**
This is a **style / production reference only**.

**CRITICAL:** Do not copy, recreate, import, or invent characters from *The Boondocks*.  
The cast must only use the Truth Explains canonical characters already developed.

## 2. One-Shot / Measure-Twice-Cut-Once Rule

“One-shot” means:
- no duplicate creative work
- no duplicate asset creation
- no prompt experimentation on paid services
- no paying twice because the shot was not fully specified
- no generating a still and later discovering the pose/crop/set was wrong
- no recreating recurring characters or environments every episode

The order of operations must be:

**specify locally -> verify canon -> lock the payload -> generate once -> validate -> reuse**

Paid generation is not allowed for:
- exploration
- prompt testing
- ambiguity resolution
- identity testing
- composition discovery
- tasks that can be done locally

Retries are allowed only for:
- provider failure
- clearly defective output

## 3. Canonical Recurring Cast — LOCKED

These are the only established recurring characters currently approved for the series:

- **Aurora Reid / Aunt Truth** — narrator / storyteller
- **Maya** — adult female viewer-surrogate
- **Kirk** — Black American adult male viewer-surrogate
- **Zuri** — 22-year-old Black American woman
- **Darius** — 24-year-old Black American man
- **Nia** — 13-year-old Black American girl
- **Malik** — 11-year-old Black American boy
- **Joni** — Black American woman, age 64–70
- **Terrance** — Black American man, age 64–70
- **NPCs** — scenario-specific only; not recurring unless explicitly promoted to canon

Do not add substitute recurring characters.

Names such as **Marcus, Tasha, Agent Vale, Professor Lee, Lena, campus security, generic students, or Boondocks-like children/adults** were created by an incorrect generated board and are **NOT CANON**.

## 4. Canonical Identity Masters — LOCKED

Every recurring-character generation must use the direct canonical master.
Generated frames must never become identity references.

| Character | Canonical Master | SHA-256 |
|---|---|---|
| Aurora | `~/Documents/Codex/truth-explains-media/characters/aurora/identity/master/auntie_truth_ref_v2.jpg` | `2ce8caa44b39d297b6043b237a12b076db0148fb8ea81f4b66f3dc6b6cde03e9` |
| Maya | `~/Documents/Codex/truth-explains-media/characters/maya/identity/master/Maya_Chen.png` | `532277eaf5bd0c7a6f6f910408b0106abc01c39755345d3f24569a3e88847520` |
| Darius | `~/Documents/Codex/truth-explains-media/characters/darius/identity/master/Darius.png` | `c625e08f6832ff5d4d64908d67980f84fe0d526be5c92023364c5ca4dedcc80b` |
| Joni | `~/Documents/Codex/truth-explains-media/characters/joni/identity/master/Joni.png` | `e93f54df02f24c2ed0466b6db328a442b5420d93feec7c26effd4fcbc85eb1eb` |
| Kirk | `~/Documents/Codex/truth-explains-media/characters/kirk/identity/master/Kirk.png` | `f6ddc3305a9447ba033d5491703ca9a66c2e326b1e04b53c2bdde03d851f07fe` |
| Malik | `~/Documents/Codex/truth-explains-media/characters/malik/identity/master/Malik.png` | `1721af5fa1325d93408441c92d47fea2fbdf8f51c6a23a6ea814a78c378b1fb7` |
| Nia | `~/Documents/Codex/truth-explains-media/characters/nia/identity/master/Nia.png` | `54ece4ec86ab086fc44a0cb29c4e6e3ebd5a881238675ecc4e5087fa02851a30` |
| Terrance | `~/Documents/Codex/truth-explains-media/characters/terrance/identity/master/Terrance.png` | `136e9767cc9b6f1c829c38303ceaf16092bc6a1673cb856928b6464211a6f50e` |
| Zuri | `~/Documents/Codex/truth-explains-media/characters/zuri/identity/master/Zuri.png` | `f4e8f9b5ac7cf0fbd46b4007d17ffdf2789319e075f0168af6a9ce2f1fde3cd5` |

Identity policy:
- direct canonical master every time
- hash verification before provider request
- no generated-frame identity chaining
- no description-only recurring-character generation
- if the provider cannot use the canonical master directly, block the generation

## 5. Known Character-Sheet Metadata Errors

Some earlier reference-sheet art contains incorrect ages / roles and must not override canon:

- Malik sheet may say **19**; canonical Malik is **11**
- Nia sheet may say **16**; canonical Nia is **13**
- Terrance sheet may say **52**; canonical Terrance is **64–70**
- Zuri sheet may say **23/24**; canonical Zuri is **22**
- Joni at **64** is compatible with the canonical 64–70 range

Any visual life-stage mismatch must be flagged for human review before use.

## 6. Aurora-Specific Canon

Aurora Reid is the storyteller, not the subject of every beat.

Locked characteristics:
- African American woman
- early 50s
- warm brown skin
- reddish-bronze locs past shoulders
- gold loc cuffs
- bold black square-frame glasses, always on
- gold hoop earrings
- black tee
- wide-leg black cargo pants
- chunky white sneakers
- USB-drive pendant and layered gold chains
- warm, knowing, cool expression
- never stern or stiff

Episode-color rule:
- only the windbreaker color and matching LED accent may change by topic

EP03 uses:
- cobalt blue / black windbreaker
- restrained blue accent lighting

Aurora appears for:
- direct address
- narration anchors
- transitions

Most beats should show the thing being discussed instead of Aurora speaking to camera.

## 7. Maya-Specific Canon

Maya is a viewer-surrogate, not a co-host.

She should be:
- ordinary
- relatable
- visually understated
- no signature look that competes with Aurora
- no recurring dialogue
- no direct-to-camera explanation

She may appear in:
- quiet daily moments
- device use
- uncertainty / doubt
- relatable audience-experience scenes

## 8. Truth Explains Animation / Design Rules

From the project design system:

Design goal:
- quiet confidence
- warm
- grounded
- nothing flashy
- voice leads
- visuals support

Prefer:
- warm neutral backgrounds
- simple motion
- desks
- notebooks
- hands
- everyday technology
- human-scale environments
- readable composition

Avoid:
- hacker-hoodie clichés
- green code rain
- glitch effects
- over-animated text
- bouncing
- shaking
- frantic camera work
- trend-chasing visuals

Motion:
- slow
- fade in / fade out
- minimal camera movement
- one idea per screen
- consistency beats creativity

The Boondocks reference is used only to communicate:
- confident 2D linework
- cel-shaded animated-series feel
- expressive but controlled character acting
- cinematic framing
- reusable television-animation production logic

It is **not** a character-design source.

## 9. HARD RULE — No Cybersecurity Signage or Environmental Words

The user explicitly locked this rule during this session:

**No signage or words describing, promoting, or talking about cybersecurity may appear in generated scene art.**

Do not generate:
- cybersecurity posters
- “protect / secure / verify / think” wall art
- fake cybersecurity book titles
- security slogans
- hacker slogans
- motivational safety signage
- cybersecurity-themed mugs
- words on clothing
- cybersecurity stickers
- decorative cybersecurity monitors
- terminal text / code as atmosphere
- fake brand names
- random readable environmental text

Default:
**ENVIRONMENTAL READABLE TEXT = NONE**

Allowed exceptions:
- functional UI text that the approved script explicitly requires the audience to read
- captions/subtitles
- official channel title/tagline when intentionally composited

Those exceptions should be created in the compositor, not baked into generative environment art.

## 10. Studio Library Architecture

The studio library should eventually contain:

### Canonical Characters
The 9 locked recurring characters above.

### Reusable Sets
High-value initial set families:
- Aurora home / table setup
- Kirk desk / device setup
- residential hallway + two-lock door
- neutral tabletop
- ordinary kitchen / living room / commute / device-use spaces as story needs arise
- graphic field / explanatory background system

### Reusable Props
- plain house key
- lower keyed lock
- separate upper deadbolt
- generic smartphone
- generic laptop
- generic hardware security key
- headphones
- blank notebook
- plain mug
- houseplants
- desk lamp
- neutral chairs/tables
- other ordinary household items as needed

All recurring props:
- no logos
- no slogans
- no cybersecurity words
- no incidental readable text

### Reusable Shot Templates
- eye-level medium close-up
- over-shoulder device view
- object insert
- environment wide
- two-shot
- explanatory mechanical cutaway
- slow push
- static hold
- slow lateral move

## 11. EP03 Reuse Families

EP03 should no longer be thought of as “21 paid generations.”

It should be reclassified into reusable asset families.

Primary families include:

**Aurora table family**
- S001
- S011
- S017
- S026

These should share the same canonical set, camera logic, lighting, and Aurora master.

**Door / hallway family**
- S003
- S004
- S005
- S006
- S018
- S020
- S023
- S025

These should reuse one canonical door / lock / hallway asset family.

**Kirk desk / device family**
- S013
- S014
- S015
- S021
- S027
- S028

These should reuse one canonical Kirk desk / device environment.

**Local graphic family**
- S007
- S008
- S009
- S010
- S012
- S019
- S022
- S024

These should be built locally wherever possible.

The principle is:
**asset family first -> shots second**

## 12. EP03 Production State at Handoff

The written EP03 package had already passed the local production gates before this studio-library discussion.

Important state:
- narration: HUMAN APPROVED
- approved narration runtime: 160.472 seconds
- approved narration SHA-256: `2083bd6ec23c5f660f15cb39c8b8b2b007267dae366da27e3593651654067c0d`
- timing gate: PASS
- media generation gate: PASS
- final release gate: PENDING_RENDER
- stage: `VISUAL_GENERATION_READY`
- paid generation: OFF
- publishing: OFF

The prior 21-paid / 7-local split is now considered too coarse and must be reclassified using the reusable-studio model before any paid visual generation.

## 13. Zero-Waste Production Rule

Locked rule:

> No paid TTS, image, video, music, or other generative request may be made for exploration, prompt testing, ambiguity resolution, or QA that can be completed locally. Every paid generation request must use an approved production-ready payload. Retries occur only for an actual provider failure or a clearly defective generated artifact—not because the prompt was incomplete or misdirected.

## 14. Major Error During This Session — REJECTED

Several studio-library boards were generated incorrectly.

The error:
- the generator invented replacement characters
- some imagery visually resembled Boondocks-type archetypes
- the generated boards included characters that were not part of Truth Explains canon
- one or more boards also included words/signage contrary to the project rules

These outputs are **REJECTED / NON-CANONICAL**.

They must never be used as:
- character references
- environment references
- identity sources
- style authority
- generation inputs
- studio-library masters

Incorrect invented characters shown in those boards are not part of this project.

The root cause was failure to enforce:
**CANON BEFORE STYLE REFERENCE**

Correct rule:
**Truth Explains character canon + identity masters first.  
Boondocks reference only for animation language / production feel.**

## 15. Failed Studio-Library Build Attempt

A filesystem package build was started in `/mnt/data/truth-explains-studio-library-v1`, but the write step hit a permission error before a valid handoff package was completed.

Treat that partial directory as:
**INVALID / INCOMPLETE / DO NOT USE**

Do not assume its contents are production-ready.

## 16. What Must Happen Next

1. Do not generate another character-bearing studio image until the exact canonical master(s) are available to the generation step.
2. Build the studio library in separate canonical asset classes, not one giant collage.
3. Start with environment and prop masters that contain no people and no text.
4. Build character pose/expression assets only by transforming the direct canonical masters.
5. Verify each recurring character against the identity lock before approval.
6. Add approved assets to the persistent media library.
7. Reclassify EP03 shots against the approved asset library.
8. Only then decide which very small number of shots actually require generative video.
9. Keep paid generation OFF until all above steps pass and the user deliberately authorizes spending.

## 17. Recommended Next Studio-Library Build Order

- Canonical Aurora studio/table set, empty master
- Canonical Kirk desk set, empty master
- Canonical residential hallway + two-lock door set
- Neutral tabletop
- Core prop pack
- Local graphic system
- Aurora pose/expression derivatives from canonical master
- Kirk pose/expression derivatives from canonical master
- Maya pose/expression derivatives from canonical master
- remaining recurring cast derivatives as story need requires
- reusable shot-template compositions
- EP03 shot-to-library remap

## 18. Approval Model

The user requested a batch workflow:

> Build all assets first, then the user will approve or deny.

This does **not** override identity safeguards.

The agent may continue without repeatedly asking “continue,” but:
- no paid generation
- no publishing
- no character invention
- no new canon
- no identity drift
- no signage / cybersecurity words

Final approval remains human.