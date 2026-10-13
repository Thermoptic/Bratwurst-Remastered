/// scr_levels_write_defaults()
// Skriver de inbyggda banorna (scr_data_levels) till levels.ini. Anropas bara om filen saknas (meta.version).
// Format: [index] count, next, id0..; [<id>] name, shapes, s0.. (polygoner "x,y;x,y;..." i varldspixlar), p0..p3 (startplatser "x,y,vinkel" i 1/256 px).
var m, j, k, sec;
ini_open("levels.ini");
ini_write_string("meta", "version", "v1");
ini_write_string("meta", "info", "Maps for Bratwurst. Each shape is a closed polygon of world pixel points. Edit in the in-game map editor.");
ini_write_real("index", "count", g_dl_count);
ini_write_real("index", "next", g_dl_count);
for (m = 0; m < g_dl_count; m += 1)
{
    sec = g_dl_id[m];
    ini_write_string("index", "id" + string(m), sec);
    ini_write_string(sec, "name", g_dl_name[m]);
    ini_write_real(sec, "shapes", g_dl_n[m]);
    for (j = 0; j < g_dl_n[m]; j += 1) { ini_write_string(sec, "s" + string(j), g_dl_shape[m, j]); }
    for (k = 0; k < 4; k += 1) { ini_write_string(sec, "p" + string(k), g_dl_spawn[m, k]); }
}
ini_close();
