/// scr_race_step()
// Race (D-053, steg 1): kors varje matchtick (bara i Race). Racetimern gar medan rundan pagar; nedrakningen efter rundslutet (g_end_timer) stoppar den.
// Steg 6 (D-058): avgorande, utslagning av sista racern och resultat. Steg 2 (D-054): varvraknaren, scr_fin_cross (malrutan), for varje levande skepp som inte ar klart.
var nu, nf;
if (g_end_timer < 0)
{
    g_race_t += 1;
    scr_pickup_step();
    if (g_fin_on)
    {
        with (obj_player) { if (alive && !race_fin) { scr_fin_cross(); } }
    }
    // avgorande (D-058): alla klara/utslagna -> racet slutar efter 1 s; ar bara en racer kvar som inte ar klar (och nagon annan ar klar) far den 4 s, sedan exploderar den
    nu = 0;
    nf = 0;
    with (obj_player)
    {
        if (alive)
        {
            if (race_fin) { nf += 1; } else { nu += 1; }
        }
    }
    if (nu == 0) { g_end_timer = 50; g_race_el = -1; }
    else if (nu == 1 && nf >= 1)
    {
        if (g_race_el < 0) { g_race_el = g_END_DELAY; }
        else
        {
            g_race_el -= 1;
            if (g_race_el <= 0)
            {
                g_race_el = -1;
                with (obj_player) { if (alive && !race_fin) { scr_race_eliminate(); } }
            }
        }
    }
    else { g_race_el = -1; }
}
else
{
    g_end_timer -= 1;
    if (g_end_timer < 0) { g_end_timer = -1; scr_race_round_end(); }
}
