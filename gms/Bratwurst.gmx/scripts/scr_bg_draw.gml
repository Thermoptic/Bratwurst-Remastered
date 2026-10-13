/// scr_bg_draw()
// Gemensam menybakgrund (titelskarm och huvudmeny): svagt rutnat over hela vyn, blinkande stjarnor och de fyra roterande skeppssilhuetterna.
// Anvander den fortlopande klockan g_bg_t sa att bakgrunden inte hoppar nar man byter skarm. Kors i obj_game.
var gx, gy, i, sh, ax, ay, k, tw, ssx, ssy;
// svagt rutnat over hela vyn
draw_set_color(g_c[1]);
for (gx = g_vx; gx < g_vx + g_vw; gx += 32) { draw_line(gx, g_vy, gx, g_vy + g_vh); }
for (gy = g_vy; gy < g_vy + g_vh; gy += 32) { draw_line(g_vx, gy, g_vx + g_vw, gy); }

// drivande skeppssilhuetter i bakgrunden (vektorer ur .SOB)
for (i = 0; i < 4; i += 1)
{
    sh = (i * 4 + 3) mod g_ship_count;
    ax = g_vx + ((g_bg_t * 0.5 + i * 290) mod (g_vw + 240)) - 120;
    ay = g_vy + g_vh * (0.19 + 0.31 * (i mod 2)) + 40 * sin(g_bg_t * 0.012 + i * 2);
    scr_ui_ship(sh, ax, ay, 0.9, g_bg_t * (1 + i), g_c[2], -1, false);
}

// stjarnor
for (k = 0; k < 46; k += 1)
{
    tw = 0.5 + 0.5 * sin(g_bg_t * 0.04 * (1 + g_mv_on * 0.6) + g_tt_sp[k] * 20);
    ssx = floor(g_vx + g_tt_sx[k] * g_vw);
    ssy = floor(g_vy + g_tt_sy[k] * g_vh);
    draw_set_color(g_c[3]);
    if (g_tt_st[k] == 0) { if (tw > 0.4) { draw_rectangle(ssx - 3, ssy, ssx + 3, ssy, false); draw_rectangle(ssx, ssy - 3, ssx, ssy + 3, false); } }
    else if (tw > 0.25) { draw_rectangle(ssx, ssy, ssx + 1, ssy + 1, false); }
}

