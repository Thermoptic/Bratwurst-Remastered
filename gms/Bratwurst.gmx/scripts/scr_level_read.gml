/// scr_level_read(map_index)
// Laser en bana fran levels.ini till redigerarens arrayer: g_ed_name, g_ed_n, g_ed_pn/px/py[shape, punkt], g_ed_sx/sy/sa[4] (startplatser).
var idx, sec, n, s, k;
idx = clamp(argument0, 0, g_lv_count - 1);
sec = g_lv_id[idx];
g_ed_sx[0] = -300000; g_ed_sy[0] = -270000; g_ed_sa[0] = 96;
g_ed_sx[1] = 300000; g_ed_sy[1] = -270000; g_ed_sa[1] = 160;
g_ed_sx[2] = -300000; g_ed_sy[2] = 270000; g_ed_sa[2] = 64;
g_ed_sx[3] = 300000; g_ed_sy[3] = 270000; g_ed_sa[3] = 192;
g_ed_fon = false;
g_ed_pk_n = 0;
ini_open("levels.ini");
g_ed_name = ini_read_string(sec, "name", sec);
g_ed_modes = round(ini_read_real(sec, "modes", 7));   // saknas nyckeln: aldrig Capture the Bratwurst (D-083)
n = clamp(round(ini_read_real(sec, "shapes", 0)), 0, 64);
g_ed_n = 0;
for (s = 0; s < n; s += 1)
{
    scr_level_parse_shape(ini_read_string(sec, "s" + string(s), ""), g_ed_n);
    if (g_ed_pn[g_ed_n] >= 3) { g_ed_n += 1; }
}
for (k = 0; k < 4; k += 1) { scr_level_parse_spawn(ini_read_string(sec, "p" + string(k), ""), k); }
scr_level_parse_finish(ini_read_string(sec, "finish", ""));
scr_level_parse_pickups(ini_read_string(sec, "pickups", ""));   // Race: pickuppunkter (valfria, D-056)   // Race: start/malruta (valfri, D-054)
scr_level_parse_ctb(ini_read_string(sec, "ctb_spawn", ""), 0);   // Capture the Bratwurst: korvens startpunkt och lagens zoner (valfria, D-078)
scr_level_parse_ctb(ini_read_string(sec, "ctb_red", ""), 1);
scr_level_parse_ctb(ini_read_string(sec, "ctb_blue", ""), 2);
ini_close();
