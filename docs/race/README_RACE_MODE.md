# Bratwurst Remastered — Race Mode Documentation

This pack specifies a new **Race** game mode for the existing project, targeting **GameMaker Studio 1.4**.

## Files
- `RACE_MODE_SPEC.md` — core rules, race flow, finish logic and results.
- `RACE_POWERUPS_AND_BALANCE.md` — weapons, pickups, drift and catch-up rules.
- `RACE_LEVEL_EDITOR.md` — finish-line and pickup placement tools.
- `RACE_IMPLEMENTATION_PLAN.md` — suggested implementation stages and architecture.
- `RACE_TEST_PLAN.md` — acceptance and regression tests.
- `RACE_CLAUDE_PROMPT.md` — prompt for Claude Code.

## Constraints
- Race is a new mode, not a replacement for existing modes.
- Preserve existing non-Race behavior.
- Target GMS 1.4 / legacy GML syntax.
- Inspect the current project before editing or assuming systems exist.
- Reuse existing menu settings for lap count and round count where possible.
