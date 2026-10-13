/// scr_ui_header(left_text, right_text)
// Rubrikrad overst (med klocka) och linje under.
g_fs = g_f_sm;
scr_ui_text(20, 8, "[] " + argument0, g_acc);
scr_ui_text_r(room_width - 20, 8, argument1 + "  " + scr_pad2(current_hour) + ":" + scr_pad2(current_minute) + ":" + scr_pad2(current_second), g_c[4]);
draw_set_color(g_c[3]);
draw_line(20, 30, room_width - 20, 30);
