/// scr_frame_line_draw(wall_line)
// Ritar ett segment av arenans ytterram (D-066) med tonande synlighet: segmentet delas i delar (hogst 150 varldspixlar var) och varje del far en alfa efter sitt
// avstand till narmaste levande skepp: osynlig langre bort an g_FR_FAR, full synlighet narmare an g_FR_NEAR, mjuk overgang (smoothstep) emellan. Fargen ar
// vaggobjektets egen. Kollisionen ar oforandrad: ramen finns hela tiden, den syns bara nar man narmar sig.
var k, a, b, wx1, wy1, wx2, wy2, len, n, i, t0, t1, mx, my, d, j, al, sx1, sy1, sx2, sy2;
k = argument0;
a = g_wall_a[k];
b = g_wall_b[k];
wx1 = g_wall_px[a]; wy1 = g_wall_py[a]; wx2 = g_wall_px[b]; wy2 = g_wall_py[b];
if (g_fd_n <= 0) { exit; }
len = point_distance(wx1, wy1, wx2, wy2);
n = clamp(ceil(len / 150), 1, 60);
draw_set_color(g_wcol[g_wall_grp[k] mod 11]);
for (i = 0; i < n; i += 1)
{
    t0 = i / n;
    t1 = (i + 1) / n;
    mx = wx1 + (wx2 - wx1) * (t0 + t1) / 2;
    my = wy1 + (wy2 - wy1) * (t0 + t1) / 2;
    d = 999999;
    for (j = 0; j < g_fd_n; j += 1) { d = min(d, point_distance(mx, my, g_fd_x[j], g_fd_y[j])); }
    al = clamp((g_FR_FAR - d) / (g_FR_FAR - g_FR_NEAR), 0, 1);
    al = al * al * (3 - 2 * al);
    if (al > 0.02)
    {
        sx1 = g_OX + scr_w2s_x(wx1 + (wx2 - wx1) * t0) * g_SCALE;
        sy1 = g_OY + scr_w2s_y(wy1 + (wy2 - wy1) * t0) * g_SCALE;
        sx2 = g_OX + scr_w2s_x(wx1 + (wx2 - wx1) * t1) * g_SCALE;
        sy2 = g_OY + scr_w2s_y(wy1 + (wy2 - wy1) * t1) * g_SCALE;
        draw_set_alpha(al);
        draw_line(sx1, sy1, sx2, sy2);
    }
}
draw_set_alpha(1);
