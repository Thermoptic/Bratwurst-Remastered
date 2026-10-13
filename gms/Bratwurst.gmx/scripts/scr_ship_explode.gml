/// scr_ship_explode()
// Kors i obj_player nar skeppet dor (forlorar ett liv): pixelpartiklar at alla hall i olika hastigheter (gnistpoolen) plus fem skrovdelar, riktiga
// linjer ur skeppets form i sina egna langder, som flyger ut, snurrar och forsvinner efter ett par sekunder. Ljud: explosionen.
var wx, wy, c, sc, n, k, li, a, b, mx, my, dir, spd, npick, used;
wx = floor(px / 256);
wy = floor(py / 256);
c = scr_slot_colour(slot);
sc = 32768 / max(1, g_zoom);   // skarmenheter -> varldspixlar
scr_spark_burst(wx, wy, 36 + irandom(8), 3.4, c);
scr_sfx_play(snd_sfx_explosion, 1, 1);
npick = min(5, nl);
for (k = 0; k < nl; k += 1) { used[k] = false; }
for (n = 0; n < npick; n += 1)
{
    li = irandom(nl - 1);
    while (used[li]) { li = (li + 1) mod nl; }
    used[li] = true;
    a = g_ship_lines[ship, 2 * li];
    b = g_ship_lines[ship, 2 * li + 1];
    mx = (ow_x[a] + ow_x[b]) / 2;
    my = (ow_y[a] + ow_y[b]) / 2;
    if (point_distance(wx, wy, mx, my) < 1) { dir = random(360); }
    else { dir = point_direction(wx, wy, mx, my) + random_range(-25, 25); }
    spd = (0.5 + random(1.8)) * sc;
    scr_debris_add(mx, my, (ow_x[b] - ow_x[a]) / 2, (ow_y[b] - ow_y[a]) / 2,
                   lengthdir_x(spd, dir) + vx / 512, lengthdir_y(spd, dir) + vy / 512,
                   random_range(-0.22, 0.22), 100 + irandom(80), c);
}
