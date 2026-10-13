/// scr_level_write(section_id)
// Skriver redigerarens bana till levels.ini under sektionen section_id (ersatter den).
var s, i, k, str;
ini_open("levels.ini");
ini_section_delete(argument0);
ini_write_string(argument0, "name", g_ed_name);
ini_write_real(argument0, "modes", g_ed_modes);
ini_write_real(argument0, "shapes", g_ed_n);
for (s = 0; s < g_ed_n; s += 1)
{
    str = "";
    for (i = 0; i < g_ed_pn[s]; i += 1)
    {
        if (i > 0) { str += ";"; }
        str += string(round(g_ed_px[s, i])) + "," + string(round(g_ed_py[s, i]));
    }
    ini_write_string(argument0, "s" + string(s), str);
}
for (k = 0; k < 4; k += 1)
{
    ini_write_string(argument0, "p" + string(k), string(round(g_ed_sx[k])) + "," + string(round(g_ed_sy[k])) + "," + string(round(g_ed_sa[k])));
}
ini_close();
