/// scr_level_parse_shape(text, shape_index)
// Laser "x,y;x,y;..." till g_ed_px[s, i], g_ed_py[s, i] och g_ed_pn[s] (max 32 punkter).
var str, n, p, tok, c;
str = argument0;
n = 0;
while (string_length(str) > 0 && n < 32)
{
    p = string_pos(";", str);
    if (p == 0) { tok = str; str = ""; }
    else { tok = string_copy(str, 1, p - 1); str = string_delete(str, 1, p); }
    c = string_pos(",", tok);
    if (c > 0)
    {
        g_ed_px[argument1, n] = scr_safe_real(string_copy(tok, 1, c - 1), 0);
        g_ed_py[argument1, n] = scr_safe_real(string_delete(tok, 1, c), 0);
        n += 1;
    }
}
g_ed_pn[argument1] = n;
