/// scr_round_over_step()
// En tick medan rundresultatet visas (g_state = 2). Efter 3 sekunder: nasta runda, eller slutresultatet efter sista rundan.
if (g_game_mode == 2 || g_game_mode == 3)   // Capture the Bratwurst har samma resultatruta som Race: bekrafta efter en sekund (D-082)
{
    // Race (D-058): resultatrutan visas tills spelaren bekraftar (efter en sekund); nasta race eller slutresultatet
    g_round_timer += 1;
    if (g_round_timer >= 50 && g_nv_ok)
    {
        if (g_round >= g_rounds_total)
        {
            g_state = 30;
            g_res_sel = 0;
            g_menu_tick = 0;
        }
        else
        {
            g_round += 1;
            scr_round_reset();
        }
    }
    exit;
}
g_round_timer += 1;
if (g_round_timer >= 180)
{
    if (g_round >= g_rounds_total)
    {
        g_state = 30;
        g_res_sel = 0;
        g_menu_tick = 0;
    }
    else
    {
        g_round += 1;
        scr_round_reset();
    }
}
