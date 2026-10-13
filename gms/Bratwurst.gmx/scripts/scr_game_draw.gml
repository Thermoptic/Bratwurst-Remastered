/// scr_game_draw()
// Ritar aktuell skarm: 10 = titel, 11 = huvudmeny, 0 = skeppsval, 1-2 = match. Bakgrund forst och scanlines sist.
scr_ui_clear();
if (g_state == 10) { scr_title_draw(); }
else if (g_state == 11) { scr_mn_draw(); }
else if (g_state == 20) { scr_ed_draw(); }
else if (g_state == 0) { scr_menu_draw(); }
else { scr_match_draw(); }
scr_ui_crt();
