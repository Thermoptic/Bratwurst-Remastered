/// scr_ed_row(x, y, width, key, description, key_colour, active)
// En verktygsrad: tangenten i kategorins farg och beskrivningen i gratt. Aktivt verktyg far en markerad bakgrund med en accentlist och ljusare text.
var col;
if (argument6)
{
    draw_set_color(g_c[1]);
    draw_rectangle(argument0, argument1 - 2, argument0 + argument2, argument1 + 12, false);
    draw_set_color(argument5);
    draw_rectangle(argument0, argument1 - 2, argument0 + 2, argument1 + 12, false);
}
scr_ed_txt(argument0 + 8, argument1, argument3, argument5);
if (argument6) { col = g_c[6]; } else { col = g_c[5]; }
scr_ed_txt(argument0 + 58, argument1, argument4, col);
