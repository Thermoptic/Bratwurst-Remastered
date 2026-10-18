# Race — Steg 8: polering och regression (testlista)

Status: stegen 1–7 är implementerade (D-053…D-058) men bara delvis körda av projektägaren. Den här listan är det som återstår att köra i GMS-IDE (F5) och sedan i en export. Fyll i kolumnen **Resultat** (OK / FEL + kommentar). Jag (Claude) har inte kört något av detta.

## A. Statisk granskning (gjord utan att köra spelet)
| Kontroll | Resultat |
|---|---|
| Alla `race_*`-variabler som används utanför Race-grenar (träff-, kollisions- och målsökningsskript) skapas för alla spelare i `scr_player_init` | OK (genomgången av koden) |
| Race-grenar ligger bakom `g_game_mode == 2`; Classic, Galaxy Duel och Asteroids har oförändrad logik utom att `race_fin` alltid är falskt | OK (genomgång) |
| Lint, argumentkontroll, inga tomma skriptfiler, projektfilen giltig XML | OK |
| Varvlogiken, ordningen mellan racare och avgörandet (tidsstyrd utslagning, resultat) återskapade i Python för tre scenarier (2 spelare, 3 spelare, ensam spelare) | OK för logiken; ej GMS-koden |

## B. Spelartal och inställningar
| Test | Förväntat | Resultat |
|---|---|---|
| RACE-S8-01: 1 spelare, 1 varv, 1 runda | Går i mål, resultatruta, `PRESS TO SEE THE FINAL RESULT`, slutresultat | |
| RACE-S8-02: 2 spelare, 3 varv, 2 rundor | Placering, pickups, utslagning av sista racern, resultat, nästa race, slutresultat | |
| RACE-S8-03: 3 spelare | Ledare / mitten / sist får rätt föremål (RACE-050…052) | |
| RACE-S8-04: 4 spelare (tangentbord + kontroller) | Fyra paneler, `POS x / 4`, inga hängningar | |
| RACE-S8-05: LAPS 1 och 10, ROUNDS 1 och 15 | Respekteras, sparas efter omstart | |
| RACE-S8-06: POWERUPS på i Race | Vanliga powerup-orben dyker upp och fungerar; av som standard | |

## C. Styrning och regler
| Test | Förväntat | Resultat |
|---|---|---|
| RACE-S8-10: gamepad: A skjuter bara med ammo, Y bara med specialskott, LT drift bara med drivmedel, B/Back/RB gör inget i Race | Som specen | |
| RACE-S8-11: väggkrasch i full fart | Studs utan skada | |
| RACE-S8-12: träff med alla fem vapentyper (skott, missil, styrd missil, Mini Nuke, railgun) | 20 % fart i 3 s, förnyas, ingen dör | |
| RACE-S8-13: skepp i mål: träffas inte, kolliderar inte, skjuter inte | Spöke | |
| RACE-S8-14: pausa i ett race (Start/Esc), ändra Options, fortsätt | Race fortsätter oförändrat, tiden står stilla under paus | |
| RACE-S8-15: avsluta till menyn mitt i ett race och starta ett nytt | Allt nollställt (varv, tid, pickups, ammo, drift) | |

## D. Banredigeraren
| Test | Förväntat | Resultat |
|---|---|---|
| RACE-S8-20: målruta, pilar (mushjulet), pickuppunkter, spara, öppna | Allt finns kvar | |
| RACE-S8-21: Race-bana utan målruta | Varning vid sparning och `NO FINISH LINE` i race | |
| RACE-S8-22: öppna äldre banor, spela Classic, Galaxy Duel, Asteroids | Som förut | |

## E. Regression (andra lägen)
| Test | Förväntat | Resultat |
|---|---|---|
| RACE-S8-30: Classic: vapen, energi, väggskada, powerups, drift | Som förut (drifting fuel D-052 gäller) | |
| RACE-S8-31: Galaxy Duel: skada i två steg (D-051) | Som förut | |
| RACE-S8-32: Asteroids | Som förut | |
| RACE-S8-33: musik, pausmeny, Options (SCREEN MODE, ZOOM, SCANLINES AND GLOW) | Som förut | |

## F. Export (först när A–E är körda)
Enligt projektreglerna får en Windows-build inte exporteras eller distribueras innan den verifierats starta och gå att spela. Steg: Create Application → Windows (ZIP), packa upp i en ny mapp, starta, spela ett race med 2 spelare, kontrollera att musik, ljud och inställningar fungerar. Resultat: ____

## Kända begränsningar och öppna beslut
1. **Ingen tidsgräns:** är två eller fler racare kvar som inte kommer i mål avgörs racet aldrig av sig självt (det går att pausa och avsluta). Förslag: valfri maxtid per race (t.ex. 5 minuter) som utslagning av alla oklara. Kräver ditt beslut.
2. **Placering** ändras bara när någon passerar målrutan (en enda kontrollpunkt, beslutad). Pickupnivåerna följer den placeringen.
3. **Skeppsvalet** visar fortfarande vapenval även i Race (de används inte, ammo börjar på noll). Kan döljas om du vill.
4. **Sista racet** visar `PRESS TO SEE THE FINAL RESULT` i stället för `PRESS TO ENTER NEXT RACE`, eftersom det inte finns något nästa race.
5. **Start-knappen** på resultatrutan går till skeppsvalet (som i övriga lägen); fortsätt med A, Enter, Z eller mellanslag.
6. **Ensam racer** som tar en pickup kan få alla fyra föremål (inga nivåer att välja mellan).
7. **Ingen Race-bana medföljer:** alla banor kan väljas i Race tills banor markeras för Race; en bana behöver målruta och pickuppunkter ritade av dig.
