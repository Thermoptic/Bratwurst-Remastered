/// scr_player_change_ship(dir)
// Kors i obj_player. TESTFUNKTION (PLACEHOLDER): byter skepp under matchen. Position/hastighet/vinkel/liv behalls;
// energi, ammo och specialvapen aterstalls for det nya skeppet.
var ns;
ns = (ship + argument0 + g_ship_count) mod g_ship_count;
scr_player_load_ship(ns, false);
g_pship[slot] = ns;
g_sel_ship[slot] = ns;
energy = energy_max;
cannon_ammo = ammo_max;
turn_w = turn_init;
sp_cool = 0;
sp_ammo = scr_special_ammo();
scr_player_outline();
