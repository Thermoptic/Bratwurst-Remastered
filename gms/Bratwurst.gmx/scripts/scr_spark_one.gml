/// scr_spark_one(world_x, world_y, vx, vy, life, size, colour)
// Skapar en enskild gnista/pixelpartikel i gnistpoolen (varldspixlar, hastighet i varldspixlar per tick). Anvands for missilernas partikelsvans.
var i, k;
k = -1;
for (i = 0; i < g_SP_MAX; i += 1)
{
    if (g_sp_life[g_sp_next] <= 0) { k = g_sp_next; }
    g_sp_next = (g_sp_next + 1) mod g_SP_MAX;
    if (k >= 0) { break; }
}
if (k < 0) { exit; }
g_sp_x[k] = argument0;
g_sp_y[k] = argument1;
g_sp_vx[k] = argument2;
g_sp_vy[k] = argument3;
g_sp_life[k] = argument4;
g_sp_size[k] = argument5;
g_sp_col[k] = argument6;
