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
race_fin = false;   // Race (D-058): finns i alla lagen sa att traff- och kollisionstest kan fraga efter den
race_dnf = false;
race_ft = 0; race_laps = 0; race_x = 0; race_free = 0; race_ct = 0; race_s0 = 0; race_slow = 0; race_msg = ""; race_msg_t = 0;
respawn_t = 0;
drifting = false;
dr_snd = -1;
rg_snd = -1;
pu_auto = 0;
dr_off = 0;
scr_trail_clear();
reversing = false;
spin_v = 0;
spin_f = 0;
scr_player_respawn();
