/// scr_title_draw()
// Titelskarm ("Radial Ring"): logotyp i linjer centrerad pa skarmen, en cirkular equalizer (72 staplar) runt den som foljer musiken (g_mv),
// planeter som svullnar med basen, stjarnor och de roterande skeppen i bakgrunden. Valfri tangent/knapp tar en till huvudmenyn (scr_game_step).
var cx, cy, t, i, gx, gy, sh, ax, ay, ls, lw, x0, y0, bi, b0, lv, len, inn, th, c, s2, col, bass, R0, N, pr, k, px1, py1, px2, py2, wd, ww, glow, tw, ssx, ssy, ds, dtop, dbot, mm;
cx = g_vx + g_vw / 2;
cy = g_vy + g_vh / 2 - 20;
t = g_menu_tick;
R0 = 150;
N = 72;
ls = 9;
lw = 3;
bass = (g_mv[0] + g_mv[1] + g_mv[2]) / 3;
glow = g_sv[g_SV_GLOW];

// svagt rutnat over hela vyn
draw_set_color(g_c[1]);
for (gx = g_vx; gx < g_vx + g_vw; gx += 32) { draw_line(gx, g_vy, gx, g_vy + g_vh); }
for (gy = g_vy; gy < g_vy + g_vh; gy += 32) { draw_line(g_vx, gy, g_vx + g_vw, gy); }

// drivande skeppssilhuetter i bakgrunden (vektorer ur .SOB)
for (i = 0; i < 4; i += 1)
{
    sh = (i * 4 + 3) mod g_ship_count;
    ax = g_vx + ((t * 0.5 + i * 290) mod (g_vw + 240)) - 120;
    ay = g_vy + g_vh * (0.19 + 0.31 * (i mod 2)) + 40 * sin(t * 0.012 + i * 2);
    scr_ui_ship(sh, ax, ay, 0.9, t * (1 + i), g_c[2], -1, false);
}

// stjarnor
for (k = 0; k < 46; k += 1)
{
    tw = 0.5 + 0.5 * sin(t * 0.04 * (1 + g_mv_on * 0.6) + g_tt_sp[k] * 20);
    ssx = floor(g_vx + g_tt_sx[k] * g_vw);
    ssy = floor(g_vy + g_tt_sy[k] * g_vh);
    draw_set_color(g_c[3]);
    if (g_tt_st[k] == 0) { if (tw > 0.4) { draw_rectangle(ssx - 3, ssy, ssx + 3, ssy, false); draw_rectangle(ssx, ssy - 3, ssx, ssy + 3, false); } }
    else if (tw > 0.25) { draw_rectangle(ssx, ssy, ssx + 1, ssy + 1, false); }
}

// cirkular equalizer: 72 staplar (speglade), utat och en kortare inat; luckor dar planeterna och korslinjen sitter
for (i = 0; i < N; i += 1)
{
    th = i / N * 2 * pi - pi / 2;
    dtop = abs(arctan2(sin(th + pi / 2), cos(th + pi / 2)));
    dbot = abs(arctan2(sin(th - pi / 2), cos(th - pi / 2)));
    if (dtop < 0.2 || dbot < 0.2) { continue; }
    mm = abs(i / N * 2 - 1);
    bi = min(10.99, mm * 11);
    b0 = floor(bi);
    if (g_mv_on) { lv = g_mv[b0] * (1 - (bi - b0)) + g_mv[min(11, b0 + 1)] * (bi - b0); }
    else { lv = 0.12 + 0.1 * sin(t * 0.07 + i * 0.4); }
    len = 6 + 78 * power(lv, 1.15);
    inn = 3 + 18 * lv;
    if (lv < 0.5) { col = merge_colour(g_c[11], g_c[10], lv * 2); } else { col = merge_colour(g_c[10], g_c[8], (lv - 0.5) * 2); }
    c = cos(th);
    s2 = sin(th);
    draw_set_color(col);
    draw_set_alpha(0.8);
    draw_line_width(cx + c * R0, cy + s2 * R0, cx + c * (R0 + len), cy + s2 * (R0 + len), 3.2);
    draw_set_alpha(0.45);
    draw_line_width(cx + c * (R0 - 4), cy + s2 * (R0 - 4), cx + c * (R0 - 4 - inn), cy + s2 * (R0 - 4 - inn), 3.2);
    draw_set_alpha(1);
}
draw_set_color(g_c[3]);
draw_circle(cx, cy, R0 - 2, true);
draw_line(cx, cy - R0 - 140, cx, cy - R0 - 30);
draw_line(cx, cy + R0 + 30, cx, cy + R0 + 140);

// planeter (prickad skuggning, svullnar med basen)
pr = 1 + bass * 0.3;
draw_set_color(g_acc);
for (k = 0; k < 2; k += 1)
{
    py1 = cy - R0 - 6;
    if (k == 1) { py1 = cy + R0 + 6; }
    draw_circle(cx, py1, 24 * pr, true);
    for (i = 0; i < g_tt_n; i += 1)
    {
        px2 = floor(cx + g_tt_dx[i] * pr);
        py2 = floor(py1 + g_tt_dy[i] * pr);
        draw_rectangle(px2, py2, px2 + 1, py2 + 1, false);
    }
}

// logotyp: BRATWURST (linjer, glod pa basen), REHEATED under med linjer pa sidorna
ww = 9 * (7 + 2) * ls - 2 * ls;
x0 = cx - ww / 2;
y0 = cy - 4.5 * ls;
if (glow)
{
    draw_set_color(g_acc);
    draw_set_alpha(0.12 + bass * 0.25);
    scr_logo_word("BRATWURST", x0, y0, ls, 2, lw * 3);
    draw_set_alpha(1);
}
draw_set_color(g_acc);
scr_logo_word("BRATWURST", x0, y0, ls, 2, lw);
s2 = 2.2;
wd = 8 * (7 + 2.6) * s2 - 2.6 * s2;
draw_set_color(g_acc);
scr_logo_word("REHEATED", cx - wd / 2, cy + 4.5 * ls + 30 - 4.5 * s2, s2, 2.6, 1.2);
draw_line_width(cx - wd / 2 - 30 - 130 - (g_mv_on * (bass * 40)), cy + 4.5 * ls + 30, cx - wd / 2 - 30, cy + 4.5 * ls + 30, 1.2);
draw_line_width(cx + wd / 2 + 30, cy + 4.5 * ls + 30, cx + wd / 2 + 30 + 130 + (g_mv_on * (bass * 40)), cy + 4.5 * ls + 30, 1.2);

// PRESS START TO HEAT
g_fs = g_f_lg;
if ((t mod 70) < 46) { scr_ui_text_c(cx, cy + R0 + 80, "PRESS START TO HEAT", g_c[6]); }
g_fs = g_f_sm;
scr_ui_text_c(cx, cy + R0 + 124, "ANY KEY OR GAMEPAD BUTTON", g_c[4]);
scr_ui_text(g_vx + 20, g_vy + g_vh - 32, "ESC = QUIT", g_c[4]);
scr_ui_text_r(g_vx + g_vw - 20, g_vy + g_vh - 32, "BUILD 0.2 // PLACEHOLDER UI", g_c[3]);
