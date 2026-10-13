/// scr_spark_step()
// En tick for alla gnistor: rorelse med luftmotstand och lite tyngdkraft, nedrakning av livslangd.
var i, sc;
sc = 32768 / max(1, g_zoom);
for (i = 0; i < g_SP_MAX; i += 1)
{
    if (g_sp_life[i] > 0)
    {
        g_sp_x[i] += g_sp_vx[i];
        g_sp_y[i] += g_sp_vy[i];
        g_sp_vx[i] *= 0.9;
        g_sp_vy[i] = g_sp_vy[i] * 0.9 + 0.03 * sc;
        g_sp_life[i] -= 1;
    }
}
