/// scr_sw_step()
// Super Smashwurst (D-085): en matchtick, kors i scr_game_step efter spelarna. Gransen: varje levande skepp vars mittpunkt ligger utanfor den roda gransen (scr_sw_inside) far en EGEN nedrakning
// (sw_oob = ticks kvar, OUT-OF-BOUNDS TIME x 50; -1 = inte utanfor). Kommer skeppet in igen avbryts nedrakningen direkt; gar det ut igen borjar en helt ny fran fullt varde. Nar den nar noll
// exploderar skeppet (scr_player_lose_life: ett liv bort, atersken pa en startplats eller eliminerad). Tiden raknas i ticks, 50 per sekund (spelets tidssteg, som alla timers; pausen stoppar den).
// Doda och eliminerade skepp har ingen nedrakning. Elimineringsmeddelandet (g_sw_msg) raknas ned har.
var lim;
lim = g_sv[g_SV_SWOB] * 50;
if (g_sw_msgt > 0) { g_sw_msgt -= 1; }
with (obj_player)
{
    if (alive)
    {
        if (scr_sw_inside(px / 256, py / 256)) { sw_oob = -1; }
        else
        {
            if (sw_oob < 0) { sw_oob = lim; } else { sw_oob -= 1; }
            if (sw_oob > 0 && sw_oob <= 150 && (sw_oob mod 50) == 0) { scr_sfx_play(snd_sfx_countdown, 2, 0.6); }   // ett pip per sekund de sista 3 sekunderna
            if (sw_oob <= 0)
            {
                sw_oob = -1;
                scr_player_lose_life();
            }
        }
    }
    else { sw_oob = -1; }
}
