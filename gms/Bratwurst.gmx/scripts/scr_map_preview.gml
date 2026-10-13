/// scr_map_preview(x, y, w, h, map_index)
// Bild pa en bana (huvudmenyns datapanel nar raden MAP ar vald): vaggobjekten i sina temafarger (samma ordning som i matchen) och spelarnas
// startplatser med riktning, skalade in i rutan. Banan laddas en gang per val till redigerarens arrayer (g_ed_*) och cachas med g_pv_idx;
// g_pv_idx = -1 tvingar ny inlasning (anropas efter andrad bana). Kors i obj_game.
var cx, cy, es, s, i, j, k, sx, sy;
if (g_pv_idx != argument4)
{
    scr_level_read(argument4);
    g_pv_idx = argument4;
}
draw_set_color(g_c[1]);
draw_set_alpha(0.7);
draw_rectangle(argument0, argument1, argument0 + argument2, argument1 + argument3, false);
draw_set_alpha(1);
draw_set_color(g_c[3]);
draw_rectangle(argument0, argument1, argument0 + argument2, argument1 + argument3, true);
es = min((argument2 - 14) / 6200, (argument3 - 14) / 4800);
cx = argument0 + argument2 / 2;
cy = argument1 + argument3 / 2;
for (s = 0; s < g_ed_n; s += 1)
{
    draw_set_color(g_wcol[s mod 11]);
    for (i = 0; i < g_ed_pn[s]; i += 1)
    {
        j = (i + 1) mod g_ed_pn[s];
        draw_line(cx + g_ed_px[s, i] * es, cy + g_ed_py[s, i] * es, cx + g_ed_px[s, j] * es, cy + g_ed_py[s, j] * es);
    }
}
for (k = 0; k < 4; k += 1)
{
    sx = cx + (g_ed_sx[k] / 256) * es;
    sy = cy + (g_ed_sy[k] / 256) * es;
    scr_ui_ship(g_pship[k], sx, sy, 0.07, g_ed_sa[k], g_pc[k], -1, false);
}
