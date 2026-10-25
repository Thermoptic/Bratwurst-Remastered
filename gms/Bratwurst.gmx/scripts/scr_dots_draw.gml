/// scr_dots_draw()
// Ritar orienteringspunkterna (D-043): fasta fargade pixlar i ett gitter med 100 pixlars mellanrum over arenan, bara till for att spelaren ska kunna se var man ar och
// hur fort man ror sig nar inga andra foremal syns. De syns bara nar kameran ar inzoomad: full styrka vid zoom >= g_DOT_ZHI, tonar ut mot g_DOT_ZLO och ar
// borta darunder. Bara de punkter som ligger i bilden ritas. Kors i obj_game fore vaggar och skepp.
var al, wxa, wxb, wya, wyb, i0, i1, j0, j1, i, j, sx, sy, sz;
if (g_dot_ni <= 0) { exit; }
al = clamp((g_zoom - g_DOT_ZLO) / (g_DOT_ZHI - g_DOT_ZLO), 0, 1);
if (al <= 0.01) { exit; }
// synligt omrade i varldskoordinater (omvandling av scr_w2s: u = floor(w * zoom / 32768) - cam + CX)
wxa = (g_cam_x - g_CX) * 32768 / g_zoom;
wxb = (g_PLAY_W + g_cam_x - g_CX) * 32768 / g_zoom;
wya = (g_cam_y - g_CY) * 32768 / g_zoom;
wyb = (g_PLAY_H + g_cam_y - g_CY) * 32768 / g_zoom;
i0 = max(g_dot_i0, floor(wxa / g_DOT_STEP));
i1 = min(g_dot_i0 + g_dot_ni - 1, ceil(wxb / g_DOT_STEP));
j0 = max(g_dot_j0, floor(wya / g_DOT_STEP));
j1 = min(g_dot_j0 + g_dot_nj - 1, ceil(wyb / g_DOT_STEP));
sz = max(1, g_SCALE);
draw_set_color(g_dot_col);
draw_set_alpha(al * 0.75);
for (i = i0; i <= i1; i += 1)
{
    for (j = j0; j <= j1; j += 1)
    {
        if (g_dot_ok[(i - g_dot_i0) * g_dot_nj + (j - g_dot_j0)])
        {
            sx = g_OX + (floor(i * g_DOT_STEP * g_zoom / 32768) - g_cam_x + g_CX) * g_SCALE;
            sy = g_OY + (floor(j * g_DOT_STEP * g_zoom / 32768) - g_cam_y + g_CY) * g_SCALE;
            draw_rectangle(sx, sy, sx + sz - 1, sy + sz - 1, false);
        }
    }
}
draw_set_alpha(1);
