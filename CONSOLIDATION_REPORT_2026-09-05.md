# Truth Explains consolidation report

Date: 2026-09-05

## Outcome

- Authoritative Git repository: `/Users/truth/Desktop/truth-explains-cybersecurity`
- Cleanup branch: `codex/media-consolidation`
- Authoritative media library: `/Users/truth/Documents/Codex/truth-explains-media`
- Duplicate project folders were not deleted.

## Media audit

- 392 source media records were compared by SHA-256.
- 228 distinct media files remain in the canonical library.
- Canonical media size: 2,768,044,557 bytes (2.58 GiB).
- 164 redundant source copies were collapsed by content hash.
- All 228 canonical files passed a second full SHA-256 verification.
- The repository working tree was reduced to lightweight project material; no file
  larger than 10 MB remains outside `.git`.

The complete canonical inventory is `production/media_manifest.csv`. The external
library also contains `_manifests/source_map.csv`, which maps every audited source
copy to its canonical library path.

## Episode 02 protection

- 49 EP02-named canonical assets are present, totaling 381,204,861 bytes.
- The completed render is stored at
  `renders/ep02-truth-explains-passwords-youtube.mp4.mov` in the media library.
- Render SHA-256:
  `15eb2af612f08fd4d47296af40aaa77124a0ee41c21b7bb782439a987b42a42a`
- Render size: 274,365,023 bytes.
- Container validation: QuickTime/MOV, 166.666667 seconds.

## Lightweight and legacy material

- All 246 audited files from `Truth Explains NEW` are accounted for in either the
  authoritative repository or media library.
- All 175 audited files from `Truth Explains` are accounted for.
- 63 distinct legacy-only lightweight files were preserved under
  `archive/legacy_desktop_2026-09-05/` as historical reference, not active code.
- The older repository's complete Git history, including all refs and its stash,
  was preserved and verified at
  `_archives/legacy-truth-explains-git.bundle` in the media library.
- Bundle SHA-256:
  `d901e1ba6223686d92a9640a6786ce532cf6a7ce0ef95b5bb04d7fd4e606073e`

Generated dependencies and caches were intentionally excluded from preservation,
including `node_modules`, Python caches, `.DS_Store`, and coverage caches. Four
local-only or sentinel files were classified as discardable: the legacy local
Claude settings file, the legacy `.gitignore`, and two test text files containing
only `test` or `hello`.

## Repository changes

- Removed 146 verified media files totaling 1,831,558,190 bytes from the active
  working tree after their library copies passed checksum verification.
- Of those, 25 tracked image files are recorded as Git deletions on the cleanup
  branch.
- Expanded `.gitignore` to keep production audio, video, archives, generated still
  collections, and project media out of normal Git.
- Updated `production/media_paths.md` with the actual library path and layout.
- Added the canonical media manifest and legacy archive index.
- Validation: 14 tests passed; `git diff --check` passed.

## Deletion gate

The content audit is complete and both duplicate project folders are safe removal
candidates, but neither has been deleted:

- `/Users/truth/Desktop/Truth Explains NEW` (about 2.0 GiB)
- `/Users/truth/Desktop/Truth Explains` (about 843 MiB after local hydration)

A partial, inaccessible Desktop library was created when macOS refused access to a
new sibling folder. The verified library is in Documents/Codex, so this partial
folder is also safe to remove:

- `/Users/truth/Desktop/truth-explains-media`

Permanent deletion still requires explicit approval.

## Git storage after maintenance

Normal Git repacking reduced the authoritative repository from about 1.0 GiB to
53 MiB without changing commit IDs or rewriting history. The current tree tracks
no production audio, video, archive, or project-media binary. Older commits still
contain the previously tracked image assets; fully purging those images would
require a separate history rewrite and normally a force push.
