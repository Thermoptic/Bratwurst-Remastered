/// scr_weapon_first(ship)
// Forsta tillgangliga specialvapnet for skeppet. Classic: forsta av 1..5 som skeppet har (annars 0 = NOTHING). Astro Duel: alltid MISSILE (1).
var t;
if (g_game_mode == 1) { return 1; }
for (t = 1; t <= 5; t += 1)
{
    if (g_ship_weapon[argument0, t] != 0) { return t; }
}
return 0;
