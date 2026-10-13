/// scr_ed_draw()
// Banredigeraren: ritytan till vanster (hela varlden), hjalp och status till hoger. Verktyg: B rektangel, P polygon, X radera, T startplats.
var s, i, j, k, sx0, sy0, sx1, sy1, px0, py0, hx, tx, ty, ex, tool_name, col, hs, line_y;
scr_ed_layout();
scr_ui_header("BRATWURST // MAP EDITOR", scr_pad2(g_ed_idx + 1) + " OF " + scr_pad2(g_lv_count) + " MAPS");
tx = g_ed_x0 + g_ed_w + 16;

// ---- rityta ----
if (g_ed_dirty) { scr_ui_pane(g_ed_x0, g_ed_y0, g_ed_w, g_ed_h, string_upper(g_ed_name) + " *", g_c[10]); }
else { scr_ui_pane(g_ed_x0, g_ed_y0, g_ed_w, g_ed_h, string_upper(g_ed_name), g_acc); }
// rutnat var 500:e varldspixel, axlar tydligare
draw_set_color(g_c[1]);
for (i = -3000; i <= 3000; i += 500)
{
    draw_line(g_ed_cxs + i * g_ed_es, g_ed_cys - 2400 * g_ed_es, g_ed_cxs + i * g_ed_es, g_ed_cys + 2400 * g_ed_es);
}
for (i = -2000; i <= 2000; i += 500)
{
    draw_line(g_ed_cxs - 3100 * g_ed_es, g_ed_cys + i * g_ed_es, g_ed_cxs + 3100 * g_ed_es, g_ed_cys + i * g_ed_es);
}
draw_set_color(g_c[2]);
draw_line(g_ed_cxs, g_ed_cys - 2400 * g_ed_es, g_ed_cxs, g_ed_cys + 2400 * g_ed_es);
draw_line(g_ed_cxs - 3100 * g_ed_es, g_ed_cys, g_ed_cxs + 3100 * g_ed_es, g_ed_cys);

// formerna (samma farger som i matchen: temats vaggfarger i ordning)
hs = -1;
if (g_ed_tool == 2 && g_ed_inside) { hs = scr_ed_pick(g_ed_wx, g_ed_wy); }
for (s = 0; s < g_ed_n; s += 1)
{
    if (s == hs) { draw_set_color(g_c[8]); }
    else { draw_set_color(g_wcol[s mod 11]); }
    for (i = 0; i < g_ed_pn[s]; i += 1)
    {
        j = (i + 1) mod g_ed_pn[s];
        draw_line(g_ed_cxs + g_ed_px[s, i] * g_ed_es, g_ed_cys + g_ed_py[s, i] * g_ed_es, g_ed_cxs + g_ed_px[s, j] * g_ed_es, g_ed_cys + g_ed_py[s, j] * g_ed_es);
    }
}

// pagaende polygon / rektangel
draw_set_color(g_acc);
for (i = 0; i < g_ed_cn; i += 1)
{
    px0 = g_ed_cxs + g_ed_cx[i] * g_ed_es;
    py0 = g_ed_cys + g_ed_cy[i] * g_ed_es;
    draw_rectangle(px0 - 2, py0 - 2, px0 + 2, py0 + 2, false);
    if (i > 0) { draw_line(g_ed_cxs + g_ed_cx[i - 1] * g_ed_es, g_ed_cys + g_ed_cy[i - 1] * g_ed_es, px0, py0); }
}
if (g_ed_tool == 1 && g_ed_cn > 0 && g_ed_inside)
{
    draw_line(g_ed_cxs + g_ed_cx[g_ed_cn - 1] * g_ed_es, g_ed_cys + g_ed_cy[g_ed_cn - 1] * g_ed_es, g_ed_cxs + g_ed_mx * g_ed_es, g_ed_cys + g_ed_my * g_ed_es);
}
if (g_ed_tool == 0 && g_ed_bset && g_ed_inside)
{
    draw_rectangle(g_ed_cxs + g_ed_bx * g_ed_es, g_ed_cys + g_ed_by * g_ed_es, g_ed_cxs + g_ed_mx * g_ed_es, g_ed_cys + g_ed_my * g_ed_es, true);
}

// startplatser
g_fs = g_f_sm;
for (k = 0; k < 4; k += 1)
{
    sx0 = g_ed_cxs + (g_ed_sx[k] / 256) * g_ed_es;
    sy0 = g_ed_cys + (g_ed_sy[k] / 256) * g_ed_es;
    scr_ui_ship(g_pship[k], sx0, sy0, 0.25, g_ed_sa[k], g_pc[k], -1, false);
    if (g_ed_tool == 3 && k == g_ed_spawn) { draw_circle(sx0, sy0, 14, true); }
    scr_ui_text(sx0 + 12, sy0 - 22, "P" + string(k + 1), g_pc[k]);
}

// markor
if (g_ed_inside && g_ed_tool != 2)
{
    draw_set_color(g_c[6]);
    ex = g_ed_cxs + g_ed_mx * g_ed_es;
    ty = g_ed_cys + g_ed_my * g_ed_es;
    draw_line(ex - 6, ty, ex + 6, ty);
    draw_line(ex, ty - 6, ex, ty + 6);
}

// ---- hjalp / status ----
scr_ui_pane(tx, g_ed_y0, 280, g_ed_h, "TOOLS", g_c[4]);
g_fs = g_f_sm;
if (g_ed_tool == 0) { tool_name = "BOX"; }
if (g_ed_tool == 1) { tool_name = "POLYGON"; }
if (g_ed_tool == 2) { tool_name = "ERASE"; }
if (g_ed_tool == 3) { tool_name = "SPAWN P" + string(g_ed_spawn + 1); }
line_y = g_ed_y0 + 24;
scr_ui_text(tx + 16, line_y, "TOOL    " + tool_name, g_acc);
scr_ui_text(tx + 16, line_y + 20, "SHAPES  " + string(g_ed_n) + " / 64", g_c[5]);
scr_ui_text(tx + 16, line_y + 40, "GRID    " + string(g_ed_snap) + " PX", g_c[5]);
if (g_ed_inside) { scr_ui_text(tx + 16, line_y + 60, "CURSOR  " + string(g_ed_mx) + ", " + string(g_ed_my), g_c[5]); }
else { scr_ui_text(tx + 16, line_y + 60, "CURSOR  -", g_c[3]); }
line_y += 100;
scr_ui_text(tx + 16, line_y, "B  BOX  (CLICK 2 CORNERS)", g_c[4]);
scr_ui_text(tx + 16, line_y + 20, "P  POLYGON (CLICK POINTS,", g_c[4]);
scr_ui_text(tx + 16, line_y + 40, "   ENTER OR FIRST POINT", g_c[4]);
scr_ui_text(tx + 16, line_y + 60, "   CLOSES)", g_c[4]);
scr_ui_text(tx + 16, line_y + 80, "X  ERASE (CLICK A WALL)", g_c[4]);
scr_ui_text(tx + 16, line_y + 100, "T  SPAWN (1-4 PICK, CLICK", g_c[4]);
scr_ui_text(tx + 16, line_y + 120, "   PLACE, WHEEL OR Q/E TURN)", g_c[4]);
scr_ui_text(tx + 16, line_y + 140, "G  GRID 25 / 50 / 100", g_c[4]);
scr_ui_text(tx + 16, line_y + 160, "U  UNDO LAST SHAPE", g_c[4]);
scr_ui_text(tx + 16, line_y + 180, "RIGHT CLICK  CANCEL", g_c[4]);
line_y += 214;
scr_ui_text(tx + 16, line_y, "S  SAVE (NAME + MODES)", g_c[11]);
scr_ui_text(tx + 16, line_y + 20, "N  NEW MAP", g_c[4]);
scr_ui_text(tx + 16, line_y + 40, "[ ]  PREVIOUS / NEXT MAP", g_c[4]);
scr_ui_text(tx + 16, line_y + 60, "DEL  DELETE MAP (TWICE)", g_c[4]);
scr_ui_text(tx + 16, line_y + 80, "ESC  BACK TO MENU", g_c[4]);

draw_set_color(g_c[0]);
if (g_ed_msgt > 0) { scr_ui_text(g_ed_x0, g_vy + g_vh - 32, g_ed_msg, g_c[10]); }
else { scr_ui_text(g_ed_x0, g_vy + g_vh - 32, "ALL SHAPES ARE SOLID WALLS. SAVE WITH S, THEN PICK THE MAP UNDER GAME MODES", g_c[4]); }
if (g_ed_dlg == 1) { scr_ed_dlg_draw(); }
