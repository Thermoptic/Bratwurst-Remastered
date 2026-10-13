/// scr_point_in_ship(x, y)
// Kors i obj_player. Jamn/odd-regel (stralkastning) over skeppets linjer i varldsrymd.
// PLACEHOLDER: originalet testar en skeppssilhuett-bitmapp i skarmrymd (om den ar fylld eller bara kontur ar OKAND).
var xx, yy, k, a, b, x1, y1, x2, y2, inside;
xx = argument0;
yy = argument1;
if (xx < ob_minx || xx > ob_maxx || yy < ob_miny || yy > ob_maxy) { return false; }
inside = false;
for (k = 0; k < nl; k += 1)
{
    a = g_ship_lines[ship, 2 * k];
    b = g_ship_lines[ship, 2 * k + 1];
    x1 = ow_x[a]; y1 = ow_y[a]; x2 = ow_x[b]; y2 = ow_y[b];
    if ((y1 > yy) != (y2 > yy))
    {
        if (xx < (x2 - x1) * (yy - y1) / (y2 - y1) + x1) { inside = !inside; }
    }
}
return inside;
