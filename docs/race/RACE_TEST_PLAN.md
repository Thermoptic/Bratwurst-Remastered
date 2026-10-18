# Race Mode — Test Plan

Record build/commit, GMS version, player count, lap/round settings, input devices, expected result, actual result and evidence.

## Mode isolation
- `RACE-001`: Race appears in mode selection.
- `RACE-002`: Existing modes still start.
- `RACE-003`: Existing combat modes retain their original damage/death behavior.
- `RACE-004`: Race ammo/drift rules do not leak into other modes.

## Initialization
- `RACE-010`: All weapon ammo starts at zero.
- `RACE-011`: Plasma cannot fire before pickup.
- `RACE-012`: Missile cannot fire before pickup.
- `RACE-013`: Guided Missile cannot fire before pickup.
- `RACE-014`: Drifting is disabled before Drift pickup.
- `RACE-015`: Drift meter does not regenerate automatically in Race mode.

## Laps and finish line
- `RACE-020`: Valid crossing increments exactly one lap.
- `RACE-021`: Remaining on/oscillating over trigger does not repeatedly increment laps.
- `RACE-022`: Wrong-direction crossing does not count if direction is configured.
- `RACE-023`: Two racers crossing close together update independently.
- `RACE-024`: Trigger is non-solid.
- `RACE-025`: Target lap count finishes racer on correct crossing.
- `RACE-026`: Spawn on the line does not count as a completed lap.

## Weapon slow
- `RACE-030`: Hit applies 20% effective speed for 3 seconds.
- `RACE-031`: Normal movement returns after timer expires.
- `RACE-032`: Repeat hit refreshes timer without stacking below 20%.
- `RACE-033`: No weapon kills a racer in Race mode.
- `RACE-034`: Non-Race combat remains unchanged.

## Pickups
- `RACE-040`: Pickups are active at race start.
- `RACE-041`: Plasma pickup grants exactly one Plasma shot.
- `RACE-042`: Missile pickup grants exactly one Missile shot.
- `RACE-043`: Guided Missile pickup grants exactly one Guided Missile shot.
- `RACE-044`: Drift pickup unlocks drifting and grants configured meter.
- `RACE-045`: Empty drift meter does not recharge automatically.
- `RACE-046`: Pickup respawns at the same location after 5 seconds.
- `RACE-047`: One pickup cannot be collected by two racers in the same frame.
- `RACE-048`: New pickup replenishes to grant amount instead of stacking.

## Catch-up
- `RACE-050`: 1st place receives Plasma only.
- `RACE-051`: Middle positions receive Plasma or Missile only.
- `RACE-052`: Last place receives Drift or Guided Missile only.
- `RACE-053`: Two-player ranking/pickup pools work.
- `RACE-054`: Three-player ranking distinguishes 1st, 2nd and 3rd.
- `RACE-055`: Rank is evaluated when pickup is collected.
- `RACE-056`: Ranking does not rely solely on straight-line distance to finish.

## Results
- `RACE-060`: Finish time is recorded.
- `RACE-061`: Finished racers no longer interfere.
- `RACE-062`: Last unfinished racer rule resolves without hanging.
- `RACE-063`: Results show placements, identities, times/status.
- `RACE-064`: Exact prompt `PRESS TO ENTER NEXT RACE` is displayed.
- `RACE-065`: Existing confirm/fire input advances.
- `RACE-066`: Configured laps and rounds are respected.
- `RACE-067`: No end state hangs indefinitely.

## Editor
- `RACE-070`: Finish trigger can be placed/moved/edited/deleted.
- `RACE-071`: Pickup spawn points can be placed/moved/deleted.
- `RACE-072`: Race data survives save/close/reopen.
- `RACE-073`: Existing non-Race levels still load.
- `RACE-074`: Missing finish trigger produces a warning.
- `RACE-075`: Trigger is excluded from solid collision geometry.
