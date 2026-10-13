/// scr_weapon_cycle(ship, current, dir)
// Cyklar specialvapen 0..5 (NOTHING..CANNON TURRET) och hoppar over otillgangliga, som originalet (kod 0x12454/0x12444:
// typ t >= 1 accepteras bara om tillganglighetsbyten for t ar != 0).
var w, tries;
w = argument1;
tries = 0;
do
{
    w = (w + argument2 + 6) mod 6;
    tries += 1;
}
until (w == 0 || g_ship_weapon[argument0, w] != 0 || tries > 6);
return w;
