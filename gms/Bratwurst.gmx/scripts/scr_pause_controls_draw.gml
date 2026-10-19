/// scr_pause_controls_draw()
// Pausmenyns kontrollruta (D-071): visas med Y i pausmenyn, stangs med B, Y eller OK. Gamepadets knappar och vad de gor (pa engelska).
var pw, ph, px, py, yy, cx;
pw = 380;
ph = 252;
cx = g_vx + g_vw / 2;
px = cx - pw / 2;
py = g_vy + floor((g_vh - ph) / 2) - 20;
scr_ui_pane(px, py, pw, ph, "CONTROLS // GAMEPAD", g_acc);
g_fs = g_f_sm;
yy = py + 18;
scr_ui_text(px + 14, yy, "STICK / D-PAD", g_c[4]);   scr_ui_text_r(px + pw - 14, yy, "TURN", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "A", g_c[4]);               scr_ui_text_r(px + pw - 14, yy, "CANNON", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "X / RT", g_c[4]);          scr_ui_text_r(px + pw - 14, yy, "THRUST", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "Y", g_c[4]);               scr_ui_text_r(px + pw - 14, yy, "SPECIAL WEAPON", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "B", g_c[4]);               scr_ui_text_r(px + pw - 14, yy, "POWERUP", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "BACK", g_c[4]);            scr_ui_text_r(px + pw - 14, yy, "NEXT SPECIAL", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "LB", g_c[4]);              scr_ui_text_r(px + pw - 14, yy, "WEAPON POD", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "RB", g_c[4]);              scr_ui_text_r(px + pw - 14, yy, "NEXT SHIP (TEST)", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "LT + THRUST", g_c[4]);     scr_ui_text_r(px + pw - 14, yy, "DRIFT", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "LT ALONE", g_c[4]);        scr_ui_text_r(px + pw - 14, yy, "REVERSE", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "START", g_c[4]);           scr_ui_text_r(px + pw - 14, yy, "PAUSE", g_c[6]); yy += 16;
scr_ui_text(px + 14, yy, "LB / RB IN PAUSE", g_c[4]); scr_ui_text_r(px + pw - 14, yy, "CHANGE SONG", g_c[6]); yy += 24;
scr_ui_text_c(cx, yy, "B / Y  BACK", g_c[3]);
