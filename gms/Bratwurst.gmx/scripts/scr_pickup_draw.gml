/// scr_pickup_draw()
// Race (D-056): ritar de aktiva pickuppunkterna som runda bollar (mjuk glod, mork karna och en pulserande ring i orange), tydligt annorlunda an malrutan.
var i, sx, sy, r, pul;
r = max(7, g_PU_RADIUS * g_zoom / 32768 * g_SCALE);
pul = 1 + 0.12 * sin(g_tick * 0.12);
for (i = 0; i < g_pk_n; i += 1)
{
    if (g_pk_on[i])
    {
        sx = g_OX + (g_pk_x[i] * g_zoom / 32768 - g_cam_x + g_CX) * g_SCALE;
        sy = g_OY + (g_pk_y[i] * g_zoom / 32768 - g_cam_y + g_CY) * g_SCALE;
        draw_set_blend_mode(bm_add);
        draw_set_color(g_c[9]);
        draw_set_alpha(0.22);
        draw_circle(sx, sy, r * 1.6 * pul, false);
        draw_set_blend_mode(bm_normal);
        draw_set_alpha(1);
        draw_set_color(g_c[0]);
        draw_circle(sx, sy, r, false);
        draw_set_color(g_c[9]);
        draw_circle(sx, sy, r, true);
        draw_circle(sx, sy, r * 0.55 * pul, false);
    }
}
