/// scr_race_round_end()
// Race (D-058, steg 6): racet ar over (alla klara eller utslagna). Sorterar racarna (klara efter tid, sedan ovriga efter framsteg, scr_race_ahead) till
// resultatlistan g_rr_*, utser vinnaren (nummer ett om den ar klar) som rundvinnare (g_wins) och visar resultatrutan (g_state = 2, scr_race_results_draw).
var i, j, t, o;
g_rr_n = 0;
with (obj_player)
{
    g_rr_id[g_rr_n] = id;
    g_rr_n += 1;
}
for (i = 0; i < g_rr_n - 1; i += 1)
{
    for (j = 0; j < g_rr_n - 1 - i; j += 1)
    {
        if (scr_race_ahead(g_rr_id[j + 1], g_rr_id[j])) { t = g_rr_id[j]; g_rr_id[j] = g_rr_id[j + 1]; g_rr_id[j + 1] = t; }
    }
}
for (i = 0; i < g_rr_n; i += 1)
{
    o = g_rr_id[i];
    g_rr_slot[i] = o.slot;
    g_rr_ft[i] = o.race_ft;
    g_rr_fin[i] = o.race_fin;
    g_rr_dnf[i] = o.race_dnf;
    g_rr_nm[i] = o.ship_name;
}
g_winner = -1;
if (g_rr_n > 0) { if (g_rr_fin[0]) { g_winner = g_rr_slot[0]; } }
if (g_winner >= 0) { g_wins[g_winner] += 1; }
g_state = 2;
g_round_timer = 0;
g_end_timer = -1;
