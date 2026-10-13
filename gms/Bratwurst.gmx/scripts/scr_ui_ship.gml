/// scr_ui_ship(ship, cx, cy, k, angle256, colour, highlight_pod, show_pods)
// show_pods = true: alla pods markeras (skeppsvalet). show_pods = false och highlight_pod >= 0: bara den podden som en liten prick (spelarpanelen).
// Ritar ett skepps vektorform roterad (samma matematik som skeppsvalet/spelet). highlight_pod = podindex eller -1. Kors i obj_game.
var sh, cx, cy, k, a, sn, cs, j, xs, ys, x1, y1, x2, y2, rx, ry;
sh = argument0; cx = argument1; cy = argument2; k = argument3;
a = argument4 mod 256;
if (a < 0) { a += 256; }
sp_vx[0] = 0; sp_vy[0] = 0;
sn = g_sin_tab[a];
cs = g_cos_tab[a];
for (j = 0; j < g_ship_np[sh]; j += 1)
{
    xs = g_ship_pts[sh, 2 * j] * k;
    ys = g_ship_pts[sh, 2 * j + 1] * k;
    sp_vx[j] = cx + (xs * cs + ys * sn) / 256;
    sp_vy[j] = cy + (xs * sn - ys * cs) / 256;
}
draw_set_color(argument5);
for (j = 0; j < g_ship_nl[sh]; j += 1)
{
    x1 = sp_vx[g_ship_lines[sh, 2 * j]];
    y1 = sp_vy[g_ship_lines[sh, 2 * j]];
    x2 = sp_vx[g_ship_lines[sh, 2 * j + 1]];
    y2 = sp_vy[g_ship_lines[sh, 2 * j + 1]];
    draw_line(x1, y1, x2, y2);
}
if (!argument7 && argument6 >= 0)
{
    xs = g_ship_pods[sh, 2 * argument6] * k;
    ys = g_ship_pods[sh, 2 * argument6 + 1] * k;
    draw_circle(cx + (xs * cs + ys * sn) / 256, cy + (xs * sn - ys * cs) / 256, 2.5, false);
}
if (argument7)
{
    for (j = 0; j < g_ship_nk[sh]; j += 1)
    {
        xs = g_ship_pods[sh, 2 * j] * k;
        ys = g_ship_pods[sh, 2 * j + 1] * k;
        rx = cx + (xs * cs + ys * sn) / 256;
        ry = cy + (xs * sn - ys * cs) / 256;
        if (j == argument6) { draw_circle(rx, ry, 5, false); }
        else if (g_ship_pod_flag[sh, j] != 0) { draw_circle(rx, ry, 3, true); }
        else { draw_circle(rx, ry, 1, false); }
    }
}
