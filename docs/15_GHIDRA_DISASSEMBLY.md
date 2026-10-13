# 15 — Disassemblering av hunk 0 med Ghidra (2026-10-13)

Verktyg: Ghidra 12.1.4 + JDK 21 (nedladdade med godkännande; installerade utanför projektet, se `tools/ghidra/README.md`). Ghidra saknar Amiga-Hunk-loader och exe:n är skadad (`13`). Därför:

1. `tools/build_flat_image.py` bygger en **relokerad platt minnesavbild** av alla hunks (hunk 2/3 med sin faktiska längd). Baser: h0 `0x000000`, h1 `0x020000`, h2 `0x040000`, h3 `0x070000`, h4 `0x090000`, h5 (BSS, 1 416 B) `0xa0000`, h6 (BSS, 229 376 B) `0xa1000`. Alla 3 123 + 9 + 4 relokationer är applicerade, så absoluta adresser i listningen är **avbildsadresser** (t.ex. `0x9964a` = hunk 4 + 0x964a, `0xa04e8` = hunk 5 + 0x4e8).
2. Importerad som rå binär, processor `68000:BE:32:MC68020`. Skript `tools/ghidra/ExportFlat.java` seedar disassembleringen från jsr/jmp-mål, andra kodpekare och efterföljare till `rts`-block.
3. Utdata: `analysis/ghidra/flat_listing.txt` (8 692 instruktioner, 179 funktioner), `flat_decompiled.c`, `flat_xrefs.txt` (härlett ur originalet — privat, se `09`). Den äldre `hunk0_*`-utdatan är ersatt men finns kvar.

Täckning: ca 8 700 instruktioner av en hunk 0 vars kodandel är ≈ 50 kB; resten (se nedan) är data. Delar av spelkoden — bl.a. ship select-/laddarens struct-uppbyggnad — är **inte** funnen ännu.

## KORRIGERING av tidigare fynd (docs 13/15 v1)
- Sinustabellen vid `0x7fb0` och ordtabellen vid `0x7fda` är **inte** spelfysik: det är **ProTracker-vibratotabellen** respektive **ProTrackers periodtabell** (856, 808, 762 … 113; 16 finetune-rader à 72 byte = `mulu #0x48`). Området ≈ `0x7450–0x8e00` är en **ProTracker-spelrutin** (replayer, kanalstrukturer via A5/A6). VERIFIERAD (kod + data). Det stämmer med den inbäddade `M.K.`-modulen (docs/13).
- Den "packade payloaden" (`S404` vid hunk0+`0x8f5c`) är packad med **StoneCracker 4.10** (generation 8) och är nu **uppackad** (se nedan).

## Verifierat — fynd per ämne

### StoneCracker-payloaden (steg 1) — VERIFIERAD
- `tools/s404_unpack.py` (port av algoritmen i temisu/ancient) packar upp 30 206 B → **78 108 B** (= rawSize i headern) utan fel; hela indataströmmen konsumeras bakåt och utdata fylls exakt.
- Innehåll: **planar bitmapdata** (bitplane-mönster som `ffff`, `0f3c 03c0`; ~55 % nollor; slutar med 4 kB nollor). Tolkning som bild/bana är SANNOLIK, ej bekräftad (oklart antal bitplanes/bredd). Uppackad fil: `analysis/derived/s404_payload.bin` (privat).

### Skärm och rendering — VERIFIERAD (kodkonstanter)
- **Linjeklippning mot 320 × 256** (konstanterna `0x140`/`0x13f`, `0x100`/`0xff`, Cohen-Sutherland-lik, hunk0 `0x308e–0x335a`) följt av linjerutin vid `0x335c`. Logisk skärm ≈ 320×256 (PAL lowres). Statusfältets höjd är inte utredd.
- **Skepp ritas som vektorer**: för varje punkt (x,y) läses två 16-bit-värden, skalas med zoomfaktor `(0xa04e8)` (8 fraktionsbitar, `>>8`) och roteras med sin/cos-tabeller (hunk 4 `+0x9238` / `+0x9438`, **256 ord vardera, amplitud ±256, 256 steg per varv**; värdena är ≈ `256·sin(2π(i+½)/256)`, max fel 4). Resultatet sparas i en skärmpunktscache (det som `.SOB`-block A är en bild av). Rotation: `x' = x·cos + y·sin`, `y' = x·sin − y·cos`-liknande, 8-bitars fixpunkt.
- **Vinkelenhet = 1/256 varv** (`andi.w #0xff`).
- Skeppsstrukturen (42 byte/spelare, 4 st vid hunk 4 `0x9965a, 0x99684, 0x996ae, 0x996d8`, pekare i `0x9964a/4e/52/56`) är i den körbara filen **nollad**; den fylls i runtime. Fält som används: `+0` antal punkter, `+2` antal pods−1, `+6` pekare till punktlistan (x,y), `+0xA` pekare till pod-listan (x, y, vinkel — **3 ord** per pod), `+0x12…+0x28` parametrar (se nedan).

### Spelarens fysik (hunk 0 `0x16a4–0x18d8`, spelare 1; spelare 2–4 identiska rutiner med egna variabler) — VERIFIERAD i kod
Per-spelare-tillstånd (hunk 0 `.data`): läge X `0x6858` (long), läge Y `0x685c` (long), hastighet X `0x6860`, Y `0x6864` (long), vinkel `0x6868` (word, 0–255), indata `0x466a` (bit0 vänster, bit1 höger, bit2 skjut, bit3 special, bit4 thrust; spelare 2 = `0x466b`). Skärm-/heltalsläge = läge `>>8` (`0x686a/0x686c`) → **24.8-fixpunkt**.
- **Sväng:** vid vänster/höger ändras vinkel med vinkelhastigheten `w` (`0x1a06`); efter varje bildruta `w += TURN_ACCEL`, begränsas till `TURN_MAX`; utan sväng-input återställs `w = TURN_INIT`. Alltså en **uppstartande, accelererande rotation**.
- **Thrust (bit 4):** `v_x −= sin[vinkel]·THRUST >> 3`, `v_y += cos[vinkel]·THRUST >> 3`.
- **Gravitation, motstånd, integration** (hoppas över om `0x687e ≠ 0`): `v_y += GRAVITY` (global long `0x9963e`, nollställd vid start, ändras via `0x99642`), därefter `v −= (v·DRAG) >> 8` per axel, därefter `pos += v`. Motståndet är alltså **proportionellt mot hastigheten, DRAG/256 per bildruta**.
- **Skott (bit 2):** nya skott skapas i en lista (`0x96828`, 16 byte/skott, max `0x258` = 600), position = skeppets pod-position, hastighet bestäms av skeppets hastighet + `sin/cos[vinkel + pod-vinkel] << SHOT_SHIFT`; efter skott laddas en nedräkningstimer (`RELOAD`) och `0xa04ec` (antal skott) ökar.
- **Specialvapen (bit 3):** minskar räknaren `0xa0444` (ammo), anropar skapande-rutinen `0x6bce` med vapentyp från `0x99638`.
- **Banor = bitmappar:** kollision slås upp med `btst` i **tre kollisionsbitmappar** (pekare `0xa049c`, `0xa04a4`, `0xa04ac`, en bit per pixel). Träff i den första → skada/död-rutin (`0x60d8`); i den andra → studs: `v += (målhastighet − v) >> BOUNCE` (BOUNCE = per-skeppsvariabel); i den tredje → liknande med spelarens andra parameter. Detaljer ej fullständigt utredda. Det betyder att **banor sannolikt är bitmappar** (kollisionsplan), inte vektordata.

### Per-spelare-variabler och hur de fylls — VERIFIERAD (kod 0x3498–0x36a8)
Rutinen vid `0x3498` kopierar ur skeppsstrukturen (A1–A4 = spelare 1–4) till fältvektorer i hunk 5 (index per spelare, steg 2 byte; sväng-/skottparametrar steg 10 byte):

| Strukt-offset | Variabel(r) | Användning (verifierad i kod) |
|---|---|---|
| `+0x12` | `0xa0528..` | `DRAG` (÷256 per ruta) |
| `+0x14` | `0xa0530..` | `THRUST` (`·sin/cos >> 3`) |
| `+0x16` | `0xa0538..` | `RELOAD` (kanonens nedräkning mellan skott) |
| `+0x18` | `0xa0540..` | nämnare/gräns för kanonammo/energi (`divu` vid 0x567e) — tolkning SANNOLIK |
| `+0x1a` | `0xa0500/0a/14/1e` | `TURN_INIT` |
| `+0x1c` | `0xa0502/0c/16/20` | `TURN_MAX` |
| `+0x1e` | `0xa0504/0e/18/22` | `TURN_ACCEL` |
| `+0x20` | `0xa0506/10/1a/24` | `SHOT_SHIFT` (skott-/mynningsförskjutning, `asl`) |
| `+0x22` | `0xa0508/12/1c/26` | `BOUNCE` (studs-skift mot vägg) |
| `+0x24` (ord, byte `+0x25` kopieras till `0x99638..`) | specialvapentyp | index (0–5) i tabell vid hunk 4 `0x9894` (4 B/post: mult, div) |
| `+0x26` | `0xa042c..` | specialvapenmängd, kopieras till `0xa043c..` (ammo) |
| `+0x28` | `0xa0434..` | skalas med tabell `0x99894[typ]` → `0xa0444..` |

### Koppling till `.SOB`-parameterblocket (`06`) — P0–P8 verifierade, se "Uppdatering (steg 4)" nedan
Strukturens parameterfält `+0x12…+0x28` är 12 ord i följd, som liknar början av P-blocket. **Hypotes (H1):** `+0x12 + 2k ↔ P_k` för k=0…8, vilket ger:

| P-index | Föreslaget namn | Värden i de 15 skeppen |
|---|---|---|
| P0 | DRAG | 3–8 |
| P1 | THRUST | 5–10 |
| P2 | RELOAD | 2–6 |
| P3 | (ammo/energi-gräns?) | 20–50 |
| P4 | TURN_INIT | 1–2 |
| P5 | TURN_MAX | 3–5 |
| P6 | TURN_ACCEL | 1 (alla 15) |
| P7 | SHOT_SHIFT | 5 (alla 15) |
| P8 | BOUNCE | 1–5 |
Skälen: värdena ligger i rimliga intervall för just de användningarna (t.ex. P7 = 5 och P6 = 1 i alla 15 skepp; P4 ≤ P5), men **uppbyggnadsrutinen som kopierar filen till strukturen är inte hittad**, och `+0x24…+0x28` (specialvapen) skrivs över av skeppsvalet. Bekräfta genom att hitta kopieringen eller via emulator. Enheter (pixlar/bildruta²) är ej fastställda.

### Ship-laddaren — VERIFIERAD
`0x4790–0x4960`: öppnar `PROGDIR:ShipBay`, itererar katalogen (dos.library Lock/Examine/ExNext), **versaliserar filnamnet** (chk2 mot `a..z`, −0x20) och accepterar poster som slutar på `.SOB` → `cruiser.sob` (gemener) laddas; räknar skepp (`0x4aac`); läser hela filen i minnet, kontrollerar `Shob`+`ject`. Maxantal skepp ej utrett.

### Musik — VERIFIERAD
Hunk 0 innehåller en **ProTracker-replayer** (periodtabell, vibratotabell, kanalstrukturer). Musiken är alltså PT-moduler (en finns inbäddad, se `13`).

## Öppet / nästa steg
1. Hitta koden som bygger skeppsstrukturen från den inlästa `.SOB`-filen (ship select; sannolikt i oupptäckta delar av hunk 0: gap `0x1d68–0x1fa2`, `0x2428–0x2ac4`, `0x4980…`) och bekräfta H1 samt fältordning för block A, pod-flaggor och P9–P26.
2. Kamera/zoom: `0x2b16` skriver `(0xa04e8)` (zoom) och `0x2b6c` jämför — nästa att läsa för zoomformeln och gränser.
3. Skada, energi, liv, specialvapnens beteende (`0x6bce` och anrop), vapentabellen vid hunk 4 `0x9894`, tabellen `1,1,1,10,1,12,1,8,5,1,2,1` (docs/13).
4. Banor: identifiera bitmapparnas källa (kan vara den uppackade S404-payloaden), upplösning och vilka plan som är vägg/studs/döda.
5. Dynamisk verifiering i emulator (WinUAE/debugger) för att bekräfta alla värden och enheter innan de används i GMS 1.4.

---
# Uppdatering (steg 4): `.SOB`-kopieringen och zoomkoden

Ytterligare kod disassemblerad (9 065 instruktioner / 195 funktioner). Källa: `analysis/ghidra/flat_listing.txt`.

## `.SOB` → skeppsstruktur (rutin `0x11f3e`) — VERIFIERAD
Rutinen anropas för varje spelare (`0x11e86…0x11f30`) med A1 = inläst filbuffert (filens byte 8, dvs. efter `Shobject`, motsvarar buffert+0x20) och A2 = spelarens 42-byte-struktur i hunk 4. Den läser filen i denna ordning, vilket **korrigerar block A-ordningen i `06`**:

| Filens ord (efter magic) | Hanteras som |
|---|---|
| 0, 1, 2 = N, M, K | struktur `+0` = N, `+2` = K, `+4` = M |
| 3–6 (4 ord) | **hoppas över** (block A:s fyra extra ord kommer *först*) |
| N par | hoppas över (skärm-/previewpunkter; används inte vid laddning) |
| M linjepar | struktur `+0xE` = pekare till linjelistan |
| K par | hoppas över (pod-skärmkoordinater) |
| K ord | pekare **A5** = pod-vinklar i grader (sparas per spelare på `0x139f0..`) |
| K ord | pekare **A6** = pod-flaggor (`0x13a00..`) |
| P0–P8 (9 ord) | struktur `+0x12 … +0x22` |
| 1 ord | hoppas över (struktur `+0x24` skrivs senare av specialvapenvalet) |
| P9, P10 | struktur `+0x26`, `+0x28` |
| P11–P26 (16 ord) | pekare **A4** = vapentillgänglighet, läses som **bytes** (`0x139e0..`) |
| N punkter (x,y) | struktur `+6` = pekare |
| K pod-positioner | struktur `+0xA` = pekare |

Därmed är hypotesen H1 **bekräftad för P0–P8** (`DRAG, THRUST, RELOAD, P3, TURN_INIT, TURN_MAX, TURN_ACCEL, SHOT_SHIFT, BOUNCE`). Vidare i kod (0x3498–0x3660, 0x3fe0–0x4026, 0x17c0):
- **P3** → `0xa0540` → kopieras vid rundstart till `0xa0578`, som **minskas med 1 vid väggkontakt** (`0x5f74`) och används som nämnare för en HUD-stapel (`divu` vid 0x567e) ⇒ **energi/skrov** (SANNOLIK).
- **P9** (100–450) → `0xa042c` → `0xa043c`, som **minskar med 1 per avlossat kanonskott** (0x17c0) ⇒ **kanonammunition** (SANNOLIK, hög).
- **P10** (100–250) → `0xa0434`; `special_ammo = P10 · mult[typ] / div[typ]` med tabell vid hunk 4 `0x9894` (VERIFIERAD): NOTHING 1/1, MISSILE 1/10, GUIDED MISSILE 1/12, TURBO BOOST 1/8, TRACTOR BEAM 5/1, CANNON TURRET 2/1. Specialammot räknas ned i `0xa0444` vid avfyrning (0x17f4). Tabellen är samma som "ordtabellen" `1,1,1,10,1,12,1,8,5,1,2,1` i docs/13.
- **Pod-vinklar** konverteras `grader·256/360` (0x134b0) till spelets 1/256-varvsenhet. VERIFIERAD.

## P11–P26 = vapentillgänglighet — VERIFIERAD (kod 0x12444 m.fl.)
Vid val av specialvapen cyklar spelaren typ 0–5 (`0x12454`, vänster/höger); typ `t ≥ 1` accepteras bara om `byte[t−1] ≠ 0` i P11-blocket (`tst.b (-1,A0,D0)`). Avkodat för alla 15 skepp (se `06`): t.ex. Viper endast MISSILE, HeavyMetal endast TRACTOR BEAM, Boomerang MISSILE/GUIDED/TURBO/TRACTOR, Shuttle MISSILE/TURBO/CANNON TURRET. Det förklarar de tidigare okända `256/257/1`-värdena (= bytepar `01 00` / `01 01` / `00 01`).

## Pod-flaggor — funktion VERIFIERAD, tolkning av 1 vs 2 OKÄND
Vid val av *vilken pod specialvapnet avfyras från* hoppar rutinen över pods med flagga 0 (`0x12578`, `0x12594`). Antalet **valbara pods = pods med flagga ≠ 0** är för alla 15 skepp **1–4**, vilket **löser motsägelsen med manualen** ("en till fyra pods"). K (2–8) är alltså alla monteringspunkter inklusive kanonpositioner; alla K pods avfyrar kanonskott (loop över K i skottrutinen).

## Kamera / zoom (rutin `0x2ac4`) — VERIFIERAD i kod
Indata: de fyra spelarnas heltalspositioner X (`0x686a, 0x6984, 0x6a9e, 0x6bb8`) och Y (`0x686c, 0x6986, 0x6aa0, 0x6bba`) = världsposition `>>8`.
1. `dx = maxX − minX`, `dy = maxY − minY` över de fyra spelarna (sorteringsnätverk).
2. `zoomX = 0x960000 / (dx + M)` och `zoomY = 0x6c0000 / (dy + M)` (heltalsdivision, `divu`, 16-bitsresultat), där **M = `0x9963c` = 400** (initialvärde i filen; ändras ev. av Options/bana — ej kontrollerat). `0x960000 = 150·65536`, `0x6c0000 = 108·65536`.
3. **Zoom `Z = min(zoomX, zoomY)`** → `0xa04e8`.
4. Kamerans centrum = mitten av omskrivande rektangel: `cx = (maxX + minX)/2`, `cy` likaså.
5. Världspunkt → skärm: `sx = ((x·Z) >> 15) − ((cx·Z) >> 15) + 160`, `sy = … + 118` (`0xa0`, `0x76`); alltså **Z = 32768 ⇒ skala 1:1**. Skeppens egna vertexar skalas med `Z` (`>>8` i två steg) före rotation.
6. **Gridfade:** när `Z > 0x1f40 (8000)` (inzoomat) tonas gridfärgerna in linjärt med `(Z − 8000)/10000 · {0xa3, 5, 0x87}` (0x2ca0–0x2d1a) — stämmer med manualens "grid fades in when players are close". Vid `Z ≤ 8000` är griden av.
7. Kvar: hantering av saknade/döda spelare (används alla 4 platser alltid?), eventuell min/max-gräns för Z (ingen explicit klämning hittad i 0x2ac4), samt statusfältets höjd (skärm 320×256, origo 160,118).

## Fler konstanter (VERIFIERADE i filens initialdata, hunk 4)
`0x9963c = 400` (zoommarginal), `0x9963e = 50` (gravitation i 1/256 px/ruta² på y-axeln; gäller om `0x687e = 0`), `0x99646 = 25` (okänd; används vid 0x5e9a / 0x345a), `0x99638 = 2,1,1,2` (initial specialvapentyp per spelare; skrivs om av skeppsvalet).

## Fortfarande OKÄNT
Pod-flaggornas 1/2, block A:s 4 extra ord, tolkning av `0x99646`, skada/död/respawn (rutin `0x60d8`), specialvapnens beteende (`0x6bce` m.fl.), enhetsomvandling till pixlar/s (bildfrekvens), banornas källa. Verifiering i emulator återstår.

---
# Uppdatering (steg 5): skada, liv, skott, specialvapen, bana och tidssteg

Allt nedan är läst direkt ur den disassemblerade koden (`analysis/ghidra/flat_listing.txt`); adresser = hunk 0 om inget annat anges, variabler = avbildsadresser (se överst). Enheter: positioner/hastigheter är 24.8-fixpunkt ("enheter" = 1/256 världspixel); inget är ännu mätt i emulator.

## Spelloop och tidssteg — VERIFIERAD kod, tolkning SANNOLIK
Huvudloopen (`0x490–0x7a0`) läser `0x7440` (räknare som nollställs varje varv; antas vara antal skärm-/vblank-tick sedan förra varvet) och sparar den i `0xa04d8`. All fysik upprepas `a04d8` gånger per loopvarv (`dbf`-loopar i skott-, objekt- och spelarrutinerna) → **spelet är tidsstegsbaserat och tappar inga tick vid låg bildfrekvens**. Tickfrekvens (50 Hz PAL?) är OKÄND tills den mäts. Loopordning: input → spelare 1–4 → specialvapenobjekt (`0x610c`) → kanonskott (`0x5e7c`) → kollisions-/effektrutin (`0x242c`) → dödskontroll per spelare (`0x6d4–0x700`) → vinstkontroll.

## Liv, energi, död, respawn — VERIFIERAD kod
- **Liv:** `0xa044c/4e/50/52` sätts till **6** vid start (0x34ca). När energi `≤ 0` (`0x6d4`) körs dödsrutinen (`0x3f12`, P2 `0x4032`, P3 `0x4152`, P4 `0x4276`): liv −1.
- **Om liv kvar:** spelaren **återskapas** i en fast startposition med hastighet 0, energi = P3, kanonammo = P9, specialammo = P10-värdet, alla vapen-nedräkningar nollade.
  - P1: (−300 000, −270 000) = (−1171,9; −1054,7) px, vinkel 0x60 (135°)
  - P2: (+300 000, −270 000), vinkel 0xa0 (225°)
  - P3: (−300 000, +270 000), vinkel 0x40 (90°)
  - P4: (+300 000, +270 000), vinkel 0xc0 (270°)
- **Om inga liv kvar:** spelaren elimineras (aktivflagga `0xa0490..93` nollas, spelarantal `0xa048e −1`, explosion `0x3e44`). Vinstskärm anropas (`0x52b2`) när `0xa048e == 1`. **Energi/liv-/respawnreglerna är därmed hämtade ur kod**, inte gissade.
- **Felsökningsknappar:** i huvudloopen sätts energi till −1 (dödar spelare) av flaggbytes vid `0x4711–0x4714` — sannolikt dolda tangenter för "döda spelare N" (tangentkoder ej utredda).

## Skada — VERIFIERAD kod
- **Väggkrasch** (rutin ~`0x2730`): skeppet flyttas tillbaka till föregående position och energin minskar med `((vx² + vy²) >> 16) / 64 + ticks` (där vx, vy = låga 16 bitar av hastighetslongarna; `ticks = a04d8`); hastigheten vänds och dämpas (`v = −v / 4` efter hjälprutin `0x5dc4`). Skada alltså ∝ fart².
- **Kanonskott träffar spelare** (`0x5e7c–0x6076`): träff i spelarens silhuettbitmapp (`0xa04a4/ac/b4/bc`) ger **−1 energi** (`subq #1,(0xa0578..)`), en hastighetsimpuls `v += (skottets v − spelarens v) >> BOUNCE`-liknande studs enligt `0x66f0`, och skottet tas bort. Energin P3 (20–50) betyder därmed ca 20–50 skott.
- **Skott mot vägg:** skottet tas bort (kollisionsbitmapp `0xa049c`, väggar).
- **Specialvapenobjekt som träffar** (väg/spelare; rutinerna `0x65de`, `0x66f0` med typtabeller `0x65f2`, `0x6704`): **MISSILE: −12 energi** (`0x671c`), **GUIDED MISSILE: −5 energi** (`0x673a`), båda med en studs-/impulsändring `Δv = ((v_objekt − v_spelare)·16) >> BOUNCE`. Explosionen spawnar 16 partiklar (missil, `0x660a`) respektive 8 (guidad, `0x667e`). Träff i vägg tar bort objektet med explosion. VERIFIERAD kod. (Obs: energin P3 är 20–50, så en missil tar 24–60 % av energin.)

## Kanonskott — VERIFIERAD
- Lista `0x96828`, 16 B/skott: `x(long), y(long), vx(long), vy(long)`, max 600 aktiva.
- Per tick: `vy += 25` (global `0x99646 = 25`: **skott har egen gravitation**, hälften av skeppets 50), `x += vx`, `y += vy`. Skott skapas vid varje pod (alla K pods skjuter samtidigt) med position = poddens världsposition, hastighet = skeppets hastighet + `(−sin, +cos)[vinkel+podvinkel] << SHOT_SHIFT` (SHOT_SHIFT = 5 i alla skepp ⇒ 32 px/tick relativt skeppet).
- Avfyrning kostar 1 kanonammo per skott (`a043c`), nedräkning mellan skott = RELOAD (P2) ticks.

## Specialvapen (`0x6bce`, tabell `0x6c0a`) — VERIFIERAD kod; ammotabell VERIFIERAD
Avfyras med knappbit 3 när nedräkningen `a04f8..` ≤ 0 och specialammo > 0 (−1 ammo per avfyrning). Rutinen får vapentyp, ägare (1–4) och pod-position/-riktning och sätter en vapenspecifik **nedräkning** (returnvärdet):

| Typ | Namn | Beteende | Nedräkning (ticks) | Ammo-multiplikator |
|---|---|---|---:|---|
| 0 | NOTHING | ingen effekt | – | 1/1 |
| 1 | MISSILE | skapar objekt (22 B) med hastighet `(−sin, +cos)·32` från pod; rör sig rakt, levnadstid **50 ticks** (`+0x12`, räknar ned) | 40 | 1/10 |
| 2 | GUIDED MISSILE | som missil men **styr mot närmaste aktiva spelare** efter 25 ticks rak flygning (timer startar på −25); max levnadstid 225 ticks; styrkraft `(0x68e7780 + timer·0x493e0)/(dist² + 0xea60)`, fartgräns ±0x1400 per axel | 100 | 1/12 |
| 3 | TURBO BOOST | **ögonblicklig impuls** på ägarens hastighet: `v += (sin, −cos)[vinkel+podvinkel]·64`; inget objekt | 20 | 1/8 |
| 4 | TRACTOR BEAM | **drar närmaste aktiva fiende** mot podens position: kraft `0x68e7780/(dist² + 0xea60)` (dist i px), `Δv = riktning·kraft >> 9`, fienden fartbegränsas till ±0xf00; kan användas varje tick (nedräkning 0) och kostar ammo per tick | 0 | 5/1 |
| 5 | CANNON TURRET | **automatiskt riktad kanon**: väljer närmaste aktiva fiende, beräknar riktning (atan-liknande rutin `0xaae`) och skjuter ett kanonskott (hastighet ·32) *om* riktningen ligger inom ±64 (±90°) från poddens riktning; nedräkning 3 ticks | 3 | 2/1 |

(Typ 4 och 5 väljer mål bland spelare 1–4 utom ägaren via aktivflaggorna `0xa0490–93`. Missilens hastighet 32·256 = 8192 enheter/tick = 32 px/tick relativt skeppet.) Specialammo vid start = `P10 · mult/div` (se ovan), t.ex. P10 = 150 & MISSILE → 15 missiler, TRACTOR BEAM → 750 tick-användningar.

## Banan — VERIFIERAD data, tolkning av enheter SANNOLIK
Banan är **vektorväggar**, inte en bitmapp: **68 punkter** (signerade x,y-ord, hunk 4 `+0x8f08`) och **68 linjer** (index-par, hunk 4 `+0x9018`). Linjerna ritas varje bildruta, skalade med kamerans zoom, in i kollisionsbitmappen `0xa049c` (1 bit/pixel, 40 byte per rad → 320 px bred skärmbuffert) som väggkollisioner sedan slår upp. Världsutsträckning: x −3000…+2961, y −2273…+2273 (ytterram) med inre hinder; spelarna startar vid (±1171,9; ±1054,7). Banan är **en enda fast arena i den här versionen** (inga fler banor hittade; ingen banväljare i strängarna). Utdata: `analysis/arena_walls.svg/.json` (privat). Den uppackade S404-bitmappen (78 kB) är alltså **inte** banan — troligen bakgrund/tabeller/grafik, fortfarande oidentifierad.

## Indata
Spelarnas knappbitar läses per tick från styrmetodsprocedurer via tabell `0x7424` och inställningar `0x110a8` (Options): bit0 vänster, bit1 höger, bit2 skjut, bit3 special, bit4 thrust (så dokumentationens "tryck framåt = skjut, dra bakåt = special" motsvarar bit2/bit3 per joystick; thrust-knappen är separat — OKÄNT hur den mappas på joystick/tangenter). Hårdvaruingångar: CIA `0xbfe101`, `0xbfd002`, fyrspelaradapter/tangentbord (tabeller vid `0x462a…`).

## Fortfarande OKÄNT / att verifiera i emulator
Tickfrekvens, exakt träffskada per specialvapen (typindex i `0x65f2`/`0x6704`), vad `a04f8..` dubbelt nedräknade timers gör, tangentmappning, hur kameran hanterar döda spelare (positionsvariabler kvarstår efter död?), explosions-/partikeleffekter (`0x5d28–0x5e48`), ljudtriggers (`D0`-värden), Options-effekter (spelarantal/grid/extra lines).

---
# KORRIGERING (Fas 1): fysiktabeller och gravitation skalas vid start — VERIFIERAD

Rutinen `0x3414` (anropas från `0x254` vid programstart, ovillkorligt) gör:
- `physSin[i] = (sin[i]·20) >> 5`, `physCos[i] = (cos[i]·20) >> 5` → tabeller i hunk 5 (`0xa0022` sin, `0xa0222` cos): **amplitud 160, inte 256**. Alla fysikrutiner (thrust, skottriktning, specialvapen, turret) använder dessa skalade tabeller; ritning och pod-/vertexrotation använder de oskalade tabellerna i hunk 4 (amplitud 256).
- `gravitation 50 → (50·20)>>5 = 31` och `skottgravitation 25 → (25·20)>>5 = 15` (skrivs över i hunk 4 `0x9963e` / `0x99646`).

Konsekvenser för tidigare avsnitt ovan: skotthastighet relativt skeppet är `160<<5 = 5 120` enheter (≈ 20 px/tick), inte 32 px; missilens/guidade missilens/turretens utgångshastighet likaså (`·32` på skalad tabell), turbo `·64` ⇒ ≈ 40 px/tick; thrust = `160·P1/8`. Siffrorna "32 px/tick", "gravitation 50" och "skottgravitation 25" i steg 3–5 ska läsas med denna skalning. Zoom, kamera, vinklar, energi, skada och liv påverkas inte.
