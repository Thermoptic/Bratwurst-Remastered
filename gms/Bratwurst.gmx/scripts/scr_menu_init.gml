/// scr_menu_init()
// Skeppsvalets tillstand for fyra platser. Flodet foljer originalet (docs/03, strangar i exe): SHIP -> SPECIAL WEAPON ->
// (pod) -> IS THIS OK? YES/NO -> PLAYER n IS READY. Navigeringen (vanster/hoger + fire) ar enligt manualen; pod-steget
// och exakt layout ar PLACEHOLDERS.
var i;
for (i = 0; i < 4; i += 1)
{
    g_sel_stage[i] = 0;
    g_sel_ship[i] = g_pship[i];
    g_sel_weapon[i] = scr_weapon_first(g_pship[i]);
    g_sel_pod[i] = 0;
    g_sel_yes[i] = 1;
    g_mi_prevx[i] = 0;
    g_pweapon[i] = -1;
    g_ppod[i] = -1;
}
g_state = 0;
g_menu_tick = 0;
g_ready_tick = 0;
