/// scr_ed_add_shape()
// Lagger det pagaende polygonen (g_ed_cx/cy, g_ed_cn punkter) som ny form. Returnerar true om det lyckades.
var i;
if (g_ed_cn < 3 || g_ed_n >= 64) { return false; }
g_ed_pn[g_ed_n] = g_ed_cn;
for (i = 0; i < g_ed_cn; i += 1)
{
    g_ed_px[g_ed_n, i] = g_ed_cx[i];
    g_ed_py[g_ed_n, i] = g_ed_cy[i];
}
g_ed_n += 1;
g_ed_cn = 0;
g_ed_dirty = true;
return true;
