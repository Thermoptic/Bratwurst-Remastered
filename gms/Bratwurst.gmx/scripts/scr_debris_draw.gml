/// scr_debris_draw()
// Ritar skeppsdelarna som linjer i spelarens farg; de blinkar sista halvsekunden. Kors i obj_game.
var i, x1, y1, x2, y2;
for (i = 0; i < g_DB_MAX; i += 1)
{
    if (g_db_life[i] > 0)
    {
        if (g_db_life[i] > 25 || (g_db_life[i] mod 6) < 3)
        {
            x1 = g_OX + scr_w2s_x(g_db_x[i] - g_db_hx[i]) * g_SCALE;
            y1 = g_OY + scr_w2s_y(g_db_y[i] - g_db_hy[i]) * g_SCALE;
            x2 = g_OX + scr_w2s_x(g_db_x[i] + g_db_hx[i]) * g_SCALE;
            y2 = g_OY + scr_w2s_y(g_db_y[i] + g_db_hy[i]) * g_SCALE;
            draw_set_color(g_db_col[i]);
            draw_line(x1, y1, x2, y2);
        }
    }
}
