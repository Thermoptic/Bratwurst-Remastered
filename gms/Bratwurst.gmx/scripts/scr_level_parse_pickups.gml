/// scr_level_parse_pickups(text)
// Laser "x,y;x,y;..." (varldspixlar) till redigerarens pickuppunkter g_ed_pkx/pky[0..g_ed_pk_n-1] (hogst g_PK_MAX). Ogiltiga poster hoppas over.
var s, c, e, xv, yv;
g_ed_pk_n = 0;
s = argument0;
while (string_length(s) > 0 && g_ed_pk_n < g_PK_MAX)
{
    e = string_pos(";", s);
    if (e > 0) { xv = string_copy(s, 1, e - 1); s = string_delete(s, 1, e); }
    else { xv = s; s = ""; }
    c = string_pos(",", xv);
    if (c > 0)
    {
        yv = string_delete(xv, 1, c);
        xv = string_copy(xv, 1, c - 1);
        g_ed_pkx[g_ed_pk_n] = scr_safe_real(xv, 0);
        g_ed_pky[g_ed_pk_n] = scr_safe_real(yv, 0);
        g_ed_pk_n += 1;
    }
}
