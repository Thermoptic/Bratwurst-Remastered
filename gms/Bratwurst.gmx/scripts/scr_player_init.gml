/// scr_player_init(slot, ship_index)
// Kors i en obj_player-instans vid matchstart.
slot = argument0;
rear_fire = false;   // bakatskjutning last tills powerup (D-015)
scr_player_load_ship(argument1, true);
p_lives = g_START_LIVES;
alive = true;
scr_player_respawn();
