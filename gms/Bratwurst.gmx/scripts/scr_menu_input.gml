/// scr_menu_input(slot)
// Menyindata (kantriggad). PLACEHOLDER-mappning. Satter g_mi_l, g_mi_r, g_mi_ok.
//   Tangentbord P1: vanster/hoger, Upp eller Enter = OK.  P2: A/D, W = OK.   Xbox: D-pad/vanster spak, A = OK.
var s, gx;
s = argument0;
g_mi_l = false; g_mi_r = false; g_mi_ok = false; g_mi_back = false;
if (s == 0)
{
    g_mi_l  = keyboard_check_pressed(vk_left);
    g_mi_r  = keyboard_check_pressed(vk_right);
    g_mi_ok = keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_enter);
    g_mi_back = keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_rcontrol);   // = thrust-tangenterna
}
if (s == 1)
{
    g_mi_l  = keyboard_check_pressed(ord("A"));
    g_mi_r  = keyboard_check_pressed(ord("D"));
    g_mi_ok = keyboard_check_pressed(ord("W"));
    g_mi_back = keyboard_check_pressed(vk_lshift);
}
if (s == 2)
{
    g_mi_l  = keyboard_check_pressed(ord("J"));
    g_mi_r  = keyboard_check_pressed(ord("L"));
    g_mi_ok = keyboard_check_pressed(ord("I"));
    g_mi_back = keyboard_check_pressed(ord("O"));
}
if (gamepad_is_connected(s))
{
    gx = gamepad_axis_value(s, gp_axislh);
    if (gamepad_button_check_pressed(s, gp_padl) || (gx < -0.5 && g_mi_prevx[s] >= -0.5)) { g_mi_l = true; }
    if (gamepad_button_check_pressed(s, gp_padr) || (gx > 0.5 && g_mi_prevx[s] <= 0.5)) { g_mi_r = true; }
    if (gamepad_button_check_pressed(s, gp_face1)) { g_mi_ok = true; }
    if (gamepad_button_check_pressed(s, gp_face3)) { g_mi_back = true; }   // X = thrust-knappen: ett steg tillbaka
    g_mi_prevx[s] = gx;
}
