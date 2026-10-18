# Race Mode — Level Editor Requirements

## 1. General
Race tracks are custom-built. Add Race tools to the existing level editor if one exists; do not build a separate editor before inspecting the project.

## 2. Start/finish-line tool
Add a button/tool to place and edit the start/finish trigger.

Requirements:
- Visible in the editor and editable after placement.
- Non-solid; it must never block ships.
- Detect valid crossings independently for each racer.
- Supports a line segment or polygon/rectangular trigger area.
- Can be moved, resized, edited and deleted.
- If crossing direction is supported, make it visible and configurable.
- One primary start/finish trigger per course in the first implementation unless the existing level format requires otherwise.
- Do not add it to solid wall/collision geometry.

## 3. Polygon mode
Provide a polygon tool so the designer can draw a thin line-like region or a rectangular trigger area. Reuse existing editor geometry capabilities where possible. The shape is a logical trigger, not a physical obstacle.

## 4. Crossing data
The trigger needs geometry (endpoints or polygon points), optional preferred crossing direction, and per-racer previous-side/inside state. Lap count belongs to each racer’s race state; do not use one shared “already crossed” flag for all players.

A crossing should transition from one side to the other or from outside to inside. A cooldown/debounce may be a secondary safeguard, but should not be the only detection method.

## 5. Powerup placement tool
Add a dedicated button/tool for placing powerup spawn points:
- Click a location to place a round pickup spawn.
- Points can be moved and deleted.
- Save/load points with the level.
- Pickups are active at race start.
- Collected pickups disappear for 5 seconds and respawn at the same location.
- The spawn point is generic: the pickup result is selected by catch-up tier at collection time, not fixed to a weapon type.

## 6. Course data and validation
Persist:
- Start/finish geometry.
- Optional crossing direction.
- Powerup spawn locations.
- Optional route checkpoints for ranking if added.
- A version/schema marker if supported by the existing level format.

Race data must be optional so existing non-Race levels continue loading.

Warn if a Race course has no finish trigger, an invalid lap count, or a pickup outside level bounds. Do not silently invent a finish line.

## 7. Editor acceptance tests
- Start/finish trigger can be placed, moved, edited and deleted.
- Pickup points can be placed, moved and deleted.
- Save/close/reopen preserves all Race data.
- Trigger never blocks ships.
- Existing levels still load.
