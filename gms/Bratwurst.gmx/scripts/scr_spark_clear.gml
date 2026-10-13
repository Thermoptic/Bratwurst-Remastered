/// scr_spark_clear()
// Tomar gnistpoolen (vid ny match och ny runda). Poolen: g_sp_*[0..g_SP_MAX-1], g_sp_life[i] > 0 = aktiv.
var i;
for (i = 0; i < g_SP_MAX; i += 1) { g_sp_life[i] = 0; }
g_sp_next = 0;
scr_debris_clear();
