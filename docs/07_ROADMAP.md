# 07 — Utvecklingsplan

## Fas 0 — Inventering och research

**Status: påbörjad (Fas 1-prototyp skriven, ej körd)**

- [x] Inventera ZIP-arkivet.
- [x] Läsa `Bratwurst.doc`.
- [x] Identifiera 15 skeppsdefinitioner.
- [x] Dokumentera kända funktioner och osäkerheter.
- [x] Skapa checksummor (verifierade 2026-10-13).
- [ ] Starta originalet i emulator.
- [ ] Samla skärmbilder/video och mätningar.
- [~] Undersöka `.SOB`-formatet systematiskt (struktur klar 15/15, semantik återstår; se `06`).
- [ ] Fastställa rättighetsstatus för offentlig distribution.

**Leverans:** en verifierad specifikation av originalets beteende och en lista över saknade data.

## Fas 1 — Minimal spelbar prototyp

- Skapa nytt GMS 1.4-projekt.
- Rita ett vektorskepp.
- Implementera rotation, acceleration och rörelse.
- Lägg till ett grundläggande skott.
- Lägg till väggar och enkel kollision.
- Skapa ett minimalt testområde.
- Jämför rörelse med originalet.

**Klart när:** prototypen kan startas, styras och skjuta; koden går att ändra utan att rörelselogiken blir oöverskådlig.

## Fas 2 — Originalets kärnmekanik

- Fysik och kollisioner.
- Skeppens olika egenskaper.
- Standardvapen.
- Specialvapen och vapenpods.
- Energi, ammunition och liv.
- Matchstart, matchslut och respawn enligt verifierad originalreferens.
- Dynamisk zoom.
- Grid och extra lines.

Implementera endast funktioner vars beteende är dokumenterat eller observerat. Markera återstående luckor.

## Fas 3 — Multiplayer och menyer

- Huvudmeny.
- Options.
- Skeppsval.
- Specialvapenval och pod-val.
- Tvåspelarläge.
- Utöka till tre/fyra spelare efter kontrolltest.
- Testa tangentbord, moderna gamepads och kombinationer av kontroller.

## Fas 4 — Innehållssystem

- Skeppsdata.
- Vapen och specialvapen.
- Powerups.
- Banor.
- Grafik och animationer.
- Musik och ljudeffekter.
- Konfigurerbara matchinställningar.

Nya funktioner ska inte ändra originalregler om det inte är ett avsiktligt dokumenterat val.

## Fas 5 — Windows-export och kvalitet

- Testa Windows-export från den installerade GMS 1.4-versionen.
- Kontrollera att `.exe` och nödvändiga resurser fungerar på en ren testmiljö.
- Testa alla kontroller och ljud.
- Testa olika upplösningar och bildförhållanden utan att ändra originalets bildlogik oavsiktligt.
- Skapa versionsnummer, release notes och säkerhetskopia.
- Dokumentera eventuella begränsningar i exportmodul/licens.

## Fas 6 — Remastered-innehåll

Först efter en verifierad originaltrogen bas:
- ny grafik,
- fler skepp,
- nya vapen/powerups,
- nya banor,
- ny musik,
- balansjusteringar och kvalitetsförbättringar.

Håll originaltrogen lägesprofil och nya remastered-funktioner tydligt åtskilda där det är praktiskt.

### Fas 0-status 2026-10-13
Exe och SOB har analyserats statiskt (`13`, `06`, `14`). Återstår: emulatorstart, disassemblering av kod, mätningar, rättighetsklarering. Se `14_PHASE0_REPORT.md` för nästa steg.

### Fas 1-status 2026-10-13
Prototyp skriven (`gms/`): skepp ur `.SOB`, originalfysik, kanon, bana, kamerazoom, liv/energi. **Ej körd i GMS 1.4** — nästa steg är att öppna, köra och rätta kompileringsfel/beteende; därefter emulatorverifiering. Specialvapen, meny/skeppsval, ljud, 3–4 spelare hör till Fas 2–3.

### Fas 2-status 2026-10-13
Specialvapen implementerade i prototypen (ej körda). Kvar i Fas 2: skeppsvalsmeny, grid/extra lines, explosionspartiklar, verifiering mot originalet.

### Fas 2 — skeppsvalsmeny skriven (ej körd). Kvar: huvudmeny (Start/Options/Exit), grid/extra lines, explosionspartiklar.

### Att komma ihåg till Fas 4 (powerups)
- **Bakåtskjutning:** låst som standard (D-015); en powerup ska sätta `rear_fire = true`.
