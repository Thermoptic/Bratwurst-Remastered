/// scr_ui_header(left_text, right_text)
// Rubrikrad overst i vyn (med klocka).
g_fs = g_f_sm;
scr_ui_text(g_vx + 20, g_vy + 8, "[] " + argument0, g_acc);
scr_ui_text_r(g_vx + g_vw - 20, g_vy + 8, argument1 + "  " + scr_pad2(current_hour) + ":" + scr_pad2(current_minute) + ":" + scr_pad2(current_second), g_c[4]);
