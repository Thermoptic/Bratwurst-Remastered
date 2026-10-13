/// scr_player_respawn()
// Kors i obj_player. Aterstaller enligt originalets dodsrutin (kod 0x3f84-0x4026): fast startposition,
// hastighet 0, full energi och full kanonammo, nollade nedrakningar.
px = g_start_x[slot];
py = g_start_y[slot];
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
prev_px = px;
prev_py = py;
prev_ang = ang;
scr_player_outline();
