/// scr_levels_reload()
// Laser banlistan (index) fran levels.ini till g_lv_count, g_lv_id[], g_lv_name[]. Uppdaterar menyradens max och valt kartindex.
var n, i, idn;
ini_open("levels.ini");
n = ini_read_real("index", "count", 0);
g_lv_count = 0;
for (i = 0; i < n; i += 1)
{
    idn = ini_read_string("index", "id" + string(i), "");
    if (idn != "" && ini_section_exists(idn))
    {
        g_lv_id[g_lv_count] = idn;
        g_lv_name[g_lv_count] = ini_read_string(idn, "name", idn);
        g_lv_count += 1;
    }
}
ini_close();
if (g_lv_count > 0)
{
    g_sv[g_SV_MAP] = clamp(g_sv[g_SV_MAP], 0, g_lv_count - 1);
    if (g_mn_map_node >= 0) { g_mn_max[g_mn_map_node] = g_lv_count - 1; }
    if (g_mn_map_node2 >= 0) { g_mn_max[g_mn_map_node2] = g_lv_count - 1; }
}
