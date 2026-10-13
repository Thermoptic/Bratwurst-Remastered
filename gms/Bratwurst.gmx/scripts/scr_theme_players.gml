/// scr_theme_players()
// Valjer fyra tydligt olika spelarfarger ur temats accentfarger (base08..base0E): den fyrtupel som maximerar det minsta fargavstandet
// mellan spelarna och mot bakgrunden. Resultatet i g_pc[0..3] (P1..P4); ordningen foljer base-indexet. Kors efter scr_theme_apply.
var a, b, c, d, best, bscore, pick, i, k, m, idx, sc, bgd, wpal;
best = -1;
pick[0] = 8; pick[1] = 9; pick[2] = 10; pick[3] = 11;
for (a = 8; a <= 11; a += 1)
{
    for (b = a + 1; b <= 12; b += 1)
    {
        for (c = b + 1; c <= 13; c += 1)
        {
            for (d = c + 1; d <= 14; d += 1)
            {
                idx[0] = a; idx[1] = b; idx[2] = c; idx[3] = d;
                bscore = 100000;
                for (i = 0; i < 4; i += 1)
                {
                    bgd = scr_colour_dist(g_c[idx[i]], g_c[0]) * 0.7;
                    bscore = min(bscore, bgd);
                    for (k = i + 1; k < 4; k += 1)
                    {
                        bscore = min(bscore, scr_colour_dist(g_c[idx[i]], g_c[idx[k]]));
                    }
                }
                if (bscore > best)
                {
                    best = bscore;
                    for (m = 0; m < 4; m += 1) { pick[m] = idx[m]; }
                }
            }
        }
    }
}
for (m = 0; m < 4; m += 1) { g_pc[m] = g_c[pick[m]]; }

// Vaggfarger: elva olika fargade objekt. Alla temats accentfarger plus base0F, base07, base05 och base04, i en ordning som skiljer grannar,
// och nedtonade mot bakgrunden sa att de ljusa spelarskeppen syns tydligt mot dem.
wpal[0] = 8; wpal[1] = 11; wpal[2] = 13; wpal[3] = 9; wpal[4] = 12; wpal[5] = 14; wpal[6] = 10; wpal[7] = 15; wpal[8] = 7; wpal[9] = 5; wpal[10] = 4;
for (m = 0; m < 11; m += 1) { g_wcol[m] = merge_colour(g_c[0], g_c[wpal[m]], 0.8); }

