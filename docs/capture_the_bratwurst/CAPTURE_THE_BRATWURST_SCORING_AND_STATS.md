# Capture the Bratwurst — Scoring, Timer, Statistics, and Results

## Settings
Use existing mode settings conventions. Required defaults:

| Setting | Default | Description |
|---|---:|---|
| Score Limit | 5 | A team reaching this score ends the round. |
| Round Time | 5 minutes | If time expires first, the higher score wins. |
| Number of Rounds | Existing configured value, if available | Number of rounds before the match ends. |

Reuse an existing round-count setting if available; do not add a duplicate.

## Score event
A valid delivery adds exactly 1 point. Kills do not award points. The round ends if the new score reaches the score limit, subject to the scoring presentation/transition conventions.

## Score sequence
1. Add one point.
2. Show `RED TEAM SCORES!` or `BLUE TEAM SCORES!` for 3 seconds.
3. Show a large centered countdown from 3 to 0.
4. At 0, respawn the sausage at its authored spawn point and play the 1-second spawn animation.
5. Resume play if the round has not ended.

Do not reset scores, round timer, kills, or carry-time totals on an ordinary score reset. Prevent multiple scoring events during one delivery.

## Round timer
- Default: 5 minutes.
- Start when active round gameplay begins.
- The timer continues through normal score presentation unless the existing game has a clear convention to pause it; document whichever behavior is implemented.
- The round ends when the score limit is reached or time expires.
- At time expiry, higher score wins. If tied, use an existing tie-breaker or show a draw.

## Statistics
Track for every player, per round:
- Kills.
- Cumulative time carrying the sausage, in seconds.

Carry time starts at pickup and stops at drop, delivery, or round end. If the same player carries it multiple times, sum all intervals. Never double-count time or count time while the sausage is uncarried.

Use existing kill attribution if available. Prevent duplicate kill counts. Kills are shown in statistics only and never add to team score.

## Round results screen
Show:
- Winning team or draw.
- Final Red/Blue score.
- Kills per player and the player(s) with most kills.
- Total carry time for each player, displayed consistently (seconds or `M:SS`).
- Whether another round remains.

Example text is illustrative only: `RED TEAM WINS THE ROUND!`, `RED 5 — BLUE 3`, `MOST KILLS: Player 2 — 12`. Use actual player labels and values from the game.

## Round/match progression
- Reuse the existing number-of-rounds setting if available.
- At the next round, reset per-round scores, timer, kills, carry times, carrier, and objective state.
- Preserve match-level round wins.
- Respawn the sausage at its authored point with its normal animation.
- After the final configured round, show the overall match result. Use existing conventions, or total round wins with a clear tie result if no convention exists.
