/// scr_menu_input(slot)
// Skeppsvalets indata (kantriggad), PLACEHOLDER-mappning. Satter g_mi_u, g_mi_d (rad upp/ner), g_mi_l, g_mi_r (andra varde), g_mi_ok (nasta rad / bekrafta),
// g_mi_back (tillbaka en rad, thrust-knappen).
//   P1: piltangenter, Enter = OK, mellanslag/hoger Ctrl = tillbaka.   P2: W/A/S/D, E = OK, vanster Shift = tillbaka.
//   P3: I/J/K/L, U = OK, O = tillbaka.   Xbox (kontroll = platsnummer): D-pad/vanster spak, A = OK, B eller X = tillbaka.
var s, gx, gy;
s = argument0;
g_mi_u = false; g_mi_d = false; g_mi_l = false; g_mi_r = false; g_mi_ok = false; g_mi_back = false;
if (s == 0)
{
    g_mi_u  = keyboard_check_pressed(vk_up);
    g_mi_d  = keyboard_check_pressed(vk_down);
    g_mi_l  = keyboard_check_pressed(vk_left);
    g_mi_r  = keyboard_check_pressed(vk_right);
    g_mi_ok = keyboard_check_pressed(vk_enter);
    g_mi_back = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_rcontrol);   // = thrust-tangenterna
}
if (s == 1)
{
    g_mi_u  = keyboard_check_pressed(ord("W"));
    g_mi_d  = keyboard_check_pressed(ord("S"));
    g_mi_l  = keyboard_check_pressed(ord("A"));
    g_mi_r  = keyboard_check_pressed(ord("D"));
    g_mi_ok = keyboard_check_pressed(ord("E"));
    g_mi_back = keyboard_check_pressed(vk_lshift);
}
if (s == 2)
{
    g_mi_u  = keyboard_check_pressed(ord("I"));
    g_mi_d  = keyboard_check_pressed(ord("K"));
    g_mi_l  = keyboard_check_pressed(ord("J"));
    g_mi_r  = keyboard_check_pressed(ord("L"));
    g_mi_ok = keyboard_check_pressed(ord("U"));
    g_mi_back = keyboard_check_pressed(ord("O"));
}
if (gamepad_is_connected(s))
{
    gx = gamepad_axis_value(s, gp_axislh);
    gy = gamepad_axis_value(s, gp_axislv);
    if (gamepad_button_check_pressed(s, gp_padl) || (gx < -0.5 && g_mi_prevx[s] >= -0.5)) { g_mi_l = true; }
    if (gamepad_button_check_pressed(s, gp_padr) || (gx > 0.5 && g_mi_prevx[s] <= 0.5)) { g_mi_r = true; }
    if (gamepad_button_check_pressed(s, gp_padu) || (gy < -0.5 && g_mi_prevy[s] >= -0.5)) { g_mi_u = true; }
    if (gamepad_button_check_pressed(s, gp_padd) || (gy > 0.5 && g_mi_prevy[s] <= 0.5)) { g_mi_d = true; }
    if (gamepad_button_check_pressed(s, gp_face1)) { g_mi_ok = true; }
    if (gamepad_button_check_pressed(s, gp_face3) || gamepad_button_check_pressed(s, gp_face2)) { g_mi_back = true; }   // B (D-040) eller X = tillbaka ett steg
    g_mi_prevx[s] = gx;
    g_mi_prevy[s] = gy;
}
