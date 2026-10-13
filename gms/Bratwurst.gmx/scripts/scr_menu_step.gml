/// scr_menu_step()
// En tick i skeppsvalet. Alla aktiva spelare maste vara "READY" (steg 4); sedan startar matchen efter en kort paus.
var i, st, d, n, all_ready;
g_menu_tick += 1;
all_ready = true;
for (i = 0; i < g_n_players; i += 1)
{
    scr_menu_input(i);
    st = g_sel_stage[i];
    d = 0;
    if (g_mi_l) { d = -1; }
    if (g_mi_r) { d = 1; }
    if (st == 0)
    {
        // Skepp: vanster/hoger bladdrar, fire bekraftar
        if (d != 0) { g_sel_ship[i] = (g_sel_ship[i] + d + g_ship_count) mod g_ship_count; }
        if (g_mi_ok)
        {
            g_sel_weapon[i] = scr_weapon_first(g_sel_ship[i]);
            g_sel_pod[i] = 0;
            g_sel_stage[i] = 1;
        }
    }
    else if (st == 1)
    {
        // Specialvapen
        if (d != 0) { g_sel_weapon[i] = scr_weapon_cycle(g_sel_ship[i], g_sel_weapon[i], d); }
        if (g_mi_ok) { g_sel_stage[i] = 2; }
    }
    else if (st == 2)
    {
        // Pod att avfyra specialvapnet fran
        n = scr_sel_pod_count(g_sel_ship[i]);
        if (d != 0 && n > 0) { g_sel_pod[i] = (g_sel_pod[i] + d + n) mod n; }
        if (g_mi_ok) { g_sel_stage[i] = 3; }
    }
    else if (st == 3)
    {
        // IS THIS OK? YES / NO
        if (d != 0) { g_sel_yes[i] = 1 - g_sel_yes[i]; }
        if (g_mi_ok)
        {
            if (g_sel_yes[i] == 1) { g_sel_stage[i] = 4; }
            else { g_sel_stage[i] = 0; g_sel_yes[i] = 1; }
        }
    }
    if (g_sel_stage[i] != 4) { all_ready = false; }
}
// Ledig plats: fire pa den platsens indata lagger till en spelare (skeppsval borjar om for den platsen)
if (g_n_players < 4)
{
    scr_menu_input(g_n_players);
    if (g_mi_ok)
    {
        i = g_n_players;
        g_sel_stage[i] = 0;
        g_sel_yes[i] = 1;
        g_sel_ship[i] = g_pship[i];
        g_sel_weapon[i] = scr_weapon_first(g_sel_ship[i]);
        g_sel_pod[i] = 0;
        scr_players_set(g_n_players + 1);
        all_ready = false;
    }
}
if (all_ready)
{
    g_ready_tick += 1;
    if (g_ready_tick >= 60)
    {
        for (i = 0; i < g_n_players; i += 1)
        {
            g_pship[i] = g_sel_ship[i];
            g_pweapon[i] = g_sel_weapon[i];
            g_ppod[i] = g_sel_pod[i];
        }
        scr_game_start(g_n_players);
    }
}
else { g_ready_tick = 0; }
