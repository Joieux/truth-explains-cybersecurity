# EP03 Generation Manifest Local Preflight

**PRE-GENERATION MANIFEST GATE: PASS**

- Manifest: `ep03_generation_ready_shot_manifest.json`
- Locked runtime: **176.472s**
- Shots: **28**
- Paid-generation shots: **21**
- Local-only shots: **7**
- Manifest SHA-256: `4978372cb28c1cd0ed3d070b8e44b47b5f2f6fee2c0c7ed752c85673d0cc4a39`

## Checks

- **PASS — Manifest has exactly 28 shots:** Found 28
- **PASS — Shot IDs S001-S028 complete and ordered:** S001, S002, S003, S004, S005, S006, S007, S008, S009, S010, S011, S012, S013, S014, S015, S016, S017, S018, S019, S020, S021, S022, S023, S024, S025, S026, S027, S028
- **PASS — Manifest timing exactly matches locked timing master:** All 28 exact
- **PASS — Runtime checksum:** Manifest 176.470s / locked audio 176.472s
- **PASS — Narration SHA-256 lock copied correctly:** 2a9a87a69f8ddd6b6ee8a3d79ee2d88d47ceb20e540224cc96c59d408667c7c5
- **PASS — All shot classes valid:** CHARACTER/NPC/GRAPHIC/ENVIRONMENT/COMPOSITE only
- **PASS — All generation fields populated:** Complete
- **PASS — Canonical Aurora/Kirk identity locks correct:** All recurring-character shots use the locked masters; generated-frame chaining disabled
- **DEFERRED — Canonical master file bytes available for physical hash verification:** Manifest contains canonical master paths and approved SHA-256 values. The master image files themselves were not included in the uploaded production ZIP, so physical on-disk file hashing on the Mac remains a local execution-time preflight.
- **PASS — Local-only no-pay shot set locked:** S007, S008, S009, S010, S012, S019, S022
- **PASS — Local-only shots cannot be mistaken for paid-ready shots:** READY_FOR_LOCAL_BUILD on all 7
- **PASS — Anonymous scammer / no persistent VISITOR-01 identity:** Anonymous scammer coverage remains non-identifying; no VISITOR-01 identity is created.
- **PASS — Readable text reserved for compositor unless explicitly required:** Readable text is compositor-authored unless a shot explicitly says otherwise; do not ask image generation to render incidental lettering.
- **PASS — Zero-waste paid-generation rule present:** No paid generation for exploration, prompt testing, ambiguity resolution, or locally solvable QA.

## Execution Rule

No paid image/video generation is authorized for exploration or prompt testing. Paid generation may use only the locked production-ready shot payloads. Recurring-character generations must verify the canonical master file hash immediately before the provider request.

The manifest itself is cleared for production execution. The only deferred check is physical hashing of Aurora/Kirk master image bytes on the Mac at execution time because those master images were not inside the uploaded ZIP.
