# 11 — Öppna frågor

Frågorna nedan ska lösas genom analys eller observation. De ska inte besvaras med gissningar.

## Original och version
- Är arkivet exakt den version som dokumentationen avser?
- Varför anger `file_id.diz` V3.5 medan manualen säger beta?
- Finns det en annan version eller en editor som innehåller fler resurser?

## Spelmekanik
- Vilka är exakta värden för acceleration, rotationshastighet, friktion, maxhastighet och gravitation?
- Hur fungerar väggkollisioner och skeppskollisioner?
- Hur räknas energi, ammunition, liv och respawn?
- Vilka specialvapen finns och hur fungerar de?
- Finns banor med särskilda hinder eller miljöregler?

## Grafik och kamera
- Hur beskrivs skeppens vektorgeometri i `.SOB`?
- Vilka koordinater och skalor används?
- Hur beräknas zoomnivå och kameracentrum?
- Vad exakt gör “Extra lines”?
- Är grafik och ljud inbäddade i den körbara filen?

## Kontroller
- Vilka tangentbordskontroller stöds?
- Hur skiljer sig joystickportarna?
- Hur mappas upp till fyra spelare?
- Vilka kontroller är rimliga på moderna Windows-datorer utan att ändra grundkänslan?

## Teknik och release
- Vilken GMS 1.4-installation och exportmodul finns tillgänglig?
- Ska nya skepp och banor skapas i GameMaker-editorn, via externa datafiler eller båda?
- Vilka plattformar utöver Windows är eventuellt aktuella senare?
- Vilka resurser får distribueras offentligt?

## Nya frågor 2026-10-13
- Startar `Bratwurst` i emulator trots att hunk 2/3 är 512 B kortare än deklarerat? Finns en intakt version?
- Vad betyder `.SOB`-fälten P0–P26, pod-flaggorna och block A:s 4 extra ord? Är K = alla monteringspunkter eller bara specialpods?
- Vad är tabellen `1,1,1,10,1,12,1,8,5,1,2,1` efter specialvapennamnen (0x54f10)?
- Vilken musik spelas, och räcker den inbäddade 1-pattern-modulen eller finns mer ljud i hunk 2?
- Finns banor (väggar) i kod/data, eller genereras de?
- Hur renderas menytexter (Start/Options/Exit) när de inte finns som ASCII?
- Hur stor är den logiska skärmen och vilken enhet (koordinatskala) använder SOB-punkterna i förhållande till zoomen?

## Nya frågor efter Ghidra-steg 1–3
- Stämmer hypotesen P0–P8 → DRAG/THRUST/RELOAD/…/BOUNCE (`15`)? Var kopieras filen till skeppsstrukturen?
- Vad är den uppackade 78 kB-bitmappen (bana? grafik? bakgrund) och hur många banor finns?
- Hur beräknas zoom (`0xa04e8`, kod vid 0x2b16)?
- Enhet/hastighet i pixlar per bildruta och bildfrekvens (50 Hz PAL?) — kräver emulator.
- Vad gör de tre kollisionsbitmapparna exakt (vägg, studs, död/landning)?

## Efter steg 4 — kvarstående
- Pod-flaggornas värden 1 vs 2; block A:s 4 ord; `0x99646` (=25).
- Skada/död/respawn (0x60d8) och specialvapnens beteende (0x6bce).
- Min/max-gräns för zoom; hantering av saknade spelare i kameran (alla 4 slots används alltid?).
- Bildfrekvens/enheter (pixlar per sekund) — emulator.
- Banornas källa och format (kollisionsbitmappar; ev. i S404-payloaden).

## Efter steg 5 — kvarstående
- Tickfrekvens (50/60 Hz?), mätt i emulator; vilken avbrottskälla som driver `0x7440`.
- Hur kameran/dödspositioner hanteras efter att en spelare eliminerats (`0xa0490..` flaggor).
- Tangent-/joystickmappning (thrust-knappens källa), Options-effekter, ljudtriggers, partikel-/explosionsdetaljer.
- Vad den uppackade 78 kB S404-bitmappen är (bakgrund/titel?).
- Om det finns fler banor i andra versioner (V3.5?); denna version har en arena.
