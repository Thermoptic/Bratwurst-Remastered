/// scr_pickup_grant()
// Race (D-056, steg 4): kors i den spelare som tog en pickup. Ger exakt ett av: 1 kanonskott (Plasma), 1 missil, 1 styrd missil eller ett fullt drivmedel for drift
// (DRIFTING FUEL). Mangden satts exakt (ingen stapling): ett nytt foremal ersatter det gamla. Specialvapnet valjs automatiskt. TILLFALLIGT i steg 4: foremalet
// slumpas bland alla fyra; steg 5 byter till rangordnade nivaer (ledare bara Plasma osv.).
var k, wt;
k = irandom(3);
if (k == 0)
{
    cannon_ammo = 1;
    race_msg = "PLASMA ACQUIRED";
}
else if (k == 1 || k == 2)
{
    for (wt = 0; wt < 6; wt += 1) { sp_pool[wt] = 0; }
    sp_wtype = k;
    sp_pool[k] = 1;
    sp_ammo = 1;
    sp_cool = 0;
    if (sp_nsel <= 0) { sp_sel[0] = 0; sp_nsel = 1; sp_pod_i = 0; }   // skepp utan markt specialpod anvander forsta podden
    if (k == 1) { race_msg = "MISSILE ACQUIRED"; } else { race_msg = "GUIDED MISSILE ACQUIRED"; }
}
else
{
    drift_fuel = g_DRIFT_FUEL;
    drift_rc = false;
    race_msg = "DRIFT UNLOCKED";
}
race_msg_t = 120;
scr_sfx_play(snd_sfx_hit, 2, 0.6);
