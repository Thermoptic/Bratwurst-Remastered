# Capture the Bratwurst — Documentation

This folder contains the design and implementation plan for the **Capture the Bratwurst** mode in Bratwurst Remastered.

## Files
- `CAPTURE_THE_BRATWURST_SPEC.md` — Rules, objective behavior, scoring, visuals, rounds.
- `CAPTURE_THE_BRATWURST_MAP_EDITOR.md` — Map editor and persistence requirements.
- `CAPTURE_THE_BRATWURST_SCORING_AND_STATS.md` — Settings, timer, statistics, and results.
- `CAPTURE_THE_BRATWURST_IMPLEMENTATION_PLAN.md` — Suggested implementation sequence.
- `CAPTURE_THE_BRATWURST_TEST_PLAN.md` — Acceptance tests.
- `CAPTURE_THE_BRATWURST_CLAUDE_PROMPT.md` — Prompt for Claude Code.

## Constraints
- The **Capture the Bratwurst** choice already exists under **Game Modes**. Do not create a duplicate; connect the existing choice to the mode.
- Team-based Neutral Flag / One Flag CTF with exactly one neutral sausage.
- Maps need one sausage spawn point and Red/Blue non-solid delivery zones.
- Use GameMaker Studio 1.4-compatible GML.
- Inspect the actual project architecture before editing. Keep changes scoped to this mode and required editor support.
- Preserve existing maps, modes, menu conventions, and gameplay.

## Quick summary
A player picks up the sausage by touching it and scores by delivering it to the opposing team's non-solid base zone. Each delivery is worth 1 point. Defaults are 5 points and 5 minutes. After a score, show a team announcement for 3 seconds, then a centered countdown from 3 to 0; respawn the sausage at its authored spawn point and resume the round. At round end, show the winner, kills, and each player's total sausage-carry time. Continue for the configured number of rounds.
