/// scr_debris_clear()
// Tomar poolen med skeppsdelar (g_db_*[0..g_DB_MAX-1], g_db_life[i] > 0 = aktiv).
var i;
for (i = 0; i < g_DB_MAX; i += 1) { g_db_life[i] = 0; }
