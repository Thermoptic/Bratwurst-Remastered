# 13 — Analys av den körbara filen `Bratwurst` (Amiga)

Analys utförd 2026-10-13 med egna skript (skrivskyddad läsning; ingen disassembler användes). Fil: 349 028 byte, SHA-256 `75f02567…ce86` (matchar `12_SOURCE_CHECKSUMS.md`).

## Format — VERIFIERAD
AmigaOS Hunk-format (`HUNK_HEADER` 0x3F3), 7 hunks, ingen debug-/symbolinfo (strippad).

| Hunk | Typ | Minne | Storlek (byte, enl. header) | Innehåll |
|---|---|---|---:|---|
| 0 | CODE | any | 81 432 | 68k-kod (~25 kB verifierad kod), sinustabell, packad `S404`-payload ~33 kB (se `15`); 3 123 RELOC32 |
| 1 | DATA | chip | 24 704 | Chip-data (9 RELOC32), ej analyserad |
| 2 | DATA | chip | 117 832 | 8-bitars sampel/vågformer (SANNOLIK: ljud) |
| 3 | DATA | chip | 73 204 | Innehåller en ProTracker-modul (se nedan) + sampeldata |
| 4 | DATA | any | 39 084 | Bitmap-font, specialvapennamn, tabeller (4 RELOC32) |
| 5 | BSS | any | 1 416 | |
| 6 | BSS | chip | 229 376 | Sannolikt skärm-/bitplane-buffertar |

Spelet har strängarna `graphics.library` och `dos.library` (0x4f67e/0x4f694) — **inte** reqtools.library eller Least (0 träffar). Sannolikt tar det över hårdvaran direkt (AGA). Detta är `SANNOLIK`, ej verifierat via kod.

## Hittade spelrelevanta strängar — VERIFIERAD (ASCII i filen)
| Offset | Text / betydelse |
|---|---|
| 0x49b0 | `PROGDIR:ShipBay` — skeppsfiler läses från katalogen `ShipBay` bredvid programmet |
| 0x48d8–0x48e0 | `Shob`+`ject` (kodjämförelse av `.SOB`-magic; texten är uppdelad i två 4-byte-konstanter i kod) |
| 0x12e90 | `SHIP:` / `SPECIAL WEAPON:` / `------------------` / `IS THIS OK?` / `YES` / `NO` (×4 spelare) |
| 0x133c7 | `PLAYER ONE IS READY TO EAT` / `PLAYER TWO IS READY TO ROCK` / `PLAYER THREE IS READY TO SWIM` / `PLAYER FOUR IS READY TO SNEEZE` |
| 0x4f5d8 | Introscroll: `- bratwurst -`, `the true story`, `coding:` niklas s…, thomas sk…, `graphics:` …samuelsson, `some music:` christer enfors, `-- hit a button --` |
| 0x54d7e | Fonttecken ` ABC…XYZ0123456789.,!"/()=+-\':;?` följt av glyfbitmappar (font är inbäddad) |
| 0x54ea4 | **Specialvapen (6 poster × 18 tecken):** `NOTHING`, `MISSILE`, `GUIDED MISSILE`, `TURBO BOOST`, `TRACTOR BEAM`, `CANNON TURRET` |
| 0x54f10 | Ordtabell `1,1,1,10,1,12,1,8,5,1,2,1` direkt efter namnen (OKÄND; kan vara per-vapen-parametrar) |

Menytexter för huvudmeny/Options (Start, Options, Exit, Grid, Extra lines) finns **inte** som ASCII i filen → de ritas troligen med fontbitmapen/annan kodning eller ligger i chip-data (hunk 1). OKÄND.

## Inbäddad musik/ljud
- **VERIFIERAD:** I hunk 3 på filoffset 0x42fb0 finns en giltig **ProTracker-modul** (`M.K.`-signatur, 31 sampelplatser): titel `…edeon et barnabe`, sampel `JoyDrum1–4`, `JoyHihat`, `Gedeon09`, `Joy05Bass`; 1 pattern, songlängd 1, ca 31 kB sampel. Mönsterdata ser musikaliskt rimlig ut (giltiga periodvärden).
- **SANNOLIK:** Detta är inte hela spelmusiken utan en kort modul/loop; övrigt ljud kan ligga i hunk 2 (117 kB 8-bitsdata). `file_id.diz` nämner "Dolby Surround" och doc nämner musik av Christer Enfors. Att musik **är inbäddad i exe** är verifierat; hur den sekvenseras/spelas är OKÄNT.
- Banor/nivåer: inget identifierat (inga strängar, ingen uppenbar tabell). OKÄND.

## Viktig upptäckt: filen är inkonsekvent / sannolikt skadad — MOTSÄGELSE
1. Hunk 2:s och hunk 3:s `HUNK_DATA`-storlek i huvudet är **512 byte större** än avståndet till nästa `HUNK_END` i filen (hunk 2: 117 832 deklarerat vs 117 320 faktiskt; hunk 3: 73 204 vs 72 692). Hunk 4 stämmer exakt. VERIFIERAD.
2. Efter sista `HUNK_END` (filoffset 0x54f64) ligger **1 024 byte skräp** (filen är 349 028 B men hunkströmmen slutar vid 348 004 B): ett 512-byte-block är början på `Bratwurst.doc`-texten (0x55000), och ett block är en gammal kopia av hunk-4-stjärten med specialvapennamn och en komplett hunk-stjärt (0x552a4–0x55364). VERIFIERAD.
3. De två fynden summerar exakt 2×512 B = 1 024 B. **SANNOLIK slutsats:** två 512-byte-block har försvunnit ur hunk 2 och 3, och filens längd har bibehållits med gammalt skräp (typisk skada vid diskavbildning/undelete/felaktig kopiering). Orsak OKÄND.
4. Konsekvens: AmigaOS `LoadSeg` bör **inte** kunna ladda filen i nuvarande skick (hunkstorlek ≠ strömmen). Antingen (a) emulatorn/kopian fungerar av annat skäl, (b) spelet packas/laddas annorlunda, eller (c) vi har en skadad kopia. **Måste testas i emulator** innan slutsatser om originalets fulla innehåll dras. Ljud-/grafikdata kan ha 512 B hål.

## Ej gjort ännu (kräver disassembler/emulator)
- Disassemblering av hunk 0 (kod): fysik, vapen, kollision, kamera/zoom-formler, hur `.SOB`-fälten används, huvudloopens timing.
- Hunk 1 (chip-data 24 kB): kan vara grafik, palett, vektor-/sinustabeller.
- Hunk 4:s övriga tabeller.
- Inga hastighets-, gravitations- eller zoomvärden har verifierats.

## Uppdatering: Ghidra-analys av hunk 0
Se `15_GHIDRA_DISASSEMBLY.md`: skeppsladdaren (versaliserar filnamn, accepterar `.SOB`, kontrollerar `Shobject`), sinustabell, packad payload. Punkten "ingen disassembler användes" gäller bara den första analysen.

## Uppdatering 2026-10-13 (steg 1–3)
- Hunk 0 innehåller en **ProTracker-replayer** (0x7450–0x8e00; tabellerna 0x7fb0/0x7fda är PT:s vibrato- och periodtabeller) — inte spelfysik.
- S404-payloaden i hunk 0 (0x8f5c) är **StoneCracker 4.10** och är uppackad till 78 108 B planar bitmapdata (`analysis/derived/s404_payload.bin`, privat).
- Hunk 4 innehåller sin/cos-tabeller (256 ord, ±256), fyra nollade skeppsstrukturer (42 B) och vapentabell vid `+0x9894`. Hunk 5 (BSS 1 416 B) är spelets variabelblock. Se `15`.
