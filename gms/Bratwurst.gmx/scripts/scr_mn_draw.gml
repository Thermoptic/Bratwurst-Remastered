/// scr_mn_draw()
// Huvudmenyn i "command deck"-stil: trad till vanster, lista i mitten, datapanel till hoger (konceptet godkant av anvandaren).
var node, sel, cnt, item, i, k, kid, yy, rx, ry, rw, t, v, bh, bx, by, cw, col, ti, branch, kid2, pre, avail, tx, tw0, lx, lw0, dx, dw0, py, ph, ix, iw, bs;
scr_bg_draw();   // samma bakgrund som titelskarmen
node = g_mn_stk_node[g_mn_depth];
sel = g_mn_stk_sel[g_mn_depth];
cnt = g_mn_n[node];
item = g_mn_kid[node, sel];
t = g_mn_type[item];
ti = g_sv[g_SV_THEME];
scr_ui_header("BRATWURST // TERMINAL v0.2", "LINK STABLE");
// layout: tre / lista / data fyller vyns bredd och hojd (design 236 / 432 / 284 px vid 1024 bred vy)
avail = g_vw - 40 - 32;
tw0 = floor(avail * 236 / 952);
lw0 = floor(avail * 432 / 952);
dw0 = avail - tw0 - lw0;
tx = g_vx + 20;
lx = tx + tw0 + 16;
dx = lx + lw0 + 16;
py = g_vy + 52;
ph = g_vh - 52 - 48;

// ---- TREE ----
scr_ui_pane(tx, py, tw0, ph, "TREE", g_c[4]);
g_fs = g_f_md;
yy = py + 24;
scr_ui_text(tx + 16, yy, "v bratwurst", g_c[6]);
yy += 28;
branch = -1;
if (g_mn_depth >= 1) { branch = g_mn_stk_node[1]; }
for (i = 0; i < g_mn_n[0]; i += 1)
{
    kid = g_mn_kid[0, i];
    if (i == g_mn_n[0] - 1) { pre = "`- "; } else { pre = "|- "; }
    if (kid == branch) { scr_ui_text(tx + 16, yy, pre + string_lower(g_mn_label[kid]) + " <", g_acc); }
    else if (g_mn_depth == 0 && i == g_mn_stk_sel[0]) { scr_ui_text(tx + 16, yy, pre + string_lower(g_mn_label[kid]) + " <", g_c[6]); }
    else { scr_ui_text(tx + 16, yy, pre + string_lower(g_mn_label[kid]), g_c[4]); }
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
            scr_ui_text(tx + 16, yy, pre + string_lower(g_mn_label[kid2]), col);
            yy += 28;
        }
    }
}

// ---- LIST ----
scr_ui_pane(lx, py, lw0, ph, g_mn_label[node] + " " + scr_pad2(sel + 1) + "/" + scr_pad2(cnt), g_acc);
g_fs = g_f_md;
for (i = 0; i < cnt; i += 1)
{
    kid = g_mn_kid[node, i];
    rx = lx + 12;
    ry = py + 28 + i * 40;
    rw = lw0 - 24;
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
scr_ui_pane(dx, py, dw0, ph, "DATA", g_acc);
g_fs = g_f_sm;
ix = dx + 16;
iw = dw0 - 32;
if (t == 4 && (g_mn_set[item] == g_SV_MAP || g_mn_set[item] == g_SV_MAP2))
{
    // pa raden MAP visas en bild pa vald bana i stallet for informationstexten
    scr_map_preview(ix, py + 20, iw, 190, g_sv[g_mn_set[item]]);
}
else
{
    scr_ui_text(ix, py + 24, "INFO", g_c[4]);
    yy = scr_ui_wrap(ix, py + 48, g_mn_desc[item], iw, 19, g_c[5]);
    if (t == 5) { yy = scr_ui_wrap(ix, yy + 10, g_mn_text[item], iw, 19, g_acc); }
}
scr_ui_text(ix, py + 218, "PALETTE // " + string_upper(g_th_name[ti]), g_c[4]);
cw = floor((iw - 7 * 6) / 8);
for (k = 0; k < 16; k += 1)
{
    bx = ix + (k mod 8) * (cw + 6);
    by = py + 242 + (k div 8) * 28;
    draw_set_color(g_c[k]);
    draw_rectangle(bx, by, bx + cw, by + 22, false);
    draw_set_color(g_c[3]);
    draw_rectangle(bx, by, bx + cw, by + 22, true);
}
scr_ui_text(ix, py + 298, "SPECTRUM", g_c[4]);
scr_viz_draw(ix, py + 320, iw, 110);
scr_ui_text(ix, py + 446, "NOW PLAYING", g_c[4]);
scr_ui_text_r(ix + iw, py + 446, scr_pad2(g_trk_idx + 1) + "/" + scr_pad2(g_trk_n) + "  LB/RB CHANGE", g_c[3]);
if (g_sv[g_SV_MUSIC]) { scr_ui_text(ix, py + 466, g_trk_name[g_trk_idx], g_c[10]); }
else { scr_ui_text(ix, py + 466, "MUSIC OFF", g_c[3]); }
scr_ui_text(ix, py + 494, "FILES", g_c[4]);
scr_ui_text(ix, py + 514, "settings.ini  themes.ini", g_c[3]);
// ---- hjalprad ----
g_fs = g_f_sm;
scr_ui_text(g_vx + 20, g_vy + g_vh - 32, "UP/DOWN ROW    LEFT/RIGHT VALUE    ENTER OK    ESC BACK", g_c[4]);
scr_ui_text_r(g_vx + g_vw - 20, g_vy + g_vh - 32, scr_pad2(g_th_count) + " THEMES  //  " + string_upper(g_th_name[ti]), g_c[3]);
