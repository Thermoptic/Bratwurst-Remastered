/// scr_safe_real(text, default)
// Text -> tal utan att krascha pa ogiltig text (anvands vid inlasning av banfiler). Tillater minus forst, siffror och punkt.
var s, i, ch;
s = argument0;
if (string_length(s) == 0) { return argument1; }
for (i = 1; i <= string_length(s); i += 1)
{
    ch = string_char_at(s, i);
    if (string_pos(ch, "-0123456789.") == 0) { return argument1; }
    if (ch == "-" && i > 1) { return argument1; }
}
if (string_digits(s) == "") { return argument1; }
return real(s);
