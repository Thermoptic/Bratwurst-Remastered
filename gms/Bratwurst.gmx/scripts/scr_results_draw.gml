/// scr_results_draw()
// Slutresultatskarmen: rundvinster per spelare, vinnaren (eller oavgjort) och valen REMATCH / MAIN MENU.
var px, py, pw, ph, i, best, nbest, row_y, c, k, line, ry, vtxt, sel, nm;
scr_ui_header("BRATWURST // MATCH RESULT", string(g_rounds_total) + " ROUNDS PLAYED");
pw = min(g_vw - 80, 760);
ph = g_vh - 70 - 56;
px = g_vx + (g_vw - pw) / 2;
py = g_vy + 54;
scr_ui_pane(px, py, pw, ph, "FINAL RESULT", g_acc);

best = 0;
for (i = 0; i < g_n_players; i += 1) { best = max(best, g_wins[i]); }
nbest = 0;
for (i = 0; i < g_n_players; i += 1) { if (g_wins[i] == best) { nbest += 1; } }

// vinnarrad
g_fs = g_f_lg;
if (nbest == 1)
{
    for (i = 0; i < g_n_players; i += 1) { if (g_wins[i] == best) { c = i; } }
    scr_ui_text_c(px + pw / 2, py + 26, "PLAYER " + string(c + 1) + " WINS THE MATCH", scr_slot_colour(c));
}
else
{
    line = "";
    for (i = 0; i < g_n_players; i += 1)
    {
        if (g_wins[i] == best)
        {
            if (line != "") { line += " + "; }
            line += "P" + string(i + 1);
        }
    }
    scr_ui_text_c(px + pw / 2, py + 26, "TIE: " + line, g_c[10]);
}

// en rad per spelare
g_fs = g_f_md;
row_y = py + 90;
for (i = 0; i < g_n_players; i += 1)
{
    c = scr_slot_colour(i);
    ry = row_y + i * 48;
    if (g_wins[i] == best)
    {
        draw_set_color(g_c[1]);
        draw_rectangle(px + 16, ry - 4, px + pw - 16, ry + 36, false);
        draw_set_color(c);
        draw_rectangle(px + 16, ry - 4, px + 19, ry + 36, false);
    }
    scr_ui_text(px + 34, ry + 8, "PLAYER " + string(i + 1), c);
    nm = string_upper(g_ship_name[g_pship[i]]);
    scr_ui_text(px + 190, ry + 8, nm, g_c[4]);
    for (k = 0; k < g_rounds_total; k += 1)
    {
        if (k < g_wins[i]) { draw_set_color(c); draw_rectangle(px + 380 + k * 18, ry + 10, px + 390 + k * 18, ry + 20, false); }
        else { draw_set_color(g_c[3]); draw_rectangle(px + 380 + k * 18, ry + 10, px + 390 + k * 18, ry + 20, true); }
    }
    scr_ui_text_r(px + pw - 34, ry + 8, string(g_wins[i]) + " WINS", c);
}

// val
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
