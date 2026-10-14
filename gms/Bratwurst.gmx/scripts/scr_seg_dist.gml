/// scr_seg_dist(px, py, x1, y1, x2, y2)
// Kortaste avstandet fran punkten (px, py) till strackan (x1,y1)-(x2,y2). Anvands av railgunstralen.
var vx2, vy2, len2, tt;
vx2 = argument4 - argument2;
vy2 = argument5 - argument3;
len2 = vx2 * vx2 + vy2 * vy2;
tt = 0;
if (len2 > 0) { tt = clamp(((argument0 - argument2) * vx2 + (argument1 - argument3) * vy2) / len2, 0, 1); }
return point_distance(argument0, argument1, argument2 + vx2 * tt, argument3 + vy2 * tt);
