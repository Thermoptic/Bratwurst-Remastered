/// scr_ctb_round_end()
// Capture the Bratwurst (D-082): rundan ar slut (poanggransen nadd eller tiden ute). Hogst poang vinner; lika poang avgors av lagets sammanlagda barform (D-081, svar 5),
// och ar den ocksa lika blir det oavgjort (g_ct_win = -1, ingen rundvinst). Rundvinsten laggs i g_ct_rw, resultatrutan visas (g_state = 2). Barformen stoppas
// (korven barar inte langre).
var i, c0, c1;
g_ct_tie = false;
g_ct_win = -1;
if (g_ct_score[0] > g_ct_score[1]) { g_ct_win = 0; }
else if (g_ct_score[1] > g_ct_score[0]) { g_ct_win = 1; }
else
{
    c0 = 0;
    c1 = 0;
    for (i = 0; i < g_n_players; i += 1)
    {
        if (scr_team_of(i) == 0) { c0 += g_ct_carry[i]; } else { c1 += g_ct_carry[i]; }
    }
    if (c0 > c1) { g_ct_win = 0; g_ct_tie = true; }
    else if (c1 > c0) { g_ct_win = 1; g_ct_tie = true; }
}
if (g_ct_win >= 0) { g_ct_rw[g_ct_win] += 1; }
g_sa_car = -1;
g_state = 2;
g_round_timer = 0;
g_winner = -1;
g_end_timer = -1;
