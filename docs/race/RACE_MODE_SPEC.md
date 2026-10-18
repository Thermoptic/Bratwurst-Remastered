# Race Mode — Game Design Specification

## 1. Overview
**Race** is a non-lethal multiplayer racing mode inspired by kart racers. Players fly around custom-built courses and compete to complete the configured number of laps. The first player to complete the required laps wins.

## 2. Core rules
- Players race around a course with a configured start/finish trigger.
- Lap count and number of rounds are selected in the existing pre-game menu.
- Weapons cannot kill or damage racers in Race mode.
- A weapon hit reduces the target's effective speed to **20% of normal for 3 seconds** (an 80% speed reduction).
- At race start, all weapon ammunition is zero.
- Drifting starts disabled.
- Initially, the only active racing controls/abilities are acceleration and steering.
- Pickups temporarily unlock weapons or drifting.
- Race-specific rules must not change other modes.

## 3. Race initialization
At the start of every race:
1. Load the selected course and race-specific data.
2. Place racers at the course's start positions, reusing existing spawn logic if possible.
3. Reset each racer's lap count, finish state, timers and pickup state as appropriate.
4. Set Plasma, Missile, Guided Missile and all other weapon ammo to zero.
5. Disable drifting and its automatic recharge.
6. Activate all pickup spawn points on the course.
7. Start the race timer.

No starting ammo or drift charge is granted.

## 4. Lap tracking and finish line
- Each course has a start/finish trigger authored in the level editor.
- The trigger is **non-solid**: ships pass through it without collision.
- Track valid crossings independently for each racer.
- Prevent repeated lap increments while a racer overlaps or oscillates across the trigger.
- Prefer a valid crossing direction, if supported by the editor.
- Display lap progress, e.g. `LAP 1 / 3`.
- Recommended internal model: `completed_laps = 0` at race start; each valid crossing increments it by one; finish when `completed_laps >= configured_lap_count`.
- The initial spawn on/near the line must not count as a completed lap.
- When a racer reaches the configured lap count, record finish time and mark them finished.

## 5. Weapon hits: non-lethal slow
- No weapon may kill or damage a racer in Race mode.
- A valid hit applies a `0.20` movement multiplier for `3.0` seconds.
- Repeated hits should refresh the 3-second timer but never slow below 20%.
- Restore normal movement when the timer expires.
- Apply the multiplier to effective movement/max speed, not by permanently overwriting base ship stats.
- This applies to Plasma, Missile and Guided Missile if those weapons can hit opponents.
- Keep normal combat damage/death behavior unchanged outside Race mode.

## 6. Remaining racers and elimination
- Normal combat is non-lethal.
- If only one racer remains who has not finished, that racer is eliminated and their ship explodes. This is a special race-resolution rule, not a weapon kill.
- Finished racers should no longer block, attack, or otherwise interfere with racers still competing.
- Define “remaining racer” using active, non-finished racers. Avoid a match state that can hang indefinitely.
- If an unusual state occurs (for example, all racers are eliminated without a finisher), resolve safely and log/debug the state.

## 7. Results and next race
When all racers have finished or been eliminated, show:
- Final placement.
- Player/racer identity.
- Finish time for finishers.
- Eliminated / did-not-finish status for others.
- Winner.
- Exact prompt: **`PRESS TO ENTER NEXT RACE`**

Use the existing confirm/fire input mapping to continue. Reuse the existing number-of-rounds setting and match flow. If the project has no overall round-scoring system, propose one and request approval rather than silently inventing scoring rules.

## 8. HUD
At minimum:
- Current lap / total laps.
- Current placement.
- Race timer.
- Finish state.
- Slow-effect indicator and remaining time.
- Current weapon and ammo or drift charge.

## 9. Acceptance criteria
- Race can be selected without breaking existing modes.
- All ammo starts at zero and drifting is disabled.
- Valid finish-line crossings update each racer's lap count once.
- Completing the target laps records a finish time.
- Weapons are non-lethal and apply the 3-second slow.
- Pickups grant only the item allowed by rank.
- Pickups respawn after 5 seconds.
- Results show placements/times and `PRESS TO ENTER NEXT RACE`.
- Existing modes pass regression tests.
