/// scr_set_defaults()
// Standardinstallningar: tema nord, gron accent, 1X, vsync pa, scanlines pa, glod pa, 2 spelare.
var t;
g_sv[g_SV_THEME] = 0;
for (t = 0; t < g_th_count; t += 1)
{
    if (g_th_id[t] == "nord") { g_sv[g_SV_THEME] = t; }
}
g_sv[g_SV_ACCENT] = 3;
g_sv[g_SV_SCALE] = 0;
g_sv[g_SV_VSYNC] = 1;
g_sv[g_SV_SCAN] = 1;
g_sv[g_SV_GLOW] = 1;
g_sv[g_SV_PLAYERS] = 2;
