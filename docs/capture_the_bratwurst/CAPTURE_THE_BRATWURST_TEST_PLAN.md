# Capture the Bratwurst — Test Plan

Only mark a test passed after running it.

## A. Mode and isolation
- [ ] Existing Capture the Bratwurst menu choice launches the mode.
- [ ] No duplicate Game Modes entry is created.
- [ ] Other modes still launch and behave as before.
- [ ] Mode-specific settings do not unintentionally affect other modes.

## B. Map editor
- [ ] Exactly one sausage spawn can be placed.
- [ ] Red and Blue zones can be created, edited, saved, and loaded.
- [ ] Spawn and zones persist after closing and reopening the map.
- [ ] Zones remain non-solid in gameplay.
- [ ] Missing required data produces a clear validation error.
- [ ] Existing maps remain compatible.

## C. Spawn and rotation
- [ ] Sausage starts invisible/zero-scale and scales to medium-ship size over 1 second.
- [ ] It rotates rapidly during spawn.
- [ ] Idle rotation is one full turn every 4 seconds.
- [ ] Animation timing remains consistent at different frame rates.
- [ ] It cannot be picked up until the spawn animation finishes.

## D. Pickup and carry
- [ ] Touching an uncarried sausage picks it up.
- [ ] Only one carrier is possible.
- [ ] Sausage follows behind the carrier and remains visible.
- [ ] Carry behavior remains stable during turning and movement.
- [ ] Other ships cannot pick it up while carried.
- [ ] Own-team zone entry does not score.
- [ ] A ship without the sausage cannot score.

## E. Damage and destruction
- [ ] Damaging shots and missiles trigger 1 second of fast rotation.
- [ ] Rotation returns to normal after 1 second.
- [ ] Further hits refresh the reaction timer without stacking uncontrollably.
- [ ] Damage alone does not drop the sausage.
- [ ] Carrier destruction detaches the sausage.
- [ ] Dropped sausage preserves its current momentum.
- [ ] Either team can pick up the dropped sausage.
- [ ] Destroyed ship instances are not retained as carrier references.

## F. Scoring
- [ ] Red carrier in Blue zone awards Red one point.
- [ ] Blue carrier in Red zone awards Blue one point.
- [ ] Each delivery awards exactly one point.
- [ ] Correct large scoring message appears for 3 seconds.
- [ ] Centered countdown shows 3, 2, 1, 0.
- [ ] Sausage respawns at its authored point at 0 and animates for 1 second.
- [ ] Score, timer, kills, and carry times are preserved through ordinary score resets.
- [ ] Play resumes after reset unless the round has ended.
- [ ] Reaching score limit ends the round correctly.

## G. Settings and timer
- [ ] Default score limit is 5.
- [ ] Default round duration is 5 minutes.
- [ ] Both values are configurable.
- [ ] Round ends at score limit or timer expiry.
- [ ] Higher score wins when time expires.
- [ ] A tie follows the documented tie rule.
- [ ] Timer behavior during score presentation is consistent and documented.

## H. Statistics
- [ ] Kills are counted for stats but do not add points.
- [ ] Kill attribution is correct and kills are not double-counted.
- [ ] Carry time starts at pickup and stops on drop, delivery, or round end.
- [ ] Multiple carrying intervals accumulate for the same player.
- [ ] Carry time is never counted for two players simultaneously.
- [ ] Every player’s carry time is shown.
- [ ] Player(s) with most kills are highlighted correctly.
- [ ] Per-round stats reset between rounds, not between ordinary scores.

## I. Rounds and edge cases
- [ ] Existing round-count setting is reused if present.
- [ ] New round resets timer, round scores, kills, carry time, carrier, and objective.
- [ ] Match-level round wins persist.
- [ ] Results appear after each round.
- [ ] Final match result appears after the configured number of rounds.
- [ ] Simultaneous pickup attempts resolve to one carrier.
- [ ] A dropped sausage overlapping a base does not score while uncarried.
- [ ] No scoring occurs during spawn, score reset, or after round end.
- [ ] Carrier destruction near a zone cannot cause a false score.
