/// scr_ctb_final_draw()
// Capture the Bratwurst (D-081, svar 8): slutresultatet efter sista rundan (g_state = 30): rundvinster per lag (g_ct_rw), vinnande lag eller oavgjort, och valen REMATCH /
// MAIN MENU (samma val och steg som scr_results_draw/scr_results_step). Anropas fran scr_results_draw nar g_game_mode == 3.
var px, py, pw, ph, i, ry, c, k, vtxt, wr, wb, nm;
scr_ui_header("BRATWURST // MATCH RESULT", string(g_rounds_total) + " ROUNDS PLAYED");
pw = min(g_vw - 80, 760);
ph = g_vh - 70 - 56;
px = g_vx + (g_vw - pw) / 2;
py = g_vy + 54;
scr_ui_pane(px, py, pw, ph, "FINAL RESULT", g_acc);
wr = g_ct_rw[0];
wb = g_ct_rw[1];
g_fs = g_f_lg;
if (wr > wb) { scr_ui_text_c(px + pw / 2, py + 26, "RED TEAM WINS THE MATCH", g_team_col[0]); }
else if (wb > wr) { scr_ui_text_c(px + pw / 2, py + 26, "BLUE TEAM WINS THE MATCH", g_team_col[1]); }
else { scr_ui_text_c(px + pw / 2, py + 26, "THE MATCH IS A TIE", g_c[10]); }
g_fs = g_f_md;
for (k = 0; k < 2; k += 1)
{
    c = g_team_col[k];
    ry = py + 90 + k * 48;
    if ((k == 0 && wr >= wb) || (k == 1 && wb >= wr))
    {
        draw_set_color(g_c[1]);
        draw_rectangle(px + 16, ry - 4, px + pw - 16, ry + 36, false);
        draw_set_color(c);
        draw_rectangle(px + 16, ry - 4, px + 19, ry + 36, false);
    }
    if (k == 0) { nm = "RED TEAM"; } else { nm = "BLUE TEAM"; }
    scr_ui_text(px + 34, ry + 8, nm, c);
    // spelarna i laget
    nm = "";
    for (i = 0; i < g_n_players; i += 1)
    {
        if (scr_team_of(i) == k)
        {
            if (nm != "") { nm += " + "; }
            nm += "P" + string(i + 1);
        }
    }
    scr_ui_text(px + 190, ry + 8, nm, g_c[4]);
    for (i = 0; i < g_rounds_total; i += 1)
    {
        if (i < g_ct_rw[k]) { draw_set_color(c); draw_rectangle(px + 380 + i * 18, ry + 10, px + 390 + i * 18, ry + 20, false); }
        else { draw_set_color(g_c[3]); draw_rectangle(px + 380 + i * 18, ry + 10, px + 390 + i * 18, ry + 20, true); }
    }
    scr_ui_text_r(px + pw - 34, ry + 8, string(g_ct_rw[k]) + " WINS", c);
}
for (i = 0; i < 2; i += 1)
{
    ry = py + ph - 124 + i * 48;
    if (i == 0) { vtxt = "REMATCH"; } else { vtxt = "MAIN MENU"; }
    if (i == g_res_sel)
    {
        draw_set_color(g_c[1]);
        draw_rectangle(px + 16, ry, px + pw - 16, ry + 36, false);
        draw_set_color(g_acc);
        draw_rectangle(px + 16, ry, px + 19, ry + 36, false);
        scr_ui_text(px + 34, ry + 8, vtxt, g_acc);
    }
    else { scr_ui_text(px + 34, ry + 8, vtxt, g_c[4]); }
}
g_fs = g_f_sm;
scr_ui_text(g_vx + 20, g_vy + g_vh - 32, "UP/DOWN CHOOSE    ENTER OK    REMATCH = NEW SHIPS, SAME ROUNDS    ESC MAIN MENU", g_c[4]);
