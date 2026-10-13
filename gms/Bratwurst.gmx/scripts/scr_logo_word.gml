/// scr_logo_word(text, x, y, scale, gap, line_width)
// Ritar ett ord av logotypbokstaver, vansterjusterat fran (x, y) = ovre vanstra hornet; gap i rutnatsenheter. Returnerar ordets bredd.
var i, xx;
xx = argument1;
for (i = 1; i <= string_length(argument0); i += 1)
{
    scr_logo_glyph(ord(string_char_at(argument0, i)), xx, argument2, argument3, argument5);
    xx += (7 + argument4) * argument3;
}
return xx - argument1 - argument4 * argument3;
