/// scr_mn_draw()
// Huvudmenyn i "command deck"-stil: trad till vanster, lista i mitten, datapanel till hoger (konceptet godkant av anvandaren).
var node, sel, cnt, item, i, k, kid, yy, rx, ry, rw, t, v, bh, bx, by, cw, col, ti, branch, kid2, pre;
node = g_mn_stk_node[g_mn_depth];
sel = g_mn_stk_sel[g_mn_depth];
cnt = g_mn_n[node];
item = g_mn_kid[node, sel];
t = g_mn_type[item];
ti = g_sv[g_SV_THEME];
scr_ui_header("BRATWURST // TERMINAL v0.2", "LINK STABLE");

// ---- TREE ----
scr_ui_pane(20, 52, 236, 540, "TREE", g_c[4]);
g_fs = g_f_md;
yy = 76;
scr_ui_text(36, yy, "v bratwurst", g_c[6]);
yy += 28;
branch = -1;
if (g_mn_depth >= 1) { branch = g_mn_stk_node[1]; }
for (i = 0; i < g_mn_n[0]; i += 1)
{
    kid = g_mn_kid[0, i];
    if (i == g_mn_n[0] - 1) { pre = "`- "; } else { pre = "|- "; }
    if (kid == branch) { scr_ui_text(36, yy, pre + string_lower(g_mn_label[kid]) + " <", g_acc); }
    else if (g_mn_depth == 0 && i == g_mn_stk_sel[0]) { scr_ui_text(36, yy, pre + string_lower(g_mn_label[kid]) + " <", g_c[6]); }
    else { scr_ui_text(36, yy, pre + string_lower(g_mn_label[kid]), g_c[4]); }
    yy += 28;
    if (kid == branch && g_mn_type[kid] == 0)
    {
        for (k = 0; k < g_mn_n[kid]; k += 1)
        {
            kid2 = g_mn_kid[kid, k];
            if (i == g_mn_n[0] - 1) { pre = "   "; } else { pre = "|  "; }
            if (k == g_mn_n[kid] - 1) { pre += "`- "; } else { pre += "|- "; }
            if (g_mn_depth >= 2 && kid2 == g_mn_stk_node[2]) { col = g_acc; }
            else if (g_mn_depth == 1 && k == g_mn_stk_sel[1]) { col = g_c[6]; }
            else { col = g_c[3]; }
            scr_ui_text(36, yy, pre + string_lower(g_mn_label[kid2]), col);
            yy += 28;
        }
    }
}

// ---- LIST ----
scr_ui_pane(272, 52, 432, 540, g_mn_label[node] + " " + scr_pad2(sel + 1) + "/" + scr_pad2(cnt), g_acc);
g_fs = g_f_md;
for (i = 0; i < cnt; i += 1)
{
    kid = g_mn_kid[node, i];
    rx = 284;
    ry = 80 + i * 40;
    rw = 408;
    if (i == sel)
    {
        draw_set_color(g_c[1]);
        draw_rectangle(rx, ry, rx + rw, ry + 36, false);
        draw_set_color(g_acc);
        draw_rectangle(rx, ry, rx + 3, ry + 36, false);
        scr_ui_text(rx + 14, ry + 8, scr_pad2(i + 1), g_acc);
        scr_ui_text(rx + 50, ry + 8, string_upper(g_mn_label[kid]), g_c[6]);
    }
    else
    {
        scr_ui_text(rx + 14, ry + 8, scr_pad2(i + 1), g_c[3]);
        scr_ui_text(rx + 50, ry + 8, string_upper(g_mn_label[kid]), g_c[4]);
    }
    v = scr_mn_value(kid);
    if (string_length(v) > 22) { v = ".." + string_copy(v, string_length(v) - 19, 20); }
    if (i == sel && g_mn_type[kid] >= 2 && g_mn_type[kid] <= 4) { v = "< " + v + " >"; }
    if (i == sel) { col = g_acc; } else { col = g_c[4]; }
    if (g_mn_type[kid] == 1) { v = ""; }
    scr_ui_text_r(rx + rw - 12, ry + 8, v, col);
}

// ---- DATA ----
scr_ui_pane(720, 52, 284, 540, "DATA", g_acc);
g_fs = g_f_sm;
scr_ui_text(736, 76, "INFO", g_c[4]);
yy = scr_ui_wrap(736, 100, g_mn_desc[item], 252, 19, g_c[5]);
if (t == 5) { yy = scr_ui_wrap(736, yy + 10, g_mn_text[item], 252, 19, g_acc); }
scr_ui_text(736, 270, "PALETTE // " + string_upper(g_th_name[ti]), g_c[4]);
cw = 26;
for (k = 0; k < 16; k += 1)
{
    bx = 736 + (k mod 8) * (cw + 6);
    by = 294 + (k div 8) * 28;
    draw_set_color(g_c[k]);
    draw_rectangle(bx, by, bx + cw, by + 22, false);
    draw_set_color(g_c[3]);
    draw_rectangle(bx, by, bx + cw, by + 22, true);
}
scr_ui_text(736, 366, "SIGNAL", g_c[4]);
for (k = 0; k < 12; k += 1)
{
    bh = 6 + 38 * (0.5 + 0.5 * sin(g_menu_tick * 0.07 * (1 + (k mod 3) * 0.4) + k * 0.8));
    bx = 736 + k * 21;
    draw_set_color(g_acc);
    draw_rectangle(bx, 450 - bh, bx + 16, 450, false);
}
scr_ui_text(736, 468, "INI KEY", g_c[4]);
if (g_mn_ini[item] != "") { scr_ui_text(736, 490, g_mn_ini[item], g_c[10]); }
else { scr_ui_text(736, 490, "-", g_c[3]); }
scr_ui_text(736, 520, "FILES", g_c[4]);
scr_ui_text(736, 542, "settings.ini  themes.ini", g_c[3]);

// ---- hjalprad ----
g_fs = g_f_sm;
scr_ui_text(20, 608, "UP/DOWN ROW    LEFT/RIGHT VALUE    ENTER OK    ESC BACK", g_c[4]);
scr_ui_text_r(room_width - 20, 608, scr_pad2(g_th_count) + " THEMES  //  " + string_upper(g_th_name[ti]), g_c[3]);
