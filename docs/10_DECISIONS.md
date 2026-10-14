# 10 — Beslutslogg

## D-001 — GameMaker Studio 1.4 som mål
- **Status:** beslutat
- **Skäl:** användaren har GMS 1.4 installerat och vill arbeta med Claude Code.
- **Konsekvens:** GML-kod måste vara kompatibel med GMS 1.4; ingen GMS2+-syntax.

## D-002 — Rekonstruktion, inte automatisk binärkonvertering
- **Status:** beslutat
- **Skäl:** arkivet innehåller en Amiga-binär, inte källkod eller ett färdigt GMS-projekt.
- **Konsekvens:** använd dokumentation, binäranalys och observation av originalet som referens.

## D-003 — Originaltrohet först
- **Status:** beslutat
- **Skäl:** användaren vill återskapa spelet och därefter kunna bygga vidare på det.
- **Konsekvens:** ändra inte fysik, kontroller, kamera eller spelregler utan dokumenterat beslut.

## D-004 — Originalfiler är skrivskyddade
- **Status:** beslutat
- **Skäl:** originalfilerna behövs för analys och jämförelse.
- **Konsekvens:** alla konverterade resurser, testdata och remake-kod placeras separat.

## D-005 — `.SOB`-formatet är ännu inte förstått
- **Status:** öppet
- **Observation:** filerna börjar med ASCII-liknande signatur `Shobject`, är binära och varierar i storlek.
- **Nästa steg:** jämför alla filer och korrelera data med skeppens visuella form i originalet.

## D-006 — Versionsidentitet behöver verifieras
- **Status:** öppet
- **Observation:** `Bratwurst.doc` beskriver en beta från 1994–1995, medan `file_id.diz` säger V3.5.
- **Nästa steg:** undersök arkivets ursprung och jämför med observerad version.

## D-007 — Rättighetsstatus måste klarläggas före distribution
- **Status:** öppet
- **Skäl:** dokumentationen anger copyright till Three Little Elks, 1994–1995.
- **Nästa steg:** undersök rättighetsinnehavare och eventuella tillstånd.

## D-005 — uppdatering 2026-10-13
- **Status:** delvis löst. Strukturen (punkter/linjer/pods) är verifierad för 15/15 filer; fältsemantik för P0–P26 och pod-flaggor är fortfarande OKÄND. Se `06`. Formatet får **inte** kallas fullt förstått.

## D-008 — Härledd data hålls utanför `original/`
- **Status:** beslutat (2026-10-13)
- **Beslut:** analysverktyg i `tools/`, härledda filer i `analysis/`. Inget skrivs under `original/`.

## D-009 — Exe är sannolikt skadad; verifiera i emulator före slutsatser
- **Status:** öppet
- **Observation:** hunk 2/3 är 512 B kortare än deklarerat + 1 024 B skräp i slutet (`13`).
- **Nästa steg:** se om emulatorn startar spelet; om inte, leta efter intakt version av arkivet.

## D-010 — Disassembler/emulator kräver användarens godkännande (Ghidra + JDK godkända och installerade 2026-10-13; emulator/ROM fortfarande ej)
- **Status:** öppet
- **Skäl:** nedladdning av verktyg (Ghidra, WinUAE …) och Kickstart-ROM (rättigheter) får inte göras utan godkännande.

## D-011 — Fas 1-prototyp: datadrivet från `.SOB` men med genererade GML-datascript
- **Status:** beslutat (2026-10-13)
- **Beslut:** `tools/gen_gms_data.py` genererar `scr_data_*.gml` (skepp, bana, tabeller) ur analysresultaten; logiken i separata handskrivna scripts. Ingen filläsning av originalfiler i spelet.
- **Skäl:** GMS 1.4 har ingen enkel binärparser i GML; generering undviker datafil-/sökvägsproblem och håller originalen orörda.
- **Konsekvens:** datascripten är härledd originaldata (privata, `docs/09`); byts senare mot ett eget dokumenterat format (D-005).

## D-012 — Placeholder-lista för Fas 1
- **Status:** beslutat; måste revideras efter emulatortest.
- **Placeholders:** kontroller (tangentbord), rumshastighet 50, 1 tick/steg, världsrymdskollision i stället för bitmappar, fyllt skepp för träfftest, endast levande spelare i kameran, färger, ingen meny/ljud/specialvapen. Se `gms/README.md`.

## D-013 — GMS 1.4 kan inte kompileras från kommandoraden här
- **Status:** konstaterat. Ett försök att starta `GameMaker-Studio.exe /c ...` gav ingen utdata och hängde; processen avbröts. Testning sker manuellt i GMS-editorn.

## D-014 — Fas 2: specialvapen med placeholder-urval
- **Status:** beslutat (2026-10-13)
- **Beslut:** specialvapnens logik följer kodverifierade regler; **urvalet** (vapen/pod) sker med tangenter de första 250 ticken i stället för skeppsvalsmeny. NOTHING gör inget (originalet drar ammo utan effekt). Explosioner är en enkel cirkel.
- **Avvikelser att verifiera:** guidad missil kan välja ägaren som mål (som i originalet enligt koden); missiler tas inte bort utanför skärmen; träfftest mot fyllt skepp.

## D-015 — Kanonen skjuter bara framåt som standard; bakåtskjutning låst tills powerup
- **Status:** beslutat av användaren (2026-10-13). **Avvikelse från originalet:** originalets kod avfyrar kanonskott från *alla* K pods (VERIFIERAD, docs/15), inklusive pods som pekar bakåt.
- **Beslut:** pods med podvinkel utanför ±90° (256-stegsenhet 65–191, t.ex. 135°/180°/225°) skjuter inte kanon som standard. Flaggan `rear_fire` (per spelare, startvärde `false`) låser upp dem.
- **Framtida krav (Fas 4, powerups):** en powerup ska sätta `rear_fire = true` för spelaren; bakåtskjutning är alltså **låst från början men ska kunna aktiveras**. Ammo förbrukas bara för pods som faktiskt skjuter. Specialvapen påverkas inte (valbar pod).
- **Att verifiera:** om originalet verkligen skjuter bakåt som standard (kan bekräftas i emulator); tills dess kan en "originaltrogen profil" (rear_fire = true från start) läggas som alternativ.

## D-016 — Terminal-UI ("command deck"), Base16-teman och lokala .ini-filer
- **Status:** beslutat av användaren (2026-10-13). **Avvikelse från originalet:** originalet hade ingen huvudmeny; detta är en ny presentationsnivå (påverkar inte spelmekaniken).
- **Beslut:** titelskärm "BRATWURST - REHEATED" / "PRESS START TO HEAT" (valfri tangent/knapp) → huvudmeny i *command deck*-stil (träd, lista, datapanel; konceptet i artefakten "Bratwurst Terminal UI", förslag 2) → skeppsval i samma stil (en ruta per spelarplats, ledig plats = "PRESS FIRE TO JOIN") → match med paneler: (uppdaterat: alla spelarpaneler i en rad längs nederkanten, lika breda för 1–4 spelare).
- **Färger:** 16 färger (base00–base0F) ur 30 mörka Base16-teman (tinted-theming/schemes; datan genereras av `tools/gen_gms_themes.py`). Tema, accent m.m. väljs i Options och sparas i `settings.ini`; temafärgerna skrivs till `themes.ini` och läses därifrån (redigerbara).
- **Lagring:** `settings.ini` och `themes.ini` via GMS 1.4 `ini_open` i spelets sparmapp (sökvägen visas i Options → DATA FOLDER). Att lägga mappen bredvid exe-filen (portable) är **ej provat** (OKÄND).
- **Layout:** rum 1024×640; spelytan 640×472 (originalets 320×236 ×2) på (192, 36). Text: Cascadia Mono (SIL OFL 1.1) som typsnittsresurser i fyra storlekar × fyra UI-skalor (`fnt_<storlek>_k<skala>`, genererade av `tools/gen_gms_fonts.ps1`). UI-skalan k ∈ {1, 1.5, 2, 3} väljs efter fönster/skärm (`scr_display_apply`: störst k där 1024·k ≤ bredd och 640·k ≤ höjd), vyn blir bredd/k × höjd/k med designytan centrerad, och texten ritas 1:1 mot skärmpixlarna med pixelsnappad position, så den är skarp utan skalning. Koordinaterna är fortfarande rummets 1024×640.
- **Öppet:** spritar/grafik måste senare ritas i en gemensam palett för att följa temat; Base16-licens/kreditering (docs/09); omknytning av tangenter (Controls visas bara).

## D-017 — Spelytan och menyer fyller hela fönstret (widescreen-spelyta)
- **Status:** beslutat av användaren (2026-10-13). **Avvikelse från originalet och från CLAUDE.md-regeln om widescreen:** godkänd uttryckligen av användaren.
- **Beslut:** all UI (titel, menyer, skeppsval, match) lägger ut sig relativt vyn som fyller hela fönstret/skärmen (`scr_layout_update`), så inga tomma sidor återstår. Spelytan är lika bred som panelraden: höjden är originalets 236 enheter (skala = tillgänglig höjd/236, inte längre exakt 2) och bredden visar så mycket mer av banan som ryms (`g_PLAY_W`). Kamerans x-zoom använder `(g_PLAY_W/2 − 10)` i stället för 150 (samma värde vid 320). Skotten tas bort vid `g_PLAY_W`.
- **Reservväg:** Options → WIDE PLAYFIELD = OFF ger originalets 320 enheters bredd (centrerad, skalad så att höjden/bredden ryms). Originalbeteendet för zoom/synfält är därmed bevarat som alternativ.
- **Att verifiera:** att den bredare vyn inte ändrar spelkänslan på ett sätt som spelaren upplever som fusk (längre skottsikt åt sidan).

## D-018 — Skepp mot skepp: kollision och knuff
- **Status:** beslutat av användaren (2026-10-13). **Ny funktion:** om originalet har skepp-mot-skepp-kollision är OKÄNT och ej verifierat (prototypen hade ingen).
- **Beslut:** efter varje tick testas alla levande skepp mot varandra (linjeskärning, som väggkollisionen). Vid kontakt återställs båda till föregående ticks position och byter impuls längs linjen mellan dem (lika massor): `j = (1 + g_COL_REST) · v_närmande / 2`. Ett skepp som står stilla puttas alltså iväg med ungefär motpartens fart. Ett skepp som nyligen använt TURBO BOOST (`boost_timer`, `g_COL_TICKS` = 30 ticks) ger den träffade en kraftigare knuff (`g_COL_BOOST` = 1,6). Maxfart efter krock `g_COL_VMAX` = 16 000 (1/256 px per tick).
- **Ingen skada** vid skeppskrock än så länge (lätt att lägga till). Värdena är PLACEHOLDERS att justera efter spelkänsla (`scr_config_init`).

## D-019 — Banfiler (levels.ini) och banredigerare
- **Status:** beslutat av användaren (2026-10-13). **Ny funktion** (originalet har en fast bana).
- **Format:** `levels.ini` i spelets sparmapp. `[index]` (count, next, id0..) listar banorna; varje bana är en sektion `[<id>]` med `name`, `shapes`, `s0..` (slutna polygoner, `x,y;x,y;...` i världspixlar) och `p0..p3` (startplatser `x,y,vinkel` i 1/256 px och 256-stegs vinkel). Alla former är solida hinder: varje polygon blir vägglinjer (`scr_level_apply`), avgränsningsrutor räknas ut vid inläsning.
- **Inbyggda banor** (skrivs till filen vid första start, `tools/gen_gms_levels.py`): *Sirius Bratwurst* (originalbanan, uppdelad i 11 polygoner), *Kepler Chorizo* och *Proxima Merguez* (egna remixer). Namn följer mönstret stjärna/planet + korv; nya banor får slumpat namn (`scr_level_name_random`).
- **Meny:** Game Modes → MAP (välj bana) och MAP EDITOR. Vald bana sparas i `settings.ini` (`gameplay.map`).
- **Redigerare:** mus + tangentbord (B rektangel, P polygon, X radera, T startplats, G rutnät, U ångra, S spara, N ny bana, [ ] byt bana, Del ta bort bana, Esc ut). Enkel och avsiktligt begränsad (inget zoom/panorering, max 64 former à 32 punkter, ingen gamepad).
- **Rättigheter:** originalbanans geometri är härledd data (docs/09); den skrivs till användarens sparmapp men distribueras inte med repot som egen fil förutom via `scr_data_levels.gml`/`scr_data_arena.gml` (privat).

## D-020 — Rundor och slutresultat
- **Status:** beslutat av användaren (2026-10-13). **Ny funktion** (originalets matchstruktur med rundor är ej verifierad).
- **Beslut:** Game Modes → Classic → ROUNDS (1–15, standard 3, sparas som `gameplay.rounds`). En runda slutar när bara en spelare återstår; vinnaren får en rundvinst, rundresultatet visas ca 3 s och nästa runda startar med samma skepp (alla får full energi, alla liv och ammo, nya startplatser). Efter sista rundan visas en egen resultatskärm (`g_state = 30`): rundvinster per spelare, matchvinnaren (eller oavgjort), och valen REMATCH (tillbaka till skeppsvalet med samma antal rundor, nya skepp) och MAIN MENU. Vid dött lopp (ingen kvar) ger rundan ingen vinst. Med en spelare avslutas rundan aldrig.

## D-021 — Originalets ljudeffekter inlagda
- **Status:** beslutat (2026-10-13), kopplingarna VERIFIERADE ur koden (docs/15, "Ljudeffekter").
- **Beslut:** de sju originalsamplen i hunk 2 klipps med exakta gränser (`tools/extract_sfx.py`, 16-bit WAV vid Paula-frekvensen period→Hz) och spelas via `scr_sfx_play` på originalets tre effektkanaler (ny effekt avbryter den på samma kanal). Kopplingar: kanonskott och cannon turret, missil/guidad missil avfyrning, explosion (`scr_fx_spawn` med typ 1–2), väggkrasch (fart över ±1000), skepp mot skepp, kanonträff (volym 26/64). Options → SOUND EFFECTS slår av/på. Titelmusiken är separat.
- **Rättigheter:** härledd originaldata (docs/09): privat repo; gäller även `gms/Bratwurst.gmx/sound/audio/`. Användaren uppger att spelet är gratis och aldrig sålts kommersiellt (2026-10-13), men rättighetsfrågan är inte juridiskt klarlagd.

## D-022 — Titelmusik: användarens loop, förberäknad equalizer
- **Status:** beslutat av användaren (2026-10-13).
- **Beslut:** `snd_title_music` är `RollingBreakbeat_loop_150bpm.ogg`. GameMaker Studio 1.4 saknar spektrumanalys av ljud i realtid, så equalizern drivs av data som analyseras offline (`tools/gen_music_viz.py` → `scr_data_musicviz.gml`) och synkas mot `audio_sound_get_track_position`. Byts musikfilen måste verktyget köras om.
- **Rättigheter:** filens ursprung och licens är okända för projektet (användarlevererad). Se docs/09.

## D-023 — Spelläge ASTRO DUEL
- **Status:** beslutat av användaren (2026-10-13). Nytt spelläge, finns inte i originalet.
- **Meny:** Game Modes → Astro Duel: START, PLAYERS, MAP, ROUNDS (delade inställningar som i Classic) och LIFE (1–9, standard 1; `astro.lives` i `settings.ini`).
- **Regler:** (1) Varje träff (kanonskott eller missil) tar ett liv; med LIFE = 1 dör man på en träff. (2) Ingen skada av väggkrasch (studs, gnistor och ljud finns kvar). (3) Kanon: tre skott per laddning, ett skott per knapptryck (kantat) hur snabbt man vill; efter det tredje skottet 4 s nedkylning (`g_AD_COOLDOWN` = 200 ticks), därefter tre nya skott; ingen kanonammo. (4) Projektiler (skott och missiler) 30 % större: ritade 1,3×, träffradie 1,5 × 1,3 skärmenheter i världsrymd (Classic: punkt) och svept träfftest längs rörelsen (`scr_proj_hit`). (5) Endast MISSILE och TURBO BOOST för alla skepp (oavsett skeppets .SOB-vapenlista). (6) Missilen flyger dubbelt så fort (`64` i stället för `32`); livslängden är oförändrad.
- **Oförändrat (ej angivet av användaren):** specialammo per skepp enligt P10 (10–25 missiler), missilens och turbons nedräkning, skeppskrockar, rundor och resultatskärm.
- **Att verifiera:** spelkänsla (dubbel missilfart/räckvidd, träffradie, nedkylningstid).

## D-024 — Ingen gravitation på skeppen
- **Status:** beslutat av användaren (2026-10-13). **Avvikelse från originalet:** originalets fysik har gravitation på skeppen (VERIFIERAD: 50, skalad till 31, docs/15) och luftmotstånd.
- **Beslut:** skeppsgravitationen är `g_SHIP_GRAV = 0` (`scr_config_init`; originalvärdet `g_GRAV = 31` är kvar i konfigurationen). Luftmotståndet är kvar men avrundas nu mot noll (tidigare drev ett långsamt skepp med positiv fart för evigt) och farten nollas helt när båda komponenterna är under 24 (1/256 px/tick) utan thrust, så att ett skepp som inte styrs står helt stilla.
- **Orört:** kanonskottens gravitation (`g_SHOT_GRAV` = 15) och missilerna (ingen gravitation).

## D-025 — Ny titelskärm: "Radial Ring"
- **Status:** beslutat av användaren (2026-10-13), vald bland sex förslag (artefakten "Bratwurst Radial Ring").
- **Beslut:** titelskärmen har en centrerad logotyp i tunna linjer (B R A T W U R S T, A med öga, REHEATED under med linjer på sidorna), en cirkulär equalizer med 72 staplar runt loggan som följer musiken (`g_mv`, D-022; faller tillbaka på en lugn animation utan musik), två dithrade planeter som svullnar med basen, fasta blinkande stjärnor samt oförändrad bakgrund med rutnät och roterande skepp. Loggans glöd pulserar med basen. Gamla texten och värmebalken är borttagna; PRESS START TO HEAT finns kvar. Färgerna kommer från temat (logotyp och planeter = accent; staplar grön → gul → röd).

## D-026 — Banor per spelläge och sparfönster i banredigeraren
- **Status:** beslutat av användaren (2026-10-13).
- **Beslut:** varje bana har en bitmask `modes` i `levels.ini` (bit 0 Classic, 1 Astro Duel, 2 Race, 3 Capture the Bratwurst; saknas nyckeln gäller alla lägen). Banvalet i menyn visar bara banor som finns i läget; Classic och Astro Duel har var sitt banval (`gameplay.map`, `gameplay.map_astro` i `settings.ini`).
- **Sparfönster:** S i banredigeraren öppnar ett fönster med namnfält (skrivs med tangentbordet), knappen GENERATE NAME (slumpat "stjärna + korv"-namn) och en ruta per spelläge. SAVE (Enter) sparar, CANCEL (Esc) avbryter. Minst ett läge måste vara valt, och varje spelbart läge (Classic, Astro Duel) måste ha minst en bana kvar; samma regel hindrar att man tar bort den sista banan i ett läge. Race och Capture the Bratwurst finns i listan så att banor kan förberedas, men lägena är inte byggda än.

## D-027 — Skepp som fastnar i varandra skjuts isär
- **Problem:** skeppskollisionen (D-018) återställer båda skeppen till föregående tick; om de redan överlappade där (respawn på varandra, rotation in i varandra, utebliven impuls) fastnar de.
- **Beslut:** `scr_ship_separate` skjuter isär skeppen längs linjen mellan centrumen (2 px per varv, högst 24 varv; ett skepp som skulle hamna i en vägg flyttas inte) och ger en minsta isärhastighet. Nytt beteende, inte i originalet.

## D-028 — Skeppskrock: normal från relativ rörelse och vridning
- **Problem:** ett skepp som körde in i ett stillastående gav ingen reaktion när rörelsen var mest tangentiell mot linjen mellan centrumen (skeppet stoppades men impulsen uteblev).
- **Beslut:** `scr_ship_bounce` använder centrumlinjen som normal, men faller tillbaka på den relativa rörelseriktningen när närmandet är under 35 % av relativa farten; minsta impuls 100. Kontaktpunkten (`scr_ship_contact`) ger båda skeppen en vridhastighet `spin_v` (hävarm × impuls / 12000, högst 3 steg/tick, avklingar 10 % per tick) som appliceras i `scr_player_step`. Nytt beteende, inte i originalet; konstanterna är PLACEHOLDERS.

## D-029 — Missilexplosionens ring skadar
- **Beslut (användaren):** när en missil exploderar och den expanderande ringen når ett skepp tar skeppet 3 energi (en gång per skepp och explosion). Ringens radie är exakt den som ritas (6 + 4 px per tick, 14 resp. 9 ticks för missil resp. guidad missil). Gäller missil och guidad missil i Classic; ingen splash i Astro Duel (där tar bara direktträffar liv) och inte skeppskrockens ring. En direkträff på ett skepp ger dessutom den vanliga träffskadan (12/5). Nytt beteende, inte i originalet.

## D-030 — Drift (test) och Y för specialvapenbyte
- **Beslut (användaren, test):** en drift-knapp på vänster trigger (LT, `gp_shoulderlb`) på alla gamepads. Drift fungerar bara medan man gasar och håller knappen, och bara i fart (`g_DRIFT_MINSPEED` = 500 enheter/tick); stillastående eller utan gas ger ingen drift.
- **Effekt (PLACEHOLDER, ska justeras efter test):** snabbare vridning (`g_DRIFT_TURN` = 1.5), gasen riktas `g_DRIFT_ANG` = 34 vinkelsteg (≈48°; först 20, sedan 26, 34 efter två test med +30 %) utåt från svängen så att skeppet glider i sidled, gasen är 117 % (`g_DRIFT_THRUST` = 1.17; först 0.9, +30 % efter test), samt gnistor bakom skeppet. Nytt beteende, inte i originalet.
- **Konsekvens:** LT var tidigare nästa specialvapen; det flyttades till Y (`gp_face4`, tidigare oanvänd). Tangentbord för test: spelare 1 C, spelare 2 Q, spelare 3 H.
- **Reverse (tillägg):** samma knapp utan gas = backa. Bara drift-knappen, ingen gas: svag gas åt motsatt håll mot nosen (`g_REVERSE_THRUST` = 0.25 av vanlig gas), så man kan backa ur en vägg; fungerar även från stillastående. Värdet är en PLACEHOLDER.
- **Driftspår (ersätter gnistorna):** under drift ritas ett eller två ljusspår i skeppets färg (additiv blandning, smalare och svagare mot svansen). Smala skepp (halva bredden < 80 skeppsenheter: BatWing, JAS, Kaese, TieFighter) har ett spår från aktern, de bredare två spår på ±50 % av halva bredden. Spåret får en punkt per tick (högst `g_TR_MAX` = 40, först 80), växer fram och följer banan; när driften slutar hänger spåret kvar vid skeppets akter medan det tonar ut och de äldsta punkterna tas bort (ca 1 s). Spårens utseende och längd är PLACEHOLDERS. `scr_trail_init/clear/update/draw`.
- **Momentum-läget återkallat (användaren):** farten bevarades under drift (inget luftmotstand), men det kändes som is. Driften är tillbaka till den tidigare modellen: vanligt luftmotstånd, gasen riktas `g_DRIFT_ANG` = 34 steg utåt och är `g_DRIFT_THRUST` = 1.17 av vanlig gas.

## D-031 — Skott och missiler ärver inte skeppets fart
- **Beslut (användaren):** ett kanonskott eller en missil ska alltid avfyras exakt i den riktning skeppet pekar (nosens vinkel plus podens vinkel), även när skeppet glider i sidled med full fart eller driftar. Därför läggs inte längre skeppets egen hastighet till skottets hastighet (`g_SHOT_INHERIT` = 0 i `scr_config_init`; 1 återställer det gamla beteendet).
- **Avvikelse från originalet:** originalets rutin adderar skeppets hastighet till skottet (docs/15, `vx - sin << shift`; VERIFIERAD i kod). Gäller kanonskott (Classic och Astro Duel) och missiler/guidade missiler. Kanontornet (autosikte mot närmaste fiende) och turbo/tractor är oförändrade.

## D-032 — Ändrad gamepad-mappning: Y = specialvapen, Back = nästa specialvapen, ingen spelarcykling
- **Beslut (användaren):** Specialvapen flyttas från B till Y (`gp_face4`); Nästa specialvapen flyttas från Y till Back (`gp_select`); "Cykla antal spelare" tas bort helt (Back på gamepad och F5 på tangentbordet). B är nu oanvänd. Antalet spelare väljs genom att gå med i skeppsvalet eller i Game modes → Players.
- **Driftljud:** `snd_sfx_drift`, ett egenproducerat loopbart motorljud (2 s, mono, 44,1 kHz) som spelas i loop så länge man driftar, per spelare, med inton 150 ms och uttoning 200 ms; följer Options → SOUND EFFECTS. Syntetiserat av `tools/gen_drift_sound.py` (morrande basljud 55/82,5 Hz, tjutande ton 330 Hz, filtrerat brus, 7 Hz modulering), ingen extern källa, inga rättighetsproblem. Volym `g_DRIFT_SND_GAIN` = 0.45 (PLACEHOLDER).

## D-033 — Den yttre ramlinjen borttagen på alla banor
- **Beslut (användaren):** banornas ram bestod av två slutna fyrkanter (originalets två första väggobjekt: yttre −3000,−2273…2961,2273 och inre −2904,−2159…2847,2159). Den yttre linjen togs bort på alla banor; den inre ramen är kvar och är den som skepp och skott kolliderar med. Området mellan linjerna var ändå oåtkomligt (alla startpositioner ligger innanför den inre), så spelytan och spelkänslan ändras inte.
- **Genomförande:** `tools/gen_gms_levels.py` genererar de inbyggda banorna utan den yttre fyrkanten (Sirius 10, Kepler 10, Proxima 12 objekt), `scr_level_new` skapar nya banor med bara en ram, och `levels.ini` migreras från v1 till v2 vid start (`scr_levels_strip_outer`): den yttre fyrkanten tas bort ur alla banor, även egna, och en säkerhetskopia sparas som `levels_v1_backup.ini` i spelets sparmapp. Avvikelse från originalets banform (utseende); `scr_data_arena` (originaldata) är orörd. Hur originalet använder dubbellinjen är OKÄNT (kan kontrolleras i emulatorn).

## D-034 — Korvmodell (Capture the Bratwurst)
- **Beslut (användaren):** en korvmodell i samma trådramsstil som skeppen, att användas senare i spelläget Capture the Bratwurst och nu som dekoration på titelskärmen och i huvudmenyn.
- **Genomförande:** `scr_data_sausage` bygger modellen matematiskt (bågformad central kurva, fyra längsgående kurvor, tvärringar var annan punkt som böjs lätt, en spets med liten fena i varje ände; ca 300 skeppsenheter lång) i skeppens dataformat som pseudoskepp med index `g_SAUSAGE` = `g_ship_count`, utanför skeppsvalet (som bara går till `g_ship_count - 1`). Den ritas med `scr_ui_ship` och driver och roterar i bakgrunden (`scr_bg_draw`) tillsammans med de fyra skeppssilhuetterna, på både titelskärmen och menyn. Modellen är en första version efter användarens bild och kan finjusteras (spetsar, tjocklek, krökning). Spelläget Capture the Bratwurst är fortfarande en platshållare.
- **Andra versionen (användaren: första såg ut som en banan):** korven är nu kraftigare med nästan jämn tjocklek (54 enheter) och trubbiga, rundade ändar (superellips-profil i stället för avsmalnande spetsar), fem längsgående kurvor, ca 16 lätt böjda tvärringar, extra ringar nära ändarna som slutna kappor och en liten vriden knut (spets + V) på den inre kanten i varje ände, som i användarens bild.
- **Redigerbar källa (användaren vill rita själv):** `assets/models/sausage.svg` (en linje per modellinje) är en redigerbar källa. `tools/svg_to_model.py` (tar nu hänsyn till viewBox, så en SVG som sparats om i annan skala, t.ex. 0 0 1200 660, hamnar rätt) läser gruppen `id="model"` (linjer, polylinjer, polygoner, rektanglar, path med raka linjer och kurvor, transformer) och skriver om `scr_data_sausage.gml` som en explicit punkt-/linjelista; `tools/make_sausage_svg.py` skapar SVG:n från den inbyggda formen. Rundtur SVG → GML testad (236 linjer bevaras). Instruktioner i `assets/models/README.md`.
- **Användarens ritade korv:** `assets/models/sausage2.svg` (användarens omritning: 180 punkter, 251 linjer, med extra kantlinje och finnar i ändarna) är nu den aktiva modellen: `scr_data_sausage.gml` genereras av `svg_to_model.py` från den. Den beräknade första versionen finns kvar i git-historiken och via `tools/make_sausage_svg.py` / `sausage.svg`.

## D-035 — Powerup-system och Mini Nuke
- **Beslut (användaren):** ett nytt powerup-system. Alla spellägen får en rad POWERUPS ON/OFF (standard ON; implementerat i Classic och Astro Duel, de tomma platshållarlägena Race/Capture får raden när de byggs). 5 s efter att en runda startar dyker en orb med en pixelikon upp på en slumpad plats på kartan; slumpas bland alla definierade powerups (nu bara Mini Nuke). Platsen ska ligga innanför banans ram, inte på ett föremål och orbens kant minst 20 pixlar från varje vägg (`g_PU_WALL`, centrum minst radie + 20); jag lade till att den inte hamnar närmare än 70 pixlar från ett skepp. När en powerup tas upp kommer en ny slumpad powerup efter 10 s på en ny slumpad plats (`g_PU_RESPAWN`); bara en finns på kartan åt gången. Ikonen byter färg mellan fem starka färger (röd, gul, grön, cyan, magenta) var 2:a tick så den syns tydligt.
- **Mini Nuke (tolkning, kan ändras):** den som tar upp en powerup håller den (visas som "PU MINI NUKE" i spelarpanelen) och avfyrar den med B på gamepaden (tangentbord för test: spelare 1 V, spelare 2 F, spelare 3 M; ändrat från special-knappen efter användarens önskemål); den förloras om man dör eller rundan tar slut. Mini Nuke beter sig som en missil (`obj_missile`, `mtype` 3): ärver inte skeppets fart (D-031), kolliderar med en radie som är projektilens storlek, exploderar mot vägg/skepp eller efter 3 s och skapar en chockvåg (explosionstyp 4) i världspixlar som växer och bromsar in, skadar varje skepp den når en gång och skickar ut pixelpartiklar. I Astro Duel dödar både direktträff och chockvåg (alla träffar tar ett liv).
- **Powerup Editor (hemlig):** i Options, tryck P, så läggs raden POWERUP EDITOR sist i listan (syns tills spelet startas om). Där finns en undermeny per powerup. Mini Nuke: PROJECTILE SIZE 1–20 (standard 4), SPEED 8–96 (28; en vanlig missil är 32), SHOCKWAVE RADIUS 40–800 världspixlar (220), PARTICLES 0–400 (160), DIRECT DAMAGE 0–100 (30), SHOCKWAVE DAMAGE 0–100 (15), CAMERA SHAKE 0–60 pixlar (12; bilden i spelytan skakar slumpmässigt när nuken exploderar och klingar av på ca 0,4 s, ram och paneler ligger stilla). Värdena sparas i settings.ini (`[powerup_mininuke]`). Nya powerups läggs till i `scr_data_powerups` (definition, ikon, parametrar), `scr_powerup_fire` (effekt) så byggs menyn och sparandet av datan. Orbens radie (36 världspixlar, först 18), tider och skadevärden är PLACEHOLDERS.
- Filer: `scr_data_powerups`, `scr_powerup_reset/enabled/pos_ok/spawn/step/fire/draw`, ändringar i `scr_missile_step`, `scr_fx_spawn/damage`, `scr_match_draw`, `scr_special_fire`, `scr_hud_panel`, menyerna och `scr_set_*`. Nytt beteende, inte i originalet.

## D-036 — Powerup Railgun
- **Beslut (användaren):** ny powerup RAILGUN. Efter upplockning håller man powerup-knappen (B) inne i 4 sekunder; framför skeppet växer en glödande kula (i spelarens färg med allt ljusare kärna; när den är klar byter den färg till vitt och flimrar snabbt). Släpper man knappen fulladdad avfyras den: kulan försvinner och en stråle dras från skeppets nos åt det håll skeppet pekar genom hela banan, över alla föremål och väggar (stråla går igenom allt). Huvudet når andra sidan på 0,5 s; strålen ligger kvar i 2 s och tonar sedan ut på 1 s. Strålens färg är spelarens färg. Den dödar ett skepp på en träff. Egen ikon (ett skott mellan två skenor) och ett kraftfullt scifi-lasersljud (`snd_sfx_railgun`, egenproducerat med `tools/gen_railgun_sound.py`).
- **Tolkningar:** släpps knappen före full laddning avbryts laddningen och powerupen är kvar (inget skott); skadan sker bara när strålens huvud sveper förbi ett skepp (inte om man flyger in i den kvarliggande strålen); ägaren träffas inte; strålen ärver inte skeppets fart; "0,5 s" gäller hela strålens färd (7000 världspixlar, banan är ca 6000 bred) och ljusare kärna används i strålen (färgen är spelarens). I Astro Duel dödar alla träffar.
- **Powerup Editor:** CHARGE TIME 1–10 s (4), BEAM SPEED 0,1–3,0 s (0,5), BEAM HOLD TIME 0–10 s (2), BEAM FADE TIME 0,1–5 s (1), BEAM WIDTH 1–40 pixlar (6; både träffbredd och ritad bredd), DAMAGE 0–100 (100 dödar), CAMERA SHAKE 0–60 (8), CHARGE BALL SIZE 4–50 pixlar (18). Filer: `scr_railgun_update/draw`, `scr_beam_spawn/step/draw`, `scr_seg_dist`, `scr_data_powerups`, ändringar i `scr_player_input/step`, `scr_hud_panel`. Allt är PLACEHOLDER-värden.
- **Railgun-ljud (tillägg):** under laddningen loopar ett vibrerande, vobblande ljud (`snd_sfx_rg_charge`, 2 s, sömlös loop: vibrato 6 Hz, tremolo 9 Hz, skimrande ton) vars volym går från försiktig till stark (0,08 + 0,92·laddning²) och tonhöjd från 0,8 till 1,5 med laddningen; när kanonen är fulladdad tystnar det och ett "laddad"-ljud spelas (`snd_sfx_rg_ready`); släpps knappen avfyras skottet; hålls den kvar avfyras den av sig själv efter 3 s (`g_RG_AUTO` = 150 ticks, konstant, inte i Powerup Editor). Ljuden tystnar vid paus, död, rundslut och när matchen lämnas och följer SOUND EFFECTS. Egenproducerade med `tools/gen_railgun_charge_sounds.py`.

## D-037 — Mjuk kamerazoom när antalet spelare i bilden ändras
- **Beslut (användaren):** när en spelare dör (eller kommer tillbaka efter respawn) ska kameran inte hoppa direkt till de kvarvarande spelarna utan zooma mjukt. `scr_camera_update` räknar målzoom och mål-centrum som förut (originalets formel, alla levande spelare); ändras antalet spelare i bilden startar en övergång på `g_CAM_TRANS` = 100 ticks (2 s) där zoom och centrum glider exponentiellt mot målet (`g_CAM_K` = 0,045 per tick, ca 90 % efter 1 s). Utanför övergångar följer kameran spelarna omedelbart som i originalet; vid ny match/runda hoppar den direkt. Kamerans fryst läge när bara en spelare är kvar (rundslut) är oförändrat. Nytt beteende, konstanterna är PLACEHOLDERS.

## D-038 — Drift i Powerup Editor och Options i pausmenyn
- **Beslut (användaren):** (1) alla drift- och reverseinställningar ska kunna justeras i spelet: en sida DRIFT i den hemliga Powerup Editor (Options, tryck P). Den är den tredje posten i powerup-datan (`g_PU_COUNT` = 3) men spawnas inte som orb (`g_PU_SPAWN` = 2). Parametrar (sparas i `[powerup_drift]` i settings.ini, kopieras av `scr_drift_apply` till spelkodens variabler): MIN SPEED 0–3000 (500), TURN BOOST 100–400 % (150), SLIDE ANGLE 0–64 steg (34), DRIFT THRUST 25–300 % (117), REVERSE THRUST 0–100 % (25), TRAIL LENGTH 4–120 punkter (40), ENGINE SOUND 0–100 % (45), TRAIL WIDTH 20–300 % (100). (2) Pausmenyn får raden OPTIONS (RESUME GAME, OPTIONS, QUIT TO MENU) som öppnar samma menyträd som i huvudmenyn med OPTIONS som rot; Esc/B på översta nivån går tillbaka till pausmenyn. Menyns stack sparas och återställs (`scr_pause_opts_open/close`). Banredigeraren (Map Editor) är spärrad under en match; ändringar som gäller nästa match (t.ex. LIFE) slår igenom då. Tryck P även här visar Powerup Editor.

## D-039 — Drift: SIDE THRUSTER
- **Beslut (användaren):** driften ska kännas som att man sladdar i en kurva som en rallybil. En sidotruster puttar skeppet i sidled medan man driftar: bara när man gasar (och driftar) och svänger. Svänger man höger puttas skeppet åt skeppets vänstra sida (ut ur kurvan), svänger man vänster puttas det åt höger. Styrkan ställs in i Powerup Editor → DRIFT → SIDE THRUSTER (0–400 % av vanlig gas, standard 60 %; `g_DRIFT_SIDE`). Den läggs till utöver den befintliga "SLIDE ANGLE" (som lutar gasens riktning); SLIDE ANGLE kan sättas till 0 om man bara vill ha sidotrustern.
- **Teknik:** antalet inställningsplatser per powerup höjdes från 8 till 12 (`g_PU_STRIDE`), eftersom DRIFT nu har 9 parametrar; sparade värden hittas via namn i settings.ini så inget går förlorat.

## D-040 — B backar ett steg i skeppsvalet
- **Beslut (användaren):** B på gamepaden backar ett steg i skeppsvalet (samma som X/thrust-knappen: CONFIRM → POD → WEAPON → SHIP, och tar tillbaka READY). På första raden (SHIP) lämnar B skeppsvalet till huvudmenyn, men bara när ingen spelare har kommit längre än SHIP (så ingen förlorar ett val av misstag); annars händer inget. Tidigare gick tillbaka från SHIP runt till CONFIRM, vilket togs bort. Esc går som förut direkt till huvudmenyn.

## 2026-10-14 — D-041: Solid colors (fyllda väggar och skepp)
- **Beslut (användaren):** ny inställning Options → SOLID COLORS ON/OFF, standard OFF (originalets rena konturer). Vid ON fylls alla solida väggar med sin väggfärg (samma färg som konturen; bilden användaren bifogade visar även ett fyllt skepp, så skeppens skrov fylls också i sin spelarfärg; konturerna ritas ovanpå).
- **Teknik:** polygoner (väggar och skeppsskrov, även konkava) triangulerar med ear clipping (`scr_poly_tris`) en gång: banans polygoner vid matchstart (`scr_solid_build`, från `g_ed_*`), skeppens skrov vid start (`scr_ship_fill_init`; skrovet hittas genom att följa linjerna runt punkterna). Per bildruta ritas bara trianglarna (`pr_trianglelist`). Banans ytterram (polygonen som innesluter en annan) fylls inte, eftersom den är spelytans kant. Skeppet Kaese har ett öppet skrov (4 punkter, 3 linjer) och fylls inte. Verifierat: alla 14 slutna skeppsskrov och alla polygoner i de tre inbyggda banorna ger trianglar vars area exakt är polygonens (test med samma algoritm i Python). Sparas som `[display] solid_colors` i settings.ini.
- **Fyllningens kant (D-041, justering):** användaren såg att fyllningen låg 1–2 pixlar snett mot konturen med en tunn mörk kant på hög/nedre sidor. Orsak (sannolik): grafikkortets fyllregel (D3D9) täcker inte sista pixelraden på höger/nedre kant av en triangel, medan linjer träffar hela raden. Åtgärd: fyllningen ritas flera gånger förskjuten 0–`g_FILL_EXPAND` pixlar åt höger/ned (standard 1 = fyra kopior) och trianglarnas kanter ritas även som linjer i samma färg; kopiorna hamnar bara under konturlinjen. Ökas `g_FILL_EXPAND` till 2 om en kant syns kvar (i `scr_config_init`).

## D-042 — Projektiler får skeppets framåtfart så man inte kör in i sina egna skott
- **Problem:** efter D-031 (skott och missiler ärver inte skeppets fart) kunde ett snabbt skepp i maxfart köra ikapp och in i sina egna skott när skottets grundhastighet var lägre än skeppets fart.
- **Beslut (användaren, matematisk lösning):** `scr_boost_vel` lägger till skeppets fart *framåt i skjutriktningen* på projektilens grundhastighet: d = b / |b| (skjutriktningen), extra = max(0, v_skepp · d) · `g_SHOT_BOOST`, hastighet = b + d · extra. Då är projektilens hastighet relativt skeppet alltid minst grundhastigheten, oavsett skepp (fart och skotthastighet varierar per skepp). Bara komponenten längs skjutriktningen läggs till, så riktningen är fortfarande exakt dit skeppet pekar (sidofart och drift påverkar inte riktningen). Gäller kanonskott (Classic/Astro Duel), missiler/guidade missiler och Mini Nuke; kanontornet (siktar mot fiende) är oförändrat. `g_SHOT_BOOST` = 1 (0 stänger av, högre ger extra marginal).

## D-043 — Orienteringspunkter (fast "matta" av pixlar)
- **Beslut (användaren):** ett fast gitter av färgade pixlar i världskoordinater med 100 pixlars mellanrum över hela arenan, så att man kan orientera sig och bedöma fart och position när inga andra föremål syns. Punkterna syns bara när kameran är inzoomad: full styrka vid zoom ≥ 13000 (`g_DOT_ZHI`), tonar ut linjärt och är borta vid zoom ≤ 7000 (`g_DOT_ZLO`) (ensam spelare ca 17700, två spelare nära varandra ca 12000–15000, spridda spelare ca 5000–9000). Färg: temats accent, 2×2 pixlar vid skalan 2 och max 75 % styrka. Punkter ritas bara innanför banans ram och utanför föremål (beräknas en gång vid matchstart, `scr_dots_prepare`) och bara de som ligger i bilden (`scr_dots_draw`). Värdena (100 px, zoomgränser, styrka) är PLACEHOLDERS. Ingen Options-inställning ännu.
