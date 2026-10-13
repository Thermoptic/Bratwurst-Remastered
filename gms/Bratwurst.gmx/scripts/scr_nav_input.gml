/// scr_nav_input()
// Menyindata for titel och huvudmeny (kanttriggad, en gang per steg). Tangentbord: pilar/WASD, Enter/Space/Z = OK, Esc/Backspace/X = tillbaka.
// Gamepad 1-4: D-pad/vanster spak, A eller Start = OK, B = tillbaka. g_nv_any = valfri tangent/knapp trycktes (titelskarmen).
var i, b, gx, gy;
g_nv_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
g_nv_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
g_nv_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"));
g_nv_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
g_nv_ok = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z"));
g_nv_back = keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(ord("X"));
g_nv_any = keyboard_check_pressed(vk_anykey);
for (i = 0; i < 4; i += 1)
{
    if (gamepad_is_connected(i))
    {
        gx = gamepad_axis_value(i, gp_axislh);
        gy = gamepad_axis_value(i, gp_axislv);
        if (gamepad_button_check_pressed(i, gp_padu) || (gy < -0.5 && g_nv_py[i] >= -0.5)) { g_nv_up = true; }
        if (gamepad_button_check_pressed(i, gp_padd) || (gy > 0.5 && g_nv_py[i] <= 0.5)) { g_nv_down = true; }
        if (gamepad_button_check_pressed(i, gp_padl) || (gx < -0.5 && g_nv_px[i] >= -0.5)) { g_nv_left = true; }
        if (gamepad_button_check_pressed(i, gp_padr) || (gx > 0.5 && g_nv_px[i] <= 0.5)) { g_nv_right = true; }
        g_nv_px[i] = gx;
        g_nv_py[i] = gy;
        if (gamepad_button_check_pressed(i, gp_face1) || gamepad_button_check_pressed(i, gp_start)) { g_nv_ok = true; }
        if (gamepad_button_check_pressed(i, gp_face2)) { g_nv_back = true; }
        for (b = 0; b < 16; b += 1)
        {
            if (gamepad_button_check_pressed(i, g_nv_btn[b])) { g_nv_any = true; }
        }
    }
}
