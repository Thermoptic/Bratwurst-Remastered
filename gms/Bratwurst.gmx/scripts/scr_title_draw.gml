/// scr_title_draw()
// Titelskarm: logotyp "BRATWURST - REHEATED" och "PRESS START TO HEAT". Valfri tangent/knapp tar en till huvudmenyn (scr_game_step).
// Layouten ar centrerad i vyn (som fyller hela fonstret/skarmen); y-positionerna ar designvarden for en 640 hog vy plus oy.
var cx, oy, t, i, gx, gy, sh, ax, ay, heat, bh, bx, cc, ofs;
cx = g_vx + g_vw / 2;
oy = g_vy + floor((g_vh - 640) / 2);
t = g_menu_tick;

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

scr_ui_header("BRATWURST // REHEATED", "SYSTEM ONLINE");

// logotyp
g_fs = g_f_xl;
ofs = cx - scr_ui_tw("BRATWURST") / 2;
draw_set_color(g_c[2]);
scr_ui_dt(ofs + 6, oy + 146, "BRATWURST");
scr_ui_text(ofs, oy + 140, "BRATWURST", g_acc);

g_fs = g_f_lg;
scr_ui_text_c(cx, oy + 252, "- R E H E A T E D -", g_c[9]);

// varmebalk under loggan (rod/orange/gul, pulserar)
for (i = 0; i < 40; i += 1)
{
    heat = 0.5 + 0.5 * sin(t * 0.07 - i * 0.35);
    bh = 4 + 22 * heat;
    if (heat < 0.34) { cc = g_c[8]; }
    else if (heat < 0.67) { cc = g_c[9]; }
    else { cc = g_c[10]; }
    bx = cx - 240 + i * 12;
    draw_set_color(cc);
    draw_rectangle(bx, oy + 340 - bh, bx + 8, oy + 340, false);
}

// PRESS START TO HEAT
g_fs = g_f_lg;
if ((t mod 70) < 46) { scr_ui_text_c(cx, oy + 392, "PRESS START TO HEAT", g_c[6]); }
g_fs = g_f_sm;
scr_ui_text_c(cx, oy + 438, "ANY KEY OR GAMEPAD BUTTON", g_c[4]);
scr_ui_text(g_vx + 20, g_vy + g_vh - 32, "ESC = QUIT", g_c[4]);
scr_ui_text_r(g_vx + g_vw - 20, g_vy + g_vh - 32, "BUILD 0.2 // PLACEHOLDER UI", g_c[3]);
