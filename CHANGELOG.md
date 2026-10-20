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

## 2026-10-13 — Bugfix: skott och missiler flög igenom väggar
- Kollisionen testade bara skottets slutposition per tick med en tolerans på en skärmpixel, så snabba skott (~20 px/tick) kunde hoppa över tunna väggar. Nu sveps hela rörelsen från förra tickens position mot väggarna (`scr_seg_hits_wall`, i `scr_shot_step` och `scr_missile_step`). Ej körd.

## 2026-10-13 — Gnistor vid träff och krasch
- Nytt partikelsystem (`scr_spark_burst/step/draw/clear`, pool om 400 partiklar): 2–3 enheter stora pixlar som flyger ut åt slumpade håll, bromsas och försvinner en och en efter slumpad tid (14–62 ticks). Vid kanonträff 6–9 gnistor i det träffade skeppets färg, vid missilträff 12–17, vid väggkrasch 2–40 beroende på hastigheten (fart/120) och med högre utgångsfart ju fortare man krockar. Ny visuell effekt, inte i originalet. Ej körd.

## 2026-10-13 — Ny titelmusik och equalizer som följer musiken
- Titelmusiken är nu användarens `RollingBreakbeat_loop_150bpm.ogg` (6,4 s loop, 150 bpm) i stället för renderingen av originalets modul (`snd_title_music`). Originalmodulens rendering ligger kvar i `analysis/audio/`.
- Equalizern på titelskärmen (värmebalken) och i menyn (SIGNAL) rör sig nu efter musiken: `tools/gen_music_viz.py` analyserar loopen i förväg (12 band, 50 rutor/s, `scr_data_musicviz`) och `scr_musicviz_update` läser upp raden vid musikens spelposition (`audio_sound_get_track_position`). Utan musik (avstängd/pågående match) används den gamla sinusrörelsen. Ej körd.

## 2026-10-13 — Spelläge Astro Duel
- Game Modes → Astro Duel är nu spelbart: ett liv per träff (LIFE 1–9), ingen väggskada, 3 skott + 4 s nedkylning, 30 % större projektiler, endast Missile (dubbel fart) och Turbo Boost. `g_game_mode`, `scr_proj_hit`, `scr_proj_radius`, `scr_mode_name`; panelen visar skott kvar, nedkylning och liv. D-023. Ej körd.

## 2026-10-13 — Skeppsexplosion
- När ett skepp förlorar ett liv exploderar det (`scr_ship_explode`): 36–44 pixelpartiklar (gnistpoolen) åt alla håll i olika hastigheter, plus fem skrovdelar (`scr_debris_*`): linjer ur skeppets egen form i sina egna längder som flyger ut, snurrar, blinkar sista halvsekunden och försvinner efter 2–3,6 s. Explosionsljudet spelas. Ny visuell effekt. Ej körd.

## 2026-10-13 — Ingen gravitation på skeppen
- Skeppen faller inte längre: `g_SHIP_GRAV = 0`, luftmotståndet avrundas mot noll och farten nollas under 24 enheter utan thrust (D-024). Skotten har kvar sin gravitation. Ej körd.

## 2026-10-13 — Ny titelskärm (Radial Ring)
- `scr_title_draw` omgjord: linjelogotyp (`scr_logo_init/add/glyph/word`), cirkulär equalizer runt loggan efter musiken, dithrade planeter (förberäknat prickmönster), stjärnor; bakgrunden med roterande skepp är kvar. D-025. Ej körd.

## 2026-10-13 — updates.txt och README
- `gms/Bratwurst.gmx/datafiles/updates.txt` (Included Files) listar de stora uppdateringarna och nya funktionerna; `tools/sync_updates.py` synkar projektfilens filstorlek och README-blocket "What's new" på GitHub-sidan. README.md är omskriven som publik förstasida.

## 2026-10-13 — Titelbakgrunden i huvudmenyn
- Bakgrunden (rutnät, blinkande stjärnor och de fyra roterande skeppen) är utbruten till `scr_bg_draw` och används nu även i huvudmenyn; den följer en fortlöpande klocka (`g_bg_t`) så den inte hoppar mellan skärmarna. Rutorna (`scr_ui_pane`) har en 80 % täckande bakgrund så att texten förblir läsbar. Ej körd.

## 2026-10-13 — Spektrum i menyn
- Visualizern i menyns datapanel (SPECTRUM) är ombyggd (`scr_viz_draw`): 32 LED-staplar med segment grön → gul → röd, fallande toppmarkörer, spegling under baslinjen, oscilloskoplinje, en baslinje som glöder med basen och en spektrogramhistorik. Datan har analyserats i 32 band (`g_mw_frame`, FFT 2048; `tools/gen_music_viz.py`) vid sidan av de 12 banden för titelskärmen; `scr_musicviz_update` sköter attack/fall, toppar och historik. Ej körd.

## 2026-10-13 — Bugfix: kompileringsfel i scr_viz_draw
- Variabeln `frac` krockade med den inbyggda funktionen; bytt namn (`fq`). Alla skript genomsökta efter liknande namnkrockar.

## 2026-10-13 — Spektrumets färger följer temat
- SPECTRUM i menyn använder nu temats färger (`scr_theme_ramp`): staplarna går blå (base0D) → cyan (0C) → grön (0B) → gul (0A) → orange (09) → röd (08) efter höjd, spektrogramremsan färgas efter frekvens (samma skala plus magenta 0E) med ljusstyrka efter nivå, toppmarkörerna är base07, oscilloskoplinjen magenta (0E), baslinjen accenten och panelbakgrunden base01. Färgerna byts direkt med temat. Ej körd.

## 2026-10-13 — Enklare hörnmarkeringar på rutorna
- Rutornas nedre hörn har nu en enda accentlinje på ramens kant i stället för ett L av två linjer (`scr_ui_pane`). Ej körd.

## 2026-10-13 — Banredigeraren: vrid startplats med mushjulet
- Med startplatsverktyget (T, eller 1–4) vrider mushjulet det valda skeppet 11,25° per klick (upp = moturs, ned = medurs), vid sidan av Q/E (22,5°). Hjälptexten uppdaterad. Ej körd.

## 2026-10-13 — Banor per spelläge, sparfönster
- Banredigerarens S öppnar ett sparfönster (`scr_ed_dlg_*`): namn, GENERATE NAME och en kryssruta per spelläge. Banor får en `modes`-bitmask i `levels.ini` (`scr_level_allowed`); banvalet i Classic och Astro Duel visar bara banor som finns i läget och har egna val (`g_SV_MAP2`). D-026. Ej körd.

## 2026-10-13 — Bugfix: skriptfel i scr_ed_dlg_step
- Variabeln `other` är ett nyckelord i GML; bytt namn (`hasother`). Alla skript genomsökta efter variabelnamn som är nyckelord.

## 2026-10-14 — Fördröjning före rundresultatet
- När sista motståndaren är död startar en nedräkning på 4 s (`g_END_DELAY` = 200 ticks, `g_end_timer`) innan rundresultatet visas; spelet fortsätter som vanligt under tiden (explosionen spelas klart, man kan flyga och skjuta). Vinnaren avgörs när tiden är ute (ingen vinnare om ingen är kvar). Gäller alla spellägen. Ej körd.

## 2026-10-14 — Banans namn i spelytan
- Spelytans övre vänstra hörn visar `MAP: <banans namn>` (`g_match_map`, satt vid matchstart); debugtexten ligger en rad under. Ej körd.

## 2026-10-14 — Skeppsvalet: upp/ner byter rad, vänster/höger ändrar värdet
- Skeppsvalets rader (SHIP, WEAPON, POD, CONFIRM) väljs nu fritt med upp/ner (tangentbord och gamepad) och vänster/höger ändrar värdet på vald rad; fire/OK går till nästa rad och bekräftar på CONFIRM, thrust-knappen går tillbaka en rad. Byte av skepp nollställer vapen och pod. Tangentmappningen ändrad: P1 Enter = OK (upp/ner är pilar), P2 E = OK, P3 U = OK. `scr_menu_input`, `scr_menu_step`. Ej körd.

## 2026-10-14 — Banredigeraren: Load Map
- L öppnar ett laddafönster (`scr_ed_load_*`) med alla banor i en tabell: NAME, CLASSIC, ASTRO DUEL, RACE, CAPTURE med YES/NO per spelläge. Upp/ner eller klick väljer, mushjulet rullar (10 rader syns), Enter/LOAD/dubbelklick laddar, Esc/CANCEL avbryter; banan som är öppen är markerad med *. Vägras med meddelande om det finns osparade ändringar. Ej körd.

## 2026-10-14 — Kartbild i menyn
- På raden MAP (Classic och Astro Duel) visar datapanelen en bild av vald bana i stället för informationstexten (`scr_map_preview`): väggobjekten i temafärger och spelarnas startplatser med riktning, skalade in i rutan. Banan läses en gång per val och cachas (`g_pv_idx`). Ej körd.

## 2026-10-14 — Skeppsvalet: ny uppdelad layout
- Varje spelarruta (fortfarande 2x2) är nu delad i en statuslist med de fyra stegen (1 SHIP, 2 WEAPON, 3 POD, 4 OK; klara fyllda, aktivt markerat), en radlista med radnummer 01–04 och avdelare, vapenchips (valt specialvapen fylls; Astro Duel visar bara MSL och TURBO), en ram med roterande skepp, radarringar, hörnmarkeringar, skeppsindex (03/15), podantal och skeppsnamn, samt fem statstaplar (SPEED, ENERGY, TURN, AMMO, RATE) från skeppets parametrar i förhållande till det bästa skeppet. Lediga rutor visar en tom ram. Samma bakgrund som titeln och huvudmenyn. `scr_menu_draw`. Ej körd; staplarnas mappning av parametrar är SANNOLIK.

## 2026-10-14 — Respawn med nedräkning
- När en spelare förlorar ett liv och har fler kvar väntar skeppet 3 sekunder (`g_RESPAWN_DELAY` = 150 ticks) innan det återskapas på startplatsen. Under tiden är skeppet ur spel (kan inte träffas, syns inte) men räknas som kvar i rundan, så rundan inte avslutas i förtid. Spelarpanelen visar siffran 3, 2, 1 i stället för skeppsbilden och rubriken RESPAWN. Ny `scr_player_lose_life` (används av väggkrasch och skott); `scr_player_step`, `scr_hud_panel`, `scr_count_alive`, `scr_last_alive`. Ej körd.

## 2026-10-14 — Större missilexplosioner, mindre respawnsiffra
- Missilexplosionen (självdetonering i luften, vägg eller skepp) har dubbel ringradie och en extra inre ring, plus ett moln av pixelpartiklar (70+30 för missil, 45+20 för guidad) via `scr_spark_burst` i `scr_fx_spawn`. Den har ingen skaderadie (bara direktträff skadar, som förut), så "radien" gäller den visuella explosionen. Respawnsiffran i spelarpanelen ritas i mindre typsnitt (`g_f_lg`) och centrerad på skeppsbildens mittpunkt. `scr_fx_spawn`, `scr_match_draw`, `scr_hud_panel`. Ej körd.

## 2026-10-14 — Gnistor vid skeppskrock och skott mot vägg
- Skepp mot skepp ger nu gnistor (pixelpartiklar) från kontaktpunkten i båda skeppens färger; antal (8–30 per skepp) och fart växer med stötens styrka (`scr_ship_bounce`). Kanonskott som träffar en vägg ger 5–8 gula gnistor (`scr_shot_step`). Ej körd.

## 2026-10-14 — Skepp som fastnar i varandra skjuts isär
- Om två skepp fortfarande överlappar efter stöten skjuts de automatiskt isär (`scr_ship_separate`, D-027) och får en liten isärglidande hastighet. Ej körd.

## 2026-10-14 — Skeppskrock: putt och vridning
- Skepp som kör in i ett stillastående skepp puttar nu iväg det även vid långsam eller sned inkörning (normalen faller tillbaka på relativa rörelseriktningen, minsta impuls), och båda skeppen vrids lite av stöten beroende på var på skrovet de träffas och hur hårt (`spin_v`). Gnistorna kommer från den verkliga kontaktpunkten. `scr_ship_bounce`, `scr_ship_contact`, `scr_player_step`. Ej körd (D-028).

## 2026-10-14 — Explosionsringen skadar
- Missilexplosionens expanderande ring skadar skepp som den når: 3 energi, en gång per skepp och explosion, med gnistor på det träffade skeppet (`scr_fx_damage`, D-029). Gäller Classic; Astro Duel och krockringen påverkas inte. Ej körd.

## 2026-10-14 — Banans namn i rubrikraden
- "MAP: <namn>" flyttad från spelytans övre vänstra hörn till rubrikraden, till höger om "ROUND n OF m" (`scr_match_draw`). Ej körd.

## 2026-10-14 — Banans namn i rubrikens färg
- "MAP: <namn>" är nu en del av rubrikraden (samma färg och samma "//"-avstånd som resten) i stället för en separat text (`scr_match_draw`). Ej körd.

## 2026-10-14 — Kameran låses när bara en spelare är kvar
- I matcher med fler än en spelare slutar kameran (zoom och position) uppdateras när bara en spelare är kvar, så bilden stannar kvar under rundslutets fördröjning i stället för att zooma in på vinnaren. Spelare som väntar på respawn räknas som kvar. `scr_camera_update`. Ej körd.

## 2026-10-14 — Now playing och byte av låt
- Under spektrumet står nu "NOW PLAYING" med låtens namn (3ELKS - DAS BRATWURST (DNB EDIT)) i stället för INI KEY, samt låtnummer och LB/RB-hint. Spellista i `scr_config_init` (`g_trk_n`, `g_trk_name`, `g_trk_snd`, `g_trk_viz`, `g_trk_idx`); axelknapparna LB/RB (gamepad) eller PageUp/PageDown i titel, meny och skeppsval byter låt åt respektive håll (`scr_music_switch`, `scr_music_update`). Med en låt händer inget. Låtar utan förberäknad equalizerdata (`g_trk_viz` = false) får lugn grundrörelse i spektrumet. Ej körd.

## 2026-10-14 — Spellista från mappen Music
- Thermoptic-låtarna i `Music/` (No Safe Orbit, Sectorwurst) ligger nu i spellistan efter titellåten: LB/RB (PageUp/PageDown) bläddrar 3ELKS - DAS BRATWURST (DNB EDIT) → THERMOPTIC - NO SAFE ORBIT → THERMOPTIC - SECTORWURST med omslag. `tools/gen_tracks.py` gör om mp3 till ogg (`sound/audio/snd_music_N.ogg` + `sound/snd_music_N.sound.gmx`), analyserar equalizerdata (`datafiles/viz_N.txt`, 25 rutor/s, 12 + 32 band) och skriver `scr_data_tracks` samt projektposter; `scr_tracks_load` läser datan vid start; `scr_musicviz_update` använder låtens egen data. Varje låt loopar tills man byter. Lägg nya mp3 i `Music/` och kör `python tools/gen_tracks.py` (befintliga viz-filer behålls, `--redo` gör om). Ej körd i GMS.

## 2026-10-14 — Ny låt i spellistan
- THERMOPTIC - WE WERE NEVER ORGANIC (DISCO EDIT) tillagd (lat 4 av 4) med `tools/gen_tracks.py`: ogg `snd_music_3`, equalizerdata `viz_3.txt`, projektposter och `scr_data_tracks` uppdaterade. Ej körd i GMS.
- Långa låttitlar rullar i sidled på NOW PLAYING-raden (`scr_mn_draw`) om de inte ryms.

## 2026-10-14 — Musik under matcher, ny låt varje runda, volym
- Musiken spelas nu även under matcher. När en ny runda startar (matchstart och varje ny runda) väljs en slumpad låt ur spellistan (alltid en annan än den som spelade) av `scr_music_round_start`; låtens namn visas i matchens rubrikrad till höger ("MUSIC: ..."; kortas av om den inte ryms, "OFF" om musiken är avstängd). Tangenthjälpen (ESC MENU, F2 SHIP SELECT, TICK) flyttades till F1-raden för att få plats. Ny inställning Options -> VOLUME (10 %–100 % i steg om 10, standard 70 %; `g_SV_VOL` = steg 1–10, sparas som `[audio] volume` i procent i settings.ini) styr musikens volym via `audio_sound_gain`; ljudeffekter påverkas inte. `scr_music_update`, `scr_mn_build`, `scr_mn_value`, `scr_set_*`, `scr_match_draw`. Ej körd.

## 2026-10-14 — Två nya låtar och fast låtordning
- Lagt till Nothing Good Beyond Neptune (lat 4) och The Final Frankfurter (lat 5; filnamnets stavfel "Thermoptoc" rättas i visningsnamnet). `tools/gen_tracks.py` håller nu låtnumren fasta via `tools/tracks.txt` (nya mp3 läggs sist), så att `viz_N.txt` alltid hör ihop med rätt ogg. Ej körd i GMS.

## 2026-10-14 — Pausmeny under matchen
- Esc (tangentbord) eller Start (gamepad) under en pågående match öppnar en pausmeny med RESUME GAME och QUIT TO MENU (`scr_pause_step`, `scr_pause_draw`, `g_paused`). Spelet står stilla medan menyn visas; musiken fortsätter. Upp/ner byter rad, Enter/Space/A/Start väljer, Esc/Backspace/B återupptar, QUIT TO MENU går till huvudmenyn. Tidigare gick Esc direkt till huvudmenyn och Start till skeppsvalet under match; i skeppsval och rundresultat är Esc/Start oförändrade. Ej körd.

## 2026-10-14 — Större explosion när missilen träffar
- Missil och guidad missil som träffar en vägg eller ett skepp får 30 % större ring (`g_FX_IMPACT` = 1.3; både den ritade ringen och skaderadien) och 30 % snabbare partiklar. Missiler som självdetonerar i luften behåller den tidigare storleken (62 resp. 42 px max; nu 81 resp. 55 px vid träff). `scr_fx_spawn` fick ett fjärde argument (storlek); `scr_missile_step`, `scr_fx_damage`, `scr_match_draw`. Ej körd.

## 2026-10-14 — Lediga platser i skeppsvalet
- "PRESS FIRE TO JOIN" ritas i mindre typsnitt (medium), centrerat i en bredare ram, med "PLAYER <nummer>" under. Alla lediga platser (även plats 4 innan plats 3 anslutit) visar samma uppmaning; bara nästa plats blinkar och visar tangenterna, övriga visar "JOIN SLOT n FIRST" längst ned. `scr_menu_draw`. Ej körd.

## 2026-10-14 — Drift (test)
- Ny drift-knapp på vänster trigger (alla gamepads; tangentbord C / Q / H för spelare 1–3). Fungerar bara när man gasar och håller knappen och har fart: snabbare vridning, gasen riktas utåt från svängen så att skeppet glider i sidled, något svagare gas och gnistor bakom skeppet. Konstanterna `g_DRIFT_*` i `scr_config_init` är startvärden som ska justeras efter test. Nästa specialvapen flyttades från LT till Y. `scr_player_input`, `scr_player_step`, D-030. Ej körd.

## 2026-10-14 — Drift: 30 % mer sidoglid
- `g_DRIFT_ANG` höjd från 20 till 26 vinkelsteg (≈28° → ≈37°), 30 % mer utåtriktad gas under drift, så skeppet glider mer i sidled. Ej körd; fortsätt justera efter test.

## 2026-10-14 — Drift: starkare gas
- `g_DRIFT_THRUST` höjd från 0.9 till 1.17 (+30 %): gasen under drift är nu 17 % starkare än vanlig gas i stället för 10 % svagare. Ej körd.

## 2026-10-14 — Drift: ännu 30 % mer sidoglid
- `g_DRIFT_ANG` höjd från 26 till 34 vinkelsteg (≈37° → ≈48°). Ej körd.

## 2026-10-14 — Reverse på drift-knappen
- Vänster trigger (C / Q / H på tangentbordet) utan gas backar skeppet mycket långsamt (`g_REVERSE_THRUST` = 0.25 av vanlig gas), även från stillastående, för att ta sig ur en vägg. Med gas samtidigt blir det drift som förut. `scr_player_step`. Ej körd.

## 2026-10-14 — Driftspår i stället för gnistor
- Driftgnistorna ersattes av ljusspår efter skeppet i skeppets färg (additiv blandning): två spår för breda skepp, ett för smala (BatWing, JAS, Kaese, TieFighter). Spåret växer fram när man börjar drifta, följer rörelsebanan (upp till 80 punkter, en per tick) och tonar ut mot svansen; när driften slutar tonar hela spåret ut på ca 0,8 s. Nya `scr_trail_init`, `scr_trail_clear`, `scr_trail_update`, `scr_trail_draw`; `scr_player_step`, `scr_match_draw`. Ej körd; utseende och längd ska justeras efter test.

## 2026-10-14 — Motorglöd vid driftspåret
- Där varje driftspår startar ritas nu en glödande boll medan man driftar: en solid kärna i skeppets färg och utanför den fem mjuka ringar (additiv blandning) som tonar ut, pulserar och flimrar snabbt (slumpad radie och styrka per bildruta; kärnan flimrar inte). Bollen försvinner när driften slutar. `scr_trail_draw`. Ej körd.

## 2026-10-14 — Drift: farten bevaras
- Under drift bevaras farten du hade: inget luftmotstand och gasen ökar inte farten, den böjer bara färdriktningen (`g_DRIFT_STEER` = 0.4, ersätter `g_DRIFT_THRUST`). Skeppet glider därför vidare i sidled så länge du driftar. När du släpper återgår luftmotståndet. `scr_player_step`. Ej körd; justera `g_DRIFT_STEER` / `g_DRIFT_ANG` efter test.

## 2026-10-14 — Smalare och kortare driftspår
- Driftspåret är ca 35 % smalare (bredd 0.5 + 1.7·t i stället för 0.8 + 2.6·t) och hälften så långt (`g_TR_MAX` 80 → 40 punkter). `scr_trail_draw`, `scr_config_init`. Ej körd.

## 2026-10-14 — Driftspåret hänger med skeppet när det tonar ut
- När drift-knappen släpps fortsätter spåret att hänga med skeppet (nya punkter läggs till vid aktern varje tick) medan hela spåret tonar ut och de äldsta punkterna tas bort, tills det är borta (ca 1 s). Tidigare stod det kvar på banan och tonade ut. Motorbollen försvinner som förut direkt. `scr_trail_update`. Ej körd.

## 2026-10-14 — Drift: tillbaka till tidigare känsla
- Momentum-läget (farten bevaras under drift) togs bort eftersom det kändes som is. Driften är som innan: vanligt luftmotstånd, gasen riktas 34 steg utåt och är 1.17 av vanlig gas (`g_DRIFT_THRUST` återinförd, `g_DRIFT_STEER` borta). Spåren, motorbollen och reverse är oförändrade. `scr_player_step`, `scr_config_init`. Ej körd.

## 2026-10-14 — Missiler: glödande boll och partikelsvans
- Alla missiler (missil och guidad missil) ritas nu som en glödande boll med solid gul kärna och fem mjuka ringar (orange yttre, gula inre, additiv blandning) som pulserar och flimrar, i stället för en kort linje och en ruta. Efter missilen flyger små pixelpartiklar (två per tick, gula/orange/vita, kort livslängd 8–23 ticks, liten slumpad sidofart) via nya `scr_spark_one` i gnistpoolen. `scr_match_draw`, `scr_missile_step`. Ej körd.

## 2026-10-14 — Skott och missiler avfyras i nosens riktning
- Kanonskott och missiler får inte längre skeppets egen hastighet; de avfyras alltid exakt åt det håll skeppet pekar, även vid drift eller glidning i sidled (`g_SHOT_INHERIT` = 0, D-031; 1 ger originalets beteende). `scr_player_step`, `scr_special_fire`, `scr_config_init`. Ej körd.

## 2026-10-14 — Musikfilerna i repot
- Mappen `Music/` (mp3-källfilerna, ca 25 MB) ligger nu i git, med `Music/README.md` (hur man lägger till låtar, rättighetsstatus). Spelet innehåller redan musiken: oggfilerna är ljudresurser i projektet (`sound/audio/snd_music_N.ogg`, byggs in i spelet) och equalizerdatan ligger i Included Files (`datafiles/viz_N.txt`). Rättighetsanteckning: titellåten är 3Elks (tredje part), Thermoptic-låtarna är SANNOLIKT egna.

## 2026-10-14 — Kontrollerna: Y = specialvapen, Back = nästa specialvapen, ingen spelarcykling
- Gamepad: specialvapen (avfyra) på Y (var B), nästa specialvapen på Back (var Y), B är ledig. Cykling av antal spelare (Back på gamepad och F5 på tangentbordet) är borttagen; skeppsvalets hjälprad och README uppdaterade. `scr_player_input`, `scr_game_step`, `scr_menu_draw`, D-032. Ej körd.
- Controls-menyn i spelet (Gamepad) uppdaterad med Y, Back, LB, LT (drift/reverse) och Start (paus); raden Players är borttagen.

## 2026-10-14 — Ny pausmeny med stats och kontroller
- Pausmenyn är nu tre rutor i en rad med liten text som resten av gränssnittet: till vänster MATCH STATS (läge, runda, bana, låt, tid, antal spelare, ledare efter flest rundvinster, och per spelare skepp, vinster, liv som rutor samt energi/respawn/OUT), i mitten en kompakt PAUSED-ruta (RESUME GAME / QUIT TO MENU) och till höger CONTROLS som listar vad alla gamepad- och tangentbordsknappar gör, på engelska. `scr_pause_draw`. Ej körd; kontrollera att allt ryms i 1024x640 och i större vyer.
- Loggan (assets/logo.png) ligger överst i README.md på GitHub.

## 2026-10-14 — Driftljud
- Nytt loopbart rymdskeppsmotorljud (`snd_sfx_drift`, genererat med `tools/gen_drift_sound.py`) som spelas så länge drift-knappen hålls med gas och fart. Varje spelare har egen kanal, ljudet tonas in/ut, tystnar vid paus, när skeppet förstörs och när matchen lämnas, och följer SOUND EFFECTS i Options. `scr_drift_sound`, `scr_player_step`, `scr_game_step`. Ej körd.

## 2026-10-14 — Plats 4 blinkar som plats 3
- "PRESS FIRE TO JOIN" blinkar nu på alla lediga platser i skeppsvalet (även plats 4 innan plats 3 anslutit), inte bara på nästa plats. `scr_menu_draw`. Ej körd.

## 2026-10-14 — Rundvinst: "Well hot dog, we have a weiner!"
- När någon vinner en runda visar resultatrutan den stora rubriken "WELL HOT DOG, WE HAVE A WEINER!" (stort typsnitt, rutan anpassas efter textbredden) och under den "PLAYER n WINS" i vinnarens färg. Utan vinnare står bara NO WINNER. `scr_match_draw`. Ej körd.

## 2026-10-14 — Classic: LIFE
- Ny rad LIFE under ROUNDS i Game modes → Classic: antal liv per runda. Standard och högsta värde är originalets 6 (`g_START_LIVES`); det går att sänka ner till 1 men inte höja. Sparas som `[gameplay] lives` i settings.ini (`g_SV_LIVES`) och används av `scr_game_start` i Classic (Astro Duel har sin egen LIFE, 1–9). `scr_mn_build`, `scr_set_*`, `scr_config_init`. Ej körd.

## 2026-10-14 — Yttre ramlinjen borttagen på alla banor
- Den yttre av de två ramlinjerna runt banan är borttagen på alla banor (D-033). De inbyggda banorna genereras utan den, nya banor i redigeraren får bara en ram, och befintlig `levels.ini` migreras automatiskt från v1 till v2 (yttre fyrkanten tas bort ur alla banor, säkerhetskopia `levels_v1_backup.ini`). `tools/gen_gms_levels.py`, `scr_data_levels`, `scr_level_new`, `scr_levels_init`, `scr_levels_strip_outer`, `scr_levels_write_defaults`. Ej körd.

## 2026-10-14 — Korvmodell i bakgrunden
- Ny trådramsmodell av en korv (`scr_data_sausage`, D-034, första version efter användarens bild) i skeppens dataformat som pseudoskepp `g_SAUSAGE`. Den driver och roterar i bakgrunden på titelskärmen och i huvudmenyn tillsammans med skeppen (`scr_bg_draw`); den är inte valbar i skeppsvalet. Avsedd för det framtida spelläget Capture the Bratwurst. Ej körd.
- Korvmodellen ritades om (andra versionen): tjockare, nästan jämn tjocklek och trubbiga rundade ändar i stället för spetsiga (första versionen såg ut som en banan), fem längsgående kurvor, lätt böjda tvärringar, slutna ändkappor och en liten vriden knut på den inre kanten i varje ände. `scr_data_sausage`. Ej körd.

## 2026-10-14 — Korven som redigerbar SVG
- `assets/models/sausage.svg` (korvmodellen som ritbar SVG), `tools/svg_to_model.py` (SVG → `scr_data_sausage.gml`, stöd för linjer, polylinjer, polygoner, rektanglar, path med raka linjer och kurvor samt transformer; punkter inom 1 enhet slås ihop) och `tools/make_sausage_svg.py` (skapar SVG:n från den inbyggda formen), samt `assets/models/README.md` med hur man ritar om och läser in den. Den nuvarande `scr_data_sausage.gml` är fortfarande den beräknade versionen tills SVG:n har ritats om och verktyget körts.

## 2026-10-14 — Användarens ritade korv används
- `assets/models/sausage2.svg` (användarens omritning av korven) är inläst med `tools/svg_to_model.py` till `scr_data_sausage.gml` (180 punkter, 251 linjer). Verktyget normaliserar nu viewBox (mitten blir 0,0 och bredden 400 enheter) så att SVG:er som sparats i annan skala (här 0 0 1200 660) hamnar rätt. Ej körd i GMS.

## 2026-10-14 — Powerup-system: Mini Nuke och hemlig Powerup Editor
- Rad POWERUPS ON/OFF (standard ON) i Game modes → Classic och Astro Duel. 5 s efter rundstart spawnar en orb med pixelikon (snabbt färgbytande i 5 färger) på en slumpad plats på kartan (innanför ramen, inte på föremål, minst 20 px från vägg); ny powerup 10 s efter upplockning. Den som tar upp Mini Nuke avfyrar den med special-knappen: en missilliknande projektil med inställbar storlek och fart, chockvåg (världspixlar, skadar alla den når), partiklar och direkt-/chockvågsskada. Hemlig Powerup Editor i Options (tryck P) med alla powerups och deras parametrar, sparas i settings.ini. D-035. Ej körd.

## 2026-10-14 — Powerup-orben dubbel storlek och centrerad ikon
- Orbens radie är dubbel (`g_PU_RADIUS` 18 → 36 världspixlar; också upplockningsradien). Väggavståndet räknas nu från orbens kant (minst 20 px, centrum minst radie + 20 = 56) så att den inte ligger an mot en vägg. Ikonen heltalsplaceras nu (11×11 pixlar, `ox/oy` avrundade från orbens mitt) så att den ligger exakt i mitten av bollen i stället för att hamna en halv pixel snett. `scr_powerup_draw`, `scr_powerup_pos_ok`, `scr_config_init`. Ej körd.

## 2026-10-14 — 3LE och titellåten bara på titelskärmen
- Artistnamnet på låten Das Bratwurst visas nu som "3LE - DAS BRATWURST (DNB EDIT)" (var 3ELKS). Titellåten (lat 0) spelas bara på titelskärmen: lämnar man titeln byter musiken till en slumpad annan låt ur spellistan, och i matcher, menyer och skeppsval spelas aldrig titellåten. LB/RB hoppar över den (och är avstängda på titelskärmen), NOW PLAYING räknar bara de övriga låtarna (t.ex. 02/05), och tillbaka på titelskärmen startar titellåten igen. `scr_music_update`, `scr_music_switch`, `scr_music_round_start`, `scr_mn_draw`, `scr_config_init`. Ej körd.

## 2026-10-14 — B aktiverar powerupen
- Hållen powerup (t.ex. Mini Nuke) avfyras nu med B på gamepaden (tangentbord för test: V / F / M för spelare 1–3) i stället för special-knappen, som åter bara styr specialvapnet. B var tidigare oanvänd. Controls-menyn och pausmenyns kontrollruta uppdaterade. `scr_player_input`, `scr_player_step`, `scr_special_fire`, `scr_powerup_fire`, `scr_pause_draw`, `scr_mn_build`. Ej körd.

## 2026-10-14 — Roterande powerup
- Ikonen i powerup-orben roterar nu runt orbens mitt (ett varv på ca 2 s; pixlarna roteras runt mittpixeln så den förblir exakt centrerad) och en ring av åtta streck snurrar runt orben åt andra hållet, så att den syns ännu tydligare. `scr_powerup_draw`. Ej körd.

## 2026-10-14 — Mini Nuke: kameraskakning
- Ny parameter CAMERA SHAKE (0–60 pixlar, standard 12) i Powerup Editor → Mini Nuke. När en Mini Nuke exploderar skakar spelytans bild (slumpmässig förskjutning av kameran i ritningen, `g_shake_amp`, som klingar av med 0,9 per tick, ca 0,4 s); ram, paneler och spelfysik påverkas inte, och skakningen pausas i pausmenyn. 0 stänger av den. `scr_data_powerups`, `scr_fx_spawn`, `scr_match_draw`, `scr_game_step`, `scr_powerup_reset`. Ej körd.

## 2026-10-14 — Powerup Railgun
- Ny powerup RAILGUN (D-036): håll powerup-knappen (B) inne i 4 s så laddas en glödande kula framför skeppet (växer, byter färg till vitt när den är klar); släpp så avfyras en stråle i skeppets färg genom hela banan och över alla väggar och föremål, som når andra sidan på 0,5 s, ligger kvar 2 s och tonar ut på 1 s och dödar ett skepp på en träff. Egen ikon och ett nytt lasersljud (`tools/gen_railgun_sound.py`). Alla värden (laddningstid, strålens fart/hålltid/utfasning/bredd, skada, kameraskakning, kulans storlek) ligger i Powerup Editor. HUD visar RAILGUN n % / READY. Släpps knappen för tidigt avbryts laddningen. Ej körd.

## 2026-10-14 — Titellåten fortsätter i huvudmenyn
- 3LE - Das Bratwurst fortsätter spela när man går från titelskärmen till huvudmenyn (ingen låtbyte där). Lämnar man huvudmenyn (skeppsval, match, banredigerare, resultat) byter musiken till en slumpad annan låt, och titellåten kommer tillbaka först när man går tillbaka till titelskärmen. LB/RB i huvudmenyn byter som förut (hoppar över titellåten). `scr_music_update`. Ej körd.

## 2026-10-14 — Railgun: laddljud och automatisk avfyring
- Under laddningen loopar ett vibrerande, vobblande ljud som går från försiktigt till starkt (volym och tonhöjd följer laddningen); när Railgun är fulladdad tystnar det och ett "laddad"-ljud spelas. Släpps knappen avfyras skottet och väntar man 3 sekunder efter fulladdning avfyras det av sig självt (`g_RG_AUTO`). Ljuden är egenproducerade (`tools/gen_railgun_charge_sounds.py`) och tystnar vid paus, död och rundslut. `scr_railgun_update`, ny `scr_railgun_fire`, `scr_player_lose_life`, `scr_game_step`. Ej körd.

## 2026-10-14 — Mjuk kamerazoom vid död
- När en spelare dör eller kommer tillbaka efter respawn glider kameran (zoom och centrum) mjukt mot de spelare som är kvar (ca 1–2 s, `g_CAM_TRANS` / `g_CAM_K`) i stället för att hoppa direkt. Vanlig rörelse följer fortfarande utan fördröjning, och en ny runda börjar direkt i rätt vy. `scr_camera_update`, `scr_game_start`, `scr_round_reset`, `scr_config_init`. D-037. Ej körd.

## 2026-10-14 — DRIFT i Powerup Editor och Options i pausmenyn
- Ny sida DRIFT i den hemliga Powerup Editor (Options, tryck P) med alla drift- och reverseinställningar: MIN SPEED, TURN BOOST, SLIDE ANGLE, DRIFT THRUST, REVERSE THRUST, TRAIL LENGTH, ENGINE SOUND och TRAIL WIDTH (standardvärdena är de nuvarande). De sparas i settings.ini och slår igenom direkt (`scr_drift_apply`). Spårets längd kan sänkas medan ett spår är längre. Pausmenyn har fått raden OPTIONS som öppnar Options inne i matchen; Esc/B går tillbaka till pausmenyn; Map Editor är spärrad där. D-038. Ej körd.

## 2026-10-14 — Debugtexten dold som standard
- Debugtexten uppe till vänster i spelytan (ESC MENU, F2 SHIP SELECT, TICK, Z, shots) är dold vid start; F1 visar och döljer den som förut. `g_debug` är `false` som standard (`scr_config_init`). Ej körd.

## 2026-10-14 — Dracula som standardtema
- Standardtemat är nu Dracula (var Nord). Ett tema man väljer sparas som förut i settings.ini och används vid nästa start; standardvärdet gäller bara när ingen sparad inställning finns (första start eller efter "återställ inställningar"). `scr_set_defaults`. Ej körd.

## 2026-10-14 — Ny exe-ikon
- Spelets exe-ikon är den nya BW-loggan (neonlogga med equalizerring): `Configs/Default/windows/runner_icon.ico` (GameMakers `option_windows_game_icon`) är ersatt med en ikon i sju storlekar (16–256 px, genomskinlig bakgrund), liksom `Runner_Icon_256.ico`; källbilden ligger som `assets/icon/icon.png` och ikonerna byggs med `tools/make_icon.py <bild>`. Ikonen syns först efter en ny export/build av exe-filen (Windows kan visa den gamla ikonen i cache en stund). Ej verifierat i GMS.

## 2026-10-14 — Drift: SIDE THRUSTER
- Ny inställning SIDE THRUSTER i Powerup Editor → DRIFT (0–400 %, standard 60): en sidotruster puttar skeppet ut ur kurvan medan man driftar (gas + drift + sväng: sväng höger = putt åt vänster, sväng vänster = putt åt höger), så driften känns som en sladd i en rallykurva. Inställningsplatserna per powerup höjdes till 12 (`g_PU_STRIDE`). `scr_player_step`, `scr_drift_apply`, `scr_data_powerups`, D-039. Ej körd.

## 2026-10-14 — Fix: kamerakrasch (g_CAM_TRANS)
- Spelet kraschade ("global variable g_CAM_TRANS not set") eftersom en kommentar som lades in mitt på en rad i `scr_config_init` kommenterade bort resten av raden, inklusive startvärdena för kamerans mjuka zoom (`g_CAM_TRANS`, `g_CAM_K`, `g_cam_*`) och pausmenyns variabler (`g_pause_opts`, `g_pm_*`). Kommentaren ligger nu sist på raden. En kontroll av alla deklarerade globaler visar att alla tilldelas. Ej körd.

## 2026-10-14 — B backar i skeppsvalet
- B på gamepaden (liksom X och thrust-tangenterna) backar ett steg i skeppsvalet, och på första raden (SHIP) tillbaka till huvudmenyn om ingen spelare har kommit längre. Förut gick back från SHIP runt till CONFIRM. Hjälpraden visar "B/X/THRUST BACK". `scr_menu_input`, `scr_menu_step`, `scr_menu_draw`. D-040. Ej körd.

## 2026-10-14 — Solid colors
- Ny inställning Options → SOLID COLORS (OFF som standard). ON fyller banans solida väggar med sin färg och skeppens skrov med spelarfärgen; konturerna ritas ovanpå. Polygonerna (även konkava) triangulerar med ear clipping en gång (`scr_poly_tris`, `scr_solid_build`, `scr_ship_fill_init`) och ritas som trianglar (`scr_solid_walls_draw`, `scr_ship_fill`). Banans ytterram fylls inte; skeppet Kaese (öppet skrov) fylls inte. D-041. Ej körd i GMS (triangulerigen verifierad mot alla skepp och banor i Python).

## 2026-10-14 — Solid colors: fyllningen täcker hela skrovet
- Fyllningen av skepp och väggar låg 1–2 pixlar snett mot konturen (en tunn kant på höger/nedre sidor, troligen grafikkortets fyllregel). Nu ritas fyllningen förskjuten 0–`g_FILL_EXPAND` pixlar åt höger/ned (standard 1) och trianglarnas kanter ritas även som linjer i samma färg, så att fyllningen täcker hela formen under konturen. `scr_ship_fill`, `scr_solid_walls_draw`, `scr_config_init`. Ej körd; höj `g_FILL_EXPAND` till 2 om en kant syns kvar.

## 2026-10-14 — Skott går aldrig sakta nog att köra in i
- Skott och missiler får nu skeppets fart framåt i skjutriktningen utöver sin grundhastighet (`scr_boost_vel`, `g_SHOT_BOOST` = 1): extra = max(0, skeppets fart längs skjutriktningen), så projektilen är relativt skeppet alltid minst lika snabb som grundhastigheten och ett snabbt skepp kan inte köra in i sina egna skott. Riktningen förblir exakt skeppets (sidofart räknas inte). Gäller kanonskott, missiler och Mini Nuke. `scr_player_step`, `scr_special_fire`, `scr_powerup_fire`, `scr_config_init`. D-042. Ej körd.

## 2026-10-14 — Orienteringspunkter
- Ett fast gitter av färgade pixlar (accentfärg, 100 pixlars mellanrum i banans koordinater) över hela arenan hjälper spelaren att se var man är och hur fort man rör sig när inga andra föremål syns. De syns bara vid mycket inzoomad kamera (full styrka vid zoom ≥ 13000) och tonar ut mot zoom 7000, där de är helt borta. Punkter ritas bara innanför ramen och utanför föremål. `scr_dots_prepare`, `scr_dots_draw`, `scr_match_draw`, `scr_game_start`, `scr_config_init`. D-043. Ej körd.

## 2026-10-14 — Musikspelare i huvudmenyn
- Huvudmenyns högra kolumn är delad i DATA (överst) och MUSIC (nederst) enligt användarens skiss: spektrum, NOW PLAYING med låtnummer och titel, segmenterad tidslinje med tid och kvarvarande tid, transportknappar (föregående, spela/pausa, nästa), shuffle och repeat samt volym (−, LED-stapel, +, procent). PALETTE och FILES är borttagna. Y/M spelar och pausar; allt går att klicka på med musen (tidslinjen söker). Låtar loopar inte längre för evigt utan går vidare till nästa (shuffle: slumpad, repeat: samma); titellåten loopar på titelskärmen. D-044. Ej körd.
- Fix: kompileringsfel i `scr_music_panel` (variabeln `frac` krockar med GameMakers funktion `frac`); bytt till `fq`. En kontroll av alla variabler i alla skript mot kända inbyggda namn gav inga fler träffar (utom de avsiktliga `view_*`). Ej körd.

## 2026-10-14 — Musikspelaren: justering efter bild
- Tidslinjen har 30 segment med mer luft emellan, volymraden har en MUTE-knapp (tystar utan att ändra volymen; klickbar) i stället för procenten, och längst ned visas NEXT TRACK med nästa låt (RANDOM TRACK vid shuffle, samma vid repeat) med nummer. Knappraden följer skissen. Fix: kommentar som slukade en klammer i `scr_music_update` (hittad av klammerkontrollen). `scr_music_panel`, `scr_mp_mouse`, `scr_music_update`, `scr_mn_draw`. Ej körd.

## 2026-10-14 — Mindre ogg-filer
- Musikfilerna (`snd_music_1..5.ogg`) är omkodade med Vorbis-kvalitet 3 i stället för 5 (`tools/gen_tracks.py`): från ca 19 MB till ca 15 MB tillsammans, med oförändrade längder och samma equalizerdata. Ej verifierat i GMS; lyssna efter skillnad vid hög volym.

## 2026-10-14 — Rutornas hörn blir vinkelhakar
- De små accentlinjerna i rutornas nedre hörn (`scr_ui_pane`) är nu vinkelhakar: den korta vågräta linjen längs nederkanten får en lika lång lodrät linje upp längs sidokanten, båda exakt på ramens egna linjer så att det inte blir dubbla linjer som tidigare. Gäller alla rutor i gränssnittet (meny, skeppsval, spelarpaneler, pausmeny). Ej körd.

## 2026-10-14 — Musikspelaren: knapprad i linje med transportknapparna
- Raden under transportknapparna följer nu samma kolumner: shuffle och repeat under PREV, volym under play/paus (minus i linje med play/paus-knappens vänstra kant, plus i linje med dess högra, LED-stapeln emellan) och MUTE under NEXT i samma bredd. Plus- och minustecknen är mindre (10 pixlar) och exakt centrerade i sina 26 × 26 pixlar stora knappar. `scr_music_panel`. Ej körd.

## 2026-10-14 — Titelskärmens text
- Texten på titelskärmen är nu "PRESS START TO TURN UP THE HEAT" (versaler) i ett steg mindre typsnitt (medium i stället för stort) så att den längre texten ryms. `scr_title_draw`. Ej körd.

## 2026-10-14 — Musiken tonas in vid start
- Musiken som startar på titelskärmen tonas nu in från helt tyst till vald volym under 1,5 sekunder (`g_MU_FADE` = 75 ticks, först 150, räknas från att första låten startar) i stället för att börja direkt. Gäller bara vid start av spelet; senare låtbyten börjar som vanligt. `scr_music_update`, `scr_config_init`. Ej körd.
- Intoningen halverad till 1,5 sekunder (`g_MU_FADE` = 75 ticks) efter test. Ej körd.

## 2026-10-14 — Fix: helskärm och alt-tab
- Spelets fönster försvann vid alt-tab i helskärmsläget (musiken fortsatte men fönstret gick inte att få tillbaka). Ett ramlöst fönster med `window_set_showborder` gav kompileringsfel (funktionen är obsolete i GameMaker 1.4) och är borttaget. Nu lämnar spelet helskärmsläget när fönstret saknat fokus i 5 ticks (ett vanligt fönster finns kvar i aktivitetsfältet) och går tillbaka till helskärm när fokus är tillbaka. `scr_focus_update`, `scr_game_step`, `scr_config_init`, D-045. Ej körd.

## 2026-10-15 — Ny låt: Juke to Jupiter
- THERMOPTIC - JUKE TO JUPITER (3:30) tillagd som låt 6 av 6 (plus titellåten): `Music/Thermoptic - Juke to Jupiter.ogg` omkodad till `snd_music_6.ogg` (Vorbis kvalitet 3, 2,6 MB), equalizerdata `viz_6.txt` (25 rutor/s) och projektposter. `tools/gen_tracks.py` accepterar nu även ogg, wav, flac och m4a och hoppar över omkodning av ogg-filer som redan är uppdaterade (`--redo` tvingar). Ej körd i GMS.

## 2026-10-15 — Spelläget Asteroids
- Nytt spelläge ASTEROIDS (D-046) med en egen, helt tom bana. Stora stenar flyger in från kanterna, delas i två mellanstora (snabbare) och sedan två små (mycket snabba) när de skjuts, och små försvinner. En sten som träffar ett skepp tar 10 / 5 / 1 energi (stor / mellan / liten) och knuffar skeppet. Vågor som i originalet (4 stora stenar, +2 per våg, högst 12; ny våg 3 s efter att banan är tom); stenarna ignorerar väggarna och varvar kanten. Missiler delar stenar; Mini Nuke och Railgun förintar dem. Menyrader: START, PLAYERS, ROUNDS, LIFE, POWERUPS (ny inställning, standard ON, `[asteroids] powerups`). Nya skript `scr_ast_*`, `scr_level_asteroids`. Fix: Solid colors fyllde hela arenan på banor med bara en ram (t.ex. nya banor och Asteroids). Ej körd.
- Asteroids, högre tempo och stenar som delas vid kollision: en sten som träffar ett skepp delas eller går sönder som om den blivit skjuten; första vågen kommer efter 1 s med 6 stora stenar (+2 per våg, högst 14), nästa våg 1,5 s efter tom bana, stenarna är 50 % snabbare, och en ny stor sten kommer var 6:e sekund så länge det finns färre än 10. `scr_ast_step`, `scr_ast_spawn_one/wave`, `scr_ast_hit`, `scr_config_init`. Ej körd.
- Asteroids: ny inställning LEVEL (1–5, standard 3; `[asteroids] level`). Nivå 1 är grundinställningen och varje nivå dubblar allt: antalet stenar per våg, hur snabbt vågorna och strömmen kommer och stenarnas fart (farten högst 8 gånger, stenar per våg högst 64). Poolen ökad till 320 stenar; svept kollisionstest skepp–sten och rutkontroll/beskärning för prestanda. Ny `scr_ast_mult`. Ej körd.

## 2026-10-15 — Kamerazoom 1–10
- Ny inställning Options → ZOOM (1–10, standard 1 = nuvarande zoom). Varje steg zoomar ut kameran mer; Zoom 10 visar dubbelt så mycket av arenan (målzoomen delas på 1 + (zoom − 1) / 9). Kameran glider mjukt när valet ändras. Gäller alla spellägen, sparas som `[display] zoom`. Bieffekt: skott och missiler flyger längre i världen innan de tas bort vid bildkanten när man zoomar ut. `scr_camera_update`, `scr_config_init`, `scr_set_*`, `scr_mn_build`. D-047. Ej körd.

## 2026-10-15 — Options städas
- WIDE PLAYFIELD borttagen (alltid bred). SCANLINES och PHOSPHOR GLOW sammanslagna till SCANLINES AND GLOW. D-048. Ej körd.
- MUSIC On/Off borttagen; VOLUME kan nu gå till 0 % (visas OFF = musiken av). D-049. Ej körd.

- DATA-rutan: rubriken INFO borttagen, beskrivningstexten flyttad upp dit. Ej körd.

- Options: WINDOW omdöpt till SCREEN MODE. Pausmenyn: LB/RB byter låt, tangentbordsinstruktionerna borttagna (bara gamepad visas). Ej körd.

- Titelskärmen: krediteringsrad centrerad längst ned (ersätter BUILD-texten), "ESC = QUIT" borttagen. Ej körd.

- Alt-tab i helskärm: lämnar helskärmen direkt vid Alt+Tab/Windows-tangenten och efter 2 ticks utan fokus (D-045, tillägg). Ej körd.

## 2026-10-18 — Galaxy Duel
- Astro Duel omdöpt till Galaxy Duel (menyer, banredigerare, pausruta, powerup-beskrivningar). Skadan är nu i två steg: första träffen ger 6 s skada (80 % långsammare, inga vapen, gnistor och lösa streck), en träff medan skadad dödar. `scr_ad_hit`, `scr_ad_fx`, `scr_player_step` m.fl. D-051. Ej körd.

- Galaxy Duel: skadat skepp 60 % långsammare (var 80 %); reparerat skepp är som nytt och skadas igen vid nästa träff; 0,5 s skyddstid efter en träff så att en salva inte dödar direkt. Ej körd.

## 2026-10-18 — Drifting fuel
- Drift har nu begränsat drivmedel: 8 s drift per full mätare (inställbart i Powerup Editor → DRIFT → DRIFTING FUEL), resten sparas mellan drifter, tom mätare laddas på exakt 6 s och drift är avstängd tills den är full. Spelarpanelens `RF LOCKED` ersatt med `AB` + mätare (blå, röd vid laddning). `scr_player_step`, `scr_player_respawn`, `scr_hud_panel`, `scr_drift_apply`, `scr_data_powerups`, `scr_config_init`. D-052. Ej körd.

## 2026-10-18 — Race, steg 1 (skal)
- Race är nu valbart under Game modes: START, PLAYERS, LAPS (1–10, standard 3), MAP, ROUNDS, POWERUPS (av som standard). En race-runda startar på vald bana med spelarnas startplatser; HUD visar `LAP x / N` per spelare och racetimern i rubrikraden. Ingen mållinje, inga pickups och inga Race-regler för vapen och drift än (steg 2–7). Specifikationen ligger i `docs/race/`. D-053. Ej körd.

- Race: väggkrasch tar ingen skada (samma som Galaxy Duel). D-053 tillägg: en enda kontrollpunkt = start/mållinjens ruta. Ej körd.

## 2026-10-18 — Race: start/målruta och varvräkning (steg 2 + 7)
- Banredigeraren: nytt verktyg **F** för en start/målruta (en per bana, icke-solid, pilar; mushjulet vrider riktningen; X tar bort). Sparas som `finish` i `levels.ini` (valfri). I Race räknas varven när skeppet passerar rutan i pilens riktning (nettoräkning, ingen fusk genom att vicka); klara skepp får maltid. Panelen visar varv/klar/`NO FINISH LINE`. `scr_fin_cross`, `scr_fin_draw`, `scr_fin_arrows`, `scr_level_parse_finish`, `scr_ed_in_finish`, `scr_ed_step/draw`, `scr_level_read/write/apply`. D-054. Ej körd.

## 2026-10-18 — Race, steg 3
- Race: alla börjar utan ammo (kanon och specialvapen) och med drift avstängd (ingen automatisk laddning). Ett kanonskott kostar 1 ammo. Vapenträffar (skott, missil, Mini Nuke, chockvåg, stråle) skadar och dödar inte utan ger 20 % fart i 3 sekunder (förnyas, staplas inte). Panelen visar fartminskningen som `SL` i stället för energi. `scr_race_hit`, `scr_player_step`, `scr_player_respawn`, `scr_shot_step`, `scr_missile_step`, `scr_fx_damage`, `scr_beam_step`, `scr_hud_panel`. D-055. Ej körd.

## 2026-10-18 — Race, steg 4 (pickups)
- Banredigeraren: verktyg **O** placerar, flyttar och (med X) tar bort runda pickuppunkter (högst 16, sparas som `pickups` i `levels.ini`). I Race ger en pickup exakt ett skott Plasma, en missil, en styrd missil eller fullt drivmedel för drift (slumpat tills steg 5), väljer vapnet automatiskt, försvinner i 5 s och kommer tillbaka på samma plats; meddelande i panelen. `scr_pickup_step`, `scr_pickup_grant`, `scr_pickup_draw`, `scr_level_parse_pickups`, `scr_ed_pk_pick`, `scr_ed_step/draw`, `scr_level_read/write/apply`. D-056. Ej körd.

## 2026-10-18 — Race, steg 5 (placering och nivåer)
- Race: placering enligt klara, varv, tidigast passage av målrutan och startordning (`POS x / N` i panelen). En pickup ger efter placering: ledare bara Plasma, mitten Plasma eller Missile, sist Guided Missile eller Drift (ensam racer alla fyra). `scr_race_ahead`, `scr_race_pos`, `scr_pickup_grant`, `scr_fin_cross`, `scr_race_reset`, `scr_hud_panel`. D-057. Ej körd.

## 2026-10-18 — Race, steg 6 (mål, utslagning, resultat)
- Race: skepp som kommit i mål blir spöken (skjuter inte, kolliderar inte, kan inte träffas). Är alla klara slutar racet; är bara en racer kvar får den 4 s och exploderar sedan (nedräkning i panelen). Resultatrutan visar vinnare, placeringar och tider (eller ELIMINATED/DID NOT FINISH) och `PRESS TO ENTER NEXT RACE`; vinnaren får en rundvinst. `scr_race_step`, `scr_race_eliminate`, `scr_race_round_end`, `scr_race_results_draw`, `scr_round_over_step`, `scr_game_step`, träff- och kollisionsskript. D-058. Ej körd.

## 2026-10-18 — Race, steg 8 (granskning)
- Statisk regressionsgranskning och testlista för Race (`docs/race/RACE_STAGE8_CHECKLIST.md`). Inga kodändringar. Kända begränsningar och öppna beslut listade. D-059. Ej körd.

- Race: stor startnedräkning 3, 2, 1, GO! i mitten av spelytan; gas och backning avstängda tills GO! (racetiden startar då). D-060. Ej körd.

- Helskärm: Windows-tangenten får inte längre spelet att flimra ut och in; endast Alt+Tab lämnar helskärmen direkt, annars efter 5 ticks utan fokus. D-045 tillägg 2. Ej körd.

## 2026-10-18 — Banredigeraren: ny panel, zoom och panorering
- Verktygspanelen omgjord: mindre text, kategorierna STATUS, DRAW, PLACE, VIEW och FILE med egna färger, markerat aktivt verktyg och verktygsberoende hjälptext. Mushjulet zoomar (25 % per steg, 1 till 16 gånger, kring muspekaren), mellanslag + drag (eller mittenknappen) panorerar, Home återställer vyn. Över målrutan vrider hjulet fortfarande pilarna. `scr_ed_draw`, `scr_ed_step`, `scr_ed_layout`, `scr_ed_zoom`, `scr_ed_pan_clamp`, `scr_ed_txt/head/row/frame`. D-061. Ej körd.

## 2026-10-18 — Race: bara Race-banor, skarp nedräkning
- Race visar bara banor som sparats med Race markerat (levels.ini migreras till v3: Race-biten tas bort från banor utan målruta); inga Race-banor ger `NO RACE MAPS` och spärrad START; nya banor får Classic + Galaxy Duel som förval. Startnedräkningen 3, 2, 1, GO! ritas som vektorlinjer (skarp). D-062. Ej körd.

## 2026-10-18 — Väggkontakt: glid och gnistor
- Skepp som träffar en vägg fastnar inte längre: de glider längs väggen och saktas ned, mer ju mer nosen pekar mot den, med gnistor medan de slipar. Skada bara av normalfarten. `scr_wall_slide`, `scr_player_hits_wall`, `scr_player_step`. D-063. Ej körd.

- Race-nedräkningen ritas i digital LCD-stil (raka segment, inga rundade kanter). D-064. Ej körd.

## 2026-10-18 — Spelarpanelens högra zon
- Skeppet ligger ensamt i mitten (mindre) och siffrorna i hörnen: placering (Race) eller runda, vinster, varv eller liv med rutor, reparationstid i Galaxy Duel. Gäller alla spellägen. D-065. Ej körd.

- Spelarpanelen: skeppet skalas efter sin storlek så att det ryms mellan texten uppe och linjen nere i alla vinklar. D-065 tillägg. Ej körd.

## 2026-10-18 — Ytterramen tonar fram
- Arenans yttre gräns (den röda ramen) syns bara när ett skepp närmar sig och tonar in ju närmare man kommer (200–700 världspixlar); övriga väggar oförändrade, kollisionen oförändrad. `scr_frame_prepare`, `scr_frame_players`, `scr_frame_line_draw`, `scr_poly_has_point`, `scr_match_draw`, `scr_game_start`. D-066. Ej körd.

- Ytterramen börjar synas tidigare: avstånden dubblade (full synlighet inom 400, osynlig bortom 1400 världspixlar). D-066 tillägg. Ej körd.

## 2026-10-18 — Ljud i Race-nedräkningen
- Race-nedräkningen (3, 2, 1, GO!) spelar ljudet PM_FSSF_DOOR_MID_9 (Sonniss GDC 2019) vid varje steg. Rättigheter dokumenterade, status okänd tills bekräftad. D-067. Ej körd.

## 2026-10-18 — Missilens ring skadar som en direktträff
- Explosionsringen från en missil (när den sprängs av sig själv eller träffar något) skadar nu lika mycket som en direktträff: 12 för missil, 5 för guidad missil (förut 3). Skeppet som träffas direkt får inte skadan två gånger. D-068. Ej körd.

## 2026-10-18 — Powerup Editor: CANNON och MISSILE
- Två nya sidor i den hemliga Powerup Editor: CANNON (skada, hastighet, gravitation, laddtid, knuff) och MISSILE (hastighet, explosionstid, direktskada, ringens skada, ringens storlek, skadeavstånd, partiklar, knuff, väntetid). Missilens ring har nu fast storlek i världspixlar (som Mini Nuke). Race-inställningarnas g_sv-index flyttade till 100–102. D-069. Ej körd.

## 2026-10-19 — Explosionsringar knuffar bort skepp
- Missilens, den styrda missilens och Mini Nukens explosionsring puttar bort skeppen den når, starkast nära mitten (nya rader BLAST KNOCKBACK i MISSILE och MINI NUKE i Powerup Editor). D-070. Ej körd.

- Missilringens knuff tredubblad (standard 1500 -> 4500; ny ini-nyckel blast_push). Styrd missil och Mini Nuke oförändrade. D-070 tillägg. Ej körd.

## 2026-10-19 — Ny pausmeny (band)
- Pausmenyn är ett vågrätt band med valen på en rad, matchinfo, spelarkort under och knapphjälp; kontrollerna visas med Y. `scr_pause_draw`, `scr_pause_step`, `scr_pause_controls_draw`, `scr_game_step`. D-071. Ej körd.

- Pausmenyn: PAUSED och valen större, matchinfo mindre, knapprutorna kvadratiska (1:1) med tecknet centrerat. D-071 tillägg. Ej körd.

## 2026-10-19 — MAP EDITOR i huvudmenyn
- MAP EDITOR ligger nu i huvudmenyn under CONTROLS i stället för i Options. D-072. Ej körd.

## 2026-10-20 — FONT TEST (tillfällig)
- Ny tillfällig sida Options -> FONT TEST: sju typsnitt (Cascadia Mono, Rodchenko Light och Cond Light, Bebas Neue, Doto, Pixelify Sans, Intel One Mono) i fem storlekar med och utan kantutjämning, numrerade prover. Rodchenko är kommersiellt: atlasfilerna är gitignorerade. D-073. Ej körd.

## 2026-10-20 — Nytt typsnitt: Rodchenko Light
- Hela spelet använder nu Rodchenko Light (kantutjämnat; 10, 14 och 20 punkter, plus en reserv på 28) i stället för Cascadia Mono. Proportionellt typsnitt med breddtabell per tecken. `tools/gen_gms_fonts.ps1`, `g_TXT_SMALL`. Återställningspunkt: commit aa6a757. D-074. Ej körd.

- FONT TEST-sidan borttagen efter att typsnittet valts. D-073 avslutad.
