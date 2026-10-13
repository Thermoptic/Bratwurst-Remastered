/// scr_last_alive()
// Returnerar platsnummer (0..3) for en levande spelare, annars -1.
g_tmp_slot = -1;
with (obj_player)
{
    if (alive || respawn_t > 0) { g_tmp_slot = slot; }
}
return g_tmp_slot;
