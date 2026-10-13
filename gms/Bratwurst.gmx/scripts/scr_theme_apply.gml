/// scr_theme_apply()
// Satter de 16 temafargerna g_c[0..15] (base00..base0F) fran themes.ini (reserv: inbyggd data) och accentfargen g_acc.
var t, k, sec, col;
t = g_sv[g_SV_THEME];
sec = g_th_id[t];
ini_open("themes.ini");
for (k = 0; k < 16; k += 1)
{
    col = scr_hex_parse(ini_read_string(sec, "base0" + string_char_at("0123456789ABCDEF", k + 1), g_th_hex[t, k]));
    if (col < 0) { col = g_th_col[t, k]; }
    g_c[k] = col;
}
ini_close();
g_acc = g_c[8 + g_sv[g_SV_ACCENT]];
scr_theme_players();
