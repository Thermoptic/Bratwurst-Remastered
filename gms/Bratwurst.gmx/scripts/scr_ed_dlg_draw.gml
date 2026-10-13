/// scr_ed_dlg_draw()
// Ritar sparfonstret over redigeraren.
var x0, y0, m, ry, hov, c, mx, my;
scr_ed_dlg_layout();
x0 = g_dg_x;
y0 = g_dg_y;
mx = mouse_x;
my = mouse_y;
draw_set_color(g_c[0]);
draw_set_alpha(0.7);
draw_rectangle(g_vx - 4, g_vy - 4, g_vx + g_vw + 4, g_vy + g_vh + 4, false);
draw_set_alpha(1);
scr_ui_pane(x0, y0, g_dg_w, g_dg_h, "SAVE MAP", g_acc);
draw_set_color(g_c[0]);
draw_rectangle(x0 + 1, y0 + 1, x0 + g_dg_w - 1, y0 + g_dg_h - 1, false);
scr_ui_pane(x0, y0, g_dg_w, g_dg_h, "SAVE MAP", g_acc);
g_fs = g_f_sm;
scr_ui_text(x0 + 20, y0 + 28, "MAP NAME", g_c[4]);
// namnruta
draw_set_color(g_c[1]);
draw_rectangle(x0 + 20, y0 + 50, x0 + 340, y0 + 84, false);
draw_set_color(g_acc);
draw_rectangle(x0 + 20, y0 + 50, x0 + 340, y0 + 84, true);
g_fs = g_f_md;
scr_ui_text(x0 + 30, y0 + 58, g_ed_dname, g_c[6]);
if ((g_menu_tick mod 40) < 24)
{
    draw_set_color(g_acc);
    draw_rectangle(x0 + 30 + scr_ui_tw(g_ed_dname) + 2, y0 + 58, x0 + 30 + scr_ui_tw(g_ed_dname) + 8, y0 + 76, false);
}
// GENERATE NAME
hov = (mx >= x0 + 350 && mx <= x0 + 500 && my >= y0 + 50 && my <= y0 + 84);
if (hov) { draw_set_color(g_c[2]); } else { draw_set_color(g_c[1]); }
draw_rectangle(x0 + 350, y0 + 50, x0 + 500, y0 + 84, false);
draw_set_color(g_acc);
draw_rectangle(x0 + 350, y0 + 50, x0 + 500, y0 + 84, true);
g_fs = g_f_sm;
scr_ui_text_c(x0 + 425, y0 + 59, "GENERATE NAME", g_c[6]);
// spellagen
scr_ui_text(x0 + 20, y0 + 104, "AVAILABLE IN GAME MODES", g_c[4]);
g_fs = g_f_md;
for (m = 0; m < 4; m += 1)
{
    ry = y0 + 132 + m * 36;
    hov = (mx >= x0 + 20 && mx <= x0 + 500 && my >= ry && my <= ry + 32);
    if (hov) { draw_set_color(g_c[1]); draw_rectangle(x0 + 20, ry, x0 + 500, ry + 32, false); }
    draw_set_color(g_acc);
    draw_rectangle(x0 + 28, ry + 6, x0 + 48, ry + 26, true);
    if ((g_ed_modes & (1 << m)) != 0)
    {
        draw_rectangle(x0 + 32, ry + 10, x0 + 44, ry + 22, false);
        c = g_c[6];
    }
    else { c = g_c[4]; }
    scr_ui_text(x0 + 62, ry + 6, g_mode_name[m], c);
}
// meddelande, knappar, hjalp
g_fs = g_f_sm;
if (g_ed_dmsg != "") { scr_ui_text(x0 + 20, y0 + g_dg_h - 92, g_ed_dmsg, g_c[8]); }
hov = (mx >= x0 + g_dg_w - 330 && mx <= x0 + g_dg_w - 180 && my >= y0 + g_dg_h - 56 && my <= y0 + g_dg_h - 20);
if (hov) { draw_set_color(g_c[2]); } else { draw_set_color(g_c[1]); }
draw_rectangle(x0 + g_dg_w - 330, y0 + g_dg_h - 56, x0 + g_dg_w - 180, y0 + g_dg_h - 20, false);
draw_set_color(g_acc);
draw_rectangle(x0 + g_dg_w - 330, y0 + g_dg_h - 56, x0 + g_dg_w - 180, y0 + g_dg_h - 20, true);
scr_ui_text_c(x0 + g_dg_w - 255, y0 + g_dg_h - 47, "SAVE", g_acc);
hov = (mx >= x0 + g_dg_w - 170 && mx <= x0 + g_dg_w - 20 && my >= y0 + g_dg_h - 56 && my <= y0 + g_dg_h - 20);
if (hov) { draw_set_color(g_c[2]); } else { draw_set_color(g_c[1]); }
draw_rectangle(x0 + g_dg_w - 170, y0 + g_dg_h - 56, x0 + g_dg_w - 20, y0 + g_dg_h - 20, false);
draw_set_color(g_c[3]);
draw_rectangle(x0 + g_dg_w - 170, y0 + g_dg_h - 56, x0 + g_dg_w - 20, y0 + g_dg_h - 20, true);
scr_ui_text_c(x0 + g_dg_w - 95, y0 + g_dg_h - 47, "CANCEL", g_c[4]);
scr_ui_text(x0 + 20, y0 + g_dg_h - 48, "ENTER = SAVE", g_c[3]);
scr_ui_text(x0 + 20, y0 + g_dg_h - 32, "ESC = CANCEL", g_c[3]);
