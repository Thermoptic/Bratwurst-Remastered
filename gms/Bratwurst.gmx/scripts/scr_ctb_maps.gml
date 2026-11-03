/// scr_ctb_maps()
// Capture the Bratwurst (D-080): antal banor som ar markerade for Capture the Bratwurst (bit 3 i g_lv_modes). Om de har korvstart och zoner kontrolleras vid START (scr_ctb_validate).
var k, n;
n = 0;
for (k = 0; k < g_lv_count; k += 1) { if (scr_level_allowed(3, k)) { n += 1; } }
return n;
