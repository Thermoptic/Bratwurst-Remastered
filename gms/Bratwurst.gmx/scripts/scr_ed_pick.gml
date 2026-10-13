/// scr_ed_pick(world_x, world_y)
// Index pa den form vars kontur ligger narmast punkten (inom ca 14 skarmpixlar), annars -1.
var s, i, j, d, best, bd;
best = -1;
bd = 14 / g_ed_es;
for (s = g_ed_n - 1; s >= 0; s -= 1)
{
    for (i = 0; i < g_ed_pn[s]; i += 1)
    {
        j = (i + 1) mod g_ed_pn[s];
        d = scr_ed_dist(argument0, argument1, g_ed_px[s, i], g_ed_py[s, i], g_ed_px[s, j], g_ed_py[s, j]);
        if (d < bd) { bd = d; best = s; }
    }
}
return best;
