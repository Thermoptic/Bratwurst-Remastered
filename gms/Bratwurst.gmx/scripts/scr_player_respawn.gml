/// scr_player_respawn()
// Kors i obj_player. Aterstaller enligt originalets dodsrutin (kod 0x3f84-0x4026): fast startposition,
// hastighet 0, full energi och full kanonammo, nollade nedrakningar.
px = g_start_x[slot];
py = g_start_y[slot];
vx = 0;
vy = 0;
ang = g_start_ang[slot];
turn_w = turn_init;
energy = energy_max;
cannon_ammo = ammo_max;
reload = 0;
sp_cool = 0;
sp_ammo = scr_special_ammo();
prev_px = px;
prev_py = py;
prev_ang = ang;
scr_player_outline();
