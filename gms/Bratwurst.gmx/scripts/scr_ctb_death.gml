/// scr_ctb_death()
// Capture the Bratwurst (D-082): kors i det forstorda skeppets kontext fran scr_player_lose_life. (1) Bar skeppet korven slapps den: den blir neutral och behaller sin
// fart (g_sa_vx/vy), sa att den glider vidare och kan plockas upp av bada lagen. (2) Kill-statistik: den vars vapen skadade skeppet de senaste 2 ticken (alltsa
// dodande traffen; en krasch i vagg lang efter en traff ger ingen kill) och som ar fiende far en kill. Inga poang for kills.
if (g_sa_st == 2 && g_sa_car == slot)
{
    g_sa_st = 1;
    g_sa_car = -1;
    g_sa_spin = 0;
}
if (hit_by >= 0 && (g_tick - hit_tick) <= 2)
{
    if (scr_team_of(hit_by) != scr_team_of(slot)) { g_ct_kills[hit_by] += 1; }
}
hit_by = -1;
