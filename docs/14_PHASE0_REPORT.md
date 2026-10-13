# 14 — Fas 0: analysrapport (2026-10-13)

## Verifierat denna session
1. **Checksummor:** alla 27 originalfiler matchar `12_SOURCE_CHECKSUMS.md`. Inget under `original/` har skrivits.
2. **Dokumentationen** (`Bratwurst.doc`, README, docs/01–12) är konsistent med arkivet; filantal och storlekar stämmer.
3. **`Bratwurst`** är en Hunk-exe med 7 hunks; kod 81 kB + tre stora datahunks (se `13`). Strängar för `graphics.library`/`dos.library`.
4. **`.SOB`-layout:** 15/15 filer följer en exakt storleksformel; punkter, linjer, pod-positioner och pod-vinklar är avkodade och ritas som igenkännbara vektorskepp (`06`, `analysis/ships_sheet.svg`). Parser: `tools/sob_dump.py`.
5. **Specialvapen** i exe: NOTHING, MISSILE, GUIDED MISSILE, TURBO BOOST, TRACTOR BEAM, CANNON TURRET (5 riktiga + "ingenting").
6. **UI-texter:** ship select, "PLAYER … IS READY TO EAT/ROCK/SWIM/SNEEZE", intro-/credits-scroller.
7. **Inbäddad ProTracker-modul** i exe ("edeon et barnabe", 8 sampel) → musik/ljud är åtminstone delvis inbäddat.
8. **Filskada:** hunk 2/3 är 512 B kortare än deklarerat; 1 024 B skräp i slutet inkl. kopia av doc-text — se `13`.
9. Övriga filer är tredjepartsverktyg: `Least` (textvisare), `Assign`, `LoadWB`, `Wait` (AmigaOS), `reqtools.library`. Exe refererar inte till dem.

## Motsägelser och osäkerheter (olösta)
- **MOTSÄGELSE:** manualen säger 1–4 vapenpods; SOB-data har K = 2–8 (`06`).
- **MOTSÄGELSE/OKÄND:** "beta, CompuSphere IV" (doc) vs "V3.5" (`file_id.diz`). Exe-tailen innehåller doc-texten, så doc och exe kommer sannolikt ur samma diskavbildning, men versionsfrågan är olöst.
- **OKÄND:** Betydelsen av P0–P26 i SOB, pod-flaggor, fysik, kamera-/zoomformel, banor (finns de?), huvudmenyns textrendering.
- **OKÄND:** Om originalet startar i emulator trots skadefyndet.

## Saknade resurser för en trogen remake
- Fysikvärden (acceleration, rotation, tyngdkraft, friktion, maxfart, projektilfart): ej extraherade → kräver disassemblering och/eller emulatormätning.
- Banor/väggar: inget format identifierat.
- Vapenbalans, skada, energi/ammo/liv per skepp: ej identifierat (kan ligga i SOB-parametrarna).
- Ljud/musik: delvis lokaliserat; vad som spelas när är ej verifierat.
- Grafik: inga bitmaps identifierade; stilen är vektorlinjer + inbäddad font.
- Referensvideo/skärmdumpar från emulator: saknas.
- Rättighetsklarering: oförändrad (`09`).

## Förslag: första prototyp (efter steg 1–3 nedan)
Ett vektorskepp (t.ex. XWing eller Kaese-triangeln) ritat från `.SOB`-punkterna, rotation + thrust + skott, tom bana, en kamera. Acceptanstester: `PHY-01..03`, `WPN-01`, `CAM-01` i `08`. Fysikvärden hämtas först när de är observerade/verifierade; tills dess markeras de som placeholders.

## Nästa konkreta analyssteg (prioritetsordning)
1. **Emulator (WinUAE/FS-UAE, AGA, användarens egen Kickstart-ROM)**: kontrollera om exe laddas trots skadefyndet (REF-01). Spela in menyer, skeppsval (pods/vapen per skepp), strid, zoom.
2. **Disassemblera hunk 0** (Ghidra m68k eller liknande): hitta `.SOB`-läsaren, bekräfta fältordning och P0–P26, hitta fysik-/kamerakonstanter. Kräver nedladdning av verktyg → behöver ditt godkännande.
3. **Korrelera SOB mot ship select** i emulator (antal pods/vapen per skepp) och namnge fälten först då.
4. **Hunk 1 och 4:** analysera chip-data/tabeller; mappa 0x54f10-tabellen mot specialvapnen.
5. **Ljud:** extrahera modulen endast till en analysmapp utanför `original/` för identifiering; rättighetsfråga före återanvändning.
6. **Tomt GMS 1.4-projekt** (Fas 1) först när steg 1–3 gett rörelse- och kameraformler.
