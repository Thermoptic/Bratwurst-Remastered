/// scr_race_reset()
// Race (D-053, steg 1): nollar racets tillstand vid matchstart och vid varje ny runda: tid 0, malvarv ur LAPS-installningen, och per spelare 0 genomforda varv,
// ej i mal och ingen maltid. Kors efter att spelarna skapats (scr_game_start) och i scr_round_reset.
var k;
g_race_t = 0;
g_race_el = -1;
g_race_target = g_sv[g_SV_LAPS];
for (k = 0; k < g_pk_n; k += 1)
{
    g_pk_on[k] = true;   // alla pickuppunkter ar aktiva vid racets start
    g_pk_t[k] = 0;
}
with (obj_player)
{
    race_dnf = false;
    race_slow = 0;
    race_msg_t = 0;
    race_laps = 0;
    race_fin = false;
    race_ft = 0;
    race_ct = 0;   // tid (g_race_t) for senaste passagen av malrutan
    race_s0 = 0;   // startlage langs pilens riktning (storre = narmare linjen)
    race_x = 0;   // nettopassager av malrutan (framat +1, bakat -1)
    race_free = 0;   // 1 om skeppet startar bakom linjen: forsta passagen ar bara starten
    if (g_fin_on)
    {
        race_s0 = (px / 256 - g_fin_cx) * g_fin_dx + (py / 256 - g_fin_cy) * g_fin_dy;
        if ((px / 256 - g_fin_cx) * g_fin_dx + (py / 256 - g_fin_cy) * g_fin_dy < 0) { race_free = 1; }
    }
}
