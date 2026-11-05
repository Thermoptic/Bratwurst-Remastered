/// scr_hud_panel(slot, x, y, w, h)
// Spelarpanel i matchen (terminalstil), alltid langs nederkanten. Bredden kommer fran scr_hud_draw (panelerna delar raden lika).
// Innehall: energi, kanonammo, liv, specialvapen + nedrakning, drivmedel och skeppets kontur till hoger. Hogra zonen (D-065): skeppet i mitten med siffror i
// hornen: ovre vanster placering (Race) eller runda, ovre hoger vinster, nere text (varv, liv eller reparation) och rutor (varv eller liv).
var sl, px, py, pw, ph, c, p, y0, i, fr, bw, cdx, hp, zx0, zx1, zc, btx, bcol, npips, nfill, shr;
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
if (g_game_mode == 2)
{
    // Race (D-055): ingen energi (inget skadar); raden visar i stallet fartminskningen efter en vapentraff (rod stapel som tomms pa 3 s)
    scr_ui_text(px + 12, y0, "SL", g_c[4]);
    scr_ui_bar(px + 42, y0 + 4, bw, 10, p.race_slow / g_RACE_SLOW_TICKS, g_c[8]);
}
else if (g_game_mode == 5)
{
    // Super Smashwurst (D-085): ingen energi; PUSH i procent i en farg som gar fran cyan via gult och orange till rott, med en stapel som fylls till 100 % (scr_sw_colour)
    shr = scr_ui_tw("PUSH 999%");
    scr_ui_text(px + 12, y0, "PUSH " + string(min(999, p.sw_push)) + "%", scr_sw_colour(p.sw_push));
    if (bw > shr - 20) { scr_ui_bar(px + 20 + shr, y0 + 4, max(24, bw + 22 - shr), 10, min(1, p.sw_push / 100), scr_sw_colour(p.sw_push)); }
}
else
{
    scr_ui_text(px + 12, y0, "EN", g_c[4]);
    fr = max(0, p.energy) / max(1, p.energy_max);
    scr_ui_bar(px + 42, y0 + 4, bw, 10, fr, c);
}
scr_ui_text(px + 12, y0 + 18, "AM", g_c[4]);
fr = p.cannon_ammo / max(1, p.ammo_max);
scr_ui_bar(px + 42, y0 + 22, bw, 10, fr, c);
if (g_game_mode == 2)
{
    // Race (D-056): inga liv; raden visar senaste pickup en stund
    scr_ui_text(px + 12, y0 + 36, "IT", g_c[4]);
    if (g_race_el >= 0 && p.alive && !p.race_fin) { scr_ui_text(px + 42, y0 + 36, "ELIMINATED IN " + string(ceil(g_race_el / 50)), g_c[8]); }   // sista racern: nedrakning (D-058)
    else if (p.race_msg_t > 0) { scr_ui_text(px + 42, y0 + 36, p.race_msg, g_c[11]); }
}
else
{
    scr_ui_text(px + 12, y0 + 36, "LV", g_c[4]);
    for (i = 0; i < g_lives_max; i += 1)
    {
        if (i < p.p_lives) { draw_set_color(c); draw_rectangle(px + 42 + i * 18, y0 + 40, px + 51 + i * 18, y0 + 49, false); }
        else { draw_set_color(g_c[3]); draw_rectangle(px + 42 + i * 18, y0 + 40, px + 51 + i * 18, y0 + 49, true); }
    }
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
// ---- hogra zonen (D-065): skepp i mitten, siffror i hornen ----
zx0 = px + pw - 12 - clamp(pw * 0.42, 92, 112);   // zonens bredd 92 till 112, smalare med fler spelare
zx1 = px + pw - 12;
zc = (zx0 + zx1) / 2;
g_fs = g_f_sm;
// ovre vanster: Race = placering, ovriga lagen = rundan; ovre hoger: vinster
if (g_game_mode == 2)
{
    if (p.alive) { fr = scr_race_pos(p, false); scr_ui_text(zx0, py + 14, "POS " + string(fr) + "/" + string(g_rk_n), g_acc); }
}
else { scr_ui_text(zx0, py + 14, "R " + string(g_round) + "/" + string(g_rounds_total), g_acc); }
scr_ui_text_r(zx1, py + 14, "W " + string(g_wins[sl]), g_c[4]);
if (g_debug && g_game_mode == 2) { scr_ui_text_r(zx1, py + 28, "X " + string(p.race_x) + " F " + string(p.race_free), g_c[3]); }
// skeppet (eller nedrakning / OUT)
if (p.alive)
{
    // skeppet skalas efter sin storsta radie (hornpunkt langst fran mitten) sa att det ryms mellan texten uppe och linjen nere i alla vinklar
    shr = 1;
    for (i = 0; i < g_ship_np[p.ship]; i += 1) { shr = max(shr, sqrt(g_ship_pts[p.ship, 2 * i] * g_ship_pts[p.ship, 2 * i] + g_ship_pts[p.ship, 2 * i + 1] * g_ship_pts[p.ship, 2 * i + 1])); }
    scr_ui_ship(p.ship, zc, py + 54, min(0.28, 21 / shr), p.ang, c, hp, false);
}
else if (p.respawn_t > 0)
{
    g_fs = g_f_lg;
    scr_ui_text_c(zc, py + ph / 2 - 8, string(ceil(p.respawn_t / 50)), c);   // 3, 2, 1
    g_fs = g_f_sm;
}
else { g_fs = g_f_md; scr_ui_text_c(zc, py + ph / 2 - 8, "OUT", g_c[8]); g_fs = g_f_sm; }
// linje, nere text till vanster och rutor till hoger
draw_set_color(g_c[2]);
draw_rectangle(zx0, py + ph - 30, zx1, py + ph - 30, false);
npips = 0;
nfill = 0;
bcol = c;
if (g_game_mode == 2)
{
    // Race: varv (rutor om hogst sex varv), klar-tid eller varning om banan saknar malruta
    if (!g_fin_on) { btx = "NO FINISH"; bcol = g_c[10]; }
    else if (p.race_fin) { btx = "FIN " + scr_race_time(p.race_ft); bcol = g_c[11]; }
    else
    {
        btx = "LAP " + string(min(p.race_laps + 1, g_race_target)) + "/" + string(g_race_target);
        if (g_race_target <= 6) { npips = g_race_target; nfill = p.race_laps; }
    }
}
else
{
    // ovriga lagen: liv (rutor), eller reparationstid i Galaxy Duel nar skeppet ar skadat
    btx = "LV " + string(p.p_lives);
    if (g_lives_max <= 6) { npips = g_lives_max; nfill = p.p_lives; }
    if (g_game_mode == 1 && p.ad_dmg > 0) { btx = "REPAIR " + string(ceil(p.ad_dmg / 50)) + "S"; bcol = g_c[8]; npips = 0; }
}
scr_ui_text(zx0, py + ph - 22, btx, bcol);
for (i = 0; i < npips; i += 1)
{
    if (i < nfill) { draw_set_color(c); draw_rectangle(zx1 - (npips - i) * 12 + 4, py + ph - 20, zx1 - (npips - i) * 12 + 11, py + ph - 14, false); }
    else { draw_set_color(g_c[3]); draw_rectangle(zx1 - (npips - i) * 12 + 4, py + ph - 20, zx1 - (npips - i) * 12 + 11, py + ph - 14, true); }
}
