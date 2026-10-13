/// scr_title_draw()
// Titelskarm: logotyp "BRATWURST - REHEATED" och "PRESS START TO HEAT". Valfri tangent/knapp tar en till huvudmenyn (scr_game_step).
var W, H, cx, t, i, gx, gy, sh, ax, ay, heat, bh, bx, cc, ofs;
W = room_width;
H = room_height;
cx = W / 2;
t = g_menu_tick;

// svagt rutnat
draw_set_color(g_c[1]);
for (gx = 0; gx < W; gx += 32) { draw_line(gx, 0, gx, H); }
for (gy = 0; gy < H; gy += 32) { draw_line(0, gy, W, gy); }

// drivande skeppssilhuetter i bakgrunden (vektorer ur .SOB)
for (i = 0; i < 4; i += 1)
{
    sh = (i * 4 + 3) mod g_ship_count;
    ax = ((t * 0.5 + i * 290) mod (W + 240)) - 120;
    ay = 120 + 360 * ((i mod 2) * 0.55) + 40 * sin(t * 0.012 + i * 2);
    scr_ui_ship(sh, ax, ay, 0.9, t * (1 + i), g_c[2], -1, false);
}

scr_ui_header("BRATWURST // REHEATED", "SYSTEM ONLINE");

// logotyp
g_fs = g_f_xl;
ofs = cx - scr_ui_tw("BRATWURST") / 2;
draw_set_color(g_c[2]);
scr_ui_dt(ofs + 6, 140 + 6, "BRATWURST");
scr_ui_text(ofs, 140, "BRATWURST", g_acc);

g_fs = g_f_lg;
scr_ui_text_c(cx, 252, "- R E H E A T E D -", g_c[9]);

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
    draw_rectangle(bx, 340 - bh, bx + 8, 340, false);
}

// PRESS START TO HEAT
g_fs = g_f_lg;
if ((t mod 70) < 46) { scr_ui_text_c(cx, 392, "PRESS START TO HEAT", g_c[6]); }
g_fs = g_f_sm;
scr_ui_text_c(cx, 438, "ANY KEY OR GAMEPAD BUTTON", g_c[4]);
scr_ui_text(20, 608, "ESC = QUIT", g_c[4]);
scr_ui_text_r(room_width - 20, 608, "BUILD 0.2 // PLACEHOLDER UI", g_c[3]);
