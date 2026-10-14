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
