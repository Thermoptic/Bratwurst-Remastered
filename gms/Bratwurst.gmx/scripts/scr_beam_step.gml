/// scr_beam_step()
// Kors varje matchtick. Railgunstralens huvud far fram med konstant fart over hela banan (BEAM SPEED); varje skepp (utom agaren) som huvudet nar, over alla vaggar
// och foremal, tar DAMAGE en gang (100 = dodar; Astro Duel: alla traffar dodar). Stralen ligger kvar (BEAM HOLD TIME) och tonar sedan ut (BEAM FADE TIME).
var k, age, prog, hd;
for (k = 0; k < g_BM_MAX; k += 1)
{
    if (g_bm_on[k])
    {
        g_bm_age[k] += 1;
        age = g_bm_age[k];
        if (age <= g_bm_sweep[k] + 1)
        {
            prog = min(1, age / g_bm_sweep[k]);
            hd = g_bm_len[k] * prog;
            g_sd_x1 = g_bm_x[k];
            g_sd_y1 = g_bm_y[k];
            g_sd_x2 = g_bm_x[k] + g_bm_dx[k] * hd;
            g_sd_y2 = g_bm_y[k] + g_bm_dy[k] * hd;
            g_bm_cur = k;
            if (g_game_mode == 4) { scr_ast_beam(g_sd_x1, g_sd_y1, g_sd_x2, g_sd_y2, g_bm_w[k]); }   // Asteroids: stralen forintar stenar
            with (obj_player)
            {
                if (alive && slot != g_bm_owner[g_bm_cur] && ((g_bm_hit[g_bm_cur] & (1 << slot)) == 0))
                {
                    var jb, hitp;
                    hitp = false;
                    for (jb = 0; jb < np; jb += 1)
                    {
                        if (scr_seg_dist(ow_x[jb], ow_y[jb], g_sd_x1, g_sd_y1, g_sd_x2, g_sd_y2) <= g_bm_w[g_bm_cur] / 2 + 1) { hitp = true; break; }
                    }
                    if (hitp)
                    {
                        g_bm_hit[g_bm_cur] = g_bm_hit[g_bm_cur] | (1 << slot);
                        scr_spark_burst(floor(px / 256), floor(py / 256), 30, 4, scr_slot_colour(slot));
                        if (g_game_mode == 1) { energy = 0; } else { energy -= g_bm_dmg[g_bm_cur]; }
                        if (energy <= 0) { scr_player_lose_life(); }
                    }
                }
            }
        }
        if (age > g_bm_sweep[k] + g_bm_hold[k] + g_bm_fade[k]) { g_bm_on[k] = false; }
    }
}
