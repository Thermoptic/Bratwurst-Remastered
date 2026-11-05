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
for (k = 0; k < lc; k += 1) { g_wall_gh[k] = false; }   // inga spoklinjer; Super Smashwurst markerar ytterramen efterat (scr_sw_prepare, D-085)
// Race (D-054): start/malrutan (normaliserad ruta, riktningsvektor och halv bredd tvars riktningen)
g_fin_on = g_ed_fon;
if (g_fin_on)
{
    g_fin_x0 = min(g_ed_fx0, g_ed_fx1); g_fin_x1 = max(g_ed_fx0, g_ed_fx1);
    g_fin_y0 = min(g_ed_fy0, g_ed_fy1); g_fin_y1 = max(g_ed_fy0, g_ed_fy1);
    g_fin_cx = (g_fin_x0 + g_fin_x1) / 2;
    g_fin_cy = (g_fin_y0 + g_fin_y1) / 2;
    g_fin_dir = g_ed_fdir;
    g_fin_dx = 0; g_fin_dy = 0;
    if (g_fin_dir == 0) { g_fin_dy = -1; }
    if (g_fin_dir == 1) { g_fin_dx = 1; }
    if (g_fin_dir == 2) { g_fin_dy = 1; }
    if (g_fin_dir == 3) { g_fin_dx = -1; }
    if (g_fin_dx != 0) { g_fin_hw = (g_fin_y1 - g_fin_y0) / 2; } else { g_fin_hw = (g_fin_x1 - g_fin_x0) / 2; }
}
// Race (D-056): pickuppunkter (aktiva fran start, scr_race_reset nollstaller dem)
g_pk_n = g_ed_pk_n;
for (k = 0; k < g_pk_n; k += 1)
{
    g_pk_x[k] = g_ed_pkx[k];
    g_pk_y[k] = g_ed_pky[k];
    g_pk_on[k] = true;
    g_pk_t[k] = 0;
}
// Capture the Bratwurst (D-082): zonerna och korvens startpunkt (icke-solida, ingen vagg)
for (k = 0; k < 2; k += 1)
{
    g_ctz_on[k] = g_ed_zon[k];
    g_ctz_x0[k] = g_ed_zx0[k]; g_ctz_y0[k] = g_ed_zy0[k];
    g_ctz_x1[k] = g_ed_zx1[k]; g_ctz_y1[k] = g_ed_zy1[k];
}
g_cts_on = g_ed_son;
g_cts_x = g_ed_sox;
g_cts_y = g_ed_soy;
for (k = 0; k < 4; k += 1)
{
    g_start_x[k] = g_ed_sx[k];
    g_start_y[k] = g_ed_sy[k];
    g_start_ang[k] = g_ed_sa[k];
}
