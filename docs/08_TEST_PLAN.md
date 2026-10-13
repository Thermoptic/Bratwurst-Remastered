# 08 — Testplan

## Testprincip

Jämför remaken med originalet där det är möjligt. Förväntade värden ska hämtas från observationer eller dokumentation, inte hittas på.

## Manuella referenstester

| ID | Test | Förväntat resultat |
|---|---|---|
| REF-01 | Starta originalet | Meny visas utan fel |
| REF-02 | Öppna Options | Spelarantal, kontrollmetoder, Grid och Extra lines går att se/ändra |
| REF-03 | Välj skepp | Skepp kan väljas med vänster/höger och bekräftas med fire |
| REF-04 | Välj specialvapen | Specialvapen och vapenpod kan väljas där tillgängligt |
| REF-05 | Skjut standardkanon | Skott och ammunition beter sig enligt originalet |
| REF-06 | Skjut specialvapen | Specialvapen och ammunition beter sig enligt originalet |
| REF-07 | Observera HUD | Energi, standardammunition, specialammunition och liv visas |
| REF-08 | Spelare nära varandra | Kameran zoomar in enligt dokumenterad funktion |
| REF-09 | Spelare långt ifrån varandra | Kameran zoomar ut för att hålla spelare synliga |
| REF-10 | Grid på/av | Grid beter sig enligt Options |
| REF-11 | Extra lines på/av | Extra linjer beter sig enligt Options |
| REF-12 | Flera spelare | Kontrollera spelarmängd och kontrollmetoder som emulatorn stöder |

## Prototyptester

- `PHY-01`: rotation åt båda håll.
- `PHY-02`: acceleration framåt och broms/backning enligt originalet.
- `PHY-03`: skeppet fortsätter eller stannar enligt verifierad fysik.
- `COL-01`: kollision med vägg.
- `WPN-01`: skott skapas, rör sig och försvinner enligt regler.
- `CAM-01`: alla aktiva spelare hålls inom vy enligt originalets beteende.
- `HUD-01`: energi/ammunition/liv uppdateras korrekt.
- `PAD-01`: varje konfigurerad gamepad ger rätt input.
- `WIN-01`: exporterad Windows-exe startar på testmaskin.
- `REG-01`: en ny skeppsdefinition påverkar inte befintliga skepp.

## Regression

Efter varje ändring:
1. Starta spelet.
2. Kör relevanta manuella tester.
3. Kontrollera att tidigare fungerande funktioner inte har gått sönder.
4. Notera GMS-version, exportinställningar, felmeddelanden och resultat.
5. Uppdatera changelog vid beteendeförändringar.

## Resultatmall

- Datum:
- Build/commit:
- GameMaker-version:
- Testmiljö:
- Test-ID:
- Förväntat:
- Faktiskt:
- Resultat: PASS / FAIL / BLOCKED
- Bevis (skärmbild/video/logg):
- Kommentar:

## Fas 1-prototypen — testläge 2026-10-13
Prototyp: `gms/Bratwurst.gmx` (se `gms/README.md`). **Ingen körning i GameMaker har gjorts**; GML-syntax och körbeteende är därför OTESTADE (BLOCKED tills projektet öppnats i GMS 1.4).

Rimlighetskontroll med `tools/proto_sim.py` (Python-spegling av formlerna, XWing, original-parametrar; inga värden jämförda mot originalet):
| ID | Kontroll | Resultat |
|---|---|---|
| PHY-02 (spegling) | Fritt fall, gravitation 31, drag 6/256 | terminalhastighet ≈ 5,2 px/tick (5,05 efter 500 ticks) — stabilt, ingen divergens |
| PHY-02 (spegling) | 50 ticks thrust från P1:s start | ≈ 330 px i nosens riktning (−sin, +cos) |
| PHY-01 (spegling) | Ett varv med höger sväng (XWing: init 1, max 4, acc 1) | ≈ 64 ticks |
| CAM-01 (spegling) | Zoom 1 spelare / P1+P2 vid start / P1+P4 | Z = 17 694 / 3 583 / 2 820 (alla > 0, kamera tar in alla) |

**Observation att verifiera i emulator:** spelare 1 startar uppe till vänster (−1172, −1055) med vinkel 0x60, och nosriktningen (−sin, +cos) pekar då **utåt** (upp till vänster) enligt de verifierade formlerna. Antingen är startvinkeln i originalet avsedd så, eller så skiljer sig tecken-/fasantagandet för världens y-axel eller skeppsritningen. Måste kontrolleras i originalet (REF-05/REF-08).

Manuella prototyptester som återstår (kräver GMS): PHY-01, PHY-02, PHY-03, COL-01, WPN-01, CAM-01, HUD-01, REG-01 (byt skepp med F3/F4 påverkar inte det andra skeppet).

### Uppdatering: första körning i GMS 1.4 (användartest 2026-10-13)
Projektet öppnas utan fel och spelet startar: vektorbana och två skepp (XWing, TieFighter) ritas, HUD (liv, ammo, energistapel) och debugtext visas, matchen har spelats (skärmdump: XWing L3 A0, TieFighter L3 A300, tick 1181, Z = 11351). Därmed PASS för start/rendering/zoom-uppdatering/liv-/ammoräkning på övergripande nivå. Detaljerade PHY/COL/WPN-tester och jämförelse mot originalet återstår.

### Fas 2 — manuella tester för specialvapen (ej körda)
| ID | Test | Förväntat |
|---|---|---|
| WPN-02 | MISSILE (t.ex. XWing, Down, sedan Z tills MISSILE) | rak missil, ~50 ticks, nedräkning 40, ammo = P10/10, −12 energi vid träff |
| WPN-03 | GUIDED MISSILE | flyger rakt i 25 ticks, svänger sedan mot närmaste spelare, max 225 ticks, nedräkning 100, −5 energi |
| WPN-04 | TURBO BOOST (bakre pod ger framåtkick) | stor impuls bort från podens riktning, nedräkning 20 |
| WPN-05 | TRACTOR BEAM | drar närmaste fiende mot podden, kostar ammo varje tick |
| WPN-06 | CANNON TURRET | skjuter ett skott mot närmaste fiende endast inom ±90° från podens riktning, var 3:e tick |
| WPN-07 | Valbara vapen per skepp | Viper endast MISSILE; HeavyMetal endast TRACTOR BEAM; Z hoppar över otillgängliga |
| WPN-08 | Max 16 samtidiga specialobjekt | fler missiler skapas inte |

### Fas 2 — skeppsvalsmeny (ej körd)
| ID | Test | Förväntat |
|---|---|---|
| MENU-01 | Starta spelet | Skeppsvalet visas (inte matchen); texterna SHIP / SPECIAL WEAPON / IS THIS OK? syns |
| MENU-02 | Bläddra skepp med vänster/höger, bekräfta med fire | Alla 15 skepp går att välja; förhandsvisning roterar |
| MENU-03 | Välj specialvapen | Endast skeppets tillgängliga vapen (+ NOTHING) kan väljas |
| MENU-04 | Välj pod | 1–4 valbara pods; vald pod markeras |
| MENU-05 | YES / NO | NO återgår till skeppsvalet; YES visar "PLAYER … IS READY TO …" |
| MENU-06 | Båda spelarna redo | Matchen startar med valda skepp, vapen och pod |
| MENU-07 | F2 / Start under match | Tillbaka till skeppsvalet |

| MENU-08 | F5 tills 4 spelare | Fyra paneler (2×2) syns i skeppsvalet; alla kan välja och bli READY |
| PLAY-4 | Match med 4 spelare | Fyra skepp på de fyra startpositionerna, kameran håller alla i bild, HUD i fyra kolumner, sista överlevande vinner |

### Fas 3 — terminal-UI (ej körda; kräver GMS 1.4)
| ID | Test | Förväntat |
|---|---|---|
| UI-01 | Starta spelet | Titelskärm med BRATWURST, "- R E H E A T E D -" och blinkande PRESS START TO HEAT |
| UI-02 | Tryck valfri tangent / gamepadknapp | Huvudmenyn (träd, lista, datapanel) visas; Esc på titeln avslutar |
| UI-03 | Options → THEME vänster/höger | Alla 30 teman byter färg direkt; paletten i datapanelen följer |
| UI-04 | Ändra tema, avsluta, starta igen | Samma tema laddas; `settings.ini` och `themes.ini` finns i mappen som visas under DATA FOLDER |
| UI-05 | Redigera ett hexvärde i `themes.ini`, starta om | Färgen ändras för det temat |
| UI-06 | WINDOW 1X/1.5X/2X/FULLSCREEN, VSYNC, SCANLINES, GLOW | Respektive effekt syns; sparas |
| UI-07 | Game modes → PLAYERS, START | Skeppsvalet visar rätt antal aktiva rutor; övriga "OPEN"/"EMPTY" |
| UI-08 | Fire på ledig plats i skeppsvalet | Ny spelare läggs till (max 4) |
| UI-09 | Match | Spelytan i mitten; P1-panel vänster, P2 höger, P3/P4 under; energi/ammo/liv/special uppdateras |
| UI-10 | Esc i match/skeppsval | Huvudmenyn; START igen fungerar |
| REG-02 | Fysik, kamera, vapen som tidigare | Oförändrat beteende (endast ritning flyttad/omfärgad) |

