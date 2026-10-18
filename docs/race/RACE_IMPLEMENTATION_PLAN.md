# Race Mode — Implementation Plan (GameMaker Studio 1.4)

## Before coding
Inspect and report how the current project handles:
- Game-mode selection.
- Lap and round menu settings.
- Ship movement and steering.
- Weapons, ammo, hit detection, damage, death and drifting.
- Level creation/storage/loading and the level editor.
- Local player input/controller mappings.
- HUD, match results and next-round flow.

Do not assume this specification's conceptual names match existing resources.

## Architecture constraints
- Add Race as an isolated game mode.
- Preserve all other modes.
- Reuse existing movement, weapons, input, menus, levels and result systems where safe.
- Use GMS 1.4-compatible legacy GML only. Do not use GMS 2.3+ structs, methods, constructors or syntax.
- Avoid rewriting unrelated systems.
- Make a Git commit/checkpoint before major changes.

## Conceptual race state
Adapt names to existing conventions and avoid duplicate state:
- Race state, target laps, target rounds, race start time, finish-line data.
- Per racer: completed laps, finished flag, finish time, rank and slow timer.
- Per racer: Plasma ammo, Missile ammo, Guided Missile ammo, drift-unlocked flag and drift charge.

## Stage 1 — Race mode shell
- Add Race to mode selection.
- Start a race using an existing level/spawn logic.
- Reset race state at round start.
- Add a basic HUD for lap and timer; debug values are acceptable.
- Verify other modes remain unchanged.

## Stage 2 — Lap trigger
- Add non-solid start/finish trigger.
- Detect valid crossings per racer and prevent duplicate increments.
- Finish each racer after the configured number of laps.
- Add debug overlays for lap state.

## Stage 3 — Non-lethal weapons
- Set all ammo to zero at Race start.
- Disable drifting and automatic meter recharge.
- Weapon hits apply 20% speed for 3 seconds.
- Ensure no weapon can kill racers in Race mode.
- Regression-test normal combat modes.

## Stage 4 — Pickups
- Add round pickup placeholder and authored spawn points.
- Hide pickup for 5 seconds after collection, then respawn.
- Grant exactly one shot of the selected weapon or one configured drift meter.
- Prevent stacking beyond the grant.
- Add pickup/HUD feedback.

## Stage 5 — Ranking and catch-up
- Calculate ranking from laps and route progress.
- Apply first/middle/last tier at collection time.
- If route progress cannot be computed accurately with current level data, report this and propose checkpoints rather than relying solely on straight-line distance.

## Stage 6 — Finish and results
- Record finish time.
- Stop finished racers interfering with active racers.
- Implement the special rule for the last unfinished racer.
- Show placement, times and non-finish status.
- Display exactly `PRESS TO ENTER NEXT RACE`.
- Advance through existing round flow.

## Stage 7 — Level editor
- Add start/finish trigger placement/editing.
- Add powerup spawn placement/editing.
- Persist Race data with the level.
- Add validation and ensure existing levels still load.

## Stage 8 — Polish and regression
- Test different player counts, lap/round settings and controllers.
- Verify existing modes are unchanged.
- Test a Windows export.

Implement one stage at a time. After each stage, run tests, update docs/changelog and request review before proceeding.
