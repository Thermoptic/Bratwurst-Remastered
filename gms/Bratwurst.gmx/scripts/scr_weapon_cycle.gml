/// scr_weapon_cycle(ship, current, dir)
// Cyklar specialvapen och hoppar over otillgangliga, som originalet (kod 0x12454/0x12444: typ t >= 1 accepteras bara om tillganglighetsbyten for t ar != 0).
// Classic: 0..5 (NOTHING..CANNON TURRET) enligt skeppets .SOB. Astro Duel: bara MISSILE (1) och TURBO BOOST (3), for alla skepp.
var w, tries;
w = argument1;
tries = 0;
if (g_game_mode == 1)
{
    if (w == 1) { return 3; }
    return 1;
}
do
{
    w = (w + argument2 + 6) mod 6;
    tries += 1;
}
until (w == 0 || g_ship_weapon[argument0, w] != 0 || tries > 6);
return w;
