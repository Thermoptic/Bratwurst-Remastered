# Changelog

Alla betydande projektändringar dokumenteras här.

## 2026-10-13 — Första dokumentationspaketet
- Skapade projektbeskrivning och instruktioner för Claude Code.
- Inventerade innehållet i `Bratwurst_Decomp.zip`.
- Dokumenterade kända gameplay-funktioner från `Bratwurst.doc`.
- Identifierade 15 binära `.SOB`-skeppsfiler.
- Dokumenterade tekniska risker, testplan, roadmap, rättighetsfrågor och öppna beslut.
- Ingen originalfil har avsiktligt ändrats.

## 2026-10-13 — Fas 0-analys: exe och .SOB
- Verifierade SHA-256 mot `docs/12_SOURCE_CHECKSUMS.md` (alla matchar).
- Analyserade exe-hunkstruktur, strängar, inbäddad ProTracker-modul och specialvapen (`docs/13_EXECUTABLE_ANALYSIS.md`).
- Hittade filinkonsekvens/skräp i exe (hunk 2/3, 1 024 B tail).
- Avkodade `.SOB`-layout strukturellt för 15/15 filer (`docs/06_SOB_FORMAT_RESEARCH.md`); fältsemantik delvis OKÄND.
- Nya: `tools/sob_dump.py`, `analysis/ships_raw.json`, `analysis/ships_sheet.svg`, `docs/13`, `docs/14`.
- Uppdaterade docs 02, 03, 06, 09, 10, 11, 07, README. Ingen originalfil ändrad.

## 2026-10-13 — Ghidra-disassemblering av hunk 0
- Laddade ner Ghidra 12.1.4 + Temurin JDK 21 till `E:\Games\Bratwurst_Decomp\_tools\` (användarens godkännande).
- Disassemblerade hunk 0 delvis (~25 kB kod): skeppsladdare, sinustabell, packad S404-payload. Se `docs/15`, `tools/ghidra/`, `analysis/ghidra/`.
- Fysik/vapen/zoom ej ännu spårade.

## 2026-10-13 — Ghidra steg 1–3
- Steg 1: `tools/s404_unpack.py` packar upp StoneCracker 4.10-payloaden (78 108 B planar bitmapdata).
- Steg 2: `tools/build_flat_image.py` bygger relokerad minnesavbild; Ghidra körs på den (`tools/ghidra/ExportFlat.java`): 8 692 instruktioner / 179 funktioner.
- Steg 3: tidigare "sinustabell" visade sig vara ProTracker-replayer; verklig fysik (sväng, thrust, motstånd, gravitation, studs, skott) och 256-stegs sin/cos-tabeller kartlagda. `docs/15` omskriven. Hypotes om P0–P8 i `docs/06`.

## 2026-10-13 — Steg 4: .SOB-laddning och zoom
- Hittade och avkodade spelets .SOB→struktur-rutin (0x11f3e): bekräftade P0–P8, P9/P10, vapentillgänglighet (P11+) och pod-flaggor. Korrigerade block A-ordningen. `tools/sob_dump.py` uppdaterad (`weapons`, `selectable_pods`, fältnamn).
- Hittade kamerans zoomformel (0x2ac4) och gridfade. `docs/15`, `06`, `03`, `11` uppdaterade.

## 2026-10-13 — Steg 5: skada, liv, skott, specialvapen, bana
- Kartlade i koden: tidsstegsloop, 6 liv/död/respawn/startpositioner, skada (krasch, kanon −1, missil −12, guidad −5), kanonskott, alla fem specialvapen med nedräkningar, **banan = 68 vektorlinjer** (extraherad till `analysis/arena_walls.*`, privat). `docs/15`, `03`, `11` uppdaterade.

## 2026-10-13 — Fas 1: GMS 1.4-prototyp (ej körd)
- Nytt GMS 1.4-projekt `gms/Bratwurst.gmx` (25+ scripts, 3 objekt, 1 rum) med skepp ur `.SOB`, originalfysik, kanon, bana, kamerazoom, liv/energi; `gms/README.md`.
- Nya verktyg: `tools/gen_gms_data.py`, `tools/proto_sim.py`.
- Upptäckt: fysiktabellerna och gravitationen skalas vid start (amplitud 160, gravitation 31/15) — `docs/15` korrigerad, prototypen följer det.
- Försök att kompilera GMS 1.4 från kommandoraden hängde sig (D-013); inget har körts i GameMaker.

## 2026-10-13 — Prototypen körs i GMS 1.4
- Fixade projektfil (mappprefix, constants), globala arrayer (`globalvar g_*`) och ASCII-kodning. Användaren bekräftar att spelet startar och går att spela; se `gms/README.md` (GMS 1.4-egenheter) och `docs/08`.

## 2026-10-13 — Fas 2: specialvapen (ej körda)
- Implementerade MISSILE, GUIDED MISSILE, TURBO BOOST, TRACTOR BEAM, CANNON TURRET (scripts `scr_special_*`, `scr_missile_step`, `scr_nearest_player`, `scr_fx_spawn`; objekt `obj_missile`, `obj_fx`), HUD-rad och podmarkering; rummet höjt till 560 px. Se `gms/README.md`, `docs/08`, `D-014`.

## 2026-10-13 — Xbox-kontroll
- Gamepad-stöd (XInput via GMS 1.4 gamepad_*) för spelare 1–2, parallellt med tangentbordet; se `gms/README.md`. Ej körd.

## 2026-10-13 — Omkartad Xbox-mappning
- Kanon = A, special = B, thrust = X eller RT, byt vapen = Y, byt pod = LT (spak/D-pad endast sväng).

## 2026-10-13 — Skepp står stilla vid spawn
- Gravitation/motstånd hoppas över så länge ett skepp har hastighet 0 och inte trycker thrust (placeholder; originalet tillämpar gravitation direkt — OKÄNT om skepp faller vid start).

## 2026-10-13 — Fas 2: skeppsvalsmeny (ej körd)
- Menyflöde SHIP → SPECIAL WEAPON → pod → IS THIS OK? → READY (scripts `scr_menu_*`, `scr_sel_pod*`, `scr_weapon_*`); tangent-/knappvalet av vapen under matchen borttaget. F3/F4/LB/RB (byt skepp) ersatta av menyn.

## 2026-10-13 — Fyra spelare (ej körd)
- Skeppsvalet visar 1–4 spelare (2×2-rutnät för 3–4), F5/Back cyklar 1→4, spelare 3 har tangentbord (J L I K O), alla fyra kan styras med Xbox-kontroll; HUD anpassad för fyra kolumner.

## 2026-10-13 — Kanon bara framåt som standard
- Bakåtpekande kanonpods är låsta (`rear_fire = false`, `pod_rear[]`); powerup ska låsa upp senare (D-015). Avviker från originalet (alla pods skjuter). Ej körd.

## 2026-10-13 — Testknappar under match (ej körda)
- Xbox RB byter skepp under matchen (behåller position/hastighet/liv, återställer energi/ammo), LB byter vald specialpod; ny `scr_player_load_ship`, `scr_player_change_ship`.

## 2026-10-13 — Fas 3: terminal-UI, teman och inställningsfiler (ej körd)
- Titelskärm (Bratwurst - Reheated / Press Start to heat), huvudmeny i command-deck-stil (Game modes, Options, Controls, Quit), skeppsval med "join" på ledig plats, matchpaneler (P1/P2 sida, P3/P4 under spelytan). Se D-016, `gms/README.md`.
- 30 Base16-teman (`tools/gen_gms_themes.py` → `scr_data_themes.gml`), tema/accent/fönster/vsync/scanlines/glow i Options; sparas i `settings.ini` och `themes.ini`.
- Rummet 1024×640; Esc går nu till huvudmenyn (tidigare: avsluta). Ej körd i GMS; kompilering kunde inte göras här.


## 2026-10-13 — Bugfix: liv per spelare
- Kompileringsfel i GMS (`lives` är en inbyggd global och kan inte användas som `p.lives`). Orsaken visade sig vara att prototypen redan delade en enda global `lives`-räknare mellan alla spelare. Bytt till instansvariabeln `p_lives` (scr_player_init/step, scr_shot_step, HUD): varje spelare har nu egna 6 liv (D-012: liv var avsett att vara per spelare, kod 0x34ca).

## 2026-10-13 — Bugfix: osynlig text i UI
- Användartest: ramar och staplar syntes men ingen text. `font_add("Consolas")` ersatt av standardtypsnittet med skalfaktorer (`scr_font_init`, `scr_ui_dt`). Dessutom bytta variabelnamn som krockade med inbyggda namn (`frac`, `lives`).

## 2026-10-13 — Matchpaneler längs nederkanten
- Alla spelarpaneler ligger nu i en rad under spelytan och delar bredden lika (1–4 paneler, 12 px marginaler och mellanrum). Sidopanelerna och SYS/KEYS-rutorna är borttagna; tangenthjälp flyttad till rubrikraden (`scr_hud_draw`, `scr_hud_panel`). Ej körd.

## 2026-10-13 — Skarp bild: vektorteckensnitt och native-upplösning
- Användartest: allt suddigt. Text byttes från bitmapptypsnitt till eget linjeritat teckensnitt (`scr_font_init`, `scr_vf_add`, `scr_ui_dt/tw/wrap`), och rummet har nu en vy (`view_*[0]`) som sätts efter fönster/skärm (`scr_display_apply`, `surface_resize(application_surface)`), så linjer och text rastreras i fulla upplösningen. Ej körd.

## 2026-10-13 — Riktigt typsnitt (Cascadia Mono)
- Det egna linjeteckensnittet var hackigt och ersätts av typsnittsresurser i Cascadia Mono (SIL OFL 1.1): `tools/gen_gms_fonts.ps1` renderar glyfatlaserna, `gms/Bratwurst.gmx/fonts/`. `scr_vf_add` borttagen. Ej körd i GMS.

## 2026-10-13 — Pixelperfekt text
- Ojämna bokstäver berodde på att 2×-atlaser ritades med skala 0,5 (och på fraktionella positioner). Nu finns 16 typsnittsresurser (4 storlekar × UI-skala 1/1,5/2/3); UI-skalan väljs av fönster/skärm, vyn = skärm/k och texten ritas 1:1 med pixelsnappad position (`scr_font_init`, `scr_ui_dt`, `scr_display_apply`). Scanlines är nu 1 skärmpixel tjocka. Ej körd.

## 2026-10-13 — Layouten fyller hela vyn, bred spelyta
- `scr_layout_update`: titel, menyer, skeppsval och match lägger ut sig mot hela vyn; spelytan är lika bred som panelraden (widescreen, D-017) med alternativet Options → WIDE PLAYFIELD. Kamerans x-zoom och skottgräns följer `g_PLAY_W`. Ej körd.

## 2026-10-13 — Unika spelarfärger och borttagen rubriklinje
- `scr_theme_players` väljer fyra tydligt olika accentfärger ur varje tema (störst minsta färgavstånd mellan spelarna och mot bakgrunden); `scr_slot_colour` ger dem till skepp och spelarpanel (P1–P4). Linjen under rubrikraden är borttagen (`scr_ui_header`). Ej körd.

## 2026-10-13 — Ett steg tillbaka i skeppsvalet
- Thrust-knappen (gamepad X; tangentbord: P1 mellanslag/höger Ctrl, P2 vänster Shift, P3 O) backar ett steg i skeppsvalet (READY → IS THIS OK? → pod → vapen → skepp). `scr_menu_input` (`g_mi_back`), `scr_menu_step`. Ej körd.

## 2026-10-13 — Färgade väggobjekt
- Banans 68 vägglinjer grupperas till 11 objekt (sammanhängande linjer; `scr_arena_prepare`, `g_wall_grp`) och ritas i olika temafärger (`g_wcol`, satt i `scr_theme_players`; 80 % färg mot bakgrunden så att spelarskeppen syns tydligt). Följer temabyte. Ej körd.

## 2026-10-13 — Skepp mot skepp
- Kollision och knuff mellan spelare (`scr_ship_collisions`, `scr_ships_overlap`, `scr_ship_bounce`; D-018). Stillastående skepp puttas iväg, boostande skepp ger kraftigare knuff. Ej körd.

## 2026-10-13 — Byt specialvapen och pod under matchen
- Gamepad: LT växlar specialvapen (nästa tillgängliga, inkl. NOTHING; varje vapen har egen ammo, `scr_special_switch`, `sp_pool`), LB växlar pod (position på skeppet). Tangentbord: P1 Z/X, P2 E/R, P3 U/Y. Ej körd.

## 2026-10-13 — Specialpod som prick i panelen
- Vald specialpod markeras inte längre med en ring på skeppet i arenan; den visas som en liten prick på skeppsbilden i spelarens panel (`scr_ui_ship`, `scr_hud_panel`). Ej körd.

## 2026-10-13 — Banfiler och banredigerare
- Banor lagras i `levels.ini` (D-019). Tre inbyggda banor (Sirius Bratwurst = original, Kepler Chorizo, Proxima Merguez), MAP-val och MAP EDITOR under Game Modes, ny banredigerare (`scr_ed_*`, `scr_level_*`), `tools/gen_gms_levels.py`. Ej körd.

## 2026-10-13 — Spellägen i menyn
- Game Modes: CLASSIC (innehåller START = dagens match), ASTRO DUEL, RACE och CAPTURE THE BRATWURST (tomma platshållare, "COMING SOON"). PLAYERS, MAP och MAP EDITOR ligger kvar. Ej körd.

## 2026-10-13 — Menyomflyttning
- Players och Map ligger nu under Game Modes → Classic (efter Start); Map Editor ligger under Options. Game Modes innehåller bara de fyra spellägena. Ej körd.

## 2026-10-13 — Rundor och slutresultat
- Classic → ROUNDS (standard 3). Rundflöde (`scr_round_reset`, `scr_round_over_step`), rundvinster i panelerna och rubriken, resultatskärm med REMATCH / MAIN MENU (`scr_results_step/draw`). D-020. Ej körd.

## 2026-10-13 — Ljud ur originalet (utplockat, ej inlagt)
- `tools/amiga_audio.py` + `tools/extract_audio.py` plockar ut modulen (hunk 3), dess sampel och två sampelblock (hunk 2 och början av hunk 3) till `analysis/audio/` (OGG/WAV). Hunk-parsern klarar nu att exet är 512 B trasigt per hunk. Ej lyssnat på; inget inlagt i spelet än.

## 2026-10-13 — Ljudexport: normaliserad rendering
- Musikrenderingen klippte (gain 1,4); nu normaliserad till 90 % topp. Ljudfilerna verifierade som icke tomma (toppvärden och RMS > 0).

## 2026-10-13 — Titelmusik
- `music_module.ogg` (originalets inbäddade modul, renderad) ligger som ljudresursen `snd_title_music` (`gms/Bratwurst.gmx/sound/`) och spelas i loop på titelskärm, menyer, skeppsval, redigerare och resultat; stoppas under matchen (`scr_music_update`). Options → MUSIC slår av/på (`audio.music` i `settings.ini`). Härledd originaldata: privat repo (docs/09). Ej körd.

## 2026-10-13 — Bugfix: ingen musik
- Projektet använde den gamla ljudmotorn (`option_use_new_audio` = false), som inte kör `audio_play_sound`. Satt till true i `Configs/Default.config.gmx` (som i användarens andra projekt). Ej körd.


## 2026-10-13 — Originalets ljudeffekter
- Spårade ljudmotorn i originalkoden (docs/15) och lade in alla sju effekter på rätt händelser (D-021): kanonskott, missil, guidad missil, explosion, väggkrasch, skepp mot skepp, kanonträff. `tools/extract_sfx.py`, `scr_sfx_play`, Options → SOUND EFFECTS. Fynd: originalet har skepp-mot-skepp-kollision med hastighetsbyte. Ej körd.
