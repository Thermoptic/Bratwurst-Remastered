/// scr_round_reset()
// Ny runda i samma match: alla spelare far full energi, alla liv och ammo och startar pa sina startplatser. Skeppen, vapen och bana behalls.
with (obj_shot) { instance_destroy(); }
with (obj_missile) { instance_destroy(); }
with (obj_fx) { instance_destroy(); }
with (obj_player)
{
    alive = true;
    respawn_t = 0;
    p_lives = g_lives_max;
    rear_fire = false;   // D-015
    scr_player_respawn();
}
scr_spark_clear();
g_state = 1;
g_winner = -1;
g_tick = 0;
g_round_timer = 0;
g_end_timer = -1;
scr_camera_update();
