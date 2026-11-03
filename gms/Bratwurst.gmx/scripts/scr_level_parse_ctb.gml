/// scr_level_parse_ctb(text, kind)
// Capture the Bratwurst (D-078): laser en banpost till redigerarens arrayer. kind 0 = korvens startpunkt "x,y" (g_ed_son, g_ed_sox, g_ed_soy);
// kind 1 = roda zonen, kind 2 = bla zonen, "x0,y0,x1,y1" (varldspixlar) till g_ed_zon/zx0/zy0/zx1/zy1[kind - 1] (normaliserad: x0 < x1, y0 < y1).
// Tom eller ogiltig text ger ingen post (flaggan false). Banor utan nycklarna fungerar som forut.
var s, c, k, v, n, z;
s = argument0;
if (argument1 == 0) { g_ed_son = false; n = 2; }
else { g_ed_zon[argument1 - 1] = false; n = 4; }
if (string_length(s) == 0) { exit; }
for (k = 0; k < n; k += 1)
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
        if (k < n - 1) { exit; }
    }
}
if (argument1 == 0)
{
    g_ed_sox = v[0];
    g_ed_soy = v[1];
    g_ed_son = true;
    exit;
}
if (v[0] == v[2] || v[1] == v[3]) { exit; }
z = argument1 - 1;
g_ed_zx0[z] = min(v[0], v[2]); g_ed_zx1[z] = max(v[0], v[2]);
g_ed_zy0[z] = min(v[1], v[3]); g_ed_zy1[z] = max(v[1], v[3]);
g_ed_zon[z] = true;
