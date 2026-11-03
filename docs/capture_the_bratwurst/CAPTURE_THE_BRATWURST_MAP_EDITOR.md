# Capture the Bratwurst — Map Editor Requirements

## Purpose
Extend the existing map editor only as much as required to author the objective spawn and team delivery zones. First inspect the editor, map metadata, save/load format, and existing shape tools.

## Required map elements
1. **Sausage Spawn** — exactly one authored world/map position; used for initial spawn and after each score.
2. **Red Team Delivery Zone** — a rectangular or polygonal trigger area, identified as Red's base.
3. **Blue Team Delivery Zone** — a rectangular or polygonal trigger area, identified as Blue's base.

Zones are non-solid. They must never block, push, or physically collide with ships. A carrier scores only in the opposing team's zone.

## Editor workflow
Add editor tools consistent with existing conventions to:
- Place and move the sausage spawn.
- Create, select, move, resize, and edit the Red Team zone.
- Create, select, move, resize, and edit the Blue Team zone.

Reuse existing rectangle/polygon tools if possible. A rectangle is acceptable if polygon editing is not already supported. Clearly distinguish the spawn marker and both zones in the editor. Editor overlays must not become solid gameplay geometry.

## Persistence and validation
- Save and load all three elements with the map.
- Preserve data when a map is edited and saved again.
- Validate exactly one sausage spawn and both team zones before starting this mode.
- If required data is missing or invalid, show a clear error and prevent this mode from starting with broken objective data.
- Do not silently invent coordinates or generate missing zones.
- Preserve compatibility with existing maps and other modes. If map format changes are needed, make the smallest compatible change.

## Zone rules
- Zones are trigger areas only.
- Red carrier entering Blue zone scores for Red; Blue carrier entering Red zone scores for Blue.
- Own-team zone entry never scores.
- Uncarried sausage and ships without the sausage cannot score.
- Ensure fast movement across a zone is detected using the project's existing collision/trigger conventions.

## Acceptance checks
- Exactly one spawn can be placed.
- Both zones can be edited and retain team identity.
- Data survives save/close/reload.
- Zones do not block ships.
- Missing data gives a useful validation message.
- Existing maps and modes remain unaffected.
