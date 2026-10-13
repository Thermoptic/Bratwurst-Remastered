/// scr_player_outline()
// Kors i obj_player. Beraknar skeppets punkter och poddar i VARLDSPIXLAR (for kollision) samt pod-positioner i
// 24.8-enheter (for skott), enligt originalets rutin hunk0 0x199c:
//   rot_x = (x*cos + y*sin) >> 8,  rot_y = (x*sin - y*cos) >> 8   (8 bitar fixpunkt; y-axeln vands)
//   pod_varld(24.8) = pos(24.8) + rot * 128   => 1 skeppsenhet = 0.5 varldspixel
var j, a, sn, cs, sx, sy, rx, ry;
ow_x[0] = 0; ow_y[0] = 0; pod_wx[0] = 0; pod_wy[0] = 0;   // skapa arrayerna (GMS 1.4)
sn = g_sin_tab[ang];
cs = g_cos_tab[ang];
for (j = 0; j < np; j += 1)
{
    sx = g_ship_pts[ship, 2 * j];
    sy = g_ship_pts[ship, 2 * j + 1];
    rx = floor((sx * cs + sy * sn) / 256);
    ry = floor((sx * sn - sy * cs) / 256);
    ow_x[j] = floor(px / 256) + rx * 0.5;
    ow_y[j] = floor(py / 256) + ry * 0.5;
}
for (j = 0; j < nk; j += 1)
{
    sx = g_ship_pods[ship, 2 * j];
    sy = g_ship_pods[ship, 2 * j + 1];
    rx = floor((sx * cs + sy * sn) / 256);
    ry = floor((sx * sn - sy * cs) / 256);
    pod_wx[j] = px + rx * 128;
    pod_wy[j] = py + ry * 128;
}
// avgransningsbox for snabba tester
ob_minx = ow_x[0]; ob_maxx = ow_x[0]; ob_miny = ow_y[0]; ob_maxy = ow_y[0];
for (j = 1; j < np; j += 1)
{
    ob_minx = min(ob_minx, ow_x[j]); ob_maxx = max(ob_maxx, ow_x[j]);
    ob_miny = min(ob_miny, ow_y[j]); ob_maxy = max(ob_maxy, ow_y[j]);
}
