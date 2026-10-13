/// scr_spark_draw()
// Ritar gnistorna som sma fyllda rutor (i spelytans koordinater, skalade med g_SCALE). Kors i obj_game.
var i, sx, sy, h;
for (i = 0; i < g_SP_MAX; i += 1)
{
    if (g_sp_life[i] > 0)
    {
        sx = g_OX + scr_w2s_x(floor(g_sp_x[i])) * g_SCALE;
        sy = g_OY + scr_w2s_y(floor(g_sp_y[i])) * g_SCALE;
        h = g_sp_size[i];
        draw_set_color(g_sp_col[i]);
        draw_rectangle(sx, sy, sx + h - 1, sy + h - 1, false);
    }
}
