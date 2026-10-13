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
