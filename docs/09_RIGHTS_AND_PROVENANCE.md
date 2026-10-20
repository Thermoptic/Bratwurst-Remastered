# 09 — Rättigheter och proveniens

## Vad vi vet från arkivet

Dokumentationen anger:
- Copyright: Three Little Elks, 1994–1995.
- Kod: Niklas “Tabasco” S… och Thomas “Explorer” Sköldenborg (namn återges i dokumentet, men vissa tecken påverkas av textkodning).
- Grafik: Björn “Bear” Samuelsson.
- Musik/dokumentation: Christer “Beyonder” Enfors.

Dokumentationen beskriver också Bratwurst som en beta-release från CompuSphere IV.

## Viktigt

Att filerna finns tillgängliga innebär inte automatiskt att de får distribueras eller modifieras offentligt. Innan publicering:
- undersök vem som innehar rättigheterna,
- kontrollera om tillstånd krävs för att använda namnet Bratwurst,
- kontrollera rättigheter för originalets kod, grafik, skeppsdata, ljud och musik,
- håll originalresurser och nyskapade resurser åtskilda,
- dokumentera tillstånd eller licenser med källa och datum.

## Säker strategi medan rättigheter är oklara

- Använd originalet privat som referens.
- Bygg en egen implementation av verifierade spelregler.
- Undvik att distribuera originalets binär, bibliotek, musik eller grafik i remake-paketet utan tillstånd.
- Använd tillfälliga egenritade resurser under utveckling.
- Lägg inte in upphovsrättsskyddade tillgångar i offentliga Git-repositorier innan rättigheterna är klarlagda.

Detta är praktisk projektvägledning, inte juridisk rådgivning.

## Tillägg 2026-10-13
- Arkivet innehåller tredjepartsfiler: `Least` (textvisare, egen licens/doc), `reqtools.library` (Nico François m.fl.), AmigaOS-kommandon `Assign`, `LoadWB`, `Wait`. Dessa får inte ingå i en remake-distribution.
- Härledda filer från originalets data (`analysis/ships_raw.json`, `analysis/ships_sheet.svg`) är **privata arbetsfiler** — publicera dem inte innan rättighetsstatus är klarlagd.
- Exe innehåller en inbäddad ProTracker-modul ("edeon et barnabe") vars ursprung/rättigheter är okända (kan vara ett samplat/lånat stycke). Extrahera/återanvänd inte.
- Namnen i credits-/doc-texten har kodningsproblem (Amiga-teckenkodning, t.ex. "Sörensson"); i exe-scrollern är de avkortade/små bokstäver.

## Tillägg (Fas 1)
`gms/Bratwurst.gmx/scripts/scr_data_ships.gml`, `scr_data_arena.gml`, `scr_data_trig.gml` är genererade ur originalets skepps-/banadata och tabeller → **privata**, ej för distribution innan rättigheter är klarlagda. Övriga scripts är egen kod.

## Tredjepartsresurser i UI (2026-10-13)
- **Cascadia Mono** (Microsoft, SIL Open Font License 1.1): glyfatlaserna `gms/Bratwurst.gmx/fonts/fnt_*.png` är renderade ur typsnittet. OFL tillåter inbäddning/distribution men kräver att licenstext och upphovsangivelse följer med (ej ännu tillagd; krävs före distribution).
- **Base16-teman** (tinted-theming/schemes): färgvärden i `scr_data_themes.gml`; varje schema har en upphovsperson i källrepot (kreditering och licenskontroll återstår).


## Titelmusik (2026-10-13)
- `gms/Bratwurst.gmx/sound/audio/snd_title_music.ogg` är användarens fil `RollingBreakbeat_loop_150bpm.ogg`. Källa och licens är inte dokumenterade; användaren ansvarar för att den får användas och distribueras. Ska kompletteras med upphovsperson/licens före distribution.

## Race-nedräkningens ljud (2026-10-18)
- `gms/Bratwurst.gmx/sound/audio/snd_sfx_countdown.wav` är användarens fil `PM_FSSF_DOOR_MID_9.wav` ur **Sonniss.com GDC 2019 Game Audio Bundle**, mappen *PMSFX - Foundation Series SCI-FI* (källa: användarens lokala kopia). Filen är omvandlad från 24-bitars 96 kHz till 16-bitars 44,1 kHz (GMS 1.4) men i övrigt oförändrad (1,0 s, stereo).
- **Rättighetsstatus: delvis bekräftad (2026-10-18).** Projektägaren har visat Sonniss webbplats (skärmbild): GameAudioGDC-arkivet är royalty-fritt och kommersiellt användbart, ingen kreditering krävs och ljuden får användas i obegränsat många projekt. Det gäller att använda ljudet i spelet. **Fortfarande OKÄNT:** den fulla licenstexten är inte läst (ingen sökväg till licensfilen dokumenterad), så om `.wav`-filen får ligga i ett offentligt källkodsförråd är inte bekräftat. Sonniss GDC-paketen brukar få användas i egna produkter (spel) utan kreditkrav, men ljuden får inte vidaredistribueras som fristående ljudsamling. Läs licensfilen som följde med paketet. Att spelet innehåller ljudet i sin export är normalt tillåtet; att lägga själva `.wav`-filen i ett **offentligt** källkodsförråd kan räknas som vidaredistribution. Om GitHub-förrådet är offentligt: bekräfta villkoren först, eller ta bort filen ur förrådet (och dess `.sound.gmx`) och bygg spelet lokalt. Se D-067.

## Rodchenko Light (2026-10-20)
- Typsnittet **Rodchenko Light** (ParaType Inc., filen `Rodchenko-Light.ttf` ur ett MyFonts-webbfontpaket) valdes av projektägaren som spelets typsnitt. **Projektägaren uppger att hen har licens** och att det är i sin ordning att använda det i spelet (2026-10-20). Licensens exakta villkor (omfattning, inbäddning i distribuerat spel) har inte verifierats av Claude och ligger inte i projektet; behåll licensbeviset.
- Spelet innehåller typsnittet bara som glyfbilder (PNG-atlaser `gms/Bratwurst.gmx/fonts/fnt_*_k*.png` och breddtabeller); TTF-filen ligger inte i projektet eller i spelet (se D-074). Övriga typsnitt som provades (Bebas Neue, Doto, Pixelify Sans, Intel One Mono; SIL OFL 1.1) och Cascadia Mono (SIL OFL 1.1) ligger kvar i FONT TEST-sidan (D-073) tills den tas bort.

