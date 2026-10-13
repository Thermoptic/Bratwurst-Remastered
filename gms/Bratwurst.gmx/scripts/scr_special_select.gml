/// scr_special_select()
// Kors i obj_player. PLACEHOLDER for skeppsvalets vapen- och pod-val: tangenterna kan anvandas under de forsta
// 250 tick (5 s) av en match. Originalet valjer detta i skeppsvalsmenyn (hunk0 0x12454, 0x12594).
// Vapen cyklas 0..5 och hoppar over otillgangliga (byte-test som koden 0x12444); pod cyklas bland pods med flagga != 0.
exit;   // Fas 2: ersatt av skeppsvalsmenyn (scr_menu_*)
var tries;
if (g_tick >= 250) { exit; }
if (in_wsel)
{
    tries = 0;
    do
    {
        sp_wtype = (sp_wtype + 1) mod 6;
        tries += 1;
    }
    until (sp_wtype == 0 || g_ship_weapon[ship, sp_wtype] != 0 || tries > 6);
    sp_ammo = scr_special_ammo();
}
if (in_psel && sp_nsel > 0)
{
    sp_pod_i = (sp_pod_i + 1) mod sp_nsel;
}
