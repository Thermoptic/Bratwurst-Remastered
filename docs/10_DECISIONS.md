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
- **Beslut:** titelskärm "BRATWURST - REHEATED" / "PRESS START TO TURN UP THE HEAT" (valfri tangent/knapp) → huvudmeny i *command deck*-stil (träd, lista, datapanel; konceptet i artefakten "Bratwurst Terminal UI", förslag 2) → skeppsval i samma stil (en ruta per spelarplats, ledig plats = "PRESS FIRE TO JOIN") → match med paneler: (uppdaterat: alla spelarpaneler i en rad längs nederkanten, lika breda för 1–4 spelare).
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
- **Beslut:** titelskärmen har en centrerad logotyp i tunna linjer (B R A T W U R S T, A med öga, REHEATED under med linjer på sidorna), en cirkulär equalizer med 72 staplar runt loggan som följer musiken (`g_mv`, D-022; faller tillbaka på en lugn animation utan musik), två dithrade planeter som svullnar med basen, fasta blinkande stjärnor samt oförändrad bakgrund med rutnät och roterande skepp. Loggans glöd pulserar med basen. Gamla texten och värmebalken är borttagna; PRESS START TO TURN UP THE HEAT finns kvar. Färgerna kommer från temat (logotyp och planeter = accent; staplar grön → gul → röd).

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

## D-044 — Musikspelare i huvudmenyns högra kolumn
- **Beslut (användaren, förslag A + egen skiss):** högra kolumnen delas i två rutor: DATA överst (info om vald rad, eller kartbilden på MAP-raden) och MUSIC under (`scr_music_panel`): spektrumet (visualizern) överst, NOW PLAYING med låtnummer (02/06) och titel, en segmenterad tidslinje (40 segment), tid framåt och kvarvarande tid (-2:20), tre transportknappar (föregående LB, spela/pausa, nästa RB), vippknappar för shuffle och repeat samt volym med minus, LED-stapel (10 steg) och plus med procent. Sektionerna PALETTE och FILES är borttagna.
- **Styrning:** LB/RB (PageUp/PageDown) byter låt som förut; spela/pausa = Y på gamepaden eller M på tangentbordet (skissen visar START, men START är redan OK i menyn); allt i panelen går också att klicka på med musen: tidslinjen söker, knapparna byter/pausar, shuffle/repeat växlar, volym −/+ ändrar volymen (sparas i settings.ini som förut).
- **Beteende:** låtarna loopar inte längre för evigt: när en låt tar slut spelas nästa i listan (titellåten hoppas över), med SHUFFLE en slumpad annan och med REPEAT samma om. Titellåten (3LE) loopar som förut på titelskärmen. Paus nollställs när låt byts eller en ny runda startar. Shuffle/repeat gäller bara under sessionen (sparas inte). Skript: `scr_music_panel`, `scr_mp_mouse/toggle/seek`, `scr_music_advance`, ändringar i `scr_music_update/switch/round_start`, `scr_mn_draw/step`. GameMaker-funktioner: `audio_sound_length`, `audio_sound_get_track_position`, `audio_sound_set_track_position`, `audio_pause_sound`, `audio_resume_sound`.
- **Justering efter användarens bild:** tidslinjen har 30 segment med 4 pixlars luft (var 40 tätt), volymraden har MUTE-knapp till höger (i stället för procent; tystar utan att ändra volyminställningen, `g_mp_mute`) och längst ned visas NEXT TRACK med nästa låt och dess nummer (RANDOM TRACK vid shuffle, samma låt vid repeat). Raderna i panelen skalar med bredden så att allt ryms; rutans höjd är 300 + spektrumets höjd.

## D-045 — Helskärm och alt-tab
- **Problem (användaren):** i helskärmsläget försvann spelets fönster vid alt-tab och gick inte att få tillbaka (musiken fortsatte); i fönsterläge fungerade det. Orsak (sannolik, känt problem med GameMaker 1.4 och Direct3D 9): det exklusiva helskärmsläget hanterar förlorat fokus dåligt.
- **Första försöket (avbrutet):** ett ramlöst fönster med `window_set_showborder`, men funktionen är föråldrad (obsolete) i GameMaker 1.4 och ger kompileringsfel.
- **Beslut:** helskärmsläget är kvar (`window_set_fullscreen(true)`), men `scr_focus_update` lämnar det (`window_set_fullscreen(false)`) när fönstret saknat fokus i 5 ticks i följd, så att spelet finns som ett vanligt fönster i aktivitetsfältet som går att klicka fram, och går tillbaka till helskärm (`scr_display_apply`) när fokus varit tillbaka i 5 ticks i följd. Bara när FULLSCREEN är valt. Ej verifierat av mig i GMS; fungerar bara om stegen fortsätter köras utan fokus (det gör de enligt musiken som fortsätter).

## D-046 — Spelläget Asteroids
- **Beslut (användaren):** nytt spelläge ASTEROIDS (spellage 4 i `g_game_mode`, i menyn Game modes mellan Astro Duel och Race) med en egen, helt tom bana efter Atari-originalet från 1979 (`scr_level_asteroids`: bara standardramen och originalets startplatser, som en ny bana i redigeraren, sparas inte i levels.ini; ingen kartväljare). Stenar flyger in från sidorna: stor sten → delas i två mellanstora (snabbare) → delas i två små (mycket snabba) → små försvinner när de skjuts. Träffar en sten ett skepp tar det 10 (stor), 5 (mellan) eller 1 (liten) energi.
- **Genomförande:** stenarna är en pool om 64 (`g_as_*`), polygoner med 12 hörn i fyra former, radie 110 / 55 / 28 världspixlar, fart ca 0,9–1,6 px/tick (stor), 2,2–3,4 (mellan), 3,6–5,5 (liten), ökande 6 % per våg (högst 8 gånger). Vågor som i originalet: 4 stora stenar i första vågen, 2 fler per våg, högst 12; ny våg 3 s efter att banan är tom; varje våg börjar med stenar strax utanför kanten med riktning inåt. Stenarna ignorerar väggarna (flyger in och ut genom ramen) och kommer in på motsatt sida om de lämnar banans ruta (kantvarv som i originalet). Kanonskott, missiler och guidade missiler delar stenar; Mini Nuke:s chockvåg och Railgun-strålen förintar dem utan att dela. Rockträff på skepp: skada enligt storlek, knuff bort från stenen och 40 ticks skydd mot nya stenskador (`ast_cd`), stenen påverkas inte (som originalet, där skeppet förstörs men stenen finns kvar). Skeppsrörelse, energi, liv, rundor, powerups (egen POWERUPS-rad, standard ON), musik och övriga regler som i Classic; rundan vinns som i Classic av den som flyger kvar (med en spelare tar rundan aldrig slut). Menyraderna: START, PLAYERS, ROUNDS, LIFE (samma som Classic) och POWERUPS. Våg visas i rubrikraden. Stenarna följer Solid colors (fylls som solfjäder).
- **Inte med (originalets övriga delar):** flygande tefat (UFO), hyperspace, poäng och extra liv per poäng, ljuden från Atari-spelet. Videon som länkades kunde jag inte titta på; formerna och vågreglerna bygger på det kända originalet. Alla värden är PLACEHOLDERS och kan justeras.
- **Justering efter test (D-046):** (1) en sten som kolliderar med ett skepp delas (stor/mellan) eller går sönder (liten) som om den blivit skjuten; skeppet tar fortfarande skadan och knuffas. (2) Högre tempo: första vågen kommer 1 s efter start (var 3 s) och har 6 stora stenar (var 4; +2 per våg, högst 14), nästa våg 1,5 s efter att banan är tom (var 3 s), stenarna är 50 % snabbare (`g_AS_SPEED` = 1,5: stor 1,4–2,4, mellan 3,3–5,1, liten 5,4–8,3 px/tick) och en stadig ström håller banan igång: medan det finns stenar kommer en ny stor sten var 6:e sekund om det finns färre än 10. Konstanter i `scr_config_init` (`g_AS_FIRST`, `g_AS_GAP`, `g_AS_START`, `g_AS_MAXN`, `g_AS_TRICKLE`, `g_AS_SPEED`).
- **Nivåer (D-046, tillägg efter användarens önskemål):** ny inställning Game modes → Asteroids → LEVEL, 1–5, standard 3, sparas som `[asteroids] level`. Nivå 1 är grundinställningen (6 stora stenar i första vågen osv.); varje nivå dubblar allt: faktorn m = 2^(nivå − 1) (1, 2, 4, 8, 16) multipliceras på antalet stenar per våg, på tiderna (första vågen 1 s / m, nästa våg 1,5 s / m, ström var 6 s / m, ström upp till 10·m stenar) och på stenarnas fart. Gränser: farten höjs högst 8 gånger (annars flyger stenarna genom skepp och skott mellan två ticks; svept kollisionstest för skepp och skott finns ändå) och antalet stora stenar per våg högst en femtedel av poolen (poolen är nu 320 stenar, högst 64 stora stenar per våg). Skada, storlek, knuff och rotation dubblas inte. Prestanda: rutkontroll före avståndstest för skott/missiler och beskärning av stenar utanför bilden vid ritning.

## D-047 — Kamerazoom 1–10
- **Beslut (användaren):** ny inställning Options → ZOOM, 1–10, standard 1. Zoom 1 är spelets nuvarande zoom (originalets formel, D-037); varje steg zoomar ut mer och Zoom 10 visar dubbelt så mycket av arenan. Implementering: målzoomen delas på `1 + (zoom − 1) / 9` i `scr_camera_update` (steg om 1/9 ≈ 11 %, så att 10 blir exakt dubbelt utzoomad; +10 % per steg hade gett 1,9 gånger). Ändras valet glider kameran dit mjukt (D-037). Gäller alla spellägen och sparas som `[display] zoom`. Bieffekt: skott och missiler tas bort när de lämnar bilden (originalets regel), så vid utzoomad kamera flyger de längre i världen, och väggträffstoleransen (en skärmpixel) blir större i världspixlar.

## D-048 — Alltid bred spelyta, SCANLINES AND GLOW
- **Beslut (användaren):** valet WIDE PLAYFIELD tas bort ur Options; spelytan är alltid bred (`g_SV_WIDE` tvingas till 1 vid start, gammalt ini-värde ignoreras). SCANLINES och PHOSPHOR GLOW slås ihop till en omkopplare SCANLINES AND GLOW (På/Av); `g_SV_GLOW` följer `g_SV_SCAN`. Sparas som `[display] scanlines`.

## D-049 — Musik av = volym 0
- **Beslut (användaren):** raden MUSIC (På/Av) tas bort ur Options. VOLUME går nu 0–100 % i steg om 10; 0 visas som OFF och stänger av musiken (`g_SV_MUSIC` härleds som volym > 0). Gäller även volymknapparna i musikspelaren. Gammalt `[audio] music` i ini ignoreras. Standard fortfarande 70 %.

**D-045, tillägg (2026-10-16):** användaren rapporterade att fönstret fortfarande försvann vid alt-tab (ej bekräftat vilket SCREEN MODE/build). `scr_focus_update` lämnar nu helskärmsläget redan när Alt+Tab eller Windows-tangenten trycks ned (innan fönsterbytet) och efter 2 ticks utan fokus (förut 5). Ej verifierat i GMS. Om det fortfarande händer: orsaken är exklusiv helskärm i Direct3D 9; nästa steg är att ersätta FULLSCREEN med ett fönster i skärmens storlek.

## D-050 — Portabla sparfiler: avslaget
- **Fråga (användaren):** kan spelet köras helt portabelt (alla sparfiler i spelets mapp, t.ex. på USB-minne)?
- **Undersökt:** Global Game Settings → Windows → General har bara `%localappdata%\<GameName>` och `%appdata%\<GameName>`. Ett försök att skriva `settings.ini`, `levels.ini` och `themes.ini` med `working_directory` som sökväg hamnade ändå i `%localappdata%\Bratwurst` (GameMaker 1.4:s sandbox omdirigerar skrivningar), och raden DATA FOLDER visade därför fel mapp. **VERIFIERAD** av användaren.
- **Beslut (användaren):** behåll standardplatsen (AppData). Försöket återställdes (inga kodändringar kvar). Alternativ som inte valdes: kopiera filerna till/från spelmappen med `execute_shell`, eller en tilläggs-DLL.

## D-051 — Galaxy Duel (förut Astro Duel): skada i två steg
- **Beslut (användaren):** spelläget Astro Duel heter nu **Galaxy Duel**. Förut dog ett skepp av varje träff (skott, missil, Mini Nuke-chockvåg, railgunstråle). Nu: **första träffen skadar** skeppet i 6 sekunder (`g_AD_DMG_TICKS` = 300 ticks): gasen och farten blir 60 % lägre (`g_AD_SLOW` = 0,4, ändrat från 80 % efter användarens test; fart över 44 % av normal topphastighet bromsas snabbt), och kanon, specialvapen och powerup går inte att använda (bara gas och sväng; en pågående railgunladdning avbryts). Efter 6 s är skeppet reparerat och funkar som vanligt; en ny träff ger samma skada igen. **En träff medan skeppet är skadat dödar det** (`energy = 0` → liv förloras).
- **Visuellt:** medan skadan varar kommer små gnistor från skrovet och små streck lossnar och faller (skeppsdelspoolen `scr_debris_*`); en tydligare puff vid själva träffen. När tiden gått försvinner effekterna.
- **Implementering:** `scr_ad_hit` (anropas i träffad spelares kontext från `scr_shot_step`, `scr_missile_step`, `scr_fx_damage`, `scr_beam_step`), `scr_ad_fx` (gnistor och streck), `ad_dmg` per spelare (nollas i `scr_player_respawn`), begränsningarna i `scr_player_step`. Klassiska läget och Asteroids är oförändrade. Interna namn (`g_game_mode == 1`, ini-sektionen `[astro]`) behålls.
- **Ej verifierat:** att 80 % långsammare känns rätt (faktorerna är konstanter i `scr_config_init`), poolen för skeppsdelar är 40 stycken (`g_DB_MAX`).

**D-051, tillägg (2026-10-18):** användaren rapporterade att en reparerad ship ska vara som helt nytt och skadas igen vid nästa träff. Reparationen sätter nu `energy = energy_max` och nollar skadetillståndet, och en träff efter reparationen skadar på nytt. Troliga orsaken till en omedelbar död: ett skepp med flera framåtkanoner avfyrar flera skott samtidigt och det andra skottet träffade medan skadan redan var aktiv. Därför ger första träffen en skyddstid på 0,5 s (`g_AD_GRACE` = 25 ticks, `ad_inv`) då fler träffar ignoreras. Ej verifierat i GMS (orsaken kunde inte återskapas utan körning).

## D-052 — Drifting fuel (begränsat drivmedel för drift)
- **Beslut (användaren):** driften får ett drivmedel, en mätare på 8 sekunders drift (400 ticks vid 50 ticks/s). Alla spelare börjar med full mätare (också efter ett förlorat liv och vid ny runda, `scr_player_respawn`). Bara medan skeppet driftar (`drifting`: gas + driftknapp + minsta fart) går ett tick åt per tick; släpper man knappen sparas resten, och det går bra att använda det i flera korta drifter. Tom mätare → driften stängs av direkt och mätaren laddas automatiskt, bara när den är helt tom, på exakt 6 sekunder (300 ticks, `g_DRIFT_RECHARGE`; `g_DRIFT_FUEL / g_DRIFT_RECHARGE` per tick). Drift är avstängd tills mätaren är full. Backning (driftknappen utan gas, REVERSE) är ingen drift och påverkas inte.
- **Inställning:** Powerup Editor (den dolda menyn, P i Options) → DRIFT → ny rad **DRIFTING FUEL** (sekunder, 1–30, standard 8, sparas som `[powerup_drift] fuel_seconds` i settings.ini; gäller alla spelare; `scr_drift_apply` → `g_DRIFT_FUEL`). Ligger i samma lista som övriga driftparametrar, som läser och sparas generiskt (`g_pu_np[2]` = 10).
- **Per spelare:** variablerna `drift_fuel` (ticks, kan vara bråktal) och `drift_rc` (laddar) ligger i obj_player; ingen koppling mellan spelare.
- **UI:** raden `RF LOCKED` i spelarpanelen är ersatt med `AB` + en segmenterad mätare (samma stil och höjd som övriga mätare; blå normalt, röd medan den laddas; minskar medan man driftar och fylls på under laddningen). Raden `RF ON/LOCKED` (bakåtskjutning) visas därmed inte längre i panelen; funktionen finns kvar (D-015).
- **Ej verifierat i GMS** (se testplan DR-01…DR-09).

## D-053 — Spelläget Race (steg 1: skal)
- **Underlag:** specifikationen i `docs/race/` (RACE_MODE_SPEC, RACE_POWERUPS_AND_BALANCE, RACE_LEVEL_EDITOR, RACE_IMPLEMENTATION_PLAN, RACE_TEST_PLAN). Inspektionsrapporten godkändes av projektägaren; svar på frågorna:
  1. **Plasma** = huvudkanonen; "exakt ett skott" = `cannon_ammo` blir 1.
  2. **Väggkrasch** tar fortfarande skada på skeppet i Race.
  3. **Kameran** följer alla spelare (som nu).
  4. En race-vinst räknas som **rundvinst** (`g_wins`, befintligt rundsystem).
  5. **Åkriktning:** målrutan som ritas i banredigeraren har små pilar; riktningen (upp, ner, höger, vänster) ändras med mushjulet (steg 7).
  6. **Kontrollpunkter behövs inte** (banorna byggs så att man inte kan fuska). Hur placering inom ett varv ska räknas ut återstår att bestämma i steg 5 (förslag senare).
  7. **Sista racern** exploderar efter 4 sekunder.
  8. **Drift-pickup:** standardmätaren (DRIFTING FUEL, 8 s) fylls direkt.
  9. **Vapenval:** en pickup väljer vapnet automatiskt.
  10. **Powerups:** av som standard i Race men kan slås på i menyn; bakåtskjutning (rear_fire) avstängd.
  11. `docs/race/` committas; **en spelare kan starta ett race**.
- **Steg 1 (genomfört, ej körd):** Race är spellage 2 (`g_game_mode == 2`). Menyn Game modes → RACE har START (ship select), PLAYERS, **LAPS** (1–10, standard 3, `[race] laps`), MAP (`g_SV_MAP3`, `[gameplay] map_race`), ROUNDS (gemensam inställning) och POWERUPS (av som standard, `[race] powerups`, `g_SV_PURA`). Nya g_sv-index 60–62. `scr_race_reset` (tid, målvarv och per spelare `race_laps`, `race_fin`, `race_ft` nollas vid matchstart och ny runda), `scr_race_step` (racetimern), `scr_race_time`. HUD: `LAP x / N` i spelarpanelen och `TIME m:ss.t` i rubrikraden. Banorna: finns ingen bana markerad för Race (bit 2) får alla banor användas tills redigeraren kan markera dem (steg 7, `scr_level_allowed`).
- **Tillfälligt i steg 1:** rundan slutar fortfarande enligt Classic (sista skeppet kvar), och vapen, drift och ammo är oförändrade. Det ersätts i steg 2–6.
- **Öppna frågor till senare steg:** vad som händer när ett skepp tar slut på energi (väggkrasch) i Race, och hur placering inom ett varv räknas utan kontrollpunkter.

**D-053, tillägg (2026-10-18) — svar på de öppna frågorna:**
- **Väggkrasch tar ingen skada i Race** (ändrar svar 2 ovan). Skeppet studsar som förut men tappar ingen energi (`scr_player_step`, samma regel som Galaxy Duel). Därmed finns ingen död av väggkrasch i Race.
- **Kontrollpunkt:** det finns en enda, och det är start- och mållinjen: en ruta som ritas ut i banredigeraren (unik per bana, icke-solid, går att flyga igenom). Nuddar man rutan efter ett varv räknas det som ett varv; rutan har pilar för åkriktning (mushjulet ändrar upp/ner/höger/vänster). Inga fler kontrollpunkter.
- **Följd för placering (steg 5):** med bara en kontrollpunkt går det inte att mäta framsteg inom ett varv. Förslag att godkänna: placering = fler genomförda varv först, därefter den som passerade rutan tidigast; före första passagen räknas startordningen. Placeringen ändras alltså bara när någon passerar rutan. Detta är en begränsning (jämför RACE_POWERUPS_AND_BALANCE §6) som ska beslutas innan steg 5.

## D-054 — Race, steg 2 + 7: start/målrutan och varvräkning
- **Beslut (projektägaren):** steg 2 (varv) och 7 (redigeraren) görs tillsammans, eftersom varvräkningen kräver rutan i banformatet.
- **Rutan:** en enda per bana, ritas i banredigeraren med verktyget **F** (två hörnklick; en ny ruta ersätter den gamla). Den är **icke-solid** (inte med i väggdatan) och har pilar som visar åkriktningen; **mushjulet** vrider dem upp → höger → ner → vänster (när musen är över rutan eller F är valt). X-verktyget tar bort rutan om man klickar i den (en vägg har företräde). Sparas i `levels.ini` som valfri nyckel `finish = x0,y0,x1,y1,riktning` (varldspixlar; riktning 0 upp, 1 höger, 2 ner, 3 vänster); banor utan nyckeln laddas som förut. Vid sparning med spellägesbit Race men utan ruta visas en varning (inget hittas på i tysthet).
- **Varvräkning (`scr_fin_cross`, varje tick, per spelare):** rutan är en port. Ett skepp passerar när dess mittpunkt går över rutans mittlinje (tvärs pilens riktning) inom rutans bredd; framåt ger `race_x += 1`, bakåt `race_x -= 1` (nettoräkning, så att man inte kan få varv genom att vicka). Genomförda varv = `race_x − race_free`, högst målvarven. `race_free` = 1 om skeppet startade bakom linjen (första passagen är då bara starten) och annars 0, så att en start på linjen eller före den aldrig räknas som ett varv. Är målvarven klara markeras skeppet klart (`race_fin`) och måltiden sparas (`race_ft`); fortsatt beteende för klara skepp kommer i steg 6. Korrekt riktning krävs alltså genom nettoräkningen; "nudda" betyder att passera rutans mitt.
- **Visning:** rutan ritas i matchen (grön, svag fyllning, pilar) och i redigeraren; panelen visar `LAP x / N`, `FINISHED tid` eller `NO FINISH LINE`; F1 visar `X`/`F` (passager och race_free).
- **Logiken kontrollerad i Python** (framåt, vicka, utanför bredden, start före/efter linjen); **ej körd i GMS**.
- **Kvarstår:** placering (steg 5), pickups, vapen, resultat och banor markerade för Race.

## D-055 — Race, steg 3: icke-dödliga vapen, ingen ammo, ingen drift
- **Ammo (RACE-010…013):** vid start och varje ny runda har alla spelare noll kanonammo och noll specialammo (`scr_player_respawn`, Race-gren). Kanonen kräver `cannon_ammo > 0`; i Race kostar ett skott (en salva, alla framåtkanoner) **1 ammo** oavsett antal kanoner, som beslutat ("Plasma" = huvudkanonen, "exakt ett skott" = ammo 1). Specialvapnen kräver redan ammo. Ammo ges först av pickups (steg 4). Test-tangenten "nästa skepp" (RB) är avstängd i Race så att den inte fyller på ammo.
- **Drift (RACE-014/015):** drivmedlet börjar på 0 (drift avstängd) och laddas **inte** automatiskt i Race (`drift_rc` sätts aldrig); en drift-pickup ger det fulla standardmåttet (steg 4).
- **Vapenträff (RACE-030…034):** `scr_race_hit` (anropas från `scr_shot_step`, `scr_missile_step` inkl. Mini Nuke, `scr_fx_damage` för missilring och chockvåg, `scr_beam_step`) sätter `race_slow` = 150 ticks (3 s, `g_RACE_SLOW_TICKS`). Ingen skada och ingen död från vapen. Under tiden gäller `slowf` = `g_RACE_SLOW` (0,2): gasen skalas med 0,2 och farten över 22 % av normal topphastighet bromsas snabbt (samma mekanik som Galaxy Duel). Ny träff startar om de 3 sekunderna men går aldrig under 20 %; efter 3 s är farten normal. Baskoefficienterna ändras aldrig.
- **Väggkrasch:** ingen skada (D-053). Därmed ändras energin aldrig i Race.
- **HUD:** raden `EN` ersätts i Race av `SL` (röd stapel som töms på 3 s, fartminskningens återstående tid); `AM` visar kanonammot, `AB` drivmedlet.
- **Ej körd i GMS.**

## D-056 — Race, steg 4: pickups
- **Pickuppunkter (redigeraren, verktyg O):** upp till 16 per bana (`g_PK_MAX`). Klick placerar en punkt (rutnätssnäppt); klick på en befintlig punkt tar upp den för flytt (klicka igen där den ska ligga; högerklick avbryter); X-verktyget tar bort punkten. Sparas som valfri nyckel `pickups = x,y;x,y;...` i `levels.ini` (banor utan nyckeln laddas som förut). Punkterna är generiska: vad man får avgörs vid upplockningen.
- **Livscykel (`scr_pickup_step`, per tick):** alla punkter är aktiva vid racets start (`scr_race_reset`). Ett levande skepp som inte är klart tar en punkt när skeppets mittpunkt eller någon konturpunkt ligger inom `g_PU_RADIUS` (36). Punkten försvinner i `g_PK_RESPAWN` = 250 ticks (5 s) och är sedan tillbaka på samma plats. Rör flera skepp punkten samma tick får det närmaste den (aldrig två).
- **Utdelning (`scr_pickup_grant`):** exakt ett av: **Plasma** (`cannon_ammo` = 1), **Missile** (1 skott, specialvapnet väljs automatiskt), **Guided Missile** (1 skott, väljs automatiskt) eller **Drift** (`drift_fuel` = fullt standardmått, `drift_rc` = false; DRIFTING FUEL, 8 s). Mängden *sätts* (ingen stapling): ett nytt specialvapen ersätter det gamla, en ny drift-pickup fyller bara upp till fullt. Skepp utan markerad specialpod använder första podden. Vapenbyte med Back är avstängt i Race (vapnet väljs av pickupen).
- **TILLFÄLLIGT i steg 4:** föremålet slumpas bland alla fyra med lika sannolikhet. Steg 5 byter till rangordnade nivåer (ledare bara Plasma, mitten Plasma/Missile, sist Drift/Guided Missile).
- **Visning:** runda orangea bollar (glöd, mörk kärna, pulserande), tydligt skilda från målrutan och powerup-orben; panelens rad `IT` visar vad man fick i två sekunder (`PLASMA ACQUIRED`, `MISSILE ACQUIRED`, `GUIDED MISSILE ACQUIRED`, `DRIFT UNLOCKED`) i stället för livraden; ljud: träffljudet.
- **Ej körd i GMS.**

## D-057 — Race, steg 5: placering och utdelning efter placering
- **Placering (`scr_race_ahead`, `scr_race_pos`):** racare = levande skepp. Ordning: 1) klara före oklara, klara efter måltid; 2) fler genomförda varv (`race_x − race_free`, dvs. passager av målrutan minus startpassagen); 3) vid lika varv den som passerade målrutan senast tidigast (`race_ct`, 0 = ingen passage än); 4) utan passager den som startade närmast linjen (`race_s0`, positionen längs pilens riktning vid start); 5) lägre plats (slot). Detta följer beslutet att målrutan är den enda kontrollpunkten: placeringen ändras alltså bara när någon passerar rutan (begränsning, jämför RACE_POWERUPS_AND_BALANCE §6; luftlinjeavstånd till mål används inte).
- **Nivåer vid upplockning (`scr_pickup_grant`):** placeringen räknas ut i samma ögonblick som pickupen tas, bland dem som ännu tävlar (ej klara). **Ledare:** bara Plasma. **Mitten:** Plasma eller Missile, lika chans. **Sist:** Guided Missile eller Drift, lika chans (sist har företräde framför mitten). 2 spelare: ledare/sist; 3: ledare, mitten, sist; 4: ledare, två i mitten, sist. **Ensam racer** (bara en kvar att tävla): ingen nivåindelning, alla fyra möjliga (annars skulle ensamspel bara ge Drift/Guided).
- **HUD:** `POS x / N` (placering bland alla racare, klara först) i spelarpanelens övre högra hörn.
- **Placeringslogiken kontrollerad i Python** (startordning, efter startpassagen, varvledning, klara först); **ej körd i GMS.**

## D-058 — Race, steg 6: mål, utslagning och resultat
- **Klara skepp stör inte:** ett skepp som kommit i mål (`race_fin`) skjuter och använder inga vapen, kolliderar inte med andra skepp, kan inte träffas av skott, missiler, chockvågor, strålar eller dragstråle och räknas inte som mål för styrda missiler. Det får flyga vidare; kameran följer alla spelare som förut.
- **Avgörande (`scr_race_step`):** racare = levande skepp. Är alla klara (eller utslagna) slutar racet efter 1 s. Är bara **en** racer kvar som inte är klar och minst en annan är klar får den racern **4 sekunder** (`g_END_DELAY`, nedräkningen visas i panelen som `ELIMINATED IN n`); är den inte klar då exploderar skeppet och är ute (`scr_race_eliminate`, ingen återskapning; ett vanligt vapen kan fortfarande inte döda). Kommer den i mål under nedräkningen avbryts den. En ensam spelare tävlar utan tidsgräns. Klassiska "sista skeppet kvar"-kontrollen är avstängd i Race. Racetimern stannar när racet är avgjort.
- **Resultat (`scr_race_round_end`, `scr_race_results_draw`):** racarna sorteras (klara efter tid, övriga efter framsteg, `scr_race_ahead`); vinnaren är nummer ett om det skeppet är klart och får en rundvinst (`g_wins`, beslut 4). Rutan visar vinnaren, placeringar med skepp och måltid eller `ELIMINATED` / `DID NOT FINISH` och texten **`PRESS TO ENTER NEXT RACE`** (efter sista racet `PRESS TO SEE THE FINAL RESULT`, eftersom nästa steg då är slutresultatet). Fortsätter med bekräfta (Enter, mellanslag, Z, A eller Start) efter en sekund; nästa race återställer allt (`scr_round_reset` → `scr_race_reset`), efter sista racet visas slutresultatet (rundvinster). Start-knappen går som förut till skeppsvalet från resultatrutor.
- **Ej körd i GMS.**

## D-059 — Race, steg 8: granskning och testlista
- **Gjort (utan att köra spelet):** statisk granskning av alla `race_*`/`g_race_*`-användningar utanför Race-grenar (alla variablerna skapas för alla spelare i `scr_player_init`; övriga lägen har oförändrad logik), lint, argumentkontroll, kontroll av tomma skriptfiler och projektfilens XML. Avgörandet (utslagning efter 4 s, avbrott om sista racern kommer i mål, ensam spelare, resultat) återskapades i Python för fem scenarier; där syns också att ett race med två eller fler racare som aldrig kommer i mål inte avgörs av sig självt.
- **Kvar:** testlistan i `docs/race/RACE_STAGE8_CHECKLIST.md` (spelartal, inställningar, styrning, redigerare, regression, export) körs i GMS av projektägaren; ingen test räknas som godkänd förrän den körts. Windows-export görs först därefter (projektregel).
- **Öppna beslut:** maxtid per race (annars kan ett race hänga om ≥ 2 racare aldrig går i mål), dölja vapenval i skeppsvalet i Race, ev. text efter sista racet.

## D-060 — Race: startnedräkning 3, 2, 1, GO!
- **Beslut (användaren):** när en bana startar visas en stor nedräkning i mitten av spelytan (alla spelare delar den bilden): **3, 2, 1** (en sekund var, accentfärg) och sedan **GO!** (en sekund, grön, tonas ut). Först vid GO! går det att gasa; innan dess är gas och backning avstängda (`scr_player_step`: `in_thrust`/`in_drift` nollas medan `g_race_cd > 0`), men man kan svänga. Racetiden, pickups, varvräkning och avgörande startar först vid GO! (`scr_race_step` avslutas tidigt under nedräkningen). Ett pip per siffra och ett ljud vid GO!. Nedräkningen startar vid matchstart och vid varje ny runda (`scr_race_reset`: `g_race_cd` = 150 ticks) och står stilla under paus. Ritas av `scr_race_cd_draw` (typsnitt xl, förstorat 3×).
- **Sista racern (förtydligande, ingen ändring):** den regeln fanns redan (D-058): när alla andra kommit i mål och bara en racer återstår exploderar den racerns skepp efter 4 sekunder (nedräkningen `ELIMINATED IN n` visas i panelen), om den inte hinner i mål. Beslutet om 4 sekunder kommer från projektägaren; kan ändras till direkt explosion.
- **Ej körd i GMS.**

**D-045, tillägg 2 (2026-10-18):** projektägaren rapporterade flimmer (spelet hoppar ut till Windows och tillbaka) när Windows-tangenten trycks i helskärm. Orsak: tillägg 1 lämnade helskärmen direkt vid Windows-tangenten och efter 2 ticks utan fokus. Nu lämnas den direkt bara vid Alt+Tab (det som gav det försvunna fönstret) och annars först efter 5 ticks utan fokus som innan tillägg 1. Ej verifierat i GMS.
