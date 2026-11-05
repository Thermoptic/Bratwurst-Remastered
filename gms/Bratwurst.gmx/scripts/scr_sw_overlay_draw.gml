/// scr_sw_overlay_draw()
// Super Smashwurst (D-085): nedrakningen vid skeppet for varje spelare utanfor gransen (stor siffra och RETURN TO THE ARENA; gul, sedan rod och blinkande de sista 2 sekunderna) och
// meddelandet nar nagon elimineras (g_sw_msg, 3 s). Kors i scr_match_draw ovanpa allt i spelytan. Texten hall inom spelytan sa att den syns aven nar skeppet ligger langt utanfor bilden.
var pwx, phx, cx, cy, sx, sy, n, col, urgent;
pwx = g_PLAY_W * g_SCALE;
phx = g_PLAY_H * g_SCALE;
cx = g_OX + pwx / 2;
cy = g_OY + phx / 2;
with (obj_player)
{
    if (alive && sw_oob > 0)
    {
        sx = g_OX + scr_w2s_x(floor(px / 256)) * g_SCALE;
        sy = g_OY + scr_w2s_y(floor(py / 256)) * g_SCALE;
        sx = clamp(sx, g_OX + 90, g_OX + pwx - 90);
        sy = clamp(sy, g_OY + 80, g_OY + phx - 40);
        n = ceil(sw_oob / 50);
        urgent = (sw_oob <= 100);
        if (urgent) { col = g_c[8]; } else { col = g_c[10]; }
        if (urgent && (g_tick mod 10) < 4) { col = g_c[6]; }   // blinkar nar det ar bradskande
        g_fs = g_f_lg;
        scr_ui_text_c(sx, sy - 62, string(n), col);
        g_fs = g_f_sm;
        scr_ui_text_c(sx, sy - 28, "RETURN TO THE ARENA", col);
    }
}
if (g_state == 1 && g_sw_msgt > 0)
{
    g_fs = g_f_lg;
    scr_ui_text_c(cx, cy - 90, g_sw_msg, g_sw_msgc);
}
