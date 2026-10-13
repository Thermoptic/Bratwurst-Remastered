/// scr_debris_add(x, y, half_x, half_y, vx, vy, spin, life, colour)
// Lagger en skeppsdel (en linje: mittpunkt (x,y), halv riktningsvektor (half_x, half_y), alla i varldspixlar) i poolen. Returnerar true om det fanns plats.
var i;
for (i = 0; i < g_DB_MAX; i += 1)
{
    if (g_db_life[i] <= 0)
    {
        g_db_x[i] = argument0; g_db_y[i] = argument1;
        g_db_hx[i] = argument2; g_db_hy[i] = argument3;
        g_db_vx[i] = argument4; g_db_vy[i] = argument5;
        g_db_w[i] = argument6;
        g_db_life[i] = argument7;
        g_db_col[i] = argument8;
        return true;
    }
}
return false;
