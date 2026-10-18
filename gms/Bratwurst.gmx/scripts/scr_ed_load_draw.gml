/// scr_ed_load_draw()
// Ritar laddafonstret: kolumnerna NAME, CLASSIC, ASTRO DUEL, RACE och CAPTURE med YES / NO per spellage.
var x0, y0, i, row, ry, m, hov, mx, my, cx, c, sbh, sby;
scr_ed_load_layout();
x0 = g_ld_x;
y0 = g_ld_y;
mx = mouse_x;
my = mouse_y;
draw_set_color(g_c[0]);
draw_set_alpha(0.7);
draw_rectangle(g_vx - 4, g_vy - 4, g_vx + g_vw + 4, g_vy + g_vh + 4, false);
draw_set_alpha(1);
draw_set_color(g_c[0]);
draw_rectangle(x0, y0, x0 + g_ld_w, y0 + g_ld_h, false);
scr_ui_pane(x0, y0, g_ld_w, g_ld_h, "LOAD MAP", g_acc);
g_fs = g_f_sm;
// kolumnrubriker
scr_ui_text(x0 + 32, y0 + 32, "NAME", g_c[4]);
scr_ui_text(x0 + 332, y0 + 32, "CLASSIC", g_c[4]);
scr_ui_text(x0 + 420, y0 + 32, "GALAXY DUEL", g_c[4]);
scr_ui_text(x0 + 532, y0 + 32, "RACE", g_c[4]);
scr_ui_text(x0 + 600, y0 + 32, "CAPTURE", g_c[4]);
draw_set_color(g_c[3]);
draw_line(x0 + 20, y0 + 62, x0 + g_ld_w - 20, y0 + 62);
scr_ui_text(x0 + 32, y0 + 68, string(g_lv_count) + " MAPS", g_c[3]);
g_fs = g_f_md;
for (i = 0; i < 10; i += 1)
{
    row = g_ed_ldtop + i;
    if (row >= g_lv_count) { break; }
    ry = y0 + 92 + i * 28;
    hov = (mx >= x0 + 14 && mx <= x0 + g_ld_w - 14 && my >= ry && my <= ry + 26);
    if (row == g_ed_ldsel)
    {
        draw_set_color(g_c[1]);
        draw_rectangle(x0 + 14, ry, x0 + g_ld_w - 14, ry + 26, false);
        draw_set_color(g_acc);
        draw_rectangle(x0 + 14, ry, x0 + 17, ry + 26, false);
        c = g_c[6];
    }
    else
    {
        if (hov) { draw_set_color(g_c[1]); draw_set_alpha(0.5); draw_rectangle(x0 + 14, ry, x0 + g_ld_w - 14, ry + 26, false); draw_set_alpha(1); }
        c = g_c[4];
    }
    if (row == g_ed_idx) { scr_ui_text(x0 + 22, ry + 3, "*", g_acc); }
    scr_ui_text(x0 + 32, ry + 3, string_copy(string_upper(g_lv_name[row]), 1, 28), c);
    for (m = 0; m < 4; m += 1)
    {
        if (m == 0) { cx = x0 + 332; }
        if (m == 1) { cx = x0 + 420; }
        if (m == 2) { cx = x0 + 532; }
        if (m == 3) { cx = x0 + 600; }
        if (scr_level_allowed(m, row)) { scr_ui_text(cx, ry + 3, "YES", g_acc); }
        else { scr_ui_text(cx, ry + 3, "NO", g_c[3]); }
    }
}
// rullningslist om det finns fler an 10 banor
if (g_lv_count > 10)
{
    draw_set_color(g_c[2]);
    draw_rectangle(x0 + g_ld_w - 12, y0 + 92, x0 + g_ld_w - 8, y0 + 92 + 280, false);
    sbh = max(16, 280 * 10 / g_lv_count);
    sby = y0 + 92 + (280 - sbh) * g_ed_ldtop / max(1, g_lv_count - 10);
    draw_set_color(g_acc);
    draw_rectangle(x0 + g_ld_w - 12, sby, x0 + g_ld_w - 8, sby + sbh, false);
}
// knappar
g_fs = g_f_sm;
hov = (mx >= x0 + g_ld_w - 330 && mx <= x0 + g_ld_w - 180 && my >= y0 + g_ld_h - 56 && my <= y0 + g_ld_h - 20);
if (hov) { draw_set_color(g_c[2]); } else { draw_set_color(g_c[1]); }
draw_rectangle(x0 + g_ld_w - 330, y0 + g_ld_h - 56, x0 + g_ld_w - 180, y0 + g_ld_h - 20, false);
draw_set_color(g_acc);
draw_rectangle(x0 + g_ld_w - 330, y0 + g_ld_h - 56, x0 + g_ld_w - 180, y0 + g_ld_h - 20, true);
scr_ui_text_c(x0 + g_ld_w - 255, y0 + g_ld_h - 47, "LOAD", g_acc);
hov = (mx >= x0 + g_ld_w - 170 && mx <= x0 + g_ld_w - 20 && my >= y0 + g_ld_h - 56 && my <= y0 + g_ld_h - 20);
if (hov) { draw_set_color(g_c[2]); } else { draw_set_color(g_c[1]); }
draw_rectangle(x0 + g_ld_w - 170, y0 + g_ld_h - 56, x0 + g_ld_w - 20, y0 + g_ld_h - 20, false);
draw_set_color(g_c[3]);
draw_rectangle(x0 + g_ld_w - 170, y0 + g_ld_h - 56, x0 + g_ld_w - 20, y0 + g_ld_h - 20, true);
scr_ui_text_c(x0 + g_ld_w - 95, y0 + g_ld_h - 47, "CANCEL", g_c[4]);
scr_ui_text(x0 + 32, y0 + g_ld_h - 48, "UP/DOWN OR CLICK PICK   ENTER OR DOUBLE CLICK LOAD", g_c[3]);
scr_ui_text(x0 + 32, y0 + g_ld_h - 32, "WHEEL SCROLLS   ESC CANCEL   * = OPEN IN THE EDITOR", g_c[3]);
