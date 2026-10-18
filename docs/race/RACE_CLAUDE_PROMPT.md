# Claude Code Prompt — Add Race Mode

Read `CLAUDE.md`, the existing project documentation, and every file in this Race mode documentation pack before changing anything.

We want to add a new game mode called **Race** to Bratwurst Remastered using **GameMaker Studio 1.4**. Follow:
- `RACE_MODE_SPEC.md`
- `RACE_POWERUPS_AND_BALANCE.md`
- `RACE_LEVEL_EDITOR.md`
- `RACE_IMPLEMENTATION_PLAN.md`
- `RACE_TEST_PLAN.md`

## First task: inspect, do not implement
1. Inspect how the project currently handles modes, menus, laps/rounds, movement, weapons, ammo, drifting, hit detection, levels/editor, HUD, input and results.
2. Map each requirement to existing code/resources or mark it as new work.
3. Identify conflicts and technical limitations.
4. Check whether race progress can be calculated accurately. Do not rely only on straight-line distance to the finish.
5. Recommend the smallest first implementation stage and list exact files/resources that would need changing.

Do not modify files until you have reported the plan and received approval.

## Rules after approval
- Use GMS 1.4-compatible legacy GML.
- Isolate Race behavior so other modes remain unchanged.
- Do not rewrite unrelated systems.
- Implement one stage at a time and test against `RACE_TEST_PLAN.md`.
- Update docs and changelog as work progresses.
- Never claim a test passed unless it was actually run.

The initial report must list:
- Existing systems that can be reused.
- New systems required.
- Risks/conflicts.
- Exact files/resources proposed for Stage 1.
- Stage 1 acceptance tests.
- Questions requiring the project owner's decision.

Stop after the report and wait for approval.
