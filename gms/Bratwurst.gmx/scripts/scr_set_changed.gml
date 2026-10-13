/// scr_set_changed(setting_index)
// Tillampar och sparar efter att en installning andrats.
var s;
s = argument0;
if (s == g_SV_THEME || s == g_SV_ACCENT) { scr_theme_apply(); }
if (s == g_SV_SCALE || s == g_SV_VSYNC) { scr_display_apply(); }
if (s == g_SV_PLAYERS) { g_n_players = g_sv[g_SV_PLAYERS]; }
scr_set_save();
