/// scr_count_alive()
// Returnerar antal levande spelare.
g_tmp_n = 0;
with (obj_player)
{
    if (alive) { g_tmp_n += 1; }
}
return g_tmp_n;
