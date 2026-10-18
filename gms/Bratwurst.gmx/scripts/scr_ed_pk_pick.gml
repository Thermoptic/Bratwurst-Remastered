/// scr_ed_pk_pick(world_x, world_y)
// Index pa den pickuppunkt i redigeraren som ligger narmast punkten (inom ca 14 skarmpixlar), annars -1.
var i, d, best, bd;
best = -1;
bd = 14 / g_ed_es;
for (i = 0; i < g_ed_pk_n; i += 1)
{
    d = point_distance(argument0, argument1, g_ed_pkx[i], g_ed_pky[i]);
    if (d < bd) { bd = d; best = i; }
}
return best;
