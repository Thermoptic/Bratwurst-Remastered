/// scr_ed_draw()
// Banredigeraren (D-061): ritytan till vanster (hela varlden, zoom med mushjulet, panorera med mellanslag + drag eller mittenknappen) och verktygspanelen
// till hoger (status, verktyg i kategorier med farger, vy och fil). Verktyg: B rektangel, P polygon, X radera, T startplats, F start/malruta (Race),
// O pickuppunkt (Race). Ritytan ritas forst och allt som hamnar utanfor den tacks sedan av bakgrunden (GMS 1.4 har ingen klippning).
var s, i, j, k, sx0, sy0, sx1, sy1, px0, py0, tx, ty, ex, tool_name, col, hs, tpw, hint, wxa, wxb, wya, wyb, ra, yy, cbg, ctbm;
scr_ed_layout();
tx = g_ed_x0 + g_ed_w + 16;
tpw = g_vx + g_vw - 20 - tx;
cbg = g_c[0];

// ---- rityta ----
if (g_ed_dirty) { scr_ui_pane(g_ed_x0, g_ed_y0, g_ed_w, g_ed_h, string_upper(g_ed_name) + " *", g_c[10]); }
else { scr_ui_pane(g_ed_x0, g_ed_y0, g_ed_w, g_ed_h, string_upper(g_ed_name), g_acc); }
// synligt varldsomrade
wxa = g_ed_panx - (g_ed_w / 2) / g_ed_es;
wxb = g_ed_panx + (g_ed_w / 2) / g_ed_es;
wya = g_ed_pany - (g_ed_h / 2) / g_ed_es;
wyb = g_ed_pany + (g_ed_h / 2) / g_ed_es;
// finare rutnat (var 100:e varldspixel) nar man zoomat in, tydligare rutnat var 500:e, axlar tydligast
if (g_ed_zoom >= 2.5)
{
    draw_set_color(g_c[1]);
    draw_set_alpha(0.5);
    for (i = floor(wxa / 100) * 100; i <= wxb; i += 100) { draw_line(g_ed_cxs + i * g_ed_es, g_ed_y0, g_ed_cxs + i * g_ed_es, g_ed_y0 + g_ed_h); }
    for (i = floor(wya / 100) * 100; i <= wyb; i += 100) { draw_line(g_ed_x0, g_ed_cys + i * g_ed_es, g_ed_x0 + g_ed_w, g_ed_cys + i * g_ed_es); }
    draw_set_alpha(1);
}
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

// Race: start/malrutan (icke-solid, pilar visar riktningen; mushjulet over rutan vrider dem)
if (g_ed_fon)
{
    sx0 = g_ed_cxs + g_ed_fx0 * g_ed_es; sy0 = g_ed_cys + g_ed_fy0 * g_ed_es;
    sx1 = g_ed_cxs + g_ed_fx1 * g_ed_es; sy1 = g_ed_cys + g_ed_fy1 * g_ed_es;
    if (g_ed_tool == 2 && g_ed_inside && hs < 0 && scr_ed_pk_pick(g_ed_wx, g_ed_wy) < 0 && scr_ed_in_finish(g_ed_wx, g_ed_wy)) { col = g_c[8]; } else { col = g_c[11]; }
    draw_set_color(col);
    draw_set_alpha(0.14);
    draw_rectangle(sx0, sy0, sx1, sy1, false);
    draw_set_alpha(1);
    draw_rectangle(sx0, sy0, sx1, sy1, true);
    scr_fin_arrows(sx0, sy0, sx1, sy1, g_ed_fdir, col, g_ed_x0, g_ed_y0, g_ed_x0 + g_ed_w, g_ed_y0 + g_ed_h, 4);
}

// Capture the Bratwurst (D-078): lagens zoner (icke-solida, rod = base08, bla = base0D) och korvens startpunkt (korvmodellen)
g_fs = g_f_sm;
for (k = 0; k < 2; k += 1)
{
    if (g_ed_zon[k])
    {
        sx0 = g_ed_cxs + g_ed_zx0[k] * g_ed_es; sy0 = g_ed_cys + g_ed_zy0[k] * g_ed_es;
        sx1 = g_ed_cxs + g_ed_zx1[k] * g_ed_es; sy1 = g_ed_cys + g_ed_zy1[k] * g_ed_es;
        if (g_ed_tool == 2 && g_ed_inside && hs < 0 && scr_ed_in_zone(k, g_ed_wx, g_ed_wy)) { col = g_c[6]; }
        else { col = g_team_col[k]; }
        draw_set_color(col);
        draw_set_alpha(0.14);
        draw_rectangle(sx0, sy0, sx1, sy1, false);
        draw_set_alpha(1);
        draw_rectangle(sx0, sy0, sx1, sy1, true);
        if (k == 0) { scr_ui_text(sx0 + 6, sy0 + 4, "RED ZONE", col); } else { scr_ui_text(sx0 + 6, sy0 + 4, "BLUE ZONE", col); }
    }
}
if (g_ed_son)
{
    sx0 = g_ed_cxs + g_ed_sox * g_ed_es;
    sy0 = g_ed_cys + g_ed_soy * g_ed_es;
    if (g_ed_tool == 2 && g_ed_inside && point_distance(g_ed_wx, g_ed_wy, g_ed_sox, g_ed_soy) < 150) { col = g_c[6]; } else { col = g_c[10]; }
    scr_ui_ship(g_SAUSAGE, sx0, sy0, 0.12, 0, col, -1, false);
    draw_set_color(col);
    draw_circle(sx0, sy0, 20, true);
    scr_ui_text(sx0 + 24, sy0 - 22, "SAUSAGE", col);
}

// Race: pickuppunkter (runda markorer; den som flyttas ar vit)
ra = max(7, 36 * g_ed_es);
for (i = 0; i < g_ed_pk_n; i += 1)
{
    sx0 = g_ed_cxs + g_ed_pkx[i] * g_ed_es;
    sy0 = g_ed_cys + g_ed_pky[i] * g_ed_es;
    if (i == g_ed_pkmv) { draw_set_color(g_c[6]); }
    else if (g_ed_tool == 2 && g_ed_inside && scr_ed_pk_pick(g_ed_wx, g_ed_wy) == i) { draw_set_color(g_c[8]); }
    else { draw_set_color(g_c[9]); }
    draw_circle(sx0, sy0, ra, true);
    draw_circle(sx0, sy0, 3, false);
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
if ((g_ed_tool == 0 || g_ed_tool == 4 || g_ed_tool == 7 || g_ed_tool == 8) && g_ed_bset && g_ed_inside)
{
    draw_rectangle(g_ed_cxs + g_ed_bx * g_ed_es, g_ed_cys + g_ed_by * g_ed_es, g_ed_cxs + g_ed_mx * g_ed_es, g_ed_cys + g_ed_my * g_ed_es, true);
}

// startplatser
g_fs = g_f_sm;
for (k = 0; k < 4; k += 1)
{
    sx0 = g_ed_cxs + (g_ed_sx[k] / 256) * g_ed_es;
    sy0 = g_ed_cys + (g_ed_sy[k] / 256) * g_ed_es;
    if (sx0 > g_ed_x0 - 40 && sx0 < g_ed_x0 + g_ed_w + 40 && sy0 > g_ed_y0 - 40 && sy0 < g_ed_y0 + g_ed_h + 40)
    {
        scr_ui_ship(g_pship[k], sx0, sy0, 0.25, g_ed_sa[k], g_pc[k], -1, false);
        if (g_ed_tool == 3 && k == g_ed_spawn) { draw_circle(sx0, sy0, 14, true); }
        scr_ui_text(sx0 + 12, sy0 - 22, "P" + string(k + 1), g_pc[k]);
    }
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

// ---- allt som hamnade utanfor ritytan tacks av bakgrunden, sedan ram och rubrik pa nytt ----
draw_set_alpha(1);
draw_set_color(cbg);
draw_rectangle(g_vx - 6, g_vy - 6, g_ed_x0 - 1, g_vy + g_vh + 6, false);
draw_rectangle(g_ed_x0 + g_ed_w + 1, g_vy - 6, g_vx + g_vw + 6, g_vy + g_vh + 6, false);
draw_rectangle(g_vx - 6, g_vy - 6, g_vx + g_vw + 6, g_ed_y0 - 1, false);
draw_rectangle(g_vx - 6, g_ed_y0 + g_ed_h + 1, g_vx + g_vw + 6, g_vy + g_vh + 6, false);
scr_ed_frame(g_ed_x0, g_ed_y0, g_ed_w, g_ed_h, string_upper(g_ed_name), g_ed_dirty);
scr_ui_header("BRATWURST // MAP EDITOR", scr_pad2(g_ed_idx + 1) + " OF " + scr_pad2(g_lv_count) + " MAPS");

// ---- verktygspanelen (mindre text, kategorier med egna farger) ----
scr_ui_pane(tx, g_ed_y0, tpw, g_ed_h, "TOOLS", g_c[4]);
if (g_ed_tool == 0) { tool_name = "BOX"; hint = "BOX: CLICK TWO CORNERS. IT BECOMES A SOLID WALL"; }
if (g_ed_tool == 1) { tool_name = "POLYGON"; hint = "POLYGON: CLICK POINTS, ENTER OR THE FIRST POINT CLOSES IT"; }
if (g_ed_tool == 2) { tool_name = "ERASE"; hint = "ERASE: CLICK A WALL, A PICKUP POINT OR THE FINISH BOX"; }
if (g_ed_tool == 3) { tool_name = "SPAWN P" + string(g_ed_spawn + 1); hint = "SPAWN: CLICK TO PLACE, WHEEL OR Q / E TURNS IT, 1-4 PICKS A PLAYER. IN CTB P1+P3 ARE THE RED TEAM, P2+P4 THE BLUE"; }
if (g_ed_tool == 4) { tool_name = "FINISH LINE"; hint = "FINISH LINE (RACE): CLICK TWO CORNERS, WHEEL OVER THE BOX TURNS THE ARROWS"; }
if (g_ed_tool == 5) { tool_name = "PICKUP POINT"; hint = "PICKUP POINT (RACE): CLICK TO PLACE, CLICK A POINT TO MOVE IT"; }
if (g_ed_tool == 6) { tool_name = "SAUSAGE SPAWN"; hint = "SAUSAGE SPAWN (CAPTURE THE BRATWURST): CLICK TO PLACE OR MOVE IT. ONE PER MAP"; }
if (g_ed_tool == 7) { tool_name = "RED ZONE"; hint = "RED ZONE (CAPTURE THE BRATWURST): CLICK TWO CORNERS. A NEW BOX REPLACES THE OLD. BLUE SCORES HERE"; }
if (g_ed_tool == 8) { tool_name = "BLUE ZONE"; hint = "BLUE ZONE (CAPTURE THE BRATWURST): CLICK TWO CORNERS. A NEW BOX REPLACES THE OLD. RED SCORES HERE"; }
yy = g_ed_y0 + 14;
// status
scr_ed_head(tx + 14, yy, tpw - 28, "STATUS", g_acc);
yy += 16;
scr_ed_txt(tx + 14, yy, "TOOL", g_c[4]);
scr_ed_txt(tx + 74, yy, tool_name, g_acc);
yy += 14;
scr_ed_txt(tx + 14, yy, "SHAPES", g_c[4]);
scr_ed_txt(tx + 74, yy, string(g_ed_n) + " / 64     PICKUPS " + string(g_ed_pk_n) + " / " + string(g_PK_MAX), g_c[5]);
yy += 14;
scr_ed_txt(tx + 14, yy, "GRID", g_c[4]);
scr_ed_txt(tx + 74, yy, string(g_ed_snap) + " PX     ZOOM " + string(round(g_ed_zoom * 100)) + "%", g_c[5]);
yy += 14;
scr_ed_txt(tx + 14, yy, "CTB", g_c[4]);   // Capture the Bratwurst: ar banan klar for lagets (D-078)?
ctbm = scr_ctb_validate();
if (ctbm == "") { scr_ed_txt(tx + 74, yy, "READY", g_c[11]); } else { scr_ed_txt(tx + 74, yy, ctbm, g_c[3]); }
yy += 14;
scr_ed_txt(tx + 14, yy, "CURSOR", g_c[4]);
if (g_ed_inside) { scr_ed_txt(tx + 74, yy, string(g_ed_mx) + ", " + string(g_ed_my), g_c[5]); }
else { scr_ed_txt(tx + 74, yy, "-", g_c[3]); }
yy += 20;
// rita
scr_ed_head(tx + 14, yy, tpw - 28, "DRAW", g_c[12]);
yy += 16;
scr_ed_row(tx + 8, yy, tpw - 16, "B", "BOX  (2 CORNERS)", g_c[12], g_ed_tool == 0); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "P", "POLYGON  (ENTER CLOSES)", g_c[12], g_ed_tool == 1); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "X", "ERASE  (CLICK AN OBJECT)", g_c[8], g_ed_tool == 2); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "U", "UNDO LAST SHAPE", g_c[12], false); yy += 20;
// placera
scr_ed_head(tx + 14, yy, tpw - 28, "PLACE", g_c[11]);
yy += 16;
scr_ed_row(tx + 8, yy, tpw - 16, "T", "SPAWN  (1-4 PICK, Q/E TURN)", g_c[11], g_ed_tool == 3); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "F", "FINISH LINE  (RACE)", g_c[11], g_ed_tool == 4); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "O", "PICKUP POINT  (RACE)", g_c[9], g_ed_tool == 5); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "C", "SAUSAGE SPAWN  (CTB)", g_c[10], g_ed_tool == 6); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "R", "RED ZONE  (CTB)", g_team_col[0], g_ed_tool == 7); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "V", "BLUE ZONE  (CTB)", g_team_col[1], g_ed_tool == 8); yy += 20;
// vy
scr_ed_head(tx + 14, yy, tpw - 28, "VIEW", g_c[14]);
yy += 16;
scr_ed_row(tx + 8, yy, tpw - 16, "WHEEL", "ZOOM  (OVER BOX: ARROWS)", g_c[14], false); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "SPACE", "+ DRAG: MOVE THE VIEW", g_c[14], false); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "HOME", "RESET THE VIEW", g_c[14], false); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "G", "GRID  25 / 50 / 100", g_c[14], false); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "R-CLICK", "CANCEL", g_c[14], false); yy += 20;
// fil
scr_ed_head(tx + 14, yy, tpw - 28, "FILE", g_c[10]);
yy += 16;
scr_ed_row(tx + 8, yy, tpw - 16, "S", "SAVE  (NAME + MODES)", g_c[10], false); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "N", "NEW MAP     L  LOAD MAP", g_c[10], false); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "[ ]", "PREVIOUS / NEXT MAP", g_c[10], false); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "DEL", "DELETE MAP  (TWICE)", g_c[8], false); yy += 15;
scr_ed_row(tx + 8, yy, tpw - 16, "ESC", "BACK TO MENU", g_c[10], false);

g_fs = g_f_sm;
if (g_ed_msgt > 0) { scr_ui_text(g_ed_x0, g_vy + g_vh - 32, g_ed_msg, g_c[10]); }
else { scr_ui_text(g_ed_x0, g_vy + g_vh - 32, hint, g_c[4]); }
if (g_ed_dlg == 1) { scr_ed_dlg_draw(); }
if (g_ed_dlg == 2) { scr_ed_load_draw(); }
