/// scr_solid_walls_draw()
// Fyller banans solida foremal med sin vaggfarg (Options -> SOLID COLORS ON). Kors i obj_game fore vaggarnas linjer (som da ritas ovanpa). Anvander
// samma varld-till-skarm-formel som vaggarna (scr_w2s_x/y) sa att fyllningen och konturen sammanfaller.
var k, j, wx, wy, sx, sy, wx2, wy2, ox, oy;
if (!g_sv[g_SV_SOLID] || g_wf_n <= 0) { exit; }
draw_set_alpha(1);
// samma forskjutna kopior som for skeppen (se scr_ship_fill): tacker pixelraden pa hoger/nedre kant som grafikkortets fyllregel lamnar tom
for (ox = 0; ox <= g_FILL_EXPAND; ox += 1)
{
    for (oy = 0; oy <= g_FILL_EXPAND; oy += 1)
    {
        draw_primitive_begin(pr_trianglelist);
        for (k = 0; k < g_wf_n; k += 1)
        {
            for (j = 0; j < 3; j += 1)
            {
                wx = g_wf_tri[k * 6 + j * 2];
                wy = g_wf_tri[k * 6 + j * 2 + 1];
                sx = g_OX + (floor(wx * g_zoom / 32768) - g_cam_x + g_CX) * g_SCALE + ox;
                sy = g_OY + (floor(wy * g_zoom / 32768) - g_cam_y + g_CY) * g_SCALE + oy;
                draw_vertex_colour(sx, sy, g_wcol[g_wf_col[k]], 1);
            }
        }
        draw_primitive_end();
    }
}
// trianglarnas kanter som linjer i samma farg: tacker pixelraden som grafikkortets fyllregel lamnar pa hoger/nedre kant (se scr_ship_fill)
for (k = 0; k < g_wf_n; k += 1)
{
    for (j = 0; j < 3; j += 1)
    {
        wx = g_wf_tri[k * 6 + j * 2];
        wy = g_wf_tri[k * 6 + j * 2 + 1];
        wx2 = g_wf_tri[k * 6 + ((j + 1) mod 3) * 2];
        wy2 = g_wf_tri[k * 6 + ((j + 1) mod 3) * 2 + 1];
        draw_line_colour(g_OX + (floor(wx * g_zoom / 32768) - g_cam_x + g_CX) * g_SCALE, g_OY + (floor(wy * g_zoom / 32768) - g_cam_y + g_CY) * g_SCALE,
                         g_OX + (floor(wx2 * g_zoom / 32768) - g_cam_x + g_CX) * g_SCALE, g_OY + (floor(wy2 * g_zoom / 32768) - g_cam_y + g_CY) * g_SCALE,
                         g_wcol[g_wf_col[k]], g_wcol[g_wf_col[k]]);
    }
}
