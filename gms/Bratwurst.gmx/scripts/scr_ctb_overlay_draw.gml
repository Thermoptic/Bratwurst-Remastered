/// scr_ctb_overlay_draw()
// Capture the Bratwurst (D-082): banderoll i spelytans ovre mitt (RED poang, tid kvar, BLUE poang) och meddelandena efter en leverans: "RED/BLUE TEAM SCORES!" (3 s) och
// den stora nedrakningen 3, 2, 1 (sedan "0" en halv sekund nar korven aterskapas). Siffrorna ritas i LCD-stil som Race-nedrakningen (scr_lcd_char). Kors i scr_match_draw
// ovanpa allt i spelytan.
var cx, cy, tx, hh, ww, tt, sp, n, i, ch, cw, tot, xx, x0, y0, col;
cx = g_OX + g_PLAY_W * g_SCALE / 2;
cy = g_OY + g_PLAY_H * g_SCALE / 2;
// banderoll
g_fs = g_f_md;
scr_ui_text_c(cx, g_OY + 12, scr_ctb_clock(g_ct_t), g_c[6]);
scr_ui_text_r(cx - 56, g_OY + 12, "RED " + string(g_ct_score[0]), g_team_col[0]);
scr_ui_text(cx + 56, g_OY + 12, "BLUE " + string(g_ct_score[1]), g_team_col[1]);
if (g_state != 1) { exit; }
// meddelande efter en leverans
if (g_ct_phase == 1)
{
    g_fs = g_f_lg;
    if (g_ct_scorer == 0) { scr_ui_text_c(cx, cy - 18, "RED TEAM SCORES!", g_team_col[0]); }
    else { scr_ui_text_c(cx, cy - 18, "BLUE TEAM SCORES!", g_team_col[1]); }
    exit;
}
// stor nedrakning
tx = "";
col = g_acc;
if (g_ct_phase == 2) { tx = string(ceil(g_ct_pt / 50)); }
else if (g_ct_zero > 0) { tx = "0"; }
if (tx == "") { exit; }
hh = g_PLAY_H * g_SCALE * 0.2;   // teckenhojd: 20 % av spelytans hojd
ww = hh * 0.6;                    // teckenbredd
tt = hh * 0.17;                   // stapeltjocklek
sp = ww * 0.3;                    // mellanrum mellan tecken
n = string_length(tx);
tot = 0;
for (i = 1; i <= n; i += 1)
{
    tot += ww;
    if (i < n) { tot += sp; }
}
x0 = cx - tot / 2;
y0 = cy - hh / 2;
for (i = 0; i < 2; i += 1)
{
    if (i == 0) { draw_set_alpha(0.6); draw_set_color(g_c[0]); xx = x0 + tt * 0.35; }
    else { draw_set_alpha(1); draw_set_color(col); xx = x0; }
    for (n = 1; n <= string_length(tx); n += 1)
    {
        ch = string_char_at(tx, n);
        cw = ww;
        scr_lcd_char(ch, xx, y0 + (i == 0) * tt * 0.35, cw, hh, tt);
        xx += cw + sp;
    }
}
draw_set_alpha(1);
