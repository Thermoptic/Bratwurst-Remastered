/// scr_mn_step()
// En tick i huvudmenyn. Upp/ner = rad, vanster/hoger = andra varde (eller tillbaka/in), Enter = OK, Esc = tillbaka.
var node, sel, cnt, item, t, ok_adj, i;
g_menu_tick += 1;
scr_mp_mouse();   // musen i musikspelarpanelen (D-044)
node = g_mn_stk_node[g_mn_depth];
sel = g_mn_stk_sel[g_mn_depth];
cnt = g_mn_n[node];
if (g_nv_up) { sel = (sel - 1 + cnt) mod cnt; }
if (g_nv_down) { sel = (sel + 1) mod cnt; }
g_mn_stk_sel[g_mn_depth] = sel;
item = g_mn_kid[node, sel];
t = g_mn_type[item];
ok_adj = (t >= 2 && t <= 4);
// hemlig meny: tryck P i Options for att visa POWERUP EDITOR (syns sedan till spelet startas om)
if (node == g_mn_opts_node && !g_mn_pu_linked && keyboard_check_pressed(ord("P")))
{
    scr_mn_link(g_mn_opts_node, g_mn_pu_node);
    g_mn_pu_linked = true;
    g_mn_stk_sel[g_mn_depth] = g_mn_n[node] - 1;
}

if (g_nv_left)
{
    if (ok_adj) { scr_mn_adjust(item, -1); }
    else if (g_mn_depth > 0) { g_mn_depth -= 1; }
}
if (g_nv_right)
{
    if (ok_adj) { scr_mn_adjust(item, 1); }
    else if (t == 0)
    {
        g_mn_depth += 1;
        g_mn_stk_node[g_mn_depth] = item;
        g_mn_stk_sel[g_mn_depth] = 0;
    }
}
if (g_nv_ok)
{
    if (t == 0)
    {
        g_mn_depth += 1;
        g_mn_stk_node[g_mn_depth] = item;
        g_mn_stk_sel[g_mn_depth] = 0;
    }
    else if (ok_adj) { scr_mn_adjust(item, 1); }
    else if (t == 1)
    {
        if (g_mn_act[item] == 1) { g_game_mode = 0; scr_menu_enter(); }
        if (g_mn_act[item] == 5) { g_game_mode = 1; scr_menu_enter(); }
        if (g_mn_act[item] == 6) { g_game_mode = 4; scr_menu_enter(); }
        if (g_mn_act[item] == 7 && scr_race_maps() > 0) { g_game_mode = 2; scr_menu_enter(); }   // Race kraver minst en Race-bana (D-062)
        if (g_mn_act[item] == 2) { game_end(); }
        if (g_mn_act[item] == 4 && !g_pause_opts) { scr_ed_enter(g_sv[g_SV_MAP]); }   // banredigeraren finns inte under en match
        if (g_mn_act[item] == 3)
        {
            scr_set_defaults();
            scr_drift_apply();
            scr_theme_apply();
            scr_display_apply();
            g_n_players = g_sv[g_SV_PLAYERS];
            scr_set_save();
        }
    }
}
if (g_nv_back)
{
    if (g_mn_depth > 0) { g_mn_depth -= 1; }
    else if (g_pause_opts) { scr_pause_opts_close(); }   // tillbaka till pausmenyn
    else { g_state = 10; g_menu_tick = 0; }
}
