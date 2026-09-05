# Truth Explains Cybersecurity — Character Identity Lock

Status: Canonical

## Objective

Every recurring Truth Explains character must remain recognizably the same
person across every episode, scene, image model, video model, wardrobe,
environment, and camera angle.

Character identity consistency is a production requirement.

## Master-reference rule

Every generation containing a recurring character must return to that
character's approved canonical master references.

Allowed:

master -> scene 1
master -> scene 2
master -> scene 3

Prohibited:

master -> scene 1 -> scene 2 -> scene 3

A generated episode frame must never become the primary identity reference for
the next generation.

This prevents cumulative character drift.

## Identity classes

### Immutable

These define the person and must remain stable:

- facial identity
- facial proportions
- face shape
- skin tone
- apparent age
- eyes
- nose
- lips
- jaw
- cheek structure
- natural hairline
- baseline hair identity
- body proportions
- approximate height/build
- permanent distinguishing features

### Controlled variants

These may change only through an approved variant:

- hairstyle
- facial hair
- glasses
- wardrobe
- jewelry
- accessories
- makeup

### Scene variables

These may change freely without redefining the character:

- expression
- pose
- activity
- camera angle
- framing
- lighting
- environment
- weather
- time of day
- props

## Minimum master reference package

Every recurring character requires:

1. front neutral portrait
2. three-quarter portrait
3. profile portrait
4. full-body neutral reference

Recommended additions include expression references and approved wardrobe
variants.

## Reference immutability

Once approved, master references must not be silently replaced.

A redesigned identity requires:

- explicit approval
- a new identity version
- preservation of the previous version
- updated SHA-256 hashes
- documented reason

## Reference integrity

Every approved reference file must have a SHA-256 hash recorded in its
character manifest.

If the file no longer matches its approved hash, production must stop for
review.

## Generation requirement

After a character identity is approved, that recurring character must not be
generated from text alone.

Each generation must use:

- character ID
- identity version
- canonical reference assets
- immutable identity requirements
- approved controlled variant when applicable
- scene variables
- explicit identity-preservation instruction

## Required generation instruction

Equivalent wording must be supplied to generation systems:

"Preserve the supplied character identity exactly. Keep this person
recognizably identical to the approved canonical reference. Do not alter
facial geometry, skin tone, apparent age, body identity, natural hairline, or
distinguishing physical characteristics. Change only the scene attributes
explicitly requested."

## No generational inheritance

Do not use these as primary identity sources:

- generated episode stills
- generated video screenshots
- upscaled generated frames
- previous episode shots
- previous model output

They may be secondary references for composition, pose, wardrobe, or
environment only when the canonical master identity is independently supplied.

## Multi-character scenes

Each recurring character must receive their own canonical reference package.

A Maya-and-Kirk scene requires Maya references and Kirk references.

The model must not infer one character from another.

## Video drift

Video QA must check identity at:

- opening
- midpoint
- ending
- facial turns
- speaking moments
- high-motion moments

A clip that begins with the correct character but changes identity during
motion fails QA.

## Drift failures

Reject unintended changes to:

- face
- apparent age
- skin tone
- natural hairline
- body identity
- height/build relationship
- distinguishing features

Also reject:

- cross-character blending
- face swapping
- identity merging in group scenes

## QA result

Every recurring-character asset receives:

PASS
REVIEW
REJECT

Rejected assets must never become future reference material.

## Production gate

A recurring character cannot enter automated production until:

- the canonical identity is approved
- required master references exist
- hashes are recorded
- identity version is assigned
- manifest status is APPROVED

Until then:

REFERENCE_PENDING

The production agent must honor this state.

## Storage

Git stores:

- identity manifests
- rules
- hashes
- version history
- approval state

The external canonical media library stores:

- master reference images
- expression references
- approved variants
- approved production assets

Production media does not belong in normal Git history.
