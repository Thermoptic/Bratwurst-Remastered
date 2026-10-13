/// scr_arena_prepare()
// Vaggarnas avgransningsboxar (wall_minx/maxx/miny/maxy) genereras som literal-data i scr_data_arena.
// Har grupperas ocksa vaggsegmenten till objekt (sammanhangande linjer som delar punkter) for fargsattningen: g_wall_grp[k] = objektets nummer
// (0..g_wall_gn-1, i ordning efter forsta segmentet). Banan har 11 objekt.
var i, j, ch, m, ai, bi, aj, bj, lab, nxt;
for (i = 0; i < g_wall_n; i += 1) { g_wall_grp[i] = i; }
ch = true;
while (ch)
{
    ch = false;
    for (i = 0; i < g_wall_n; i += 1)
    {
        ai = g_wall_a[i]; bi = g_wall_b[i];
        for (j = 0; j < g_wall_n; j += 1)
        {
            aj = g_wall_a[j]; bj = g_wall_b[j];
            if ((ai == aj || ai == bj || bi == aj || bi == bj) && g_wall_grp[i] != g_wall_grp[j])
            {
                m = min(g_wall_grp[i], g_wall_grp[j]);
                g_wall_grp[i] = m;
                g_wall_grp[j] = m;
                ch = true;
            }
        }
    }
}
// tata nummer 0..n-1 i ordning
g_wall_gn = 0;
for (i = 0; i < g_wall_n; i += 1)
{
    lab = g_wall_grp[i];
    if (lab == i)
    {
        g_wall_tmp[i] = g_wall_gn;
        g_wall_gn += 1;
    }
}
for (i = 0; i < g_wall_n; i += 1) { g_wall_grp[i] = g_wall_tmp[g_wall_grp[i]]; }
