/// scr_ed_dist(px, py, x1, y1, x2, y2)
// Avstand fran punkten (px, py) till strackan (x1, y1)-(x2, y2).
var dx, dy, l2, t, qx, qy;
dx = argument4 - argument2;
dy = argument5 - argument3;
l2 = dx * dx + dy * dy;
t = 0;
if (l2 > 0) { t = clamp(((argument0 - argument2) * dx + (argument1 - argument3) * dy) / l2, 0, 1); }
qx = argument2 + t * dx;
qy = argument3 + t * dy;
return point_distance(argument0, argument1, qx, qy);
