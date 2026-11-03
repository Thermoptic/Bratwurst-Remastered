/// scr_ctb_draw()
// Capture the Bratwurst (D-082): ritar lagens zoner (genomskinlig fyllning och kontur i lagfarg; de ar inte solida) och korven (korvmodellen g_SAUSAGE, samma ritsatt
// som skeppen: punkterna skalas med g_zoom / 65536 och roteras med sin/cos-tabellerna). Korven vaxer fran 0 till full storlek under spawn-animationen. Kors i
// scr_match_draw fore skeppen. Allt som hamnar utanfor spelytan tacks over av bakgrunden efterat.
var k, sx0, sy0, sx1, sy1, j, a, sn, cs, xs, ys, rx, ry, bx, by, sc, col, pa;
for (k = 0; k < 2; k += 1)
{
    if (g_ctz_on[k])
    {
        sx0 = g_OX + scr_w2s_x(g_ctz_x0[k]) * g_SCALE; sy0 = g_OY + scr_w2s_y(g_ctz_y0[k]) * g_SCALE;
        sx1 = g_OX + scr_w2s_x(g_ctz_x1[k]) * g_SCALE; sy1 = g_OY + scr_w2s_y(g_ctz_y1[k]) * g_SCALE;
        draw_set_color(g_team_col[k]);
        draw_set_alpha(0.12);
        draw_rectangle(sx0, sy0, sx1, sy1, false);
        draw_set_alpha(1);
        draw_rectangle(sx0, sy0, sx1, sy1, true);
    }
}
if (g_sa_st == 3) { exit; }
sc = g_CT_SIZE;
if (g_sa_st == 0) { sc = g_CT_SIZE * (g_sa_t / 50); }
if (sc <= 0.01) { exit; }
col = g_c[10];
a = floor(g_sa_ang) mod 256;
sn = g_sin_tab[a];
cs = g_cos_tab[a];
bx = scr_w2s_x(floor(g_sa_x));
by = scr_w2s_y(floor(g_sa_y));
sc_x[0] = 0; sc_y[0] = 0;
for (j = 0; j < g_ship_np[g_SAUSAGE]; j += 1)
{
    xs = floor(g_ship_pts[g_SAUSAGE, 2 * j] * sc * g_zoom / 65536);
    ys = floor(g_ship_pts[g_SAUSAGE, 2 * j + 1] * sc * g_zoom / 65536);
    rx = floor((xs * cs + ys * sn) / 256);
    ry = floor((xs * sn - ys * cs) / 256);
    sc_x[j] = bx + rx;
    sc_y[j] = by + ry;
}
draw_set_color(col);
for (j = 0; j < g_ship_nl[g_SAUSAGE]; j += 1)
{
    draw_line(g_OX + sc_x[g_ship_lines[g_SAUSAGE, 2 * j]] * g_SCALE, g_OY + sc_y[g_ship_lines[g_SAUSAGE, 2 * j]] * g_SCALE,
              g_OX + sc_x[g_ship_lines[g_SAUSAGE, 2 * j + 1]] * g_SCALE, g_OY + sc_y[g_ship_lines[g_SAUSAGE, 2 * j + 1]] * g_SCALE);
}
