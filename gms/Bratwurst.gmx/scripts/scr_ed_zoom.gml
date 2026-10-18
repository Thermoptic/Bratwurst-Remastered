/// scr_ed_zoom(steps)
// Banredigeraren (D-061): zoomar med mushjulet, 25 % per steg (1 till 16 ganger), sa att varldspunkten under musen ligger kvar under musen.
// steps > 0 = in, < 0 = ut.
var wx0, wy0;
scr_ed_layout();
wx0 = g_ed_panx + (mouse_x - (g_ed_x0 + g_ed_w / 2)) / g_ed_es;
wy0 = g_ed_pany + (mouse_y - (g_ed_y0 + g_ed_h / 2)) / g_ed_es;
g_ed_zoom = clamp(g_ed_zoom * power(1.25, argument0), 1, 16);
scr_ed_layout();
g_ed_panx = wx0 - (mouse_x - (g_ed_x0 + g_ed_w / 2)) / g_ed_es;
g_ed_pany = wy0 - (mouse_y - (g_ed_y0 + g_ed_h / 2)) / g_ed_es;
scr_ed_pan_clamp();
scr_ed_layout();
scr_ed_cursor();
