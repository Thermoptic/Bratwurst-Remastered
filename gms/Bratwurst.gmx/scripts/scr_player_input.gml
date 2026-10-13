/// scr_player_input()
// Kors i obj_player. Tangentbords- och Xbox-mappning ar PLACEHOLDERS (originalets mappning ar OKAND, docs/15):
//   bit0 vanster, bit1 hoger, bit2 skjut kanon, bit3 special, bit4 thrust.
// Dokumentationen: "tryck framat = kanon, drag bakat = specialvapen" (joystick); thrust-knappen = OKAND.
in_wsel = false; in_psel = false; in_shipcyc = false; in_podcyc = false;
in_left = false; in_right = false; in_fire = false; in_special = false; in_thrust = false;
if (slot == 0)
{
    in_left    = keyboard_check(vk_left);
    in_right   = keyboard_check(vk_right);
    in_fire    = keyboard_check(vk_up);
    in_special = keyboard_check(vk_down);
    in_thrust  = keyboard_check(vk_rcontrol) || keyboard_check(vk_space);
    in_wsel    = keyboard_check_pressed(ord("Z"));
    in_psel    = keyboard_check_pressed(ord("X"));
}
if (slot == 1)
{
    in_left    = keyboard_check(ord("A"));
    in_right   = keyboard_check(ord("D"));
    in_fire    = keyboard_check(ord("W"));
    in_special = keyboard_check(ord("S"));
    in_thrust  = keyboard_check(vk_lshift);
    in_wsel    = keyboard_check_pressed(ord("E"));
    in_psel    = keyboard_check_pressed(ord("R"));
}

if (slot == 2)
{
    in_left    = keyboard_check(ord("J"));
    in_right   = keyboard_check(ord("L"));
    in_fire    = keyboard_check(ord("I"));
    in_special = keyboard_check(ord("K"));
    in_thrust  = keyboard_check(ord("O"));
}
// Spelare 4 har ingen tangentbordsstyrning (kontroll kravs; originalet: fyrspelaradapter).

// Xbox-kontroll (gamepad-index = spelarplats; kombineras med tangentbordet). PLACEHOLDER-mappning:
//   svang: vanster spak (x) eller D-pad vanster/hoger       kanon: A          special: B
//   thrust: X eller hoger trigger (RT)                      byt specialvapen (forsta 5 s): Y     byt pod (forsta 5 s): vanster trigger (LT)
if (gamepad_is_connected(slot))
{
    var glx;
    gamepad_set_axis_deadzone(slot, 0.3);
    glx = gamepad_axis_value(slot, gp_axislh);
    if (gamepad_button_check(slot, gp_padl) || glx < -0.5) { in_left = true; }
    if (gamepad_button_check(slot, gp_padr) || glx > 0.5)  { in_right = true; }
    if (gamepad_button_check(slot, gp_face1)) { in_fire = true; }
    if (gamepad_button_check(slot, gp_face2)) { in_special = true; }
    if (gamepad_button_check(slot, gp_face3) || gamepad_button_check(slot, gp_shoulderrb)) { in_thrust = true; }
    if (gamepad_button_check_pressed(slot, gp_face4)) { in_wsel = true; }
    if (gamepad_button_check_pressed(slot, gp_shoulderlb)) { in_psel = true; }
    if (gamepad_button_check_pressed(slot, gp_shoulderr)) { in_shipcyc = true; }   // RB: nasta skepp (test)
    if (gamepad_button_check_pressed(slot, gp_shoulderl)) { in_podcyc = true; }    // LB: nasta specialpod (fram/bak)
}
