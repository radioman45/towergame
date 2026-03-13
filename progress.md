# Progress

## Current State
- Created a single-file browser game in `index.html` using Three.js CDN.
- Implemented an orthographic top-down battlefield, HUD overlay, shop panel, wave controls, and restart overlay.
- Implemented movable tank units with:
  - purchase by type
  - drag-to-move
  - auto-target / auto-fire
  - EXP gain and rank labels
  - promotion zone logic
  - weapon mode swap
  - sell logic
- Implemented Fortress TD style merge flow:
  - select exactly 3 identical tanks
  - merge into a random higher-tier result
- Implemented enemy waves with multiple enemy types:
  - basic
  - fast
  - heavy
  - flying
  - splitter
  - boss every 5 waves
- Implemented projectile, burn, wind particle, and boss snow particle systems.
- Added economy systems:
  - starting gold
  - kill reward
  - wave bonus
  - attack upgrade
  - speed upgrade
  - Double Fire purchase

## Verification Done
- Ran JavaScript syntax validation by extracting the inline script and checking it with `node --check`.
- Corrected broken non-ASCII characters that had corrupted rank and wind label strings.

## Known Notes
- The latest local `index.html` is syntactically valid.
- A previous browser run showed only UI with no visible battlefield progression; runtime behavior still needs full browser-side validation.
- The next session should start with direct browser console/runtime inspection and a real playtest pass.

## Files Prepared
- `index.html`
- `progress.md`
- `plan.md`
- `.gitignore`
