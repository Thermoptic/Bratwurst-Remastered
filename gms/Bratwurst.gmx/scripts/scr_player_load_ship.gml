/// scr_player_load_ship(ship_index, use_menu_choice)
// Kors i obj_player. Laser in ett skepps data (form, parametrar, pods, specialvapen). Anvands vid start och vid skeppsbyte under match.
// Parametermappning P0..P10 = VERIFIERAD fil->variabel (docs/15 steg 4); betydelsen av ENERGY/CANNON_AMMO ar SANNOLIK.
// use_menu_choice = true: anvand skeppsvalets vapen-/podval (start); false: standardval (skeppsbyte).
ship = argument0;
ship_name = g_ship_name[ship];
np = g_ship_np[ship];
nl = g_ship_nl[ship];
nk = g_ship_nk[ship];

drag       = g_ship_par[ship, 0];   // P0  vx -= vx*drag/256 per tick
thrust     = g_ship_par[ship, 1];   // P1  v += sin/cos*thrust/8
reload_val = g_ship_par[ship, 2];   // P2  ticks mellan kanonsalvor
energy_max = g_ship_par[ship, 3];   // P3  (SANNOLIK energi)
turn_init  = g_ship_par[ship, 4];   // P4
turn_max   = g_ship_par[ship, 5];   // P5
turn_acc   = g_ship_par[ship, 6];   // P6
shot_shift = g_ship_par[ship, 7];   // P7  skotthastighet = sin/cos << shift
bounce     = g_ship_par[ship, 8];   // P8  studs-skift mot skott
ammo_max   = g_ship_par[ship, 9];   // P9  (SANNOLIK kanonammo)
sp_base    = g_ship_par[ship, 10];  // P10 bas for specialammo

if (!argument1) { g_pweapon[slot] = -1; g_ppod[slot] = -1; }
scr_special_init();

// Bakatskjutning (D-015): kanonpods som pekar bakat (podvinkel 65..191 i 1/256 varv) skjuter bara om rear_fire ar sant.
var pq;
pod_rear[0] = false;
for (pq = 0; pq < nk; pq += 1)
{
    pod_rear[pq] = (g_ship_pod_ang[ship, pq] > 64 && g_ship_pod_ang[ship, pq] < 192);
}
