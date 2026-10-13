/// scr_phys_tables()
// Originalets startrutin (hunk0 0x3414, anropas fran 0x254) skalar fysiktabellerna (psin/pcos = (sin/cos*20)>>5, amplitud 160)
// och gravitationen (50 -> 31, skottgravitation 25 -> 15). VERIFIERAD, docs/15.
// psin/pcos genereras som literal-data i scr_data_trig (GMS 1.4 klarade inte att bygga dem i en loop).
g_GRAV = 31;
g_SHOT_GRAV = 15;
