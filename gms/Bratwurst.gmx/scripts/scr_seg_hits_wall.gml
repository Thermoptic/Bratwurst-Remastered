/// scr_seg_hits_wall(x1, y1, x2, y2, tolerance)
// Sant om stracka (x1,y1)-(x2,y2) (varldspixlar, t.ex. ett skotts rorelse under en tick) skar nagon vagg eller slutar inom 'tolerance' fran en vagg.
// Ersatter punkttestet for snabba skott och missiler som annars kunde flyga rakt igenom tunna vaggar (tunnling).
var w, a, b, lx, hx, ly, hy;
lx = min(argument0, argument2) - argument4;
hx = max(argument0, argument2) + argument4;
ly = min(argument1, argument3) - argument4;
hy = max(argument1, argument3) + argument4;
for (w = 0; w < g_wall_n; w += 1)
{
    if (hx < g_wall_minx[w] || lx > g_wall_maxx[w]) { continue; }
    if (hy < g_wall_miny[w] || ly > g_wall_maxy[w]) { continue; }
    a = g_wall_a[w];
    b = g_wall_b[w];
    if (scr_seg_intersect(argument0, argument1, argument2, argument3, g_wall_px[a], g_wall_py[a], g_wall_px[b], g_wall_py[b])) { return true; }
}
return scr_point_hits_wall(argument2, argument3, argument4);
