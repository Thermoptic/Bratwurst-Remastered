/// scr_hud_panel(slot, x, y, w, h)
// Spelarpanel i matchen (terminalstil), alltid langs nederkanten. Bredden kommer fran scr_hud_draw (panelerna delar raden lika).
// Innehall: energi, kanonammo, liv, specialvapen + nedrakning, bakat-skjutning och skeppets kontur till hoger.
var sl, px, py, pw, ph, c, p, y0, i, fr, bw, cdx;
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
else { scr_ui_pane(px, py, pw, ph, "P" + string(sl + 1) + " // ELIMINATED", g_c[8]); }
g_fs = g_f_sm;
bw = min(pw - 150, 320);
y0 = py + 16;

scr_ui_text(px + 12, y0, "EN", g_c[4]);
fr = max(0, p.energy) / max(1, p.energy_max);
scr_ui_bar(px + 42, y0 + 4, bw, 10, fr, c);
scr_ui_text(px + 12, y0 + 18, "AM", g_c[4]);
fr = p.cannon_ammo / max(1, p.ammo_max);
scr_ui_bar(px + 42, y0 + 22, bw, 10, fr, c);
scr_ui_text(px + 12, y0 + 36, "LV", g_c[4]);
for (i = 0; i < g_START_LIVES; i += 1)
{
    if (i < p.p_lives) { draw_set_color(c); draw_rectangle(px + 42 + i * 18, y0 + 40, px + 51 + i * 18, y0 + 49, false); }
    else { draw_set_color(g_c[3]); draw_rectangle(px + 42 + i * 18, y0 + 40, px + 51 + i * 18, y0 + 49, true); }
}
scr_ui_text(px + 12, y0 + 54, "SP", g_c[4]);
scr_ui_text(px + 42, y0 + 54, g_wshort[p.sp_wtype] + " " + string(p.sp_ammo), c);
fr = 0;
if (g_wcool[p.sp_wtype] > 0) { fr = max(0, p.sp_cool) / g_wcool[p.sp_wtype]; }
cdx = 42 + 96;
if (bw > 120) { scr_ui_bar(px + cdx, y0 + 58, bw - 96, 10, fr, g_c[9]); }
scr_ui_text(px + 12, y0 + 72, "RF", g_c[4]);
if (p.rear_fire) { scr_ui_text(px + 42, y0 + 72, "ON", g_c[11]); }
else { scr_ui_text(px + 42, y0 + 72, "LOCKED", g_c[3]); }

if (p.alive) { scr_ui_ship(p.ship, px + pw - 62, py + ph / 2 + 4, 0.34, p.ang, c, -1, false); }
else { g_fs = g_f_md; scr_ui_text_c(px + pw - 62, py + ph / 2 - 8, "OUT", g_c[8]); }
