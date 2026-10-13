# 01 — Projektbeskrivning

## Vision

Skapa **Bratwurst Remastered**, en fristående Windows-version av Amiga-spelet Bratwurst. Den ska först efterlikna originalets spelmekanik och känsla. Därefter ska den vara enkel att uppdatera med nya skepp, vapen, powerups, banor, grafik, ljud och musik.

## Mål

- Körbar Windows-version med egen `.exe`.
- Trogen rekonstruktion av originalets rörelse, strid, zoom och spelarhantering.
- Stöd för upp till fyra lokala spelare om originalets funktion och tekniska förutsättningar kan återskapas.
- GameMaker Studio 1.4 som utvecklingsmiljö.
- Projektstruktur som Claude Code kan navigera och ändra stegvis.
- Dokumenterade tester och versionshistorik.

## Icke-mål i första fasen

- Inte konvertera Amiga-binären direkt till en GameMaker-fil.
- Inte modernisera grafik, widescreen, fysik eller kontroller innan originalet har återskapats.
- Inte lägga till online-multiplayer.
- Inte anta att originalets editor eller alla resurser finns i arkivet.
- Inte distribuera originalmaterial utan rättighetskontroll.

## Framgångskriterier

1. Spelets huvudloop fungerar.
2. Skeppsrörelse och kollisioner känns som originalet.
3. Vapen, specialvapen, energi/ammunition och liv fungerar enligt verifierad referens.
4. Kameran zoomar så att spelare hålls synliga, om detta bekräftas genom test av originalet.
5. Tvåspelarläge fungerar stabilt; fler spelare läggs till enligt prioriterad plan.
6. Skepp och powerups kan läggas till utan ändringar i centrala spelskript för varje nytt objekt.
7. Windows-build startar på en ren Windows-installation som uppfyller motorns krav.

## Grundprincip

**Originaltrohet först, utbyggbarhet därefter.** Nya funktioner ska inte råka ändra redan verifierat originalbeteende.
