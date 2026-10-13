# 05 — Föreslagen arkitektur för GameMaker Studio 1.4

Detta är en målbild. Implementera inte alla delar på en gång.

## Grundprinciper

- En tydlig huvudloop och tydligt ansvar per objekt.
- Håll data separerad från beteende där det är praktiskt.
- Undvik att duplicera spelregler för varje skepp.
- Håll GMS 1.4-kompatibilitet: använd inte modern GML-syntax från senare versioner.
- Bygg först den minsta verifierbara prototypen.

## Föreslagna objekt

| Objekt | Ansvar |
|---|---|
| `obj_game` | Matchtillstånd, initiering och övergripande uppdatering |
| `obj_player` | Spelarinput, skeppstillstånd och spelaridentitet |
| `obj_projectile` | Standardprojektiler |
| `obj_special_weapon` | Specialvapen som skiljer sig från standardprojektiler |
| `obj_wall` | Väggar/hinder och kollisionsgeometri |
| `obj_camera` | Beräkning av vy och dynamisk zoom om det behövs separat |
| `obj_hud` | Energi, ammunition, liv och spelarindikatorer |
| `obj_menu` | Menyflöde och val |
| `obj_powerup` | Framtida pickup-system, inte nödvändigt i första prototypen |

Namnen är förslag, inte befintliga objekt.

## Föreslagna skriptmoduler

- `scr_input_read(player_id)`
- `scr_ship_update(player_id)`
- `scr_weapon_fire(player_id, weapon_id)`
- `scr_collision_resolve(instance_id)`
- `scr_camera_update()`
- `scr_hud_draw()`
- `scr_ship_data_load(ship_id)`

GMS 1.4 har äldre språk- och resursbegränsningar. Anpassa signaturerna till det faktiska projektet och undvik att anta att senare GML-funktioner finns.

## Dataformat för nytt innehåll

Först när formatet har valts ska vi använda ett faktiskt schema. Möjliga fält för ett framtida skepp:
- `id`, `display_name`
- vektorform/linjesegment
- storlek och rotationspunkt
- acceleration, maxhastighet, rotationshastighet
- energi och liv
- antal och positioner för vapenpods
- tillgängliga specialvapen

Alla värden behöver enheter, standardvärden och intervall. Hårdkoda inte påhittade värden som om de kom från originalet.

## Tillgångar och versionering

- Originalfiler: `original/` — skrivskyddade.
- Nya grafik-/ljudresurser: GameMaker-resurser eller `assets/`.
- Dokumentation: `docs/`.
- Testfall och testresultat: `tests/`.
- Ändringshistorik: `CHANGELOG.md`.
- Arkitekturbeslut: `docs/10_DECISIONS.md`.

## Framtida redigerbarhet

Målet är att nya skepp, powerups och banor ska kunna skapas med data och resurser utan att röra kärnlogiken varje gång. Om GMS 1.4:s verktyg eller filformat gör en del av detta opraktiskt, dokumentera avvägningen innan lösningen byggs.
