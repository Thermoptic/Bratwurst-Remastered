# GMS 1.4-prototyp — Fas 1

**Status: KÖRD I GMS 1.4 (2026-10-13, användarens test): startar, ritar bana + skepp, spelas utan felmeddelanden.** Detaljerade beteendetester (PHY/COL/WPN/CAM) återstår.

*(Äldre text:)* Projektet är skrivet för hand i GMS 1.4:s `.gmx`-format och GML-logiken är rimlighetskontrollerad med en Python-spegling (`tools/proto_sim.py`), men **ingen GameMaker-kompilering eller körning har gjorts** (kommandoradskompilering av GMS 1.4 gav ingen utdata och hängde sig; avbröts). Öppna projektet i GMS 1.4 och rapportera eventuella kompileringsfel — se "Testa" nedan.

## Öppna
`gms/Bratwurst.gmx/Bratwurst.project.gmx` i GameMaker Studio 1.4 (`D:\program\GameMaker-Studio14`) → F5 (Run).

## Vad prototypen innehåller
- Vektorskepp ritade ur de 15 `.SOB`-filerna (data genererad av `tools/gen_gms_data.py`; byt skepp med **F3** (spelare 1) / **F4** (spelare 2)).
- Originalets rörelse: accelererande sväng, thrust, gravitation, hastighetsproportionellt motstånd, 24.8-fixpunkt, 256 vinkelsteg, fysiktabeller (sin/cos × 20/32).
- Kanonskott från alla pods (ammo, RELOAD), skottgravitation, bort utanför skärm/vägg, träff = −1 energi och knuff.
- Banan som 68 vektorväggar; väggkrasch (skada ∝ fart², återställning, v = −v/4).
- Energi (P3), 6 liv, respawn på originalets startpositioner; sista överlevande vinner (2 spelare).
- Kamerans zoom enligt originalets formel (alla levande spelare), skärm 320×256 ritad i skala 2.
- **Specialvapen (Fas 2, ej körda ännu):** MISSILE, GUIDED MISSILE, TURBO BOOST, TRACTOR BEAM, CANNON TURRET enligt kodverifierade regler (`docs/15` steg 5): tillgänglighet per skepp ur `.SOB`, ammo = P10·tabell, nedräkning 40/100/20/0/3 ticks, skada −12/−5, max 16 objekt. Vapen och pod väljs i skeppsvalsmenyn.
- **Skeppsvalsmeny (Fas 2, ej körd):** spelet startar i skeppsvalet. Flöde enligt originalet: SHIP → SPECIAL WEAPON → (pod) → IS THIS OK? YES/NO → "PLAYER … IS READY TO EAT/ROCK/SWIM/SNEEZE" (texterna finns i originalets exe); matchen startar när alla aktiva spelare är redo. Navigering: upp/ner byter rad (SHIP, WEAPON, POD, CONFIRM), vänster/höger ändrar värdet på raden, fire (OK) går till nästa rad och bekräftar på CONFIRM, thrust-knappen går tillbaka en rad (spelare 1: piltangenter, Enter = OK, mellanslag/höger Ctrl = tillbaka; spelare 2: WASD, E = OK, vänster Shift = tillbaka; spelare 3: IJKL, U = OK, O = tillbaka; Xbox: D-pad/vänster spak, A = OK, X = tillbaka). Ledig plats: spelarens upp- eller OK-knapp ansluter spelaren. Roterande skeppsförhandsvisning, tillgängliga vapen och valbar pod visas. Layout/färger/pod-steget är placeholders.
- Inte med: huvudmeny, Options (grid/extra lines), ljud/musik,  riktiga explosionspartiklar.

## Terminal-UI (Fas 3, ej körd)
Flöde: titelskärm → huvudmeny (Game modes / Options / Controls / Quit) → skeppsval → match. Esc = ett steg tillbaka (match/skeppsval → huvudmenyn, huvudmeny → titel, titel → avsluta). Menyn styrs med pilar/WASD, Enter/Space/Z = OK, Esc/Backspace/X = tillbaka eller gamepad (D-pad/vänster spak, A/Start = OK, B = tillbaka). Inställningar sparas i `settings.ini`, temafärger i `themes.ini` (GMS 1.4:s sparmapp; sökvägen visas i Options → DATA FOLDER). Se `docs/10_DECISIONS.md` D-016. Rummet är 1024×640; Text ritas med typsnittsresurserna `fnt_*_k*` (Cascadia Mono, OFL; `tools/gen_gms_fonts.ps1`) via `scr_ui_dt`, 1:1 mot skärmpixlarna för UI-skala 1/1,5/2/3 (`scr_display_apply`), så allt är skarpt.

## Banor och banredigerare (ej körd)
Banor ligger i `levels.ini` i spelets sparmapp (D-019). Tre inbyggda banor skrivs vid första start. Game Modes → MAP väljer bana, MAP EDITOR öppnar redigeraren: B rektangel (klicka två hörn), P polygon (klicka punkter, Enter eller första punkten sluter), X radera (klicka på en vägg), T startplats (1–4 väljer, klicka placerar, Q/E eller mushjulet vrider), G rutnät 25/50/100, U ångra, S spara (fönster med namn och spellägen), N ny bana, L laddar en bana ur en lista (namn och vilka spellägen den finns i), [ ] eller PageUp/PageDown byter bana, Del (två gånger) tar bort bana, Esc ut. Alla former är solida väggar. Banformat: se D-019 eller öppna `levels.ini`.

## Kontroller (PLACEHOLDER — originalets mappning är okänd)
| | Spelare 1 | Spelare 2 |
|---|---|---|
| Sväng | ←/→ | A/D |
| Kanon | ↑ | W |
| Thrust | Mellanslag / Höger-Ctrl | Vänster-Shift |
| Special | ↓ | S |

**Xbox-kontroll** (kontroll 1 = spelare 1, kontroll 2 = spelare 2; fungerar parallellt med tangentbordet; samma placeholder-mappning):
| Funktion | Knapp |
|---|---|
| Sväng | Vänster spak ←/→ eller D-pad ←/→ |
| Kanon | A |
| Specialvapen | Y |
| Aktivera/avfyra hållen powerup (Mini Nuke: tryck; Railgun: håll inne och släpp) (t.ex. Mini Nuke; tangentbord spelare 1 V, spelare 2 F, spelare 3 M) | B |
| Thrust | X eller höger trigger (RT) |
| **Under matchen:** nästa skepp (test) | RB (höger axelknapp) |
| **Under matchen:** nästa specialvapen | Back |
| **Under matchen:** DRIFT (håll inne medan du gasar; tangentbord: spelare 1 C, spelare 2 Q, spelare 3 H) | LT (vänster trigger) |
| **Under matchen:** nästa specialpod (position på skeppet, t.ex. fram/bak) | LB (vänster axelknapp) |
| Pausmeny under matchen (Resume Game / Quit to Menu) | Start |
| Skeppsvalet: bläddra / bekräfta | Vänster spak eller D-pad ←/→ / A |

**4 spelare:** spelare går med i skeppsvalet med sin eld-/upp-knapp, eller ställ in antalet i Game modes → Players (3–4 spelare visas i ett 2×2-rutnät). Spelare 3 tangentbord (placeholder): J/L sväng, I kanon, K special, O thrust; spelare 3–4 kan också styras med Xbox-kontroll 3 och 4; spelare 4 har ingen tangentbordsstyrning (originalets fyrspelaradapter). Alla fyra startpositioner och kameran över alla levande spelare finns.

F1 debugtext (med tangenthjälp) · F2 tillbaka till skeppsvalet · Esc pausmeny under match, annars tillbaka till huvudmenyn.

## Rättigheter
`scr_data_*.gml` är **härledd data ur originalet** (skeppsgeometri, bana, tabeller). Publicera/distribuera inte projektet förrän rättighetsfrågan är löst (`docs/09`). Själva logikskripten är egen kod.

## Avvikelser från originalet (alla dokumenterade i skripten som PLACEHOLDER)
- 1 tick per rumssteg (originalet kör "förlorade tick" som extra steg).
- Kollision i världsrymd (segmentskärning, punkt-i-polygon) i stället för originalets skärmbitmappar.
- Skeppet antas vara fyllt för träfftest.
- Endast levande spelare styr kameran.

## Strukturen
`scripts/`: `scr_config_init` (alla konstanter), `scr_data_*` (genererat), `scr_game_*` (loop/rita), `scr_camera_update`, `scr_player_*`, `scr_shot_step`, geometri (`scr_seg_intersect`, `scr_point_*`). Objekt: `obj_game` (Create/Step/Draw anropar scripts), `obj_player`, `obj_shot` (inga egna events). Rum `rm_arena` 640×512, 50 steg/s (placeholder; tickfrekvens okänd).

## GMS 1.4-egenheter som upptäckts (viktigt för framtida kod)
- Projektfilen kräver mappprefix: `<object>objects\obj_x</object>`, `<room>rooms
m_x</room>`; tomt `<constants>`-element ger fel (utelämnas).
- `global.namn[variabel]` fungerar **inte** (fel "trying to index a variable which is not an array"). Använd `globalvar g_namn;` (deklareras i `scr_config_init`) och `g_namn[i]`.
- GML-filer ska vara ren ASCII (generatorn translittererar å/ä/ö).

**Powerups (nytt):** Game modes → Classic/Astro Duel → POWERUPS ON/OFF (standard ON). 5 s efter rundstart dyker en färgbytande orb upp på kartan; flyg in i den för att få en powerup (nu Mini Nuke) och avfyra den med B (gamepad). En ny orb kommer 10 s efter upplockning. Hemlig Powerup Editor: öppna Options och tryck P, så visas raden POWERUP EDITOR längst ned, med storlek, fart, chockvåg, partiklar och skada för varje powerup.
