/// scr_set_save()
// Sparar installningarna i settings.ini (GMS 1.4 lagger filen i spelets sparmapp; sokvagen visas i Options -> DATA FOLDER).
var pt, pk;
ini_open("settings.ini");
ini_write_string("theme", "name", g_th_id[g_sv[g_SV_THEME]]);
ini_write_string("theme", "accent", string_lower(g_acc_name[g_sv[g_SV_ACCENT]]));
ini_write_string("display", "scale", string_lower(g_scale_name[g_sv[g_SV_SCALE]]));
ini_write_real("display", "vsync", g_sv[g_SV_VSYNC]);
ini_write_real("display", "scanlines", g_sv[g_SV_SCAN]);
ini_write_real("display", "glow", g_sv[g_SV_GLOW]);
ini_write_real("audio", "music", g_sv[g_SV_MUSIC]);
ini_write_real("audio", "volume", g_sv[g_SV_VOL] * 10);
ini_write_real("astro", "lives", g_sv[g_SV_ADLIVES]);
ini_write_real("gameplay", "lives", g_sv[g_SV_LIVES]);
ini_write_real("display", "solid_colors", g_sv[g_SV_SOLID]);
ini_write_real("gameplay", "powerups_classic", g_sv[g_SV_PUCL]);
ini_write_real("astro", "powerups", g_sv[g_SV_PUAD]);
ini_write_real("asteroids", "powerups", g_sv[g_SV_PUAS]);
ini_write_real("asteroids", "level", g_sv[g_SV_ASLV]);
ini_write_real("display", "zoom", g_sv[g_SV_ZOOM]);
for (pt = 0; pt < g_PU_COUNT; pt += 1)
{
    for (pk = 0; pk < g_pu_np[pt]; pk += 1) { ini_write_real("powerup_" + g_pu_key[pt], g_pu_pkey[pt, pk], g_sv[g_SV_PU + pt * g_PU_STRIDE + pk]); }
}
ini_write_real("audio", "sfx", g_sv[g_SV_SFX]);
ini_write_real("display", "widescreen", g_sv[g_SV_WIDE]);
ini_write_real("gameplay", "players", g_sv[g_SV_PLAYERS]);
ini_write_real("gameplay", "rounds", g_sv[g_SV_ROUNDS]);
if (g_lv_count > 0)
{
    ini_write_string("gameplay", "map", g_lv_id[clamp(g_sv[g_SV_MAP], 0, g_lv_count - 1)]);
    ini_write_string("gameplay", "map_astro", g_lv_id[clamp(g_sv[g_SV_MAP2], 0, g_lv_count - 1)]);
}
ini_close();
