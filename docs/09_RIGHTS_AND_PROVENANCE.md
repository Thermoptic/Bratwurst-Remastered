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
