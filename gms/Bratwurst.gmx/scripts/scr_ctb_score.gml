/// scr_ctb_score(team)
// Capture the Bratwurst (D-082): en giltig leverans ger laget exakt ett poang, en gang. Korven forsvinner (ingen kan plocka upp eller poangsatta), meddelandet
// "RED/BLUE TEAM SCORES!" visas i 3 s (fas 1) och sedan nedrakningen 3-0 (fas 2); darefter aterskapas korven. Nar poanggransen nas avslutas rundan efter meddelandet
// i stallet. Rundtimern, poangen, kills och barform rors inte.
g_ct_score[argument0] += 1;
g_ct_scorer = argument0;
g_ct_phase = 1;
g_ct_pt = 150;
g_ct_lim = (g_ct_score[argument0] >= g_sv[g_SV_CTSC]);
g_sa_st = 3;
g_sa_car = -1;
g_sa_spin = 0;
scr_sfx_play(snd_sfx_explosion, 1, 1);
