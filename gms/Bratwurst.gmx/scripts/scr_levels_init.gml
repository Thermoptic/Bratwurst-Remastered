/// scr_levels_init()
// Ser till att levels.ini finns (inbyggda banor skrivs vid forsta start) och laser banlistan.
var v;
ini_open("levels.ini");
v = ini_read_string("meta", "version", "");
ini_close();
if (v == "v1") { scr_levels_strip_outer(); }   // v1 -> v2: yttre ramlinjen bort (D-033)
else if (v != "v2") { scr_levels_write_defaults(); }
scr_levels_reload();
if (g_lv_count == 0)
{
    scr_levels_write_defaults();
    scr_levels_reload();
}
