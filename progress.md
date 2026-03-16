# Progress

## Current State
- Created a single-file browser game in `index.html` and switched runtime loading to a local `three.min.js` file for protected/offline environments.
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
- Added synthesized Web Audio SFX for firing, placement, merge, promotion, upgrades, wave start, castle hits, and end states.
- Added a runtime recovery overlay button that resets the run and resumes rendering after a loop exception.
- Added in-battle `Pause`, `Stop`, and `Restart Run` controls.
- Added a looping synth BGM layer that shifts intensity between build, battle, pause, and overlay states.
- Fixed a drag-hover null access that could stop the loop with `Cannot read properties of null (reading 'id')`.
- Added `start_game.bat` to launch the local build in Chrome/Edge with file-access enabled.

## Verification Done
- Ran JavaScript syntax validation by extracting the inline script and checking it with `node --check`.
- Corrected broken non-ASCII characters that had corrupted rank and wind label strings.
- Verified in headless Chrome that the page now appends a Three.js canvas and resets to the expected `Fortress grid online. Place tanks and start wave 1.` state.
- Verified in headless Chrome that the runtime recovery button is present in the DOM and hidden during normal boot.
- Verified in headless Chrome that the new pause/stop/restart controls render alongside the existing battlefield canvas.
- Verified the page still boots after the hover null-guard fix and that `start_game.bat` is present in the project root.
- Confirmed the previous blank-screen failure was caused by the external jsDelivr `three.min.js` URL being unavailable from this environment.
- Added boot-time fallback messaging so missing `three.min.js` or WebGL init failure shows a visible overlay error instead of silently failing.
- Hardened the render loop so a first-frame/runtime exception surfaces as an overlay error instead of silently killing rendering.

## Known Notes
- The latest local `index.html` is syntactically valid.
- `index.html` now expects `three.min.js` to remain in the same folder.
- Browser runtime boot is validated, but gameplay balance/readability still needs a manual playtest pass.
- The next session should focus on economy tuning, wave pacing, and visual clarity improvements rather than boot-time rendering fixes.

## Files Prepared
- `index.html`
- `three.min.js`
- `progress.md`
- `plan.md`
- `.gitignore`
