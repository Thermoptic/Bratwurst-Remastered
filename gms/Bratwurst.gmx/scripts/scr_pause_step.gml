/// scr_pause_step()
// Pausmenyn under en match (g_paused, D-071): valen ligger pa en rad, vanster/hoger (eller upp/ner) byter val, OK (Enter/Space/A/Start) valjer, Esc/Backspace/B
// ateruppta, Y (eller C pa tangentbordet) visar kontrollerna (g_pause_ctrl; B, Y eller OK stanger dem). Valen: 0 RESUME, 1 OPTIONS (scr_pause_opts_open), 2 QUIT TO MENU.
// Spelet star stilla medan menyn visas (scr_game_step hoppar over simuleringen); musiken fortsatter.
var gi, yy;
yy = keyboard_check_pressed(ord("C"));
for (gi = 0; gi < 4; gi += 1)
{
    if (gamepad_is_connected(gi) && gamepad_button_check_pressed(gi, gp_face4)) { yy = true; }
}
if (g_pause_ctrl)
{
    if (g_nv_back || g_nv_ok || yy) { g_pause_ctrl = false; }
    exit;
}
if (yy) { g_pause_ctrl = true; exit; }
if (g_nv_left || g_nv_up) { g_pause_sel = (g_pause_sel + 2) mod 3; }
if (g_nv_right || g_nv_down) { g_pause_sel = (g_pause_sel + 1) mod 3; }
if (g_nv_back) { g_paused = false; exit; }
if (g_nv_ok)
{
    if (g_pause_sel == 0) { g_paused = false; }
    else if (g_pause_sel == 1) { scr_pause_opts_open(); }
    else { scr_goto_main(); }
}
