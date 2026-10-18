/// scr_level_asteroids()
// Asteroids (spellage 4): den unika, helt tomma banan: bara standardramen (en rektangel) och originalets startplatser, precis som en ny bana i redigeraren
// (scr_level_new), men utan att sparas i levels.ini. Fyller redigerarens arrayer (g_ed_*) som scr_level_read gor, sa att scr_level_apply bygger vaggarna.
g_ed_name = "ASTEROIDS";
g_ed_modes = 16;
g_ed_fon = false;
g_ed_n = 1;
g_ed_pn[0] = 4;
g_ed_px[0, 0] = -2904; g_ed_py[0, 0] = -2159; g_ed_px[0, 1] = 2847; g_ed_py[0, 1] = -2159;
g_ed_px[0, 2] = 2847; g_ed_py[0, 2] = 2159; g_ed_px[0, 3] = -2904; g_ed_py[0, 3] = 2159;
g_ed_sx[0] = -300000; g_ed_sy[0] = -270000; g_ed_sa[0] = 96;
g_ed_sx[1] = 300000; g_ed_sy[1] = -270000; g_ed_sa[1] = 160;
g_ed_sx[2] = -300000; g_ed_sy[2] = 270000; g_ed_sa[2] = 64;
g_ed_sx[3] = 300000; g_ed_sy[3] = 270000; g_ed_sa[3] = 192;
