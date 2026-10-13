# 03 — Originalets dokumenterade gameplay

**Primär källa:** `original/Bratwurst_Decomp/Bratwurst.doc`.

Den här filen skiljer dokumenterade fakta från sådant som fortfarande måste verifieras genom att spela originalet.

## Översikt

Dokumentationen beskriver Bratwurst som ett spel i stil med GravityForce, Turbo Raketti och Roketz. Den särskiljande tekniken är tvådimensionell vektorgrafik och en kamera som zoomar dynamiskt för att hålla spelarna synliga.

## Dokumenterade funktioner

### Grafik och kamera
- 2D-vektorgrafik i stället för vanlig bitmappsgrafik.
- Dynamisk zoom: kameran zoomar in när spelarna är nära varandra och ut när avståndet ökar.
- Upp till fyra samtidiga spelare enligt dokumentationen.
- Valbar grid som tonas in när spelare är nära varandra och det är svårt att se väggar.
- Valet “Extra lines” gör små skepps riktning/detaljer tydligare när kameran zoomat ut.

### Menyer
Huvudmenyn innehåller:
- Start
- Options
- Exit

Options kan ställa in:
- Antal spelare och kontrollmetod för varje spelare.
- Grid av/på.
- Extra lines av/på.

### Skeppsval och specialvapen
Efter Start väljer varje spelare skepp genom vänster/höger och bekräftar med fire. Därefter väljs specialvapen och vilken av skeppets vapenpods som ska avfyra det. Antalet vapenpods och möjliga specialvapen varierar mellan skepp.

### Spelkontroller enligt dokumentationen
- Styr joystick eller tangentbord i menyer.
- Under spel: tryck framåt för att avfyra vanliga kanonskott.
- Dra bakåt för att avfyra specialvapen.
- Dokumentationen nämner joystick och tangentbord, samt fyrspelaradapter på Amiga.

**Obs:** Detta är dokumentationens beskrivning, inte en komplett verifierad mapping för moderna kontroller.

### Statusindikatorer
Statusfältet längst ned visar per spelare:
- Energi
- Kvarvarande ammunition för standardkanon
- Kvarvarande specialvapenammunition
- Antal liv

## Historiska systemkrav
Dokumentationen anger:
- Amiga med AGA, exempelvis A1200 eller A4000.
- 68020-processor eller snabbare.
- Cirka 600 kB ledigt minne.
- Snabbare maskin rekommenderas för mjukare vektorgrafik.

Detta är originalets krav, inte krav för Windows-remaken.

## Okänt eller ännu ej verifierat

- Exakta fysikformler, acceleration, friktion, rotation och projektilhastighet.
- Kollisionernas prioritet och exakta respons.
- Alla specialvapens namn, regler, effekter och ammunition.
- Antalet liv/energi och återställningsregler.
- Banornas layout och hur de lagras.
- Exakt spelarordning, respawn och matchslut.
- Ljud, musik och eventuella surroundeffekter.
- Om V3.5-versionen i `file_id.diz` matchar dokumentationsversionen.

## Referensprotokoll

När originalet körs ska följande dokumenteras i `references/`:
- Menyflöde och val.
- Varje skepps visuella form, storlek och vapenpods.
- Styrning och respons vid låg/hög hastighet.
- Normalvapen och varje specialvapen.
- Energi, ammunition och liv.
- Kamera/zoom med spelare nära och långt ifrån varandra.
- Grid och extra lines av/på.
- En, två, tre och fyra spelare där hårdvara/emulator tillåter.

## Tillägg 2026-10-13 — fynd ur den körbara filen (VERIFIERADE strängar, ej beteende)
- **Specialvapen i exe:** NOTHING, MISSILE, GUIDED MISSILE, TURBO BOOST, TRACTOR BEAM, CANNON TURRET. Hur de beter sig, deras ammo och vilka skepp som får vilka är OKÄNT.
- **Ship select-texter:** `SHIP:`, `SPECIAL WEAPON:`, `IS THIS OK?` `YES`/`NO` för fyra spelare. Ready-texter: PLAYER ONE IS READY TO EAT / TWO … ROCK / THREE … SWIM / FOUR … SNEEZE.
- **Intro/credits:** "- bratwurst - the true story", coding/graphics/some music, "-- hit a button --".
- **Pod-geometri:** varje skepp har 2–8 monteringspunkter (position + vinkel) i `.SOB` — motsäger "en till fyra pods" i manualen om man räknar alla (OKÄND tolkning, se `06`).
- Upplösningen/zoomen/fysiken är fortfarande ej verifierade.

## Tillägg (steg 4) — kodverifierade regler (se `15`)
- Skeppsrörelse: rotation med accelererande vinkelhastighet, thrust, gravitation (50 i initialdata), hastighetsproportionellt luftmotstånd (DRAG/256 per ruta), 24.8-fixpunkt.
- Kamera: zoom = `min(150·65536/(dx+400), 108·65536/(dy+400))` över alla fyra spelares positioner; grid tonas in när zoom > 8000.
- Specialvapen per skepp styrs av tillgänglighetsbytes i `.SOB`; ammo = bas × tabell; **1–4 valbara pods per skepp** (bekräftar manualen).
- Banor: kollision via tre kollisionsbitmappar (1 bit/pixel).

## Tillägg (steg 5) — kodverifierade regler för strid och liv (se `15`, "steg 5")
- **6 liv** per spelare; död när energi ≤ 0; respawn i fast startposition med full energi/ammo (om liv återstår); sista överlevande vinner.
- **Skada:** väggkrasch ∝ fart²; kanonskott −1 energi; MISSILE −12; GUIDED MISSILE −5. Energi (P3) 20–50.
- **Specialvapen:** MISSILE (50 ticks flygtid), GUIDED MISSILE (styr efter 25 ticks, max 225), TURBO BOOST (ögonblicklig impuls), TRACTOR BEAM (drar närmaste fiende, kostar ammo varje tick), CANNON TURRET (autoriktad kanon inom ±90°, var 3:e tick). Nedräkning efter avfyrning: 40/100/20/0/3 ticks.
- **Banan** är en fast vektorarena (68 linjer) — inga fler banor i den här versionen.
- **Tidssteg:** fysiken körs i ticks och tar igen förlorade ticks.
