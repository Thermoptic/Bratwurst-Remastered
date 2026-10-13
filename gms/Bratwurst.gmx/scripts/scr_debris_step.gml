/// scr_debris_step()
// En tick for skeppsdelarna: rorelse, rotation, svag luftmotstand och tyngdkraft, nedrakning.
var i, sc, nx, ny, co, si;
sc = 32768 / max(1, g_zoom);
for (i = 0; i < g_DB_MAX; i += 1)
{
    if (g_db_life[i] > 0)
    {
        g_db_x[i] += g_db_vx[i];
        g_db_y[i] += g_db_vy[i];
        co = cos(g_db_w[i]);
        si = sin(g_db_w[i]);
        nx = g_db_hx[i] * co - g_db_hy[i] * si;
        ny = g_db_hx[i] * si + g_db_hy[i] * co;
        g_db_hx[i] = nx;
        g_db_hy[i] = ny;
        g_db_vx[i] *= 0.985;
        g_db_vy[i] = g_db_vy[i] * 0.985 + 0.012 * sc;
        g_db_life[i] -= 1;
    }
}
