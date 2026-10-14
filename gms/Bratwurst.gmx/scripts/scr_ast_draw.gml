/// scr_ast_draw()
// Asteroids: ritar stenarna som oregelbundna polygoner (12 hornpunkter, kontur i en ljus temafarg; med Options -> SOLID COLORS ON fylls de ocksa som en
// solfjader, och fyllningen forskjuts som i scr_ship_fill for att tacka kanten). Samma varld-till-skarm-formel som vaggarna. Kors i obj_game, bara i spellage 4.
var k, j, sh, rad, ca, sa, ux, uy, wx, wy, sx, sy, ox, oy, px0, py0, fx, fy, vxa, vxb, vya, vyb;
if (g_game_mode != 4) { exit; }
// synligt varldsomrade (som i scr_dots_draw): stenar utanfor bilden ritas inte
vxa = (g_cam_x - g_CX) * 32768 / g_zoom;
vxb = (g_PLAY_W + g_cam_x - g_CX) * 32768 / g_zoom;
vya = (g_cam_y - g_CY) * 32768 / g_zoom;
vyb = (g_PLAY_H + g_cam_y - g_CY) * 32768 / g_zoom;
for (k = 0; k < g_AS_MAX; k += 1)
{
    if (g_as_on[k] && g_as_x[k] > vxa - 140 && g_as_x[k] < vxb + 140 && g_as_y[k] > vya - 140 && g_as_y[k] < vyb + 140)
    {
        sh = g_as_sh[k] * 12;
        rad = g_AS_R[g_as_sz[k]];
        ca = cos(g_as_a[k]);
        sa = sin(g_as_a[k]);
        // hornpunkter i skarmkoordinater (i g_as_px / g_as_py, 12 st)
        for (j = 0; j < 12; j += 1)
        {
            ux = g_as_shx[sh + j];
            uy = g_as_shy[sh + j];
            wx = g_as_x[k] + (ux * ca - uy * sa) * rad;
            wy = g_as_y[k] + (ux * sa + uy * ca) * rad;
            g_as_px[j] = g_OX + (floor(wx * g_zoom / 32768) - g_cam_x + g_CX) * g_SCALE;
            g_as_py[j] = g_OY + (floor(wy * g_zoom / 32768) - g_cam_y + g_CY) * g_SCALE;
        }
        if (g_sv[g_SV_SOLID])
        {
            px0 = g_OX + (floor(g_as_x[k] * g_zoom / 32768) - g_cam_x + g_CX) * g_SCALE;
            py0 = g_OY + (floor(g_as_y[k] * g_zoom / 32768) - g_cam_y + g_CY) * g_SCALE;
            for (ox = 0; ox <= g_FILL_EXPAND; ox += 1)
            {
                for (oy = 0; oy <= g_FILL_EXPAND; oy += 1)
                {
                    draw_primitive_begin(pr_trianglefan);
                    draw_vertex_colour(px0 + ox, py0 + oy, g_c[2], 1);
                    for (j = 0; j < 12; j += 1) { draw_vertex_colour(g_as_px[j] + ox, g_as_py[j] + oy, g_c[2], 1); }
                    draw_vertex_colour(g_as_px[0] + ox, g_as_py[0] + oy, g_c[2], 1);
                    draw_primitive_end();
                }
            }
        }
        draw_set_color(g_c[6]);
        for (j = 0; j < 12; j += 1)
        {
            draw_line(g_as_px[j], g_as_py[j], g_as_px[(j + 1) mod 12], g_as_py[(j + 1) mod 12]);
        }
    }
}
