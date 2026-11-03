/// scr_ctb_results_draw()
// Capture the Bratwurst (D-081, svar 8): resultatrutan efter en runda (som Race): vinnande lag eller DRAW (med "WON ON CARRY TIME" om barformen avgjorde), slutpoang
// "RED 5 - BLUE 3", kills per spelare (den eller de med flest markerade) och barform per spelare (M:SS), samt uppmaningen att fortsatta (efter en sekund): nasta runda
// eller slutresultatet. Kors i scr_match_draw nar g_state == 2 i laget.
var pwx, phx, cx, cy, rw, rh, lx, rx, yy, i, c, best, ctext, rowtxt;
pwx = g_PLAY_W * g_SCALE;
phx = g_PLAY_H * g_SCALE;
cx = g_OX + pwx / 2;
cy = g_OY + phx / 2;
rw = min(pwx - 24, 520);
rh = 190 + g_n_players * 22 + 30;
lx = cx - rw / 2;
rx = cx + rw / 2;
g_fs = g_f_sm;
scr_ui_pane(lx, cy - rh / 2, rw, rh, "ROUND " + string(g_round) + " OF " + string(g_rounds_total), g_acc);
yy = cy - rh / 2 + 30;
g_fs = g_f_md;
if (g_ct_win == 0) { scr_ui_text_c(cx, yy, "RED TEAM WINS THE ROUND!", g_team_col[0]); }
else if (g_ct_win == 1) { scr_ui_text_c(cx, yy, "BLUE TEAM WINS THE ROUND!", g_team_col[1]); }
else { scr_ui_text_c(cx, yy, "DRAW", g_c[10]); }
yy += 34;
g_fs = g_f_md;
scr_ui_text_c(cx, yy, "RED " + string(g_ct_score[0]) + " - BLUE " + string(g_ct_score[1]), g_c[5]);
yy += 26;
g_fs = g_f_sm;
if (g_ct_tie) { scr_ui_text_c(cx, yy, "SCORE WAS LEVEL: WON ON SAUSAGE CARRY TIME", g_c[4]); }
else if (g_ct_win < 0) { scr_ui_text_c(cx, yy, "SCORE AND CARRY TIME WERE LEVEL", g_c[4]); }
yy += 22;
// flest kills
best = 0;
for (i = 0; i < g_n_players; i += 1) { best = max(best, g_ct_kills[i]); }
ctext = "";
if (best > 0)
{
    for (i = 0; i < g_n_players; i += 1)
    {
        if (g_ct_kills[i] == best)
        {
            if (ctext != "") { ctext += " + "; }
            ctext += "P" + string(i + 1);
        }
    }
    ctext = "MOST KILLS: " + ctext + " - " + string(best);
}
else { ctext = "NO KILLS THIS ROUND"; }
scr_ui_text_c(cx, yy, ctext, g_acc);
yy += 28;
scr_ui_text(lx + 16, yy, "PLAYER", g_c[3]);
scr_ui_text_r(rx - 130, yy, "KILLS", g_c[3]);
scr_ui_text_r(rx - 16, yy, "CARRY TIME", g_c[3]);
yy += 20;
for (i = 0; i < g_n_players; i += 1)
{
    c = scr_slot_colour(i);
    rowtxt = "P" + string(i + 1);
    if (scr_team_of(i) == 0) { rowtxt += "  RED"; } else { rowtxt += "  BLUE"; }
    scr_ui_text(lx + 16, yy, rowtxt, c);
    if (best > 0 && g_ct_kills[i] == best) { scr_ui_text_r(rx - 130, yy, "* " + string(g_ct_kills[i]), g_acc); }
    else { scr_ui_text_r(rx - 130, yy, string(g_ct_kills[i]), c); }
    scr_ui_text_r(rx - 16, yy, scr_ctb_clock(g_ct_carry[i]), c);
    yy += 22;
}
yy += 12;
if (g_round_timer >= 50 && (g_bg_t mod 60) < 42)
{
    if (g_round >= g_rounds_total) { scr_ui_text_c(cx, yy, "PRESS TO SEE THE FINAL RESULT", g_c[6]); }
    else { scr_ui_text_c(cx, yy, "PRESS TO ENTER NEXT ROUND", g_c[6]); }
}
