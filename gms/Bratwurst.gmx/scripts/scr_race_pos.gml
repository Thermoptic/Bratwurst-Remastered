/// scr_race_pos(player_id, unfinished_only)
// Race (D-057, steg 5): placering (1 = ledare) for en racer. Racare = levande skepp. Med unfinished_only = true raknas bara de som inte ar klara (for
// pickupnivaerna: forst/mitten/sist bland dem som annu tavlar); annars alla (for panelens placering). Satter g_rk_n = antal jamforda racare.
g_rk_a = argument0;
g_rk_u = argument1;
g_rk_n = 0;
g_rk_ahead = 0;
with (obj_player)
{
    if (alive && !(g_rk_u && race_fin))
    {
        g_rk_n += 1;
        if (id != g_rk_a)
        {
            if (scr_race_ahead(id, g_rk_a)) { g_rk_ahead += 1; }
        }
    }
}
return g_rk_ahead + 1;
