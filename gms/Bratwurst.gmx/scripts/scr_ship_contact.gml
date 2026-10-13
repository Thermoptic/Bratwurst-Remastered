/// scr_ship_contact(player_a, player_b)
// Kontaktpunkt (varldspixlar) mellan tva overlappande skepp: medelvardet av alla skarningspunkter mellan deras linjer. Resultatet laggs i
// g_ct_x, g_ct_y; hittas ingen skarning anvands mittpunkten mellan skeppens centrum. Ska kallas medan skeppen fortfarande overlappar.
var k, m, ia, ib, ja, jb, ax, ay, bx, by, cx2, cy2, dx2, dy2, den, tt, n, sx, sy;
n = 0; sx = 0; sy = 0;
for (k = 0; k < argument0.nl; k += 1)
{
    ia = g_ship_lines[argument0.ship, 2 * k];
    ib = g_ship_lines[argument0.ship, 2 * k + 1];
    for (m = 0; m < argument1.nl; m += 1)
    {
        ja = g_ship_lines[argument1.ship, 2 * m];
        jb = g_ship_lines[argument1.ship, 2 * m + 1];
        ax = argument0.ow_x[ia]; ay = argument0.ow_y[ia];
        bx = argument0.ow_x[ib] - ax; by = argument0.ow_y[ib] - ay;
        cx2 = argument1.ow_x[ja]; cy2 = argument1.ow_y[ja];
        dx2 = argument1.ow_x[jb] - cx2; dy2 = argument1.ow_y[jb] - cy2;
        den = bx * dy2 - by * dx2;
        if (den != 0)
        {
            tt = ((cx2 - ax) * dy2 - (cy2 - ay) * dx2) / den;
            if (tt >= 0 && tt <= 1)
            {
                sx += ax + tt * bx;
                sy += ay + tt * by;
                n += 1;
            }
        }
    }
}
if (n > 0)
{
    g_ct_x = sx / n;
    g_ct_y = sy / n;
}
else
{
    g_ct_x = (argument0.px + argument1.px) / 512;
    g_ct_y = (argument0.py + argument1.py) / 512;
}
return n;
