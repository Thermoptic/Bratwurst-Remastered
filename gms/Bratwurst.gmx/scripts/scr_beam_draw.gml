/// scr_beam_draw()
// Ritar railgunstralarna: en rak linje i agarens farg fran skeppets nos till stralens huvud (additiv glod runt en ljusare karna), huvudet lyser medan stralen far fram,
// och hela stralen tonar ut efter BEAM HOLD TIME. Ritas ovanpa allt i spelytan (vaggar, foremal, skepp). Kors i obj_game.
var k, age, prog, hd, a, w, x1, y1, x2, y2, col;
draw_set_blend_mode(bm_add);
for (k = 0; k < g_BM_MAX; k += 1)
{
    if (g_bm_on[k])
    {
        age = g_bm_age[k];
        prog = min(1, age / g_bm_sweep[k]);
        hd = g_bm_len[k] * prog;
        a = 1;
        if (age > g_bm_sweep[k] + g_bm_hold[k]) { a = max(0, 1 - (age - g_bm_sweep[k] - g_bm_hold[k]) / g_bm_fade[k]); }
        col = g_bm_col[k];
        x1 = g_OX + (g_bm_x[k] * g_zoom / 32768 - g_cam_x + g_CX) * g_SCALE;
        y1 = g_OY + (g_bm_y[k] * g_zoom / 32768 - g_cam_y + g_CY) * g_SCALE;
        x2 = g_OX + ((g_bm_x[k] + g_bm_dx[k] * hd) * g_zoom / 32768 - g_cam_x + g_CX) * g_SCALE;
        y2 = g_OY + ((g_bm_y[k] + g_bm_dy[k] * hd) * g_zoom / 32768 - g_cam_y + g_CY) * g_SCALE;
        w = max(2, g_bm_w[k] * g_zoom / 32768 * g_SCALE);
        draw_set_color(col);
        draw_set_alpha(0.22 * a);
        draw_line_width(x1, y1, x2, y2, w * 3.6);
        draw_set_alpha(0.6 * a);
        draw_line_width(x1, y1, x2, y2, w * 1.5);
        draw_set_color(merge_colour(col, c_white, 0.55));
        draw_set_alpha(a);
        draw_line_width(x1, y1, x2, y2, max(1, w * 0.55));
        // startblixt vid kanonen och lysande huvud medan stralen far fram
        if (age < 8)
        {
            draw_set_color(col);
            draw_set_alpha(0.5 * (1 - age / 8));
            draw_circle(x1, y1, w * (2 + age), false);
        }
        if (prog < 1)
        {
            draw_set_color(merge_colour(col, c_white, 0.7));
            draw_set_alpha(0.9);
            draw_circle(x2, y2, w * 1.8, false);
        }
    }
}
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
