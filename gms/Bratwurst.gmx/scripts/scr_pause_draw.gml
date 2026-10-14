/// scr_pause_draw()
// Ritar pausmenyn over matchen: nedtonad bild, en ruta med RESUME GAME och QUIT TO MENU (vald rad markerad som i huvudmenyn).
var px, py, pw, ph, r, ry, lbl, c;
pw = 360;
ph = 190;
px = g_vx + floor((g_vw - pw) / 2);
py = g_vy + floor((g_vh - ph) / 2);
draw_set_color(g_c[0]);
draw_set_alpha(0.6);
draw_rectangle(g_vx - 4, g_vy - 4, g_vx + g_vw + 4, g_vy + g_vh + 4, false);
draw_set_alpha(1);
scr_ui_pane(px, py, pw, ph, "PAUSED", g_acc);
for (r = 0; r < 2; r += 1)
{
    ry = py + 34 + r * 50;
    if (r == 0) { lbl = "RESUME GAME"; } else { lbl = "QUIT TO MENU"; }
    if (g_pause_sel == r)
    {
        draw_set_color(g_c[1]);
        draw_rectangle(px + 20, ry, px + pw - 20, ry + 40, false);
        draw_set_color(g_acc);
        draw_rectangle(px + 20, ry, px + 23, ry + 40, false);
        c = g_acc;
    }
    else { c = g_c[4]; }
    g_fs = g_f_lg;
    scr_ui_text(px + 40, ry + 8, lbl, c);
}
g_fs = g_f_sm;
scr_ui_text_c(px + pw / 2, py + ph - 32, "UP/DOWN   ENTER OR START OK   ESC BACK", g_c[3]);
