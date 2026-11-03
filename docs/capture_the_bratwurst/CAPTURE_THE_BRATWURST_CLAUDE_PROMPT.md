# Claude Code Prompt — Implement Capture the Bratwurst

You are working in the existing Bratwurst Remastered project. Follow the documents in this folder:
- `CAPTURE_THE_BRATWURST_SPEC.md`
- `CAPTURE_THE_BRATWURST_MAP_EDITOR.md`
- `CAPTURE_THE_BRATWURST_SCORING_AND_STATS.md`
- `CAPTURE_THE_BRATWURST_IMPLEMENTATION_PLAN.md`
- `CAPTURE_THE_BRATWURST_TEST_PLAN.md`

## First: inspect, do not immediately implement
The **Capture the Bratwurst** choice already exists under **Game Modes**. Do not create a duplicate. Inspect the project and report the actual files/systems used for mode dispatch, teams, ships, damage, kill attribution, map editor/save-load, collisions, timers, settings, round progression, HUD, and results screens. Identify the smallest safe integration plan before broad changes. Do not guess object names or paths.

## Required gameplay
Implement a team-based Neutral Flag / One Flag CTF mode:
- One sausage spawn point and Red/Blue non-solid delivery zones per map.
- Touching an uncarried sausage picks it up.
- Red scores by entering Blue's zone; Blue scores by entering Red's zone. Own-base entry never scores.
- Each valid delivery awards exactly one point.
- Default score limit: 5. Default round time: 5 minutes. Both configurable using existing settings conventions.
- Reuse the existing configured number-of-rounds setting if available.

## Sausage behavior
- Spawn animation: invisible/zero-scale to medium-ship size over 1 second while rotating rapidly.
- Idle rotation: one full revolution every 4 seconds.
- While carried, trail just behind the carrier.
- When the carrier takes actual damage from a shot or missile, rotate extra fast for 1 second, then return to normal. Further hits refresh the timer.
- If the carrier is destroyed, detach the sausage and preserve its current momentum. It becomes neutral and either team can pick it up.
- Never permit multiple carriers or retain a destroyed carrier reference.

## Scoring sequence
- Award one point once per valid delivery.
- Show `RED TEAM SCORES!` or `BLUE TEAM SCORES!` for 3 seconds.
- Then show a large centered countdown from 3 to 0.
- At 0, respawn the sausage at its authored spawn point and play the 1-second spawn animation.
- Resume the same round unless the score limit has ended it.
- Prevent pickup/scoring during the announcement/countdown. Preserve timer, score, kills, and carry-time statistics during normal score resets.

## Statistics and rounds
- Kills count for statistics only; they do not award points.
- Track cumulative carry time per player per round in seconds.
- At round end, show winning team/draw, final score, kills and kill leader(s), and total carry time per player.
- End a round when the score limit is reached or the timer expires.
- At timer expiry, higher score wins; if tied, use existing tie-break logic or show a draw.
- Continue for the configured number of rounds. Reset per-round state between rounds while preserving match-level round wins. Show overall result after the final round.

## Map editor
Add only what is required to place one sausage spawn and the two non-solid team zones. Persist all data with the map and validate it before starting this mode. Do not break existing maps or other modes.

## Engineering constraints
- GameMaker Studio 1.4-compatible GML.
- Follow existing project architecture and conventions.
- Keep changes scoped to this mode and map-editor support.
- Do not rewrite unrelated systems or alter unrelated modes.
- If requirements conflict with the existing architecture, explain the conflict and propose the smallest safe solution before broad changes.
- Use existing time-step conventions, not assumed frame rates.
- Do not claim tests passed unless they were run.

## Completion report
Summarize implementation, files changed, map setup/validation, scoring and drop behavior, carry-time tracking, round progression, tests actually run and results, and any known limitations or decisions needing approval.
