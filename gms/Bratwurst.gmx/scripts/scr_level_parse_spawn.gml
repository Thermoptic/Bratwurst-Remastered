/// scr_level_parse_spawn(text, slot)
// Laser "x,y,vinkel" (1/256 px, 256-stegs vinkel) till g_ed_sx/sy/sa[slot]. Ogiltigt varde behaller det som redan ligger i arrayerna.
var s, c, xv, yv, av;
s = argument0;
xv = g_ed_sx[argument1]; yv = g_ed_sy[argument1]; av = g_ed_sa[argument1];
c = string_pos(",", s);
if (c > 0)
{
    xv = scr_safe_real(string_copy(s, 1, c - 1), xv);
    s = string_delete(s, 1, c);
    c = string_pos(",", s);
    if (c > 0)
    {
        yv = scr_safe_real(string_copy(s, 1, c - 1), yv);
        av = scr_safe_real(string_delete(s, 1, c), av);
    }
}
g_ed_sx[argument1] = xv;
g_ed_sy[argument1] = yv;
g_ed_sa[argument1] = ((round(av) mod 256) + 256) mod 256;
