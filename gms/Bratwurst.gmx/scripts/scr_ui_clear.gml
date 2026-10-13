/// scr_ui_clear()
// Borjan av varje bildruta: temats bakgrund (base00) over hela vyn (vyn kan vara bredare an rummet) och standardstorlek pa text.
draw_set_alpha(1);
draw_set_color(g_c[0]);
draw_rectangle(view_xview[0] - 4, view_yview[0] - 4, view_xview[0] + view_wview[0] + 4, view_yview[0] + view_hview[0] + 4, false);
g_fs = g_f_md;
