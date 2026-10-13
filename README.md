# Bratwurst Remastered — projektstart

**Mål:** återskapa Amiga-spelet Bratwurst som ett fristående Windows-spel med GameMaker Studio 1.4, med originalets spelkänsla som första prioritet och en struktur som gör framtida uppdateringar enkla.

## Status just nu

Detta är en **analys- och planeringsbas**, inte en färdig port. Arkivet har inventerats och den medföljande dokumentationen har lästs. Originalets körbara Amiga-program har identifierats, men spelets kod har inte dekompilerats till GML och `.SOB`-formatet är bara strukturellt avkodat (se `docs/06`, `docs/13`, `docs/14`).

## Börja här

1. Läs [`CLAUDE.md`](CLAUDE.md) innan du gör ändringar.
2. Läs [`docs/01_PROJECT_BRIEF.md`](docs/01_PROJECT_BRIEF.md) och [`docs/02_SOURCE_INVENTORY.md`](docs/02_SOURCE_INVENTORY.md).
3. Följ [`docs/07_ROADMAP.md`](docs/07_ROADMAP.md). Första uppgiften är endast analys, inte att börja implementera hela spelet.
4. Kör originalet i en lämplig Amiga-emulator och spela in/referensdokumentera beteendet innan viktiga spelregler återskapas.
5. Använd Git och gör små, verifierbara ändringar.

## Viktiga begränsningar

- Den uppladdade arkivversionen innehåller ett Amiga-exekverbart program, dokumentation, Amiga-verktyg/bibliotek och 15 skeppsdefinitioner med filändelsen `.SOB`/`.sob`.
- Ingen tydlig källkod, banredigerare, banfil, musikfil eller separat grafikfil har identifierats i arkivlistan.
- Dokumentationen beskriver en beta från 1994–1995, medan `file_id.diz` marknadsför Bratwurst V3.5. Denna versionsskillnad är inte löst.
- Gör inga antaganden om att `.SOB` är ett öppet eller enkelt textformat. Filerna är binära.
- Återskapande av spelet är inte samma sak som automatisk konvertering av Amiga-programmet.
- Kontrollera rättigheter innan en offentlig distribution av en remake, originalresurser, namn eller musik.

## Föreslagen mappstruktur

```text
Bratwurst_Remastered/
├── CLAUDE.md
├── README.md
├── CHANGELOG.md
├── docs/
├── original/                 # orörda referensfiler från arkivet
├── game/                     # framtida GameMaker Studio 1.4-projekt
├── tools/                    # egna analys-/konverteringsverktyg vid behov
├── tests/                    # testplaner och eventuella automatiserade tester
└── references/               # skärmbilder, videor och mätningar från originalet
```

`original/` ska behandlas som skrivskyddad referens. Lägg inte till remake-kod i den mappen.
