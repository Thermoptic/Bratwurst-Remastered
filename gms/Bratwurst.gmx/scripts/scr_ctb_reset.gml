/// scr_ctb_reset()
// Capture the Bratwurst (D-082): nollstaller allt som galler en runda (matchstart och varje ny runda): poang, kills, barform, rundtimer (TIME LIMIT i minuter, 50 ticks
// per sekund), faser och korven (aterskapas med sin animation). Matchens rundvinster (g_ct_rw) rors inte har; de nollas bara vid matchstart (scr_game_start).
var i;
g_ct_score[0] = 0;
g_ct_score[1] = 0;
for (i = 0; i < 4; i += 1) { g_ct_kills[i] = 0; g_ct_carry[i] = 0; }
g_ct_t = g_sv[g_SV_CTTM] * 3000;
g_ct_phase = 0;
g_ct_pt = 0;
g_ct_zero = 0;
g_ct_lim = false;
g_ct_scorer = -1;
g_ct_win = -1;
g_ct_tie = false;
g_sa_ang = 0;
scr_ctb_spawn();
