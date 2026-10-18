/// scr_set_init()
// Laser settings.ini over standardvardena (okanda/ogiltiga varden ger standard), skapar themes.ini vid forsta start och applicerar temat.
var t, k, s, pt, pk;
scr_set_defaults();
ini_open("settings.ini");
s = ini_read_string("theme", "name", "");
for (t = 0; t < g_th_count; t += 1)
{
    if (g_th_id[t] == s) { g_sv[g_SV_THEME] = t; }
}
s = ini_read_string("theme", "accent", "");
for (k = 0; k < 7; k += 1)
{
    if (string_lower(g_acc_name[k]) == s) { g_sv[g_SV_ACCENT] = k; }
}
s = ini_read_string("display", "scale", "");
for (k = 0; k < 4; k += 1)
{
    if (string_lower(g_scale_name[k]) == s) { g_sv[g_SV_SCALE] = k; }
}
g_sv[g_SV_VSYNC] = clamp(ini_read_real("display", "vsync", g_sv[g_SV_VSYNC]), 0, 1);
g_sv[g_SV_SCAN] = clamp(ini_read_real("display", "scanlines", g_sv[g_SV_SCAN]), 0, 1);
g_sv[g_SV_GLOW] = clamp(ini_read_real("display", "glow", g_sv[g_SV_GLOW]), 0, 1);
g_sv[g_SV_WIDE] = 1;   // bred spelyta alltid (D-048)
g_sv[g_SV_GLOW] = g_sv[g_SV_SCAN];   // en gemensam omkopplare: SCANLINES AND GLOW
g_sv[g_SV_MUSIC] = clamp(ini_read_real("audio", "music", g_sv[g_SV_MUSIC]), 0, 1);
g_sv[g_SV_ADLIVES] = clamp(round(ini_read_real("astro", "lives", g_sv[g_SV_ADLIVES])), 1, 9);
g_sv[g_SV_VOL] = clamp(round(ini_read_real("audio", "volume", g_sv[g_SV_VOL] * 10) / 10), 0, 10);
g_sv[g_SV_MUSIC] = (g_sv[g_SV_VOL] > 0);   // musik pa/av styrs av volymen (0 = OFF)
g_sv[g_SV_SOLID] = clamp(round(ini_read_real("display", "solid_colors", g_sv[g_SV_SOLID])), 0, 1);
g_sv[g_SV_LAPS] = clamp(round(ini_read_real("race", "laps", g_sv[g_SV_LAPS])), 1, 10);
g_sv[g_SV_PURA] = clamp(round(ini_read_real("race", "powerups", g_sv[g_SV_PURA])), 0, 1);
g_sv[g_SV_ZOOM] = clamp(round(ini_read_real("display", "zoom", g_sv[g_SV_ZOOM])), 1, 10);
g_sv[g_SV_ASLV] = clamp(round(ini_read_real("asteroids", "level", g_sv[g_SV_ASLV])), 1, 5);
g_sv[g_SV_PUAS] = clamp(round(ini_read_real("asteroids", "powerups", g_sv[g_SV_PUAS])), 0, 1);
g_sv[g_SV_PUCL] = clamp(round(ini_read_real("gameplay", "powerups_classic", g_sv[g_SV_PUCL])), 0, 1);
g_sv[g_SV_PUAD] = clamp(round(ini_read_real("astro", "powerups", g_sv[g_SV_PUAD])), 0, 1);
for (pt = 0; pt < g_PU_COUNT; pt += 1)
{
    for (pk = 0; pk < g_pu_np[pt]; pk += 1)
    {
        g_sv[g_SV_PU + pt * g_PU_STRIDE + pk] = clamp(round(ini_read_real("powerup_" + g_pu_key[pt], g_pu_pkey[pt, pk], g_sv[g_SV_PU + pt * g_PU_STRIDE + pk])), g_pu_pmin[pt, pk], g_pu_pmax[pt, pk]);
    }
}
g_sv[g_SV_LIVES] = clamp(round(ini_read_real("gameplay", "lives", g_sv[g_SV_LIVES])), 1, g_START_LIVES);
g_sv[g_SV_SFX] = clamp(ini_read_real("audio", "sfx", g_sv[g_SV_SFX]), 0, 1);
g_sv[g_SV_PLAYERS] = clamp(round(ini_read_real("gameplay", "players", g_sv[g_SV_PLAYERS])), 1, 4);
g_sv[g_SV_ROUNDS] = clamp(round(ini_read_real("gameplay", "rounds", g_sv[g_SV_ROUNDS])), 1, 15);
ini_close();
scr_drift_apply();   // drift/reverse-installningarna till spelkodens variabler
scr_weapon_apply();   // kanon- och missilinstallningarna (D-069)
ini_open("settings.ini");
s = ini_read_string("gameplay", "map", "");
ini_close();
for (t = 0; t < g_lv_count; t += 1)
{
    if (g_lv_id[t] == s) { g_sv[g_SV_MAP] = t; }
}
ini_open("settings.ini");
s = ini_read_string("gameplay", "map_astro", "");
ini_close();
for (t = 0; t < g_lv_count; t += 1)
{
    if (g_lv_id[t] == s) { g_sv[g_SV_MAP2] = t; }
}
ini_open("settings.ini");
s = ini_read_string("gameplay", "map_race", "");
ini_close();
for (t = 0; t < g_lv_count; t += 1)
{
    if (g_lv_id[t] == s) { g_sv[g_SV_MAP3] = t; }
}
scr_levels_fix_selection();
g_n_players = g_sv[g_SV_PLAYERS];
scr_theme_ini_write();
scr_theme_apply();
scr_set_save();
