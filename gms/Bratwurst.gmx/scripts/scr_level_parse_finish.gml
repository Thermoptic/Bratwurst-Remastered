/// scr_level_parse_finish(text)
// Laser "x0,y0,x1,y1,riktning" (varldspixlar; riktning 0 = upp, 1 = hoger, 2 = ner, 3 = vanster) till redigerarens malruta g_ed_fx0/fy0/fx1/fy1/fdir och
// sattter g_ed_fon. Tom eller ogiltig text ger ingen malruta (g_ed_fon = false).
var s, c, k, v;
g_ed_fon = false;
s = argument0;
if (string_length(s) == 0) { exit; }
for (k = 0; k < 5; k += 1)
{
    c = string_pos(",", s);
    if (c > 0)
    {
        v[k] = scr_safe_real(string_copy(s, 1, c - 1), 0);
        s = string_delete(s, 1, c);
    }
    else
    {
        v[k] = scr_safe_real(s, 0);
        s = "";
        if (k < 4) { exit; }
    }
}
if (v[0] == v[2] || v[1] == v[3]) { exit; }
g_ed_fx0 = v[0]; g_ed_fy0 = v[1]; g_ed_fx1 = v[2]; g_ed_fy1 = v[3];
g_ed_fdir = ((round(v[4]) mod 4) + 4) mod 4;
g_ed_fon = true;
