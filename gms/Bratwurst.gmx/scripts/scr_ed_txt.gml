/// scr_ed_txt(x, y, text, colour)
// Redigerarens verktygstext: som scr_ui_text men med lite mindre text (85 % av den lilla storleken) och utan glod, sa att verktygspanelen blir kompakt.
// Positionen snappas till hel skarmpixel som i scr_ui_dt.
var xs, ys;
xs = view_xview[0] + round((argument0 - view_xview[0]) * g_k) / g_k;
ys = view_yview[0] + round((argument1 - view_yview[0]) * g_k) / g_k;
draw_set_color(argument3);
draw_set_font(g_fnt[g_fk * 4 + g_f_sm]);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(xs, ys, argument2, 0.85 / g_k, 0.85 / g_k, 0);
