# Instruktioner för Claude Code — Bratwurst Remastered

## Projektmål

Återskapa Amiga-spelet **Bratwurst** som ett fristående Windows-spel med **GameMaker Studio 1.4**. Bevara originalets spelmekanik och känsla så långt det går att verifiera. När en trogen grundversion fungerar ska projektet kunna byggas ut med ny grafik, buggfixar, skepp, vapen, powerups, banor och musik.

## Absoluta arbetsregler

1. **Analysera först. Ändra inget original.** Allt i `original/` är referensmaterial och får aldrig skrivas över eller ändras.
2. **Ingen gissning som fakta.** Markera information som `VERIFIERAD`, `SANNOLIK`, `OKÄND` eller `MOTSÄGELSE`.
3. **Bevara originalbeteende före förbättringar.** Ändra inte fysik, hastighet, vapenbalans, zoom, timing, kontroller eller spelarantal utan belägg och dokumenterat beslut.
4. **Ingen automatisk totalomskrivning.** Dela upp arbetet i små, testbara steg.
5. **GameMaker Studio 1.4 är målmotorn.** Skriv GML som är kompatibel med GMS 1.4; använd inte GMS2/GMS 2.3+-syntax eller funktioner utan uttryckligt godkännande.
6. **Ingen dold funktionsborttagning.** Dokumentera alla kända funktioner, även om de inte implementeras i första prototypen.
7. **Dokumentera beslut.** Uppdatera relevanta filer i `docs/` och `CHANGELOG.md` när slutsatser eller projektbeteenden ändras.
8. **Testa efter varje ändring.** Beskriv exakt hur ändringen testades och vad som inte gick att testa.
9. **Bevara originalresurser separat.** Nya eller konverterade resurser ska ligga utanför `original/`.
10. **Respektera rättigheter.** Utgå inte från att det är tillåtet att distribuera originalkod, grafik, skeppsfiler, musik eller namn. Dokumentera rättighetsstatus och använd inte externa resurser utan källa/licens.

## Källor och bevisnivå

Prioritera:
1. observerat beteende i originalspelet som körs i emulator,
2. den medföljande `Bratwurst.doc`,
3. faktiskt analyserade binärdata och filformat,
4. hypoteser — tydligt märkta som sådana.

Om dokumentation och observerat beteende skiljer sig åt, dokumentera skillnaden i stället för att välja tyst.

## Nuvarande fas

Projektet är i **Fas 0: inventering och research**. Skapa inte ett komplett spel ännu. Börja med att:
- kontrollera hela `original/`-inventeringen,
- extrahera och strukturera innehållet i `Bratwurst.doc`,
- undersöka `.SOB`-filerna utan att skriva till dem,
- lista vilka resurser som saknas för en trogen remake,
- ta fram frågor som kräver observation av originalet i emulator,
- föreslå en liten första prototyp och dess acceptanstester.

Avsluta analysen med en rapport och en lista över nästa steg. Gör inga destruktiva ändringar.

## Kod- och arkitekturprinciper när implementeringen börjar

- Håll skeppsdata, vapen, powerups, banor och inställningar separerade från kärnlogik där GMS 1.4 tillåter det.
- Undvik en enda enorm Create/Step-händelse.
- Använd tydliga, konsekventa namn på objekt, skript och resurser.
- Kommentera svårförstådd fysik och konverterade originalvärden.
- Lägg konfigurationsvärden centralt och dokumentera enheter/intervall.
- Lägg till nya funktioner bakom tydliga system så att de inte kräver omskrivning av grundmekaniken.
- Skapa testscenarier för rörelse, kollisioner, vapen, liv/energi, spelare och kamerazoom.
- Spara beslut i `docs/10_DECISIONS.md` och ändringar i `CHANGELOG.md`.

## Förbjudet utan godkännande

- Ändra eller ta bort filer i `original/`.
- Byta spelmotor.
- Göra om spelet till widescreen eller modernisera styrning/spelregler innan originalkänslan har verifierats.
- Påstå att `.SOB`-formatet är förstått innan en parser/konvertering har testats mot samtliga filer.
- Påstå att originalets musik, grafik eller banor har extraherats när de inte har hittats.
- Exportera eller distribuera en Windows-build utan att först verifiera att den startar och kan spelas.
