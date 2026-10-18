/// scr_poly_has_point(shape, x, y)
// Sant om punkten (x, y) (varldspixlar) ligger inuti banformen med index shape i redigerarens arrayer (g_ed_*). Jamn/udda-regeln (stralen at hoger).
var s, i, j, x1, y1, x2, y2, inside;
s = argument0;
inside = false;
for (i = 0; i < g_ed_pn[s]; i += 1)
{
    j = (i + 1) mod g_ed_pn[s];
    x1 = g_ed_px[s, i]; y1 = g_ed_py[s, i];
    x2 = g_ed_px[s, j]; y2 = g_ed_py[s, j];
    if ((y1 > argument2) != (y2 > argument2))
    {
        if (argument1 < x1 + (argument2 - y1) * (x2 - x1) / (y2 - y1)) { inside = !inside; }
    }
}
return inside;
