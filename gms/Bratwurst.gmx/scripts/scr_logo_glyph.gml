/// scr_logo_glyph(char_code, x, y, scale, line_width)
// Ritar en logotypbokstav (rutnat 7 x 9 enheter) med ovre vanstra hornet i (x, y), i aktuell farg. A far en liten prick i ogat.
var c, j, k;
c = argument0;
for (j = 0; j < g_lg_n[c]; j += 1)
{
    k = j * 4;
    draw_line_width(argument1 + g_lg_s[c, k] * argument3, argument2 + g_lg_s[c, k + 1] * argument3, argument1 + g_lg_s[c, k + 2] * argument3, argument2 + g_lg_s[c, k + 3] * argument3, argument4);
}
if (c == ord("A"))
{
    draw_rectangle(argument1 + 3.5 * argument3 - argument3 * 0.32, argument2 + 6.8 * argument3 - argument3 * 0.32, argument1 + 3.5 * argument3 + argument3 * 0.32, argument2 + 6.8 * argument3 + argument3 * 0.32, false);
}
