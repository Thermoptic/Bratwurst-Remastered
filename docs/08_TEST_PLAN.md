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
| UI-01 | Starta spelet | Titelskärm med BRATWURST, "- R E H E A T E D -" och blinkande PRESS START TO TURN UP THE HEAT |
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
| UI-11 | Fullscreen 16:9 | Titel, menyer, skeppsval och match fyller hela skärmen utan tomma sidor; spelytan lika bred som panelraden |
| UI-12 | Options → WIDE PLAYFIELD av/på | Av: originalets 320-breda vy centrerad; på: full bredd. Zoom och skott fungerar i båda |
| MENU-09 | Tryck X (thrust) på gamepad i skeppsvalet, på varje steg | Ett steg tillbaka (READY → IS THIS OK? → POD → WEAPON → SHIP); på SHIP händer inget; tidigare val behålls |
| COL-02 | Kör in i ett stillastående skepp i full fart | Det stilla skeppet puttas iväg med ungefär din fart, du bromsas; skeppen glider inte in i varandra |
| COL-03 | Använd TURBO BOOST och krocka | Det träffade skeppet flyger iväg märkbart hårdare än utan boost |
| COL-04 | Två skepp rör sig isär men överlappar | Inga upprepade studsar eller fastklistring |

### Banor och banredigerare (ej körda)
| ID | Test | Förväntat |
|---|---|---|
| MAP-01 | Starta spelet första gången | `levels.ini` skapas; Game Modes → MAP visar tre banor (Sirius Bratwurst, Kepler Chorizo, Proxima Merguez) |
| MAP-02 | Välj varje bana och starta en match | Rätt bana och startplatser; väggar solida, olika färger per objekt |
| MAP-03 | Sirius Bratwurst jämfört med den gamla banan | Samma väggar och startplatser som förut |
| MAP-04 | MAP EDITOR: rita rektangel (B), polygon (P), radera (X), flytta startplats (T, 1–4, Q/E) | Former syns direkt; radering tar den vägg man klickar på |
| MAP-05 | Spara (S), avsluta, välj banan och spela | Den egna banan laddas med nya väggar och startplatser |
| MAP-06 | N skapar ny bana med slumpat namn (två ord: stjärna + korv); Del två gånger tar bort | Banlistan i menyn uppdateras; sista banan kan inte tas bort |
| MAP-07 | Esc med osparade ändringar | Kräver ett andra Esc för att slänga ändringarna |

### Rundor (ej körda)
| ID | Test | Förväntat |
|---|---|---|
| RND-01 | Classic → Rounds visar 3 som standard; ändra och starta om spelet | Värdet sparas |
| RND-02 | Spela en runda med 2 spelare | När en är kvar visas "PLAYER n WINS" ca 3 s, vinnaren får +1 i sin panel, ny runda startar med full energi/liv |
| RND-03 | Spela alla rundor | Resultatskärm: vinster per spelare, matchvinnare eller TIE |
| RND-04 | REMATCH | Skeppsval (nya skepp), nytt spel med samma antal rundor och nollade vinster |
| RND-05 | MAIN MENU / Esc på resultatskärmen | Huvudmenyn |
| SND-01 | Starta spelet | Titelmusiken startar och loopar; fortsätter genom menyerna |
| SND-02 | Starta en match / avsluta den | Musiken stoppar under matchen och startar igen i menyn/resultatskärmen |
| SND-03 | Options → MUSIC av/på | Musiken tystnar/startar direkt; sparas |


| SND-04 | Skjut kanon (alla skepp) | Kanonljudet en gång per salva |
| SND-05 | MISSILE / GUIDED MISSILE avfyras, och när de exploderar | Respektive startljud, sedan explosionsljudet |
| SND-06 | Krocka med vägg i hög respektive låg fart | Krasch bara vid hög fart (över ~4 px/tick) |
| SND-07 | Skepp mot skepp | Kollisionsljudet |
| SND-08 | Träffa ett skepp med kanonskott | Svagt, högt träff-ljud |
| SND-09 | Options → SOUND EFFECTS av/på | Effekterna tystnar/startar; musiken påverkas inte |
| COL-05 | Skjut kanon och missiler mot tunna väggar och hörn på nära håll, i full fart och med skeppet i rörelse | Inga skott eller missiler flyger igenom en vägg |
| FX-01 | Träffa ett skepp med kanonskott och missil | Små gnistor i skeppets färg flyger ut och försvinner en och en |
| FX-02 | Krocka med väggen i låg respektive hög fart | Få gnistor vid låg fart, många och snabbare vid hög fart |
| SND-10 | Titelskärm och huvudmeny med musik på | Värmebalken respektive SIGNAL-staplarna rör sig i takt med breakbeaten (kick/virvel syns) |
| SND-11 | Options → MUSIC av | Staplarna faller tillbaka till den gamla sinusrörelsen |

### Astro Duel (ej körda)
| ID | Test | Förväntat |
|---|---|---|
| AD-01 | Game Modes → Astro Duel | Start, Players, Map, Rounds, Life (standard 1) |
| AD-02 | Starta, bli träffad av kanonskott / missil med LIFE 1 | Ett liv förloras (rundan förloras); med LIFE 3 krävs tre träffar |
| AD-03 | Åk in i väggar | Ingen energi/liv förloras (gnistor och ljud finns) |
| AD-04 | Skjut kanon | Tre skott (ett per tryck), sedan 4 s nedkylning med synlig nedräkning i panelen; delvis användning och väntan fungerar |
| AD-05 | Projektilstorlek | Skott och missiler ritas märkbart större; lättare att träffa än i Classic |
| AD-06 | Skeppsval | Bara MISSILE och TURBO kan väljas för alla skepp; MISSILE är förvald |
| AD-07 | Missil | Dubbelt så snabb som i Classic |
| AD-08 | Classic efter Astro Duel | Alla Classic-regler är oförändrade (full energi, vapen enligt skepp) |
| FX-03 | Låt ett skepp förlora ett liv (kanon, missil, väggkrasch i Classic) | Pixelpartiklar åt alla håll och fem skrovlinjer som flyger ut, snurrar och försvinner efter ett par sekunder; explosionsljud |
| PHY-04 | Starta en match och rör inte skeppet; ge thrust en stund och släpp | Skeppet står helt still; efter thrust glider det och stannar utan att sjunka eller driva |
| UI-13 | Starta spelet | Titelskärmen visar linjeloggan centrerad med ring av staplar som rör sig i takt med musiken, planeter som svullnar med basen och skeppen i bakgrunden; PRESS START TO TURN UP THE HEAT blinkar |
| UI-14 | Options → MUSIC av | Staplarna går över till lugn animation; loggan fungerar som förut |
| UI-15 | Byt tema | Logotyp, planeter och stapelfärger följer temat |
| UI-16 | Gå från titelskärmen till huvudmenyn | Samma bakgrund fortsätter utan hopp: rutnät, stjärnor och roterande skepp syns bakom och mellan menyrutorna; texten är läsbar |
| UI-17 | Huvudmenyn med musik | SPECTRUM-rutan visar 32 staplar i takt med musiken med toppar, spegling, oscilloskoplinje och spektrogramremsa; utan musik en lugn grundrörelse |
| UI-18 | Byt tema (Options → Theme) och titta på SPECTRUM | Staplar, spektrogram, toppar och oscilloskoplinje byter färg med temat; ingen färg är hårdkodad |
| MAP-08 | Banredigeraren: tryck S | Fönster med namnfält, GENERATE NAME och fyra lägesrutor; Enter sparar, Esc avbryter |
| MAP-09 | Spara en bana bara för Astro Duel | Banan syns i Astro Duels MAP-val men inte i Classics (och tvärtom) |
| MAP-10 | Avmarkera Classic på den enda Classic-banan, och försök ta bort den | Fönstret/raderingen vägras med ett meddelande |
| RND-06 | Döda sista motståndaren | Skeppet exploderar, spelet fortsätter i 4 s (man kan flyga/skjuta), sedan visas rundresultatet; ingen paus däremellan |
| MENU-10 | Skeppsval: upp/ner (tangentbord och gamepad) | Markeringen flyttas mellan SHIP, WEAPON, POD och CONFIRM; vänster/höger ändrar värdet på raden; fire = nästa rad, OK på CONFIRM = READY; upp eller thrust-knappen tar tillbaka READY |
| MAP-11 | Banredigeraren: tryck L | Fönster med alla banor och kolumnerna Name, Classic, Astro Duel, Race, Capture (Yes/No); val och laddning med tangentbord, klick och dubbelklick; vägras om osparat |
| MAP-12 | Markera MAP i Classic och Astro Duel och bläddra med vänster/höger | Datapanelen visar en bild av banan (väggar och startplatser) i stället för texten; bilden byter direkt med valet och följer temat |
| MENU-11 | Skeppsval: öppna med 1–4 spelare, bläddra SHIP/WEAPON/POD | Fyra rutor med statuslist, radlista, vapenchips, skepp i ram och statstaplar; inget text överlappar vid 1024x640 och i större vyer; staplarna byter med skeppet; Astro Duel visar bara MSL och TURBO |
| PLAY-30 | Förlora ett liv med fler liv kvar (Classic och Astro Duel) | Skeppet exploderar och försvinner; panelen visar 3, 2, 1 i stället för skeppsbilden; efter 3 s återskapas skeppet på startplatsen; rundan avslutas inte medan någon väntar på respawn; sista livet ger OUT |
| FX-06 | Skjut en missil: låt den självdetonera, träffa vägg och träffa skepp | Dubbelt så stor ring och ett stort moln av pixelpartiklar i alla fall; respawnsiffran 3-2-1 är mindre och centrerad |
| FX-07 | Ram ett annat skepp (långsamt och i full fart) och skjut kanonskott i en vägg | Gnistor sprutar från kontaktpunkten, fler och snabbare vid hårdare stöt; skott mot vägg ger små gula gnistor |
| COL-05 | Lägg två skepp på varandra (kör in långsamt, rotera in i varandra, respawna intill varandra) | Skeppen glider isär och fastnar aldrig; skepp trycks inte in i väggar |
| COL-06 | Kör långsamt och sned in i ett stillastående skepp (mitt på och i vingspetsen) | Det stillastående skeppet puttas åt rörelseriktningen och vrids lite beroende på träffpunkt och fart; gnistor vid träffpunkten; inget fastnar |
| FX-08 | Låt en missil självdetonera nära (och långt ifrån) ett skepp; titta på energistapeln | Skepp som ringen når förlorar 3 energi en gång; skepp utanför ringen påverkas inte; ingen skada i Astro Duel |
| UI-20 | Starta en match | Banans namn står i rubrikraden efter "ROUND n OF m", inte inne i spelytan |
| CAM-05 | Spela med 2+ spelare, förstör alla utom en | Bilden stannar kvar (ingen inzoomning på vinnaren) tills resultatet visas; nästa runda startar med normal kamera; en spelare som väntar på respawn låser inte kameran |
| MUS-05 | Titel, huvudmeny och skeppsval: tryck LB/RB (gamepad) eller PageUp/PageDown | Med en låt: ingen ändring och inget avbrott; med flera låtar: byter åt respektive håll med omslag; "NOW PLAYING" visar namn och nummer; MUSIC OFF visas om musiken är avstängd |
| MUS-06 | Tryck LB/RB (PageUp/PageDown) i titel, meny och skeppsval | Låten byter mellan tre låtar med omslag och "NOW PLAYING" visar rätt namn och nummer; spektrumet följer varje låt; ingen hack vid start (alla ogg och viz laddas) |
| MUS-07 | Starta en match och flera rundor i rad | Musik spelas under matchen; varje ny runda startar en annan slumpad låt; låtens namn står i rubrikraden till höger (kortas vid behov) |
| MUS-08 | Options -> VOLUME (10 %–100 %), starta om spelet | Standard 70 %; musikens volym ändras direkt i menyn och under match; värdet sparas i settings.ini ([audio] volume) och finns kvar efter omstart; ljudeffekterna påverkas inte |
| PAUSE-01 | Tryck Esc eller Start mitt i en match | Pausmeny med RESUME GAME och QUIT TO MENU; spelet står stilla (skepp, skott, nedräkningar); upp/ner byter rad; Resume (eller Esc/B) fortsätter exakt där man var; Quit går till huvudmenyn och nästa match startar normalt (inte pausad); Esc i skeppsval går som förut till huvudmenyn |
| FX-09 | Skjut en missil mot en vägg och mot ett skepp, och låt en annan sprängas i luften | Träff i vägg/skepp ger ca 30 % större ring och snabbare partiklar än luftdetonationen; skadan (3 energi) följer ringen |
| CTRL-10 | Gasa i fart, håll LT (eller C/Q/H) och sväng vänster/höger; testa också stillastående och utan gas | Med gas, fart och knapp: skeppet vrider snabbare och glider i sidled med gnistor bakom; stillastående eller utan gas händer inget; Y byter specialvapen (LT gör det inte längre) |
| CTRL-11 | Stå still intill en vägg och håll bara LT (eller C/Q/H) | Skeppet backar långsamt bort från väggen; med gas samtidigt blir det drift i stället; backandet stannar när knappen släpps |
| FX-10 | Drifta med ett smalt skepp (JAS/Kaese/TieFighter/BatWing) och ett brett skepp, släpp sedan driften | Smalt skepp: ett spår, brett: två; spåret växer fram och följer banan med svansen tonande; efter att driften slutat tonar hela spåret ut och försvinner; inga driftgnistor längre; spåret försvinner vid respawn |
| FX-11 | Drifta | En glödande boll sitter där varje spår startar: solid kärna, mjuk glöd som pulserar och flimrar snabbt; den försvinner när driften slutar |
| CTRL-12 | (utgått) momentum-driften återkallades | – |
| FX-12 | Skjut missil och guidad missil | Missilen är en glödande boll (solid kärna, pulserande och flimrande glöd) med en svans av små pixelpartiklar som blir kvar bakom den och försvinner; träff/explosion fungerar som förut |
| CTRL-13 | Åk i full fart i sidled (drift) och skjut kanon och missil åt olika håll | Skott och missil går alltid exakt dit nosen pekar, oberoende av färdriktning och fart; Astro Duel samma; kanontornet siktar fortfarande mot närmaste fiende |
| CTRL-14 | Gamepad i match: Y, Back, B; tryck Back/F5 i meny och match | Y avfyrar specialvapnet, Back byter specialvapen, B gör inget; Back och F5 ändrar inte längre antal spelare |
| PAUSE-02 | Pausa i en match med 2 och 4 spelare, i 1024x640 och större vy | Tre rutor: stats (läge, runda, bana, låt, tid, spelare, ledare, per spelare skepp/vinster/liv/energi), PAUSED i mitten, CONTROLS till höger; inget överlappar eller hamnar utanför; ledare visar NONE YET/TIED/PLAYER n rätt |
| SFX-08 | Drifta (håll LT + gas) i fart och släpp; pausa under drift; förstör skeppet under drift; stäng av SOUND EFFECTS | Ett motorljud loopar sömlöst medan man driftar, tonas in/ut; tystnar vid paus, död och när man lämnar matchen; inget ljud kvar efteråt; inget ljud om SOUND EFFECTS är av; flera spelare kan driftta samtidigt |
| MATCH-09 | Vinn en runda (och en runda utan vinnare) | Rutan visar "WELL HOT DOG, WE HAVE A WEINER!" med stora bokstäver och "PLAYER n WINS" under i vinnarens färg; texten ryms i spelytan; utan vinnare bara NO WINNER |
| MODE-10 | Game modes -> Classic -> LIFE: sänk och försök höja över 6; starta match; starta om spelet | Standard 6, går att sänka till 1 men inte över 6; matchen startar med valt antal liv (panelen visar rätt antal rutor); värdet sparas i settings.ini och finns kvar efter omstart; Astro Duel påverkas inte |
| MAP-13 | Starta spelet med en gammal levels.ini (v1), öppna alla banor i menyn, matcher och redigeraren; ta bort levels.ini och starta om; skapa en ny bana | Alla banor har bara en ramlinje; levels_v1_backup.ini skapas vid migreringen; egna banor behåller allt utom den yttre fyrkanten; nygenererade banor och nya banor i redigeraren har en ram; inget ändrat i spelet i övrigt |
| BG-05 | Titelskärm och huvudmeny | En trådramskorv (bågformad med tvärringar och spetsar) driver och roterar långsamt i bakgrunden tillsammans med skeppen; syns inte i skeppsvalet; inga felmeddelanden vid start |
| PU-01 | Game modes -> Classic och Astro Duel -> POWERUPS | Raden finns, standard ON; OFF = inga orber under matchen; värdet sparas i settings.ini |
| PU-02 | Starta en match (flera banor) och vänta | Efter 5 s syns en orb med ikon som byter färg mycket snabbt; aldrig på en vägg/föremål/utanför ramen eller närmare än 20 px från en vägg; ny plats varje gång |
| PU-03 | Flyg in i orben, vänta 10 s | Orben försvinner, spelarpanelen visar "PU MINI NUKE"; en ny orb dyker upp 10 s senare på en ny plats; powerupen förloras vid död/ny runda |
| PU-04 | Tryck B (gamepad; V/F/M på tangentbordet) med Mini Nuke; tryck special-knappen (Y) med den | En stor, glödande projektil (ej skeppets fart) flyger åt nosens håll, exploderar mot vägg/skepp/efter 3 s med partiklar och en växande chockvåg som skadar alla skepp den når en gång (Astro Duel: dödar); direkträff ger direktskadan |
| PU-05 | Options -> tryck P -> POWERUP EDITOR -> MINI NUKE | Raden dyker upp sist i Options; sju parametrar (inklusive CAMERA SHAKE) går att ändra med vänster/höger (steg enligt raden) och effekterna syns direkt i nästa nuke; värdena sparas i settings.ini ([powerup_mininuke]) och finns kvar efter omstart; Återställ-raden ger standardvärden |
| MUS-09 | Starta spelet; gå till huvudmenyn; tillbaka till titeln (Esc); starta en match | Titelskärmen spelar "3LE - DAS BRATWURST (DNB EDIT)" och den fortsätter i huvudmenyn utan avbrott; i skeppsval och match byter musiken till en annan låt; Esc till titeln startar titellåten igen; i matcher och skeppsval spelas aldrig titellåten; LB/RB bläddrar bland de övriga låtarna och gör inget på titeln; NOW PLAYING visar t.ex. 02/05 |
| PU-06 | Låt en Mini Nuke explodera med CAMERA SHAKE på 0, 12 och 40 | 0: ingen skakning; högre värde: banans bild skakar kraftigare och klingar av på under en sekund; ram och spelarpaneler ligger stilla; ingen skakning i pausmenyn; nästa runda börjar utan skakning |
| PU-07 | Ta upp Railgun (slumpas bland powerups), håll B/V/F/M inne | En liten glödande kula framför skeppet växer under 4 s i spelarens färg; när den är klar blir den vit och flimrar; panelen visar RAILGUN n % och sedan READY; släpps knappen tidigt försvinner kulan utan skott och powerupen är kvar |
| PU-08 | Släpp knappen fulladdad | Kraftfullt lasersljud; kulan försvinner; en stråle i spelarens färg går från nosen åt det håll skeppet pekar genom hela banan över väggar och föremål och når andra sidan på ca 0,5 s; ligger kvar 2 s, tonar ut på 1 s; ett skepp den sveper förbi dör på en träff (ägaren inte); kameran skakar lätt |
| PU-09 | Options -> P -> POWERUP EDITOR -> RAILGUN | Åtta parametrar (laddningstid, strålens fart, hålltid, utfasning, bredd, skada, kameraskakning, kulans storlek) går att ändra och märks direkt; sparas i settings.ini ([powerup_railgun]) |
| PU-10 | Håll inne B med Railgun hela vägen; släpp tidigt; håll kvar 3 s efter fulladdning; pausa, dö och byt runda under laddning | Ett vibrerande vobblande ljud ökar i volym och tonhöjd under laddningen; vid fulladdning tystnar det och ett laddad-ljud spelas; släpp = skott; 3 s efter fulladdning avfyras det av sig självt; tidig släpp = tystnad utan skott; ljudet tystnar vid paus/död/rundslut och fastnar aldrig; SOUND EFFECTS av = inget ljud |
| CAM-06 | 3-4 spelare: låt en spelare dö; 2 spelare med fler liv: en dör; därefter respawn | Kameran zoomar och flyttar sig mjukt (1–2 s) mot de kvarvarande spelarna, och mjukt tillbaka när spelaren kommer tillbaka; ingen hopp; vanlig rörelse är oförändrat omedelbar; ny runda startar direkt i rätt vy |
| PU-11 | Options -> P -> POWERUP EDITOR -> DRIFT: ändra alla nio värden (inklusive SIDE THRUSTER: gasa + drift + sväng, skeppet puttas ut ur kurvan åt motsatt sida mot svängen; 0 = ingen putt); starta om spelet; återställ | Varje värde märks direkt i drift/reverse (starthastighet, sväng, glidvinkel, gas, backgas, spårlängd, motorljud, spårbredd); sparas i settings.ini ([powerup_drift]) och finns kvar efter omstart; återställningsraden ger standardvärdena; DRIFT spawnas aldrig som orb |
| PAUSE-03 | Pausa i match -> OPTIONS; ändra tema/musik/volym/DRIFT; Esc tillbaka; RESUME | Hela Options-menyn visas över matchen; ändringar slår igenom (tema, volym, drift mm); Esc/B går tillbaka till pausmenyn; Map Editor gör inget där; RESUME fortsätter matchen; QUIT TO MENU fungerar |
| UI-21 | Starta en match | Ingen debugtext uppe till vänster i spelytan; F1 visar den, F1 igen döljer den |
| SET-03 | Ta bort settings.ini (eller återställ) och starta; byt tema; starta om | Första start visar temat Dracula; ett tema man väljer sparas och används vid nästa start; Återställ ger Dracula igen |
| BUILD-01 | Skapa en exe-build (F5 eller Create Executable) och titta på filen och aktivitetsfältet | Exe-filen och fönstret har BW-loggan som ikon (skarp i 16, 32, 48 och 256 px) med genomskinlig bakgrund; om Windows visar den gamla ikonen: starta om Utforskaren eller byt filnamn |
| MENU-12 | Skeppsval med gamepad: tryck B på varje rad, på READY och på SHIP; med en andra spelare längre fram | B backar CONFIRM -> POD -> WEAPON -> SHIP och tar tillbaka READY; B på SHIP lämnar till huvudmenyn om alla är på SHIP, annars händer inget; Esc går direkt till huvudmenyn |
| VIS-05 | Options -> SOLID COLORS ON; starta matcher på alla tre banor och med olika skepp; sätt OFF | Alla solida väggar fylls med sin färg (utom spelytans ram), skeppens skrov fylls i spelarfärg (förutom Kaese) med konturen ovanpå; ingen kant eller hål i fyllningen; OFF ger bara konturer som förut; valet sparas |
| SHOT-04 | Kör i maxfart rakt fram med olika skepp (snabba som XWing, Blitz) och skjut kanon, missil och Mini Nuke | Du kör aldrig in i dina egna skott eller missiler; skotten går exakt dit nosen pekar även vid drift/sidoglid; stillastående skjuter som förut; skott bakåt (bakåtpods) får ingen extra fart |
| VIS-06 | Starta en match med 1 spelare (inzoomat) och med 2+ spelare som flyger isär | Fasta pixlar med 100 pixlars mellanrum över arenan (inte på väggar eller inne i föremål, inte utanför ramen) som står stilla i banan medan skeppet rör sig; de syns tydligt när kameran är inzoomad, tonar ut när den zoomar ut och försvinner helt vid utzoomad bild; fungerar med Solid colors och kameraskakning |
| MUS-10 | Huvudmenyn: titta på högra kolumnen; klicka på tidslinjen, prev, play/paus, next, shuffle, repeat, volym −/+ och MUTE; kontrollera NEXT TRACK längst ned; tryck Y (gamepad) eller M | DATA överst och MUSIC under; spektrum, titel, tidslinje och tider uppdateras live; klick på tidslinjen söker; play/paus pausar och återupptar utan att starta om låten; prev/next byter låt; shuffle/repeat växlar (lysa i accent) och styr vad som spelas när låten tar slut; volym −/+ ändrar volymen (LED-stapel och procent) och sparas; MAP-raden visar kartbilden i DATA-rutan; ingenting överlappar vid 1024x640 och i större vyer |
| UI-22 | Titta på rutornas nedre hörn i huvudmenyn, skeppsvalet, matchens spelarpaneler och pausmenyn | Varje nedre hörn har en liten vinkelhake i accentfärg: en kort vågrät linje längs nederkanten och en kort lodrät längs sidokanten, exakt på ramen (ingen dubbel linje, ingen glipa) |
| MUS-11 | Starta spelet och lyssna på titelskärmen | Musiken börjar helt tyst och tonar upp jämnt till vald volym på 1,5 sekunder; låtbyten senare börjar med full volym; MUTE och volym fungerar under och efter intoningen |
| DISP-04 | Options -> WINDOW -> FULLSCREEN; alt-tab ut och tillbaka flera gånger (och klicka på spelet i aktivitetsfältet); byt till 2X och tillbaka | Vid alt-tab lämnar spelet helskärmen efter en kort stund och finns som ett fönster i aktivitetsfältet; klick/alt-tab tillbaka återställer helskärmen; fönstret går alltid att få tillbaka; övriga fönsterlägen påverkas inte |
| MUS-12 | Bläddra med LB/RB och via NEXT TRACK till Juke to Jupiter; låt den spela | Spelas 3:30 med rätt titel (06/06); spektrumet följer låten; tidslinjen och tiderna stämmer; nästa låt efter den är No Safe Orbit (02/06) |
| AST-01 | Game modes -> Asteroids -> START, välj skepp och starta | Helt tom bana (bara ramen), spelarna startar på sina vanliga platser; efter 1 s flyger 6 stora stenar in från kanterna; rubrikraden visar "WAVE 1" och banan "ASTEROIDS" |
| AST-02 | Skjut kanon och missiler på stenarna | Stor sten delas i två mellanstora som rör sig snabbare, mellan i två små (mycket snabba), små försvinner; gnistor och ljud; skotten försvinner vid träff |
| AST-03 | Flyg in i stenar (stor, mellan, liten) | Skeppet tar 10 / 5 / 1 energi, knuffas bort, stenen delas (stor/mellan) eller går sönder (liten), och skeppet kan inte ta ny stenskada på ca 0,8 s; död ger liv/respawn som vanligt |
| AST-04 | Förstör alla stenar; låt stenar fly ut ur banan; använd Mini Nuke och Railgun | Ny, större våg 1,5 s efter att alla är borta (WAVE 2 med 8 stora); en ny stor sten var 6:e sekund när det finns färre än 10; stenar som lämnar banan kommer in på motsatt sida; nuke-chockvågen och railgun-strålen förintar stenar utan att dela dem |
| AST-05 | POWERUPS ON/OFF, Solid colors ON, runda tillbaka/ny runda i Asteroids | Powerup-orber fungerar som i Classic; stenarna fylls med Solid colors; spelytan fylls inte (bara en polygon); ny runda börjar med tom bana; inställningen sparas |
| AST-06 | Game modes -> Asteroids -> LEVEL 1, 3 och 5; starta och jämför; stäng av och starta om | Nivå 1: 6 stora stenar efter 1 s, långsamma; nivå 3: 24 stora stenar efter ca 0,25 s och 4 gånger så snabba; nivå 5: många stenar (högst 64 stora) och farten 8 gånger; ingen märkbar fördröjning; skeppet kan fortfarande träffas av snabba stenar (inga stenar flyger genom); standard är 3 och valet sparas |
| CAM-07 | Options -> ZOOM 1, 5 och 10 med två spelare långt från varandra | Zoom 1 som förut; högre zoomvärde visar mer av arenan, Zoom 10 dubbelt så mycket; kameran glider mjukt när värdet ändras (även i pausmenyns Options); valet sparas; orienteringspunkterna tonar ut vid utzoomad bild; spelet går att spela som vanligt |
| UI-OPT-01 | Options | Ingen rad WIDE PLAYFIELD; SCANLINES AND GLOW slar bade linjer och textglod pa/av; spelytan alltid bred |
| AUD-VOL-01 | Options VOLUME ned till 0 | Visar OFF, musiken tystnar; upp igen startar musiken; samma via - i musikspelaren; ingen MUSIC-rad |
| GD-01 | Galaxy Duel: skjut en motståndare en gång | Skeppet blir 80 % långsammare i 6 s, kan inte skjuta/använda specialvapen/powerup, gnistor och små streck lossnar; efter 6 s normalt igen och effekterna försvinner |
| GD-02 | Galaxy Duel: träff medan skadad | Skeppet exploderar och tappar ett liv; träff efter reparation skadar bara igen |
| GD-03 | Galaxy Duel: träff med missil, Mini Nuke-chockvåg och railgun | Alla ger samma skada/död-regel; railgunladdning avbryts vid träff |
| DR-01 | Starta match, titta på panelens AB-mätare | Full mätare (blå) för varje spelare; RF LOCKED finns inte längre |
| DR-02 | Drifta 3 s och släpp | Mätaren minskar ungefär 3/8 och står kvar när knappen släpps |
| DR-03 | Drifta flera korta gånger | Drivmedel går bara åt medan man driftar; resten sparas |
| DR-04 | Drifta tills mätaren är tom | Driften stängs av direkt, mätaren blir röd och fylls på |
| DR-05 | Tid för laddning (mät med klocka/ticks) | Tom → full tar 6 s; drift omöjlig under laddningen; åter möjlig när den är full |
| DR-06 | Två spelare, en driftar | Den andras mätare påverkas inte |
| DR-07 | Options → P → Powerup Editor → DRIFT → DRIFTING FUEL | Raden finns; ändrad längd gäller alla och sparas; RESET OPTIONS ger 8 |
| DR-08 | Dö, ny runda | Mätaren är full igen |
| DR-09 | Övriga driftparametrar, backning, andra spellägen | Fungerar som förut |
| RACE-001 | Game modes → RACE finns, START öppnar skeppsval | Race syns och startar; övriga lägen oförändrade |
| RACE-S1-01 | Race: ändra LAPS, MAP, ROUNDS, POWERUPS, stäng och starta om spelet | Värdena sparas (`settings.ini` [race]); POWERUPS är AV som standard |
| RACE-S1-02 | Starta ett race med 1 och 2 spelare | Spelarna står på startplatserna; panelen visar `LAP 1 / N`; rubrikraden visar tiden som går; tiden nollas i nästa runda |
| RACE-S1-03 | Starta Classic, Galaxy Duel och Asteroids efter ett race | Inga Race-element (varv, tid) syns, inställningarna oförändrade |
| RACE-S1-04 | Race: kör in i en vägg i hög fart | Skeppet studsar men energin minskar inte; ingen väggdöd. Classic tar fortfarande skada |
| RACE-020 | Race, bana med målruta: kör ett varv och passera rutan i pilens riktning | Panelen går från `LAP 1 / N` till `LAP 2 / N` exakt en gång |
| RACE-021 | Ligg stilla i rutan, vicka fram och tillbaka över mittlinjen | Varvet räknas inte upp av att vicka (nettoräkning); F1 visar X/F |
| RACE-022 | Passera rutan åt fel håll | Räknas inte (X minskar) |
| RACE-023 | Två skepp passerar nära varandra | Varje skepp räknas för sig |
| RACE-024 | Flyg genom rutan | Ingen kollision, ingen bromsning |
| RACE-025 | Slutför alla varv | `FINISHED m:ss.t` visas för skeppet, tiden sparas |
| RACE-026 | Starta bakom/på linjen | Starten räknas inte som ett varv |
| RACE-070 | Redigeraren: F, två hörnklick; ny ruta ersätter gamla; mushjulet vrider pilarna; X tar bort | Rutan går att placera, byta, vrida och ta bort |
| RACE-072 | Spara, lämna, öppna banan igen | Rutan och riktningen finns kvar |
| RACE-073 | Öppna och spela äldre banor | De laddas som förut (nyckeln är valfri) |
| RACE-074 | Spara en Race-bana utan ruta; starta ett race på den | Varning vid sparning; `NO FINISH LINE` i panelen |
| RACE-075 | Rutan i matchen | Ingen väggkollision, ingen påverkan på andra lägen |

**Race steg 1, 2 och 7 — testresultat (rapporterat av projektägaren, 2026-10-18, GMS-IDE, F5):** målrutan går att bygga i redigeraren, pilarna går att vrida med mushjulet, inställt antal varv fungerar och skeppet kan köra i mål. Verifierade av användaren: RACE-020 (ett varv räknas), RACE-025 (mål efter angivna varv), RACE-070 (placera/vrida ruta), delvis RACE-072 (rutan sparas och laddas). Ej rapporterat som testade: RACE-021–024, 026, 073–075, RACE-S1-01–04 (väggkrasch utan skada), RACE-001.
| RACE-010 | Starta ett race, titta på AM och SP | Kanonammo och specialammo är 0 |
| RACE-011 | Tryck på skjut (A) utan pickup | Ingen kanon avfyras |
| RACE-012 | Tryck på Y (specialvapen) utan pickup | Ingen missil/styrd missil avfyras |
| RACE-014 | Håll drift (LT) + gas | Drift startar inte; AB-mätaren är tom |
| RACE-015 | Vänta i ett race | Drivmedlet laddas inte automatiskt |
| RACE-030 | Träffa ett skepp med ett vapen (tills pickups finns: testa med debug/ammo) | Skeppet går 80 % långsammare i 3 s, ingen skada, SL-staplen tömmer sig |
| RACE-031 | Vänta 3 s efter träffen | Normal fart igen |
| RACE-032 | Träffa igen under de 3 s | Tiden startar om; inte långsammare än 20 % |
| RACE-033 | Träffa med skott, missil, Mini Nuke, chockvåg och railgun | Ingen dör eller förlorar energi; alla ger samma slow |
| RACE-034 | Classic, Galaxy Duel och Asteroids | Vapenträffar och energi som förut |
| RACE-040 | Starta ett race på en bana med pickuppunkter | Alla bollar syns från start |
| RACE-041 | Ta en pickup tills du får Plasma | AM visar 1 skott, ett tryck på A avfyrar, därefter 0 |
| RACE-042 | Få Missile | SP visar MSL 1 och valt automatiskt; Y avfyrar en missil, därefter 0 |
| RACE-043 | Få Guided Missile | SP visar GUIDED 1 och valt; Y avfyrar en, därefter 0 |
| RACE-044 | Få Drift | AB-mätaren blir full; drift går att använda |
| RACE-045 | Töm drivmedlet | Det laddas inte om; drift är avstängd tills en ny drift-pickup |
| RACE-046 | Ta en pickup och vänta | Den är tillbaka på samma plats efter 5 s |
| RACE-047 | Två skepp rör samma boll samma stund | Bara ett får den |
| RACE-048 | Ta flera pickups av samma sort | Ammo blir aldrig mer än 1; drift aldrig mer än fullt |
| RACE-071 | Redigeraren: O placerar, klick på punkt flyttar, X tar bort, spara och öppna igen | Punkterna finns kvar |
| RACE-030 | Träffa ett skepp med ett skott/missil som kommit från pickup | Slow 20 % i 3 s (se D-055) |
| RACE-050 | Två spelare, ledaren tar en pickup upprepade gånger | Får bara Plasma |
| RACE-051 | Tre spelare, den i mitten tar pickups | Får bara Plasma eller Missile |
| RACE-052 | Sista spelaren tar pickups | Får bara Guided Missile eller Drift |
| RACE-053 | Två spelare | Ledare/sist enligt D-057 |
| RACE-054 | Tre spelare | 1:a, 2:a och 3:e skiljs åt (`POS x / 3`) |
| RACE-055 | Byt ledare under racet och ta pickups | Nivån avgörs av placeringen vid upplockningen |
| RACE-056 | Placering mellan passager | Avgörs av varv/passagetid/startordning, inte av avstånd till mål |
| RACE-060 | Kör i mål | Måltiden sparas och visas i resultatrutan |
| RACE-061 | Skepp i mål och ett som ännu tävlar: skjut, kollidera, flyg genom varandra | Klara skepp träffas och kolliderar inte, skjuter inte |
| RACE-062 | Alla utom en kommer i mål | `ELIMINATED IN 4`, 3, 2, 1; den sista exploderar; racet avgörs, ingen hängning |
| RACE-063 | Resultatrutan | Vinnare, placeringar, skepp och tider eller ELIMINATED visas |
| RACE-064 | Resultatrutan | Exakt texten `PRESS TO ENTER NEXT RACE` (sista racet: PRESS TO SEE THE FINAL RESULT) |
| RACE-065 | Tryck A/Enter/Space efter en sekund | Nästa race startar (eller slutresultatet) |
| RACE-066 | Ställ in 2 varv och 2 rundor | Antalen respekteras; rundvinster räknas |
| RACE-067 | En ensam spelare i mål; sista spelaren kommer i mål under nedräkningen | Inget hänger sig; nedräkningen avbryts |
| RACE-S8-40 | Starta ett race och varje ny runda | Stor 3, 2, 1 i mitten, sedan GO!; gas och backning går inte innan GO!, svängning går; racetiden börjar vid GO! |
| RACE-S8-41 | Pausa under nedräkningen | Nedräkningen står stilla och fortsätter efter paus |
| RACE-S8-42 | Alla utom en kommer i mål | Den sista racern får `ELIMINATED IN 4…1` och exploderar |
| ED-UI-01 | Öppna redigeraren | Verktygspanelen visar kategorierna STATUS, DRAW, PLACE, VIEW, FILE i olika färger, texten ryms i panelen, aktivt verktyg är markerat |
| ED-UI-02 | Byt verktyg (B, P, X, T, F, O) | Markeringen följer verktyget; hjälptexten längst ned byter |
| ED-ZOOM-01 | Rulla mushjulet över en tom yta | Zoomar in/ut kring pekaren (100 %–1600 %); inget ritas utanför ritytan; ZOOM visas i STATUS |
| ED-ZOOM-02 | Zooma in, håll mellanslag och dra | Vyn flyttas; mellanslag + klick ritar ingenting; vyn stannar inom världen |
| ED-ZOOM-03 | Mushjulet över målrutan och nära vald startplats (T) | Vrider pilarna respektive skeppet i stället för att zooma |
| ED-ZOOM-04 | Rita, flytta och radera objekt när vyn är inzoomad och förflyttad | Klick träffar rätt värld koordinat; sparade banor oförändrade |
| ED-ZOOM-05 | Home | Vyn återställs till 100 % |
| RACE-S8-50 | Game modes → RACE → MAP | Listan visar bara banor sparade med Race markerat; gamla banor utan målruta visas inte |
| RACE-S8-51 | Spara en bana med Race ikryssat och målruta; öppna Race-menyn | Banan finns i Race-listan |
| RACE-S8-52 | Inga Race-banor | MAP visar `NO RACE MAPS`, START gör inget |
| RACE-S8-53 | Startnedräkningen | 3, 2, 1, GO! är skarpa vektorlinjer i mitten, även vid fullskärm och olika fönsterstorlekar |
| WALL-01 | Flyg rakt in i en vägg och håll gasen | Skeppet studsar lite, saktas ned och går att vrida loss; inga fastnade lägen |
| WALL-02 | Flyg i grund vinkel (cirka 20°) mot en vägg | Glider längs väggen och fortsätter, gnistor hela vägen |
| WALL-03 | Flyg i brant vinkel (cirka 70°) | Saktas ned kraftigare ju mer nosen pekar mot väggen |
| WALL-04 | Flyg in i ett hörn, och puffa ett skepp in i en vägg med ett annat | Skeppet fastnar inte i väggen; trycks ut |
| WALL-05 | Classic: energi vid träff och släp | Hård träff tar energi enligt originalformeln, släp mot vägg tar (nästan) ingen |
| WALL-06 | Galaxy Duel och Race | Ingen väggskada, men samma glid och gnistor |
| RACE-S8-54 | Startnedräkningen | 3, 2, 1 och GO! visas som raka LCD-segment, skarpa, centrerade i spelytan |
