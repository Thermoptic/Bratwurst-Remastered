/// scr_ship_collisions()
// Kollision mellan alla levande spelare, en gang per tick efter att alla skepp flyttats (D-018). Se scr_ship_bounce.
var i, j, n, a, b;
g_tmp_n = 0;
with (obj_player)
{
    if (alive)
    {
        g_col_id[g_tmp_n] = id;
        g_tmp_n += 1;
    }
}
n = g_tmp_n;
for (i = 0; i < n; i += 1)
{
    for (j = i + 1; j < n; j += 1)
    {
        a = g_col_id[i];
        b = g_col_id[j];
        if (scr_ships_overlap(a, b))
        {
            scr_ship_bounce(a, b);
            if (scr_ships_overlap(a, b)) { scr_ship_separate(a, b); }   // fortfarande ihopfastade: skjut isar
        }
    }
}
