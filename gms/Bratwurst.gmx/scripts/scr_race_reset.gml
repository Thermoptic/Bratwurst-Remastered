/// scr_race_reset()
// Race (D-053, steg 1): nollar racets tillstand vid matchstart och vid varje ny runda: tid 0, malvarv ur LAPS-installningen, och per spelare 0 genomforda varv,
// ej i mal och ingen maltid. Kors efter att spelarna skapats (scr_game_start) och i scr_round_reset.
g_race_t = 0;
g_race_target = g_sv[g_SV_LAPS];
with (obj_player)
{
    race_slow = 0;
    race_laps = 0;
    race_fin = false;
    race_ft = 0;
    race_x = 0;   // nettopassager av malrutan (framat +1, bakat -1)
    race_free = 0;   // 1 om skeppet startar bakom linjen: forsta passagen ar bara starten
    if (g_fin_on)
    {
        if ((px / 256 - g_fin_cx) * g_fin_dx + (py / 256 - g_fin_cy) * g_fin_dy < 0) { race_free = 1; }
    }
}
