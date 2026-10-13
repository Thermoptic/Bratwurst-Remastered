/// scr_special_init()
// Kors i obj_player. Specialvapenstate. Vapentillganglighet kommer fran .SOB (P11..: bytes, VERIFIERAD, docs/15).
// Skeppsvalsmenyn finns inte an: forsta tillgangliga vapnet valjs, och valbara pods = pods med flagga != 0.
var t, p;
sp_wtype = 0;
for (t = 1; t <= 5; t += 1)
{
    if (g_ship_weapon[ship, t] != 0) { sp_wtype = t; break; }
}
sp_sel[0] = 0;
sp_nsel = 0;
for (p = 0; p < nk; p += 1)
{
    if (g_ship_pod_flag[ship, p] != 0)
    {
        sp_sel[sp_nsel] = p;
        sp_nsel += 1;
    }
}
sp_pod_i = 0;
if (g_pweapon[slot] >= 0) { sp_wtype = g_pweapon[slot]; }       // val fran skeppsvalet
if (g_ppod[slot] >= 0 && sp_nsel > 0) { sp_pod_i = min(g_ppod[slot], sp_nsel - 1); }
sp_cool = 0;
sp_ammo = 0;
