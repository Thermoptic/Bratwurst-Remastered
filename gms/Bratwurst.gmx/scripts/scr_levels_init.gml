/// scr_levels_init()
// Ser till att levels.ini finns (inbyggda banor skrivs vid forsta start) och laser banlistan.
var v;
ini_open("levels.ini");
v = ini_read_string("meta", "version", "");
ini_close();
if (v == "v1") { scr_levels_strip_outer(); }   // v1 -> v2: yttre ramlinjen bort (D-033)
else if (v != "v2" && v != "v3" && v != "v4") { scr_levels_write_defaults(); }
ini_open("levels.ini");
v = ini_read_string("meta", "version", "");
ini_close();
if (v == "v2") { scr_levels_race_migrate(); }   // v2 -> v3: Race bara pa banor med malruta (D-062)
ini_open("levels.ini");
v = ini_read_string("meta", "version", "");
ini_close();
if (v == "v3") { scr_levels_ctb_migrate(); }   // v3 -> v4: Capture the Bratwurst bara pa banor med korvstart (D-083)
scr_levels_reload();
if (g_lv_count == 0)
{
    scr_levels_write_defaults();
    scr_levels_reload();
}
