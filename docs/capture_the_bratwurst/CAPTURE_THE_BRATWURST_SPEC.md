# Capture the Bratwurst — Game Mode Specification

## 1. Overview
**Capture the Bratwurst** is a team-based mode inspired by Neutral Flag / One Flag CTF. The map contains one neutral sausage objective. The existing **Capture the Bratwurst** entry under **Game Modes** already exists; connect it to this implementation instead of adding a duplicate.

Each map must define:
1. One sausage spawn point.
2. One Red Team delivery zone.
3. One Blue Team delivery zone.

Delivery zones are editor-drawn trigger areas, not solid geometry. Ships can pass through them without being blocked.

## 2. Objective and scoring
- Teams are Red and Blue.
- Exactly one sausage exists at a time.
- Any eligible ship can pick up an uncarried sausage by touching it.
- Red scores by delivering the sausage into the Blue Team zone; Blue scores by delivering it into the Red Team zone.
- Entering one's own team's zone does not score.
- A valid delivery awards exactly 1 point, once per delivery. Prevent repeat scoring while overlapping a zone.

## 3. Spawn animation and idle rotation
Whenever the sausage spawns at its authored point:
- Begin invisible or at effectively zero scale.
- Rotate rapidly while scaling up to normal size.
- The animation takes exactly 1 second.
- Normal size is approximately that of a medium-sized ship.
- After the animation, rotate at one full revolution every 4 seconds.
- Keep timing independent of frame rate using the project's existing time-step conventions.

The sausage should not be pickable up until its spawn animation has completed.

## 4. Carrying
- Touching an available sausage makes the ship its carrier.
- The sausage follows behind the ship like a short tail, with enough separation that both remain visible.
- Use a stable trailing position based on the ship's position/orientation and the project's coordinate conventions.
- Carrying should not change ship movement or combat behavior unless required by existing rules.
- Only one ship may carry the sausage at a time.

## 5. Damage reaction
When the carrier takes actual damage from a shot or missile:
- The carried sausage rotates extra fast for 1 second.
- After 1 second, return to its normal carrying rotation speed.
- Another damaging hit refreshes the 1-second reaction timer; effects must not stack uncontrollably.
- Damage alone does not drop the sausage.

## 6. Carrier destroyed / dropped sausage
- When the carrier is destroyed, detach the sausage and make it neutral/unowned.
- Preserve the sausage's current velocity/momentum at the moment it detaches, so it continues moving rather than teleporting.
- The dropped sausage can be picked up by either team.
- Use existing world movement/collision conventions where applicable; do not create a new physics system unnecessarily.
- Never leave the sausage attached to a destroyed instance.

## 7. Scoring presentation and reset
After a valid delivery:
1. Award 1 point to the carrier's team.
2. Display a large message: `RED TEAM SCORES!` or `BLUE TEAM SCORES!`.
3. Keep the message visible for 3 seconds.
4. Show a large centered countdown: `3`, `2`, `1`, `0`.
5. At 0, respawn the sausage at its authored spawn point and play the 1-second spawn animation.
6. Resume the same round, unless the score limit has ended it.

This is not a new round. Do not reset the timer, team scores, kills, or accumulated carry-time statistics during a normal score reset. Prevent pickup/scoring during the announcement/countdown. Reuse the game's existing pause/transition conventions where possible.

## 8. Round and match end
A round ends when a team reaches the configured score limit or the round timer expires.
- Default score limit: **5 points**.
- Default round duration: **5 minutes**.
- Both settings must be configurable through the existing settings/menu conventions.
- Reuse an existing round-count setting if one exists.

At time expiry, the higher-scoring team wins. If scores are tied, use an existing project tie-breaker if available; otherwise show a draw. At round end, stop gameplay and scoring, then show the round results.

## 9. Statistics
Track per round:
- Team scores.
- Kills per player.
- Total seconds each player carried the sausage.

Carry time begins at pickup and stops when the sausage is dropped, delivered, or the round ends. Repeated carrying periods accumulate for that player. Do not count time for two players simultaneously or count time while uncarried.

Kills are statistics only; they do not award points. Reuse the existing kill attribution system and prevent double-counting.

## 10. Results and round progression
The round results screen shows:
- Winning team or draw.
- Final Red and Blue scores.
- Kills per player, clearly highlighting the player(s) with the most kills.
- Total sausage-carry time per player, in seconds or `M:SS`.
- Whether another round remains.

After a round, proceed according to the configured number of rounds. Reset per-round timer, scores, kills, carry time, carrier, and objective state. Preserve match-level round wins. After the final round, show the overall match result using existing match conventions; if none exist, use total round wins and handle an overall tie clearly.

## 11. Reliability
- Resolve simultaneous pickups to one carrier.
- Validate the carrier and detach safely if its ship is destroyed or removed.
- Only a carrier entering the opposing team's zone can score.
- Prevent duplicate score events.
- Do not allow scoring during spawn animation, score reset, or after round end.
