/// scr_theme_ini_write()
// Skriver alla teman till themes.ini (en sektion per tema, base00..base0F som hex). Spelet laser fargerna darifran, sa filen kan redigeras
// och egna varden anvandas. Skrivs bara om filen saknas (meta.written).
var t, k, sec;
ini_open("themes.ini");
if (ini_read_string("meta", "written", "") != "v1")
{
    ini_write_string("meta", "written", "v1");
    ini_write_string("meta", "info", "Base16 colour themes (tinted-theming/schemes). Edit the hex values to change a theme.");
    for (t = 0; t < g_th_count; t += 1)
    {
        sec = g_th_id[t];
        ini_write_string(sec, "name", g_th_name[t]);
        for (k = 0; k < 16; k += 1)
        {
            ini_write_string(sec, "base0" + string_char_at("0123456789ABCDEF", k + 1), g_th_hex[t, k]);
        }
    }
}
ini_close();
