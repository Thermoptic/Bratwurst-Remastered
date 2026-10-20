/// scr_ed_head(x, y, width, text, colour)
// Kategorirubrik i verktygspanelen: rubriken i kategorins farg och en tunn linje i samma farg ut till hoger.
var tw;
scr_ed_txt(argument0, argument1, argument3, argument4);
draw_set_font(g_fnt[g_fk * 4 + g_f_sm]);
tw = string_width(argument3) * g_TXT_SMALL / g_k;
draw_set_color(argument4);
draw_set_alpha(0.45);
draw_line(argument0 + tw + 8, argument1 + 6, argument0 + argument2, argument1 + 6);
draw_set_alpha(1);
