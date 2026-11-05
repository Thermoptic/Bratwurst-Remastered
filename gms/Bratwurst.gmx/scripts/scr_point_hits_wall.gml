/// scr_point_hits_wall(x, y, tolerance)
// Sant om punkten ligger inom 'tolerance' varldspixlar fran nagon vagg.
// Originalet testar EN bildpunkt i en skarmbitmapp (tolerans = 1 skarmpixel); skott kan darfor teoretiskt tunnla.
var xx, yy, tol, w, a, b, x1, y1, x2, y2, dx, dy, t, cx, cy;
xx = argument0; yy = argument1; tol = argument2;
for (w = 0; w < g_wall_n; w += 1)
{
    if (g_wall_gh[w]) { continue; }   // spoklinje (D-085)
    if (xx < g_wall_minx[w] - tol || xx > g_wall_maxx[w] + tol) { continue; }
    if (yy < g_wall_miny[w] - tol || yy > g_wall_maxy[w] + tol) { continue; }
    a = g_wall_a[w]; b = g_wall_b[w];
    x1 = g_wall_px[a]; y1 = g_wall_py[a]; x2 = g_wall_px[b]; y2 = g_wall_py[b];
    dx = x2 - x1; dy = y2 - y1;
    t = ((xx - x1) * dx + (yy - y1) * dy) / max(1, dx * dx + dy * dy);
    t = max(0, min(1, t));
    cx = x1 + t * dx; cy = y1 + t * dy;
    if ((xx - cx) * (xx - cx) + (yy - cy) * (yy - cy) <= tol * tol) { return true; }
}
return false;
