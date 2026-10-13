/// scr_ed_enter(map_index)
// Oppnar banredigeraren (g_state = 20) pa en bana.
scr_level_read(argument0);
g_ed_idx = argument0;
g_ed_tool = 0;
g_ed_cn = 0;
g_ed_bset = false;
g_ed_spawn = 0;
g_ed_dirty = false;
g_ed_cdel = 0;
g_ed_cesc = 0;
g_ed_snap = 50;
g_ed_msg = "";
g_ed_msgt = 0;
g_ed_dlg = 0;
g_pv_idx = -1;
g_state = 20;
g_menu_tick = 0;
scr_ed_cursor();   // satter markorens variabler innan forsta ritningen
