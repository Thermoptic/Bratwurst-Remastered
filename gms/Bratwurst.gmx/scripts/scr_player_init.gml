/// scr_player_init(slot, ship_index)
// Kors i en obj_player-instans vid matchstart.
slot = argument0;
boost_timer = 0;
rear_fire = false;   // bakatskjutning last tills powerup (D-015)
scr_player_load_ship(argument1, true);
p_lives = g_lives_max;
fire_prev = false;
ad_charges = g_AD_SHOTS;
ad_cool = 0;
alive = true;
respawn_t = 0;
drifting = false;
scr_trail_clear();
reversing = false;
spin_v = 0;
spin_f = 0;
scr_player_respawn();
