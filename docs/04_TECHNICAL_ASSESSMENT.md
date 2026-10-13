# 04 — Teknisk bedömning

## Vad arkivet är

Det är en Amiga-distribution, inte ett dekompilerat GameMaker-projekt. Den centrala filen `Bratwurst` är en AmigaOS `loadseg()`-bar körbar fil. Den går inte att öppna som ett GMS 1.4-projekt.

## Vad Claude Code kan göra

Claude Code kan hjälpa till att:
- inventera och hasha filer,
- läsa dokumentation och analysera binära strukturer,
- skapa verktyg för att undersöka eller konvertera skeppsdata,
- implementera gameplay i GML,
- skapa testplaner och felsöka GML-kod,
- strukturera resurser och dokumentation,
- hjälpa till med bygg- och versionshantering.

Claude Code kan inte garantera en korrekt automatisk konvertering av ett Amiga-program till GML. Korrekt beteende måste härledas från dokumentation, binäranalys och observation av originalspelet.

## GameMaker Studio 1.4

GMS 1.4 är valt eftersom det redan finns installerat och passar ett 2D-spel. Alla framtida kodförslag måste vara kompatibla med GMS 1.4 och dess äldre GML-syntax.

### Risker
- Vektorgrafik och dynamisk zoom kan behöva återskapas med Draw-händelser, surfaces och matematisk geometri.
- Flera samtidiga spelare och kontrollenheter måste testas i den faktiska runtime-versionen.
- Modern handkontrollsupport kan kräva separat hantering eller en extern lösning.
- Exportmöjligheter och licensvillkor beror på installerad GMS 1.4-version och tillgängliga exportmoduler.
- Binära `.SOB`-data kan vara svåra att tolka utan formatbeskrivning eller originalets editor.

## Rekommenderad teknikstrategi

1. Behåll originalarkivet orört.
2. Dokumentera originalets beteende.
3. Skapa ett nytt, tomt GMS 1.4-projekt.
4. Implementera en liten prototyp med vektorritat skepp, rotation, acceleration och projektil.
5. Jämför prototypen mot originalet och justera värden utifrån observerade resultat.
6. Lägg till kamera, kollisioner, skeppsval och vapen i separata steg.
7. Bygg dataorienterade skepps- och powerup-system efter att kärnmekaniken är stabil.
8. Testa Windows-exporten tidigt, inte först i slutet.

## Beslut som kräver evidens

- Om `.SOB` ska konverteras till ett nytt, dokumenterat format eller om skeppsdata ska återskapas manuellt.
- Om originalets grafik kan återanvändas eller måste återskapas.
- Om vektorlinjer och kamera kan matchas tillräckligt nära med GMS 1.4.
- Vilken kontrollmappning som bäst bevarar originalets beteende.
