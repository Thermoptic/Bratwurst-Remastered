/// scr_level_new()
// Skapar en ny bana med standardram (tva rektanglar), originalets startplatser och ett slumpat namn. Sparar den och returnerar dess index.
var nx, cnt, sec;
g_ed_name = scr_level_name_random();
g_ed_modes = 15;
g_ed_n = 2;
g_ed_pn[0] = 4;
g_ed_px[0, 0] = -3000; g_ed_py[0, 0] = -2273; g_ed_px[0, 1] = 2961; g_ed_py[0, 1] = -2273;
g_ed_px[0, 2] = 2961; g_ed_py[0, 2] = 2273; g_ed_px[0, 3] = -3000; g_ed_py[0, 3] = 2273;
g_ed_pn[1] = 4;
g_ed_px[1, 0] = -2904; g_ed_py[1, 0] = -2159; g_ed_px[1, 1] = 2847; g_ed_py[1, 1] = -2159;
g_ed_px[1, 2] = 2847; g_ed_py[1, 2] = 2159; g_ed_px[1, 3] = -2904; g_ed_py[1, 3] = 2159;
g_ed_sx[0] = -300000; g_ed_sy[0] = -270000; g_ed_sa[0] = 96;
g_ed_sx[1] = 300000; g_ed_sy[1] = -270000; g_ed_sa[1] = 160;
g_ed_sx[2] = -300000; g_ed_sy[2] = 270000; g_ed_sa[2] = 64;
g_ed_sx[3] = 300000; g_ed_sy[3] = 270000; g_ed_sa[3] = 192;
ini_open("levels.ini");
nx = ini_read_real("index", "next", g_lv_count);
cnt = ini_read_real("index", "count", g_lv_count);
sec = "m" + string(nx);
ini_write_real("index", "next", nx + 1);
ini_write_string("index", "id" + string(cnt), sec);
ini_write_real("index", "count", cnt + 1);
ini_close();
scr_level_write(sec);
scr_levels_reload();
return g_lv_count - 1;
