/// scr_sw_inside(world_x, world_y)
// Super Smashwurst (D-085): sant om punkten (varldspixlar) ligger innanfor den roda gransen (ytterramens polygon, g_sw_bx/by). Jamn/udda-regeln (stralen at hoger, som scr_poly_has_point).
// Finns ingen grans (g_sw_bn < 3) raknas allt som innanfor. Skeppets mittpunkt anvands (inte skrovet), sa att kontrollen ar entydig.
var i, j, x1, y1, x2, y2, inside;
if (g_sw_bn < 3) { return true; }
inside = false;
for (i = 0; i < g_sw_bn; i += 1)
{
    j = (i + 1) mod g_sw_bn;
    x1 = g_sw_bx[i]; y1 = g_sw_by[i];
    x2 = g_sw_bx[j]; y2 = g_sw_by[j];
    if ((y1 > argument1) != (y2 > argument1))
    {
        if (argument0 < x1 + (argument1 - y1) * (x2 - x1) / (y2 - y1)) { inside = !inside; }
    }
}
return inside;
