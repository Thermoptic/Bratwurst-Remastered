# Capture the Bratwurst — Implementation Plan

## Phase 1: Inspect before editing
Inspect and report the actual files/systems used for:
- Existing Game Modes selection and mode dispatch.
- Team identity and player/ship instances.
- Damage, projectiles/missiles, ship destruction, and kill attribution.
- Map editor tools, map serialization, and map loading.
- Collision and trigger conventions.
- HUD messages, countdowns, timers, rounds, results, and settings.
- Existing player input and game pause/transition behavior.

Do not guess object names or paths. Provide a short architecture summary and identify the smallest safe integration plan before broad edits.

## Phase 2: Map editor
1. Persist one sausage spawn point.
2. Persist Red and Blue non-solid delivery zones.
3. Add editor placement/editing using existing tools.
4. Validate required elements before this mode starts.
5. Confirm old maps/modes remain compatible.

## Phase 3: Objective state
Use existing project conventions to implement clear states: spawning, available, carried, dropped, scoring/reset sequence, and round ended. Ensure there is only one sausage and one carrier at a time.

## Phase 4: Visuals and carrying
1. Animate scale from invisible to medium-ship size while rotating rapidly over 1 second.
2. Idle rotation: one full turn every 4 seconds.
3. Follow behind the carrier.
4. On actual shot/missile damage, fast-spin for 1 second; refresh timer on further hits.
5. On carrier destruction, detach and preserve current momentum.
6. Allow either team to recover a dropped sausage.

Use the project's time-step conventions, not assumed frame rates.

## Phase 5: Scoring and timer
1. Detect delivery to the opposing zone.
2. Award one point once.
3. Show the scoring message for 3 seconds.
4. Show a centered 3-to-0 countdown.
5. Respawn at the authored point with the 1-second animation.
6. Add configurable score limit (default 5) and round time (default 5 minutes).
7. End the round at score limit or timer expiry; handle ties as specified.

## Phase 6: Statistics and rounds
1. Track kills per player through the existing kill system.
2. Track cumulative carry time per player.
3. Build round results with winner/draw, final score, kill leader(s), and carry times.
4. Reuse the existing round-count setting where possible.
5. Integrate next-round and final-match results.
6. Reset only per-round state between rounds.

## Phase 7: Integration and validation
- Connect the existing menu item; do not add a duplicate.
- Follow current settings and UI conventions.
- Test different supported player counts/team assignments.
- Ensure other modes remain unaffected.

## Phase 8: Test and report
Use `CAPTURE_THE_BRATWURST_TEST_PLAN.md`. Report files changed, systems reused, tests actually run, results, limitations, and unresolved design decisions.

## Guardrails
- GameMaker Studio 1.4-compatible GML only.
- Keep changes scoped to this mode and its editor support.
- Do not rewrite the game loop, combat system, or map format wholesale.
- Do not modify unrelated modes.
- Do not claim a test passed unless it was run.
