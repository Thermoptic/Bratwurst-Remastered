# Race Mode — Powerups, Weapons, Drifting and Catch-up Balance

## 1. Starting state
- Plasma ammo: `0`
- Missile ammo: `0`
- Guided Missile ammo: `0`
- All other weapon ammo: `0`
- Drifting disabled.
- Drift meter unavailable until a Drift pickup is collected.
- No weapon can be fired before its pickup is collected.

## 2. Pickup behavior
- Pickups initially look like **round balls**.
- Pickup spawn points are placed in the level editor.
- All authored pickup points are active at race start.
- When collected, a pickup disappears for **5 seconds**, then respawns at the same location.
- A pickup can only be collected once during each active period.
- The pickup result is selected according to the collector's current race position at collection time.
- A pickup does not grant a permanent unlock.
- A new pickup replenishes the granted resource to its defined amount; do not stack unlimited ammo or drift charge.

## 3. Pickup grants

| Result | Grant |
|---|---|
| Plasma | Exactly 1 Plasma shot |
| Missile | Exactly 1 Missile shot |
| Guided Missile | Exactly 1 Guided Missile shot |
| Drift | Unlock drifting and grant one configured standard/full drift meter |

Firing consumes one shot. Drifting consumes the meter. In Race mode, the meter **does not recharge automatically**. A new Drift pickup is required to replenish it. If the player collects Drift while already unlocked, refill to the pickup grant amount instead of adding charge.

If the existing drift system automatically regenerates charge, disable that regeneration only in Race mode.

## 4. Speed penalty on weapon hit
- Apply movement multiplier `0.20` for `3.0` seconds.
- This is an 80% speed reduction.
- Do not stack the slow below 20%.
- Recommended repeat-hit behavior: refresh the timer to 3 seconds.
- Restore normal movement at timer expiry.
- No weapon may kill racers in Race mode.

## 5. Catch-up tiers

Evaluate the racer's rank at the moment they collect a pickup.

| Rank tier | Allowed result |
|---|---|
| 1st place / leader | Plasma only |
| Middle positions | Plasma or Missile |
| Last place | Drift or Guided Missile |

Randomly choose between the two allowed middle/last results with equal odds initially. The leader always receives Plasma. Never grant an item outside the racer's tier pool.

### Rank priority and player counts
Use this unambiguous classification:
- First = leader.
- Last = final active racing position among racers who have not finished.
- Middle = any active position neither first nor last.
- Last-place classification takes priority over middle.

Examples:
- **2 players:** 1st gets Plasma; 2nd/last gets Drift or Guided Missile.
- **3 players:** 1st gets Plasma; 2nd gets Plasma or Missile; 3rd gets Drift or Guided Missile.
- **4 players:** 1st gets Plasma; 2nd–3rd get Plasma or Missile; 4th gets Drift or Guided Missile.

This resolves the possible overlap between “2nd or 3rd gets medium weapons” and “last place gets the best weapons”: last place always gets the last-place pool.

## 6. Position calculation
Rank racers using race progress, not only straight-line distance to the finish:
1. Finished racers rank ahead of unfinished racers, ordered by finish time.
2. Unfinished racers are ordered by completed laps.
3. On the same lap, compare progress along the course/checkpoints if available.
4. If the project has no route-progress data, document the limitation and propose checkpoints or a simple temporary estimate. Do not treat Euclidean distance to the finish as a reliable final solution.

## 7. Pickup lifecycle and feedback
Suggested state machine: `ACTIVE -> COLLECTED/HIDDEN -> 5-second respawn timer -> ACTIVE`.

Show feedback such as `PLASMA ACQUIRED`, `MISSILE ACQUIRED`, `GUIDED MISSILE ACQUIRED`, or `DRIFT UNLOCKED`. HUD should show ammo/charge and the slow-effect timer. Pickup graphics must be visually distinct from the finish-line trigger.
