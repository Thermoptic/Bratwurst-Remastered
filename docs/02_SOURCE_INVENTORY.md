# 02 — Inventering av källarkivet

## Arkiv

Uppladdad fil: `Bratwurst_Decomp.zip`

Arkivet innehåller 31 poster inklusive mappar. Innehållet är kopierat till `original/` och ska bevaras orört.

## Identifierade filer

| Sökväg | Storlek | Bedömning |
|---|---:|---|
| `Bratwurst` | 349 028 byte | AmigaOS `loadseg()`-körbar fil, inte vanlig Windows-exe eller källkod |
| `Bratwurst.doc` | 4 843 byte | Läsbar textdokumentation för spelet |
| `Bratwurst.info` | 450 byte | Amiga Workbench-ikonmetadata |
| `Bratwurst.doc.info` | 571 byte | Amiga Workbench-ikonmetadata |
| `c/Assign` | 3 220 byte | Amiga-systemverktyg |
| `c/Least` | 12 536 byte | Amiga-program/verktyg; syfte bör kontrolleras vid behov |
| `c/Least.doc` | 9 321 byte | Dokumentation till Least |
| `c/Least.info` | 450 byte | Ikonmetadata |
| `c/LoadWB` | 1 136 byte | Amiga-systemverktyg |
| `c/Wait` | 852 byte | Amiga-systemverktyg |
| `file_id.diz` | 226 byte | Beskrivning som anger “Bratwurst V3.5” |
| `libs/reqtools.library` | 43 628 byte | Amiga-bibliotek |
| `shipbay/BatWing.SOB` | 592 byte | Binär skeppsdefinition |
| `shipbay/Blitz.SOB` | 580 byte | Binär skeppsdefinition |
| `shipbay/Boomerang.SOB` | 484 byte | Binär skeppsdefinition |
| `shipbay/cruiser.sob` | 676 byte | Binär skeppsdefinition |
| `shipbay/Glider.SOB` | 532 byte | Binär skeppsdefinition |
| `shipbay/HeavyMetal.SOB` | 400 byte | Binär skeppsdefinition |
| `shipbay/JAS.SOB` | 244 byte | Binär skeppsdefinition |
| `shipbay/Kaese.SOB` | 144 byte | Binär skeppsdefinition |
| `shipbay/Shuttle.SOB` | 280 byte | Binär skeppsdefinition |
| `shipbay/Slicer.SOB` | 352 byte | Binär skeppsdefinition |
| `shipbay/Sweeper.SOB` | 460 byte | Binär skeppsdefinition |
| `shipbay/Swift.SOB` | 568 byte | Binär skeppsdefinition |
| `shipbay/TieFighter.SOB` | 412 byte | Binär skeppsdefinition |
| `shipbay/Viper.SOB` | 532 byte | Binär skeppsdefinition |
| `shipbay/XWing.SOB` | 364 byte | Binär skeppsdefinition |

## Resurser som inte har identifierats i arkivlistan

- Separata banfiler eller baneditor.
- Separata musikfiler eller ljudeffekter.
- Separata grafikfiler.
- Källkod.
- Projektfil för GameMaker eller annan modern spelmotor.
- Ett dokument som specificerar `.SOB`-formatet.

Det betyder inte att alla resurser saknas inuti den körbara filen; det betyder endast att de inte finns som uppenbara separata filer i det inventerade arkivet.

## Viktiga observationer

- `Bratwurst` identifieras som en AmigaOS `loadseg()`-bar körbar fil.
- `.SOB`-filerna är binära. De börjar med bytes som motsvarar texten `Shobject`, men betydelsen av signaturen och efterföljande fält är ännu inte fastställd.
- Filnamnens versaler/gemener varierar. Bevara originalnamnen.
- Dokumentationen beskriver en beta från CompuSphere IV; `file_id.diz` säger V3.5. Versionerna kan avse olika distributioner eller beskriva samma arkiv på olika sätt. Detta måste verifieras.

## Nästa inventeringssteg

1. Skapa SHA-256-checksummor för samtliga originalfiler.
2. Hitta och dokumentera en emulator-/konfigurationsväg för att starta originalet.
3. Ta skärmbilder och videoklipp av menyer, ship select, strider, specialvapen, kollisionsfall och kamerazoom.
4. Analysera `.SOB`-filer med hex-dump och jämförande tester. Skriv en parser endast efter att fältens betydelse har verifierats.
5. Undersök om musik och grafik är inbäddade i den körbara filen och om de får extraheras/återanvändas.

## Uppdatering 2026-10-13 — verifierade tillägg
- SHA-256 för alla 27 filer kontrollerades och matchar `12_SOURCE_CHECKSUMS.md`.
- `Bratwurst` är Hunk-exe med 7 hunks (se `13_EXECUTABLE_ANALYSIS.md`). **Musik/ljud är inbäddat** (ProTracker-modul i hunk 3) — detta ändrar punkten ovan om "inte identifierat": inbäddad ljuddata finns, separata filer finns inte.
- **Filen verkar skadad/inkonsekvent** (hunk 2/3 är 512 B kortare än deklarerat; 1 024 B skräp i slutet). VERIFIERAD observation, orsak SANNOLIK diskavbildningsskada.
- `Least`/`Assign`/`LoadWB`/`Wait`/`reqtools.library` är tredjeparts-/systemfiler som exe inte refererar till (0 strängträffar).
- `.SOB`: layout avkodad strukturellt (15/15), se `06`.
- Skillnad doc/diz (beta vs V3.5) kvarstår.
