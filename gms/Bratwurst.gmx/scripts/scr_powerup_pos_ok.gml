/// scr_powerup_pos_ok(x, y)
// Ar punkten (varldspixlar) en giltig plats for en powerup? Den ska ligga innanfor banans ram och utanfor alla andra objekt (udda antal skarningar med en
// stral at hoger mot alla vaggsegment = inne i ramen men inte i ett objekt) och orbens kant minst g_PU_WALL (20) pixlar fran varje vagg (centrum minst g_PU_RADIUS + 20). Ligger inte heller ovanpa ett skepp.
var k, a, b, x1, y1, x2, y2, cnt, d, dx, dy, tt, vx2, vy2, len2;
cnt = 0;
for (k = 0; k < g_wall_n; k += 1)
{
    a = g_wall_a[k];
    b = g_wall_b[k];
    x1 = g_wall_px[a]; y1 = g_wall_py[a];
    x2 = g_wall_px[b]; y2 = g_wall_py[b];
    if ((y1 > argument1) != (y2 > argument1))
    {
        if (argument0 < x1 + (argument1 - y1) * (x2 - x1) / (y2 - y1)) { cnt += 1; }
    }
    // avstand punkt - segment
    vx2 = x2 - x1;
    vy2 = y2 - y1;
    len2 = vx2 * vx2 + vy2 * vy2;
    tt = 0;
    if (len2 > 0) { tt = clamp(((argument0 - x1) * vx2 + (argument1 - y1) * vy2) / len2, 0, 1); }
    dx = argument0 - (x1 + vx2 * tt);
    dy = argument1 - (y1 + vy2 * tt);
    if (dx * dx + dy * dy < (g_PU_RADIUS + g_PU_WALL) * (g_PU_RADIUS + g_PU_WALL)) { return false; }   // orbens kant minst g_PU_WALL fran vaggen
}
if (g_wall_n > 0 && (cnt mod 2) == 0) { return false; }
g_tmp_f = true;
g_pj_x = argument0;
g_pj_y = argument1;
with (obj_player)
{
    if (alive && point_distance(floor(px / 256), floor(py / 256), g_pj_x, g_pj_y) < 70) { g_tmp_f = false; }
}
return g_tmp_f;
