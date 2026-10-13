/// scr_ed_cursor()
// Musens position i varldspixlar: obearbetad (g_ed_wx/wy) och snappad till rutnatet (g_ed_mx/my). g_ed_inside = musen ar over ritytan.
scr_ed_layout();
g_ed_wx = clamp((mouse_x - g_ed_cxs) / g_ed_es, -3000, 3000);
g_ed_wy = clamp((mouse_y - g_ed_cys) / g_ed_es, -2300, 2300);
g_ed_inside = (mouse_x >= g_ed_x0 && mouse_x <= g_ed_x0 + g_ed_w && mouse_y >= g_ed_y0 && mouse_y <= g_ed_y0 + g_ed_h);
g_ed_mx = round(g_ed_wx / g_ed_snap) * g_ed_snap;
g_ed_my = round(g_ed_wy / g_ed_snap) * g_ed_snap;
