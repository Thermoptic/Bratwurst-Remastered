# Ljud ur originalets exe (härledd data, privat; docs/09)

Skapat av `tools/extract_audio.py` (läser `original/` skrivskyddat). Ingen av filerna är lyssnad på av Claude; klippen är gissade delningar.

| Mapp/fil | Innehåll | Status |
|---|---|---|
| `music_module.ogg` | Den inbäddade ProTracker-modulen (hunk 3, filoffset 0x42fb0, titel "…edeon et barnabe", 1 mönster) renderad med en egen enkel PT-spelare, två varv (12,8 s) | modulen VERIFIERAD; renderingens ljud OKÄNT tills du lyssnat |
| `module_samples/` | Modulens sex sampel med data (JoyDrum1–4, Joy05Bass och ett namnlöst) som WAV, 8287 Hz (antagande) | VERIFIERAD data, tonhöjd antagen |
| `hunk2/` | Hela hunk 2 (117 320 B 8-bitsdata) som `_whole.wav` plus 28 klipp (gissad delning) | SANNOLIK ljud, delning OKÄND |
| `hunk3_before_module/` | De första 38 196 B av hunk 3 (före modulen), `_whole.wav` plus 4 klipp | SANNOLIK ljud, OKÄNT vad det är |

Antaganden: samplingsfrekvens 8287 Hz (PT:s C-2 på PAL), signerad 8-bitsdata. Exet är skadat (hunk 2 och 3 är 512 B kortare än deklarerat, docs/13), så klipp nära hunkarnas slut kan vara trasiga.
