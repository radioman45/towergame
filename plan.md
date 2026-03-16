# Plan

## Goal
- Get the Three.js single-file Fortress TD implementation fully playable in browser and continue iteration from another machine.

## Initial Plan
- Use a single `index.html` file with:
  - embedded CSS
  - local `three.min.js` runtime next to the HTML file
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
- [x] Run browser runtime inspection on live page (`chrome --headless --dump-dom`)
- [x] Fix the blank-screen / non-rendering runtime issue caused by blocked CDN loading
- [ ] Playtest economy, wave balance, and merge progression
- [ ] Improve visual feedback for placement and combat readability
- [ ] Push final verified playable build after runtime validation

## Immediate Next Steps
1. Playtest placement, wave start, upgrade flow, and merge flow in a normal browser session.
2. Rebalance costs, damage, and wave pacing after a short playtest.
3. Improve placement preview, targeting, and combat readability feedback.
4. Push the verified build and updated handoff files.

## Handoff Notes
- Remote target requested by user: `https://github.com/radioman45/towergame`
- Include `index.html`, `progress.md`, `plan.md`, and supporting git metadata updates in the push.
