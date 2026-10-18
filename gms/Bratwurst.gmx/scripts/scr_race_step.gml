/// scr_race_step()
// Race (D-053, steg 1): kors varje matchtick (bara i Race). Racetimern gar medan rundan pagar; nedrakningen efter rundslutet (g_end_timer) stoppar den.
// Steg 2 (D-054): varvraknaren, scr_fin_cross (malrutan), for varje levande skepp som inte ar klart.
if (g_end_timer < 0) { g_race_t += 1; scr_pickup_step(); }
if (g_fin_on && g_end_timer < 0)
{
    with (obj_player) { if (alive && !race_fin) { scr_fin_cross(); } }
}
