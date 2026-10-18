/// scr_race_results_draw()
// Race (D-058, steg 6): resultatrutan efter ett race: vinnaren, placeringarna med skepp och maltid (eller ELIMINATED / DID NOT FINISH) och uppmaningen
// "PRESS TO ENTER NEXT RACE" (efter sista racet: PRESS TO SEE THE FINAL RESULT). Fortsatt med bekrafta (Enter, mellanslag, Z, A eller Start) efter en sekund.
var pwx, phx, cx, cy, rw, rh, i, yy, c, nm, lx, rx;
pwx = g_PLAY_W * g_SCALE;
phx = g_PLAY_H * g_SCALE;
cx = g_OX + pwx / 2;
cy = g_OY + phx / 2;
rw = min(pwx - 24, 480);
rh = 118 + g_rr_n * 22 + 30;
lx = cx - rw / 2;
rx = cx + rw / 2;
g_fs = g_f_sm;
scr_ui_pane(lx, cy - rh / 2, rw, rh, "RACE RESULT // RACE " + string(g_round) + " OF " + string(g_rounds_total), g_acc);
yy = cy - rh / 2 + 28;
g_fs = g_f_md;
if (g_winner >= 0) { scr_ui_text_c(cx, yy, "PLAYER " + string(g_winner + 1) + " WINS", scr_slot_colour(g_winner)); }
else { scr_ui_text_c(cx, yy, "NO WINNER", g_c[10]); }
yy += 38;
g_fs = g_f_sm;
for (i = 0; i < g_rr_n; i += 1)
{
    c = scr_slot_colour(g_rr_slot[i]);
    nm = string_copy(string_upper(g_rr_nm[i]), 1, 14);
    scr_ui_text(lx + 16, yy, string(i + 1) + ".  P" + string(g_rr_slot[i] + 1) + "  " + nm, c);
    if (g_rr_fin[i]) { scr_ui_text_r(rx - 16, yy, scr_race_time(g_rr_ft[i]), c); }
    else if (g_rr_dnf[i]) { scr_ui_text_r(rx - 16, yy, "ELIMINATED", g_c[8]); }
    else { scr_ui_text_r(rx - 16, yy, "DID NOT FINISH", g_c[8]); }
    yy += 22;
}
yy += 10;
if (g_round_timer >= 50 && (g_bg_t mod 60) < 42)
{
    if (g_round >= g_rounds_total) { scr_ui_text_c(cx, yy, "PRESS TO SEE THE FINAL RESULT", g_c[6]); }
    else { scr_ui_text_c(cx, yy, "PRESS TO ENTER NEXT RACE", g_c[6]); }
}
