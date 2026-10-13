# 06 — `.SOB`-skeppsfiler: forskning och verifierade fynd

**Status 2026-10-13:** den *strukturella* layouten är verifierad mot samtliga 15 filer. Flera fältbetydelser är fortfarande `OKÄND`/`SANNOLIK`. Formatet får därför **inte** kallas "fullt förstått" (CLAUDE.md). Verktyg: `tools/sob_dump.py` (läser originalen skrivskyddat). Ritad kontaktsida: `analysis/ships_sheet.svg`. Rådata: `analysis/ships_raw.json` (härledd ur originalet — rättighetsstatus enligt `09`, publicera ej).

## Metod
1. Hexdump + ordvis (16-bit big-endian) jämförelse av alla 15 filer.
2. Anpassning av en storleksformel mot samtliga filer (se nedan).
3. Parser `tools/sob_dump.py` som avvisar fil om magic, storleksformel, radindex eller slutposition inte stämmer.
4. Visuell kontroll: linjerna ritades som SVG (BatWing ser ut som en fladdermus, Kaese är en kil/triangel, cruiser/Boomerang/HeavyMetal likaså).

## Layout (alla tal är 16-bit **big-endian** ord, Amiga/68k)

Fil = `"Shobject"` (8 byte) följt av ord. `N` = antal punkter, `M` = antal linjer, `K` = antal "pods"/monteringspunkter.

| Ordoffset (efter magic) | Antal ord | Innehåll | Status |
|---|---:|---|---|
| 0 | 1 | `N` punkter | VERIFIERAD (index-/storlekskonsistent i 15/15) |
| 1 | 1 | `M` linjer (= N i 14 av 15 filer; Kaese: N=4, M=3, öppen figur) | VERIFIERAD |
| 2 | 1 | `K` pods | VERIFIERAD (konsistent; tolkning se nedan) |
| 3 | 2N+4 | Block "A": N (x,y)-par + 4 ord. Osignerade, skärmkoordinatlika (ofta 160 = bredd/2, y~100). Delar upprepas inom blocket. Troligen cache/skärmprojektion från editorn | OKÄND (SANNOLIK: editor-/skärmcache; inte nödvändig för form) |
| 3+2N+4 | 2M | Linjelista: M par (punktindex a,b) | VERIFIERAD (alla index < N i 15/15) |
| … | 2K | Pod-position i skärmkoordinater (samma typ som block A) | SANNOLIK |
| … | K | Pod-vinkel i grader (0 = rakt fram, 180 = bakåt, 20/340, 135/225 …) | SANNOLIK (stämmer med skeppsform: bakre pod=180, vingpods 340/20) |
| … | K | Pod-flaggor/typ (små heltal, t.ex. `0,0,1,1`; `2,1` hos Kaese/JAS) | OKÄND |
| … | 27 | Parameterblock `P0..P26` (se nedan) | OKÄND (delvis hypoteser) |
| … | 2N | **Punkter**: signerade (x,y), skeppskoordinater, origo ≈ skeppets mitt, **y negativt = framåt** | VERIFIERAD geometri (rityttest) |
| … | 2K | **Pod-positioner**: signerade (x,y), samma koordinatsystem | VERIFIERAD (hamnar på skrovet; nos/akter/vingar) |

**Storleksformel (VERIFIERAD, 15/15 exakt):**
`filbyte = 8 + 2·(3 + (2N+4) + 2M + (27+4K) + 2N + 2K)`

### Parameterblock (27 ord) — observationer, inga slutsatser
Exempel (P0..P10) per skepp: se tabell nedan. Mönster som syns:
- `P4..P7` = `1,5,1,5` / `1,4,1,5` / `1,3,1,5` / `2,5,1,5` (nästan konstanta; första ordet av varje par varierar 1–2/3–5, andra 5 → ev. min/max-intervall) — OKÄND.
- `P9, P10` = t.ex. `300,150`, `450,200`, `100,150`, `150,100`, `200,100` — numeriskt "stora" värden; kan vara energi/ammo/massa m.m. — OKÄND.
- Efterföljande ord: små värden `256`, `257`, `1`, `0` (=0x0100, 0x0101, 0x0001 → bytepar-flaggor, sannolikt per-pod/per-vapen tillåtelse) — OKÄND, men kan vara just "vilka specialvapen / vilken pod" som dokumentationen nämner.
- De 13–15 sista orden i blocket är 0 i alla 15 filer (reserverat/oanvänt?) — VERIFIERAD observation, tolkning OKÄND.

| Skepp | N | M | K | pod-vinklar | P0–P10 |
|---|--:|--:|--:|---|---|
| BatWing | 39 | 39 | 4 | 0,0,180,0 | 5,7,4,30,1,5,1,5,1,300,150 |
| Blitz | 38 | 38 | 4 | 0,0,0,180 | 5,9,6,25,1,5,1,5,2,150,100 |
| Boomerang | 26 | 26 | 8 | 0,0,0,0,0,180,135,225 | 8,7,5,40,1,4,1,5,3,450,200 |
| cruiser | 44 | 44 | 6 | 0,0,0,180,320,40 | 8,7,6,50,1,3,1,5,4,300,250 |
| Glider | 34 | 34 | 4 | 0,3,357,180 | 5,7,5,30,1,4,1,5,3,250,100 |
| HeavyMetal | 24 | 24 | 3 | 0,0,0 | 4,5,4,50,1,3,1,5,5,450,200 |
| JAS | 12 | 12 | 2 | 0,180 | 5,9,3,20,2,5,1,5,1,100,150 |
| Kaese | 4 | 3 | 2 | 0,180 | 6,9,2,40,1,5,1,5,2,300,150 |
| Shuttle | 13 | 13 | 4 | 0,0,0,180 | 6,9,5,35,1,4,1,5,2,200,100 |
| Slicer | 18 | 18 | 5 | 0,0,225,135,0 | 3,5,5,30,1,4,1,5,2,400,200 |
| Sweeper | 28 | 28 | 4 | 0,0,0,180 | 3,7,3,35,1,4,1,5,3,300,100 |
| Swift | 37 | 37 | 4 | 5,355,0,180 | 6,10,4,30,1,4,1,5,2,200,100 |
| TieFighter | 24 | 24 | 4 | 0,0,0,180 | 6,9,5,30,1,5,1,5,2,300,150 |
| Viper | 34 | 34 | 4 | 4,356,0,180 | 6,8,6,30,1,4,1,5,2,300,150 |
| XWing | 20 | 20 | 4 | 0,20,340,180 | 6,7,5,40,1,4,1,5,3,200,200 |

(Samtliga 15 har extents ~ ±60…±170 enheter; geometrin är spegelsymmetrisk kring x=0 — alla punkter i 12 filer; HeavyMetal 22/24, Slicer 16/18, TieFighter 20/24 punkter har spegelpartner; avvikelserna är sannolikt enstaka asymmetriska punkter, ej verifierade.)

## Motsägelse mot dokumentationen
`Bratwurst.doc` säger att antalet vapenpods varierar "från en till fyra". Filerna har **K = 2–8** (Boomerang 8, cruiser 6, Slicer 5, HeavyMetal 3, JAS/Kaese 2). **MOTSÄGELSE / OKÄND:** K är troligen *alla* monteringspunkter (kanon + specialpods), inte enbart specialvapenpods. Måste avgöras i emulator (ship select).

## Vad som återstår för att kalla formatet förstått
- Betydelse av block A:s 4 extra ord, pod-flaggor, och P0–P26 (kräver korrelation mot spelbeteende/kod).
- Hur exe läser filen: `Shobject`-kontrollen finns i kod (hunk 0 ~0x48d8, jämför `Shob`+`ject`), sökvägen `PROGDIR:ShipBay` finns som sträng (0x49b0). Fältordning kan bekräftas genom att läsa 68k-koden där (kräver disassembler).
- Observera skeppsval i emulator: antal pods, vilka specialvapen per skepp, ev. hastighet/energi → matcha mot P-kolumnerna.
- Ev. editor (enligt `Bratwurst.doc`) finns inte i arkivet.

## Tillägg: kodbekräftelse (Ghidra, `15`)
Exe:n versaliserar katalogposters namn och accepterar `.SOB` oavsett skiftläge → `cruiser.sob` laddas; kontrollerar `Shobject`; läser hela filen i minnet. Fältordningen efter magic är ännu inte kodverifierad (nästa steg).

## Tillägg: hypotes om P-blockets betydelse (Ghidra, `15`) — SANNOLIK, ej verifierad
Koden som kopierar skeppsstrukturen till spelarvariabler är funnen (0x3498), och dess fält `+0x12…+0x22` motsvarar sannolikt P0–P8: **P0 DRAG, P1 THRUST, P2 RELOAD, P3 ammo/energi-gräns?, P4 TURN_INIT, P5 TURN_MAX, P6 TURN_ACCEL (=1 i alla), P7 SHOT_SHIFT (=5 i alla), P8 BOUNCE**. Kopieringen fil→struktur är inte hittad, så mappningen är en hypotes. P9–P26 återstår (P9/P10 ≈ 100–450 kan vara energi/ammo; flaggorna `256/257/1` okända).

## Korrigering och bekräftelse efter kodläsning (steg 4, `15`)
Spelets egen laddningsrutin (`0x11f3e`) är funnen och bekräftar layouten. Ändringar mot tabellen ovan:
- **Block A:** de 4 extra orden kommer **först**, därefter N skärmpunktspar (inte tvärtom). Spelet hoppar över hela blocket.
- **Pod-vinklar:** grader, konverteras `·256/360` till 1/256 varv — VERIFIERAD.
- **Pod-flaggor:** 0 = ej valbar för specialvapen, ≠0 = valbar. Valbara pods per skepp = 1–4 (löser doc-motsägelsen). Skillnaden 1 vs 2 är OKÄND.
- **P0–P8 = DRAG, THRUST, RELOAD, ENERGY(?), TURN_INIT, TURN_MAX, TURN_ACCEL, SHOT_SHIFT, BOUNCE** — mappning fil→variabel VERIFIERAD; betydelsen av P3 är SANNOLIK (energi).
- **P9 = kanonammunition (SANNOLIK, hög), P10 = bas för specialammunition (× tabell per vapen, tabellen VERIFIERAD).**
- **P11–P26 = 16 ord som läses som bytes; byte 0–4 = tillgänglighet för MISSILE, GUIDED MISSILE, TURBO BOOST, TRACTOR BEAM, CANNON TURRET** — VERIFIERAD funktion. Övriga bytes är 0 i alla 15 filer.

Tillgängliga specialvapen per skepp (`tools/sob_dump.py`): BatWing/Blitz/XWing: MISSILE, GUIDED, TURBO · Boomerang: MISSILE, GUIDED, TURBO, TRACTOR · cruiser: MISSILE, GUIDED, TRACTOR · Glider/JAS/Sweeper: GUIDED, TURBO · HeavyMetal: TRACTOR · Kaese: MISSILE, TURBO · Shuttle: MISSILE, TURBO, TURRET · Slicer/Swift/TieFighter: MISSILE, GUIDED · Viper: MISSILE. Valbara pods: se `selectable_pods` i verktyget.
