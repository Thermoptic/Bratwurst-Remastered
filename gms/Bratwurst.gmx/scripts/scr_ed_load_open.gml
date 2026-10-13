/// scr_ed_load_open()
// Oppnar laddafonstret: en lista med alla banor och vilka spellagen de finns i.
g_ed_dlg = 2;
g_ed_ldsel = g_ed_idx;
g_ed_ldtop = clamp(g_ed_idx - 4, 0, max(0, g_lv_count - 10));
g_ed_ldclick = 0;
