/// scr_spark_burst(world_x, world_y, count, speed, colour)
// Skapar 'count' gnistor (2-3 enhets stora pixlar) vid en varldsposition (varldspixlar). speed = utgangsfart i skarmenheter per tick (typiskt 1-3).
// Gnistorna flyger at slumpmassiga hall, bromsas och forsvinner var och en efter slumpad tid. Fargen blandas med vitt och gult.
var i, c, k, ang, spd, sc, r;
sc = 32768 / max(1, g_zoom);   // skarmenheter -> varldspixlar
for (c = 0; c < argument2; c += 1)
{
    k = -1;
    for (i = 0; i < g_SP_MAX; i += 1)
    {
        if (g_sp_life[g_sp_next] <= 0) { k = g_sp_next; }
        g_sp_next = (g_sp_next + 1) mod g_SP_MAX;
        if (k >= 0) { break; }
    }
    if (k < 0) { exit; }
    ang = random(2 * pi);
    spd = argument3 * (0.35 + random(0.9)) * sc;
    g_sp_x[k] = argument0;
    g_sp_y[k] = argument1;
    g_sp_vx[k] = cos(ang) * spd;
    g_sp_vy[k] = sin(ang) * spd;
    g_sp_life[k] = 14 + irandom(48);
    g_sp_size[k] = 2 + irandom(1);
    r = random(1);
    if (r < 0.6) { g_sp_col[k] = argument4; }
    else if (r < 0.85) { g_sp_col[k] = g_c[6]; }
    else { g_sp_col[k] = g_c[10]; }
}
