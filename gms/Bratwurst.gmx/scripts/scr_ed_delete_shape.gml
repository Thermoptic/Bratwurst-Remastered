/// scr_ed_delete_shape(shape_index)
// Tar bort en form (senare former flyttas ner ett steg).
var s, i;
for (s = argument0; s < g_ed_n - 1; s += 1)
{
    g_ed_pn[s] = g_ed_pn[s + 1];
    for (i = 0; i < g_ed_pn[s]; i += 1)
    {
        g_ed_px[s, i] = g_ed_px[s + 1, i];
        g_ed_py[s, i] = g_ed_py[s + 1, i];
    }
}
g_ed_n -= 1;
g_ed_dirty = true;
