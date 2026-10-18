/// scr_hud_panel(slot, x, y, w, h)
// Spelarpanel i matchen (terminalstil), alltid langs nederkanten. Bredden kommer fran scr_hud_draw (panelerna delar raden lika).
// Innehall: energi, kanonammo, liv, specialvapen + nedrakning, bakat-skjutning och skeppets kontur till hoger.
var sl, px, py, pw, ph, c, p, y0, i, fr, bw, cdx, hp;
sl = argument0; px = argument1; py = argument2; pw = argument3; ph = argument4;
c = scr_slot_colour(sl);
g_hud_slot = sl;
g_hud_id = noone;
with (obj_player)
{
    if (slot == g_hud_slot) { g_hud_id = id; }
}
p = g_hud_id;
if (p == noone)
{
    scr_ui_pane(px, py, pw, ph, "P" + string(sl + 1) + " // NO PLAYER", g_c[3]);
    exit;
}
if (p.alive) { scr_ui_pane(px, py, pw, ph, "P" + string(sl + 1) + " // " + string_upper(p.ship_name), c); }
else if (p.respawn_t > 0) { scr_ui_pane(px, py, pw, ph, "P" + string(sl + 1) + " // RESPAWN", c); }
else { scr_ui_pane(px, py, pw, ph, "P" + string(sl + 1) + " // ELIMINATED", g_c[8]); }
g_fs = g_f_sm;
scr_ui_text_r(px + pw - 12, py + 14, "WINS " + string(g_wins[sl]), c);
bw = min(pw - 150, 320);
y0 = py + 16;

if (g_game_mode == 1)
{
    // Astro Duel: skott kvar (3 rutor) + nedkylning, liv och laddningstext
    scr_ui_text(px + 12, y0, "SH", g_c[4]);
    for (i = 0; i < g_AD_SHOTS; i += 1)
    {
        if (i < p.ad_charges) { draw_set_color(c); draw_rectangle(px + 42 + i * 22, y0 + 2, px + 54 + i * 22, y0 + 12, false); }
        else { draw_set_color(g_c[3]); draw_rectangle(px + 42 + i * 22, y0 + 2, px + 54 + i * 22, y0 + 12, true); }
    }
    if (p.ad_cool > 0) { scr_ui_bar(px + 42 + g_AD_SHOTS * 22 + 8, y0 + 4, max(24, bw - g_AD_SHOTS * 22 - 8), 10, 1 - p.ad_cool / g_AD_COOLDOWN, g_c[9]); }
    scr_ui_text(px + 12, y0 + 18, "LV", g_c[4]);
    for (i = 0; i < g_lives_max; i += 1)
    {
        if (i < p.p_lives) { draw_set_color(c); draw_rectangle(px + 42 + i * 18, y0 + 22, px + 51 + i * 18, y0 + 31, false); }
        else { draw_set_color(g_c[3]); draw_rectangle(px + 42 + i * 18, y0 + 22, px + 51 + i * 18, y0 + 31, true); }
    }
    if (p.ad_cool > 0) { scr_ui_text(px + 12, y0 + 36, "RELOAD " + string(ceil(p.ad_cool / 50)) + "S", g_c[9]); }
    else { scr_ui_text(px + 12, y0 + 36, "READY", c); }
}
else
{
scr_ui_text(px + 12, y0, "EN", g_c[4]);
fr = max(0, p.energy) / max(1, p.energy_max);
scr_ui_bar(px + 42, y0 + 4, bw, 10, fr, c);
scr_ui_text(px + 12, y0 + 18, "AM", g_c[4]);
fr = p.cannon_ammo / max(1, p.ammo_max);
scr_ui_bar(px + 42, y0 + 22, bw, 10, fr, c);
scr_ui_text(px + 12, y0 + 36, "LV", g_c[4]);
for (i = 0; i < g_lives_max; i += 1)
{
    if (i < p.p_lives) { draw_set_color(c); draw_rectangle(px + 42 + i * 18, y0 + 40, px + 51 + i * 18, y0 + 49, false); }
    else { draw_set_color(g_c[3]); draw_rectangle(px + 42 + i * 18, y0 + 40, px + 51 + i * 18, y0 + 49, true); }
}
}
scr_ui_text(px + 12, y0 + 54, "SP", g_c[4]);
scr_ui_text(px + 42, y0 + 54, g_wshort[p.sp_wtype] + " " + string(p.sp_ammo), c);
fr = 0;
if (g_wcool[p.sp_wtype] > 0) { fr = max(0, p.sp_cool) / g_wcool[p.sp_wtype]; }
cdx = 42 + 96;
if (bw > 120) { scr_ui_bar(px + cdx, y0 + 58, bw - 96, 10, fr, g_c[9]); }
if (p.pu_have > 0)
{
    // hallen powerup: namnet blinkar i spelarens farg
    if (p.pu_have == 2 && p.pu_charge > 0)
    {
        // Railgun laddas: procent, och READY nar den ar fulladdad
        if (p.pu_charge >= g_sv[g_SV_PU + g_PU_STRIDE] * 50) { if ((g_tick mod 8) < 5) { scr_ui_text(px + 110, y0 + 72, "RAILGUN READY", g_c[6]); } }
        else { scr_ui_text(px + 110, y0 + 72, "RAILGUN " + string(floor(p.pu_charge * 100 / (g_sv[g_SV_PU + g_PU_STRIDE] * 50))) + "%", c); }
    }
    else if ((g_tick mod 16) < 11) { scr_ui_text(px + 110, y0 + 72, "PU " + g_pu_name[p.pu_have - 1], c); }
}
scr_ui_text(px + 12, y0 + 72, "AB", g_c[4]);   // drifting fuel (D-052): bla matare, rod medan den laddas
fr = p.drift_fuel / max(1, g_DRIFT_FUEL);
if (p.drift_rc) { scr_ui_bar(px + 42, y0 + 76, 64, 10, fr, g_c[8]); }
else { scr_ui_bar(px + 42, y0 + 76, 64, 10, fr, g_c[13]); }

hp = -1;
if (p.sp_nsel > 0) { hp = p.sp_sel[p.sp_pod_i]; }   // vald specialpod: visas som en prick pa skeppsbilden
if (p.alive) { scr_ui_ship(p.ship, px + pw - 62, py + ph / 2 + 4, 0.34, p.ang, c, hp, false); }
else if (p.respawn_t > 0)
{
    g_fs = g_f_lg;
    scr_ui_text_c(px + pw - 62, py + ph / 2 - 8, string(ceil(p.respawn_t / 50)), c);   // 3, 2, 1
}
else { g_fs = g_f_md; scr_ui_text_c(px + pw - 62, py + ph / 2 - 8, "OUT", g_c[8]); }
