/// scr_race_maps()
// Race (D-062): antal banor som ar markerade for Race (bit 2 i g_lv_modes).
var k, n;
n = 0;
for (k = 0; k < g_lv_count; k += 1) { if (scr_level_allowed(2, k)) { n += 1; } }
return n;
