/// scr_level_apply()
// Gor redigerarens arrayer (efter scr_level_read) till spelets vaggdata: punkter g_wall_px/py, linjer g_wall_a/b (varje polygon sluten),
// avgransningsboxar och startplatser g_start_x/y/ang. Alla former ar solida hinder (skeppen kolliderar med deras linjer).
var s, i, pc, lc, base, a, b, k;
pc = 0;
lc = 0;
for (s = 0; s < g_ed_n; s += 1)
{
    base = pc;
    for (i = 0; i < g_ed_pn[s]; i += 1)
    {
        g_wall_px[pc] = g_ed_px[s, i];
        g_wall_py[pc] = g_ed_py[s, i];
        pc += 1;
    }
    for (i = 0; i < g_ed_pn[s]; i += 1)
    {
        a = base + i;
        b = base + ((i + 1) mod g_ed_pn[s]);
        g_wall_a[lc] = a;
        g_wall_b[lc] = b;
        g_wall_minx[lc] = min(g_wall_px[a], g_wall_px[b]);
        g_wall_maxx[lc] = max(g_wall_px[a], g_wall_px[b]);
        g_wall_miny[lc] = min(g_wall_py[a], g_wall_py[b]);
        g_wall_maxy[lc] = max(g_wall_py[a], g_wall_py[b]);
        lc += 1;
    }
}
g_wall_n = lc;
for (k = 0; k < 4; k += 1)
{
    g_start_x[k] = g_ed_sx[k];
    g_start_y[k] = g_ed_sy[k];
    g_start_ang[k] = g_ed_sa[k];
}
