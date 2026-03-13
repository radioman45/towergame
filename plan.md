# Plan

## Goal
- Get the Three.js single-file Fortress TD implementation fully playable in browser and continue iteration from another machine.

## Initial Plan
- Use a single `index.html` file with:
  - embedded CSS
  - Three.js CDN
  - one large inline script
- Build the project in the following order:
  1. Scene setup with OrthographicCamera, renderer, lights, and battlefield grid
  2. Path, castle, and placement rules
  3. Tank unit system with movement, targeting, EXP, and rank display
  4. Enemy wave system with boss logic and special enemy types
  5. Fortress TD merge mechanic for exactly 3 identical tanks
  6. Promotion area, weapon swap, upgrades, economy, and speed toggle
  7. DOM HUD, selection controls, restart flow, and visual effects
  8. Browser validation and gameplay balancing

## Checklist
- [x] Create initial single-file `index.html`
- [x] Build HUD and side control panel
- [x] Add orthographic Three.js scene and battlefield
- [x] Add tank purchase / placement / drag movement
- [x] Add enemy pathing and wave spawning
- [x] Add merge system for exactly 3 identical tanks
- [x] Add promotion, sell, weapon swap, and upgrades
- [x] Add progress log and session handoff files
- [ ] Run browser console inspection on live page
- [ ] Fix the blank-screen / non-rendering runtime issue if it still reproduces
- [ ] Playtest economy, wave balance, and merge progression
- [ ] Improve visual feedback for placement and combat readability
- [ ] Push final verified playable build after runtime validation

## Immediate Next Steps
1. Open `index.html` in browser with devtools console visible.
2. Identify the first runtime error if the map still does not render.
3. Patch the rendering/game-loop issue and retest placement, wave start, and merge flow.
4. Rebalance costs and damage after a short playtest.

## Handoff Notes
- Remote target requested by user: `https://github.com/radioman45/towergame`
- Include `index.html`, `progress.md`, `plan.md`, and supporting git metadata updates in the push.
