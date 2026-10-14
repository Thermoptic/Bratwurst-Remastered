/// scr_powerup_draw()
// Ritar powerup-ikonen pa kartan: en orb med pixelikon som byter farg mellan fem starka farger mycket snabbt (var 2:a tick), sa att den syns tydligt och
// inte forvaxlas med skepp eller vaggar. Ikonen roterar runt orbens mitt och en ring av streck roterar at andra hallet. Kors i obj_game fore skeppen.
var sx, sy, r, ci, col, ps, yy, xx, rowstr, ic, ra, k, a0, j, ia, cs, sn, hh, px2, py2;
if (!g_pu_on) { exit; }
sx = g_OX + (g_pu_x * g_zoom / 32768 - g_cam_x + g_CX) * g_SCALE;
sy = g_OY + (g_pu_y * g_zoom / 32768 - g_cam_y + g_CY) * g_SCALE;
r = max(9, g_PU_RADIUS * g_zoom / 32768 * g_SCALE);
ci = (g_tick div 2) mod 5;
if (ci == 0) { col = g_c[8]; }
if (ci == 1) { col = g_c[10]; }
if (ci == 2) { col = g_c[11]; }
if (ci == 3) { col = g_c[12]; }
if (ci == 4) { col = g_c[14]; }
draw_set_blend_mode(bm_add);
draw_set_color(col);
draw_set_alpha(0.18);
draw_circle(sx, sy, r * 1.7, false);
draw_set_alpha(0.28);
draw_circle(sx, sy, r * 1.3, false);
draw_set_blend_mode(bm_normal);
draw_set_alpha(0.85);
draw_set_color(g_c[0]);
draw_circle(sx, sy, r, false);
draw_set_alpha(1);
draw_set_color(col);
draw_circle(sx, sy, r, true);
draw_circle(sx, sy, r - 1, true);
// roterande ring av 8 streck runt orben (motsatt riktning mot ikonen)
ra = -g_tick * 0.05;
for (k = 0; k < 8; k += 1)
{
    a0 = ra + k * pi / 4;
    for (j = 0; j < 4; j += 1)
    {
        draw_line(sx + cos(a0 + j * 0.08) * r * 1.22, sy + sin(a0 + j * 0.08) * r * 1.22, sx + cos(a0 + (j + 1) * 0.08) * r * 1.22, sy + sin(a0 + (j + 1) * 0.08) * r * 1.22);
    }
}
// ikonen: 11 x 11 pixlar som roterar runt orbens mitt (pixlarnas centrum ligger pa heltal runt mittpixeln, sa den ar alltid exakt centrerad)
ps = max(2, floor(r * 1.5 / 11));
ic = g_pu_type;
ia = g_tick * 0.06;
cs = cos(ia);
sn = sin(ia);
hh = ps * 0.62;
for (yy = 0; yy < 11; yy += 1)
{
    rowstr = g_pu_icon[ic, yy];
    for (xx = 0; xx < 11; xx += 1)
    {
        if (string_char_at(rowstr, xx + 1) == "#")
        {
            px2 = (xx - 5) * cs - (yy - 5) * sn;
            py2 = (xx - 5) * sn + (yy - 5) * cs;
            draw_rectangle(round(sx + px2 * ps - hh), round(sy + py2 * ps - hh), round(sx + px2 * ps + hh), round(sy + py2 * ps + hh), false);
        }
    }
}
