/// scr_set_defaults()
// Standardinstallningar: tema dracula, gron accent, 1X, vsync pa, scanlines pa, glod pa, 2 spelare.
var t, pt, pk;
g_sv[g_SV_THEME] = 0;
for (t = 0; t < g_th_count; t += 1)
{
    if (g_th_id[t] == "dracula") { g_sv[g_SV_THEME] = t; }   // standardtema: Dracula (ett valt tema sparas i settings.ini och vinner over standard)
}
g_sv[g_SV_ACCENT] = 3;
g_sv[g_SV_SCALE] = 0;
g_sv[g_SV_VSYNC] = 1;
g_sv[g_SV_SCAN] = 1;
g_sv[g_SV_GLOW] = 1;
g_sv[g_SV_PLAYERS] = 2;
g_sv[g_SV_WIDE] = 1;
g_sv[g_SV_MAP] = 0;
g_sv[g_SV_MAP2] = 0;
g_sv[g_SV_ROUNDS] = 3;
g_sv[g_SV_MUSIC] = 1;
g_sv[g_SV_VOL] = 7;   // musikvolym i steg om 10 % (1..10), standard 70 %
g_sv[g_SV_ADLIVES] = 1;
g_sv[g_SV_PUCL] = 1;   // powerups ON som standard i alla spellagen
g_sv[g_SV_PUAD] = 1;
for (pt = 0; pt < g_PU_COUNT; pt += 1)
{
    for (pk = 0; pk < g_pu_np[pt]; pk += 1) { g_sv[g_SV_PU + pt * 8 + pk] = g_pu_pdef[pt, pk]; }
}
g_sv[g_SV_LIVES] = g_START_LIVES;   // Classic: liv per runda, hogst originalets 6
g_sv[g_SV_SFX] = 1;
