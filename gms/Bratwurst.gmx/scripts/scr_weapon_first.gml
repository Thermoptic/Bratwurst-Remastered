/// scr_weapon_first(ship)
// Forsta tillgangliga specialvapnet (1..5) for skeppet, annars 0 (NOTHING).
var t;
for (t = 1; t <= 5; t += 1)
{
    if (g_ship_weapon[argument0, t] != 0) { return t; }
}
return 0;
