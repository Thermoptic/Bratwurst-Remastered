/// scr_player_respawn()
// Kors i obj_player. Aterstaller enligt originalets dodsrutin (kod 0x3f84-0x4026): fast startposition,
// hastighet 0, full energi och full kanonammo, nollade nedrakningar.
px = g_start_x[slot];
py = g_start_y[slot];
drifting = false;
if (g_game_mode == 2) { drift_fuel = 0; } else { drift_fuel = g_DRIFT_FUEL; }   // Drifting fuel (D-052): full matare vid start, ny runda och efter ett liv; Race: tom (drift av tills en pickup, D-055)
race_slow = 0;
sw_push = 0;   // Super Smashwurst (D-085): Push nollas vid start, ny runda och efter varje liv; ingen nedrakning
sw_oob = -1;
race_msg = "";
race_msg_t = 0;
drift_rc = false;
ast_cd = 0;   // skydd mot nya stenskador (Asteroids)
pu_have = 0;
pu_charge = 0;   // en hallen powerup gar forlorad nar man dor / ny runda
scr_trail_clear();
reversing = false;
spin_v = 0;
spin_f = 0;
vx = 0;
vy = 0;
ang = g_start_ang[slot];
turn_w = turn_init;
energy = energy_max;
cannon_ammo = ammo_max;
reload = 0;
boost_timer = 0;
ad_charges = g_AD_SHOTS;   // Astro Duel: full laddning efter respawn
ad_cool = 0;
ad_dmg = 0;
ad_inv = 0;   // Galaxy Duel: inte skadad (D-051)
sp_cool = 0;
sp_ammo = scr_special_ammo();
var wt, wsave;
wsave = sp_wtype;
for (wt = 0; wt < 6; wt += 1)
{
    sp_wtype = wt;
    sp_pool[wt] = scr_special_ammo();
}
sp_wtype = wsave;
if (g_game_mode == 2)
{
    // Race (D-055): ingen ammo alls vid start; pickups ger skott (steg 4)
    cannon_ammo = 0;
    sp_ammo = 0;
    for (wt = 0; wt < 6; wt += 1) { sp_pool[wt] = 0; }
}
prev_px = px;
prev_py = py;
prev_ang = ang;
scr_player_outline();
