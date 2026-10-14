/// scr_powerup_spawn()
// Skapar en slumpad powerup pa en slumpad giltig plats pa banan (scr_powerup_pos_ok). Provar hogst 300 platser inom vaggarnas omslutande ruta.
var i, x0, y0, x1, y1, tx, ty, ok;
if (g_wall_n > 0)
{
    x0 = g_wall_px[0]; x1 = x0; y0 = g_wall_py[0]; y1 = y0;
    for (i = 1; i < g_wall_n; i += 1)
    {
        x0 = min(x0, g_wall_px[i]); x1 = max(x1, g_wall_px[i]);
        y0 = min(y0, g_wall_py[i]); y1 = max(y1, g_wall_py[i]);
    }
}
else { x0 = -2500; x1 = 2500; y0 = -2000; y1 = 2000; }
ok = false;
for (i = 0; i < 300; i += 1)
{
    tx = x0 + random(x1 - x0);
    ty = y0 + random(y1 - y0);
    if (scr_powerup_pos_ok(tx, ty)) { ok = true; break; }
}
if (!ok) { g_pu_timer = 50; exit; }   // ingen plats hittades: forsok igen om en sekund
g_pu_on = true;
g_pu_x = tx;
g_pu_y = ty;
g_pu_type = irandom(g_PU_SPAWN - 1);
