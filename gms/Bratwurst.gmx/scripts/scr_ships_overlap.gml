/// scr_ships_overlap(player_a, player_b)
// Sant om nagon linje i skeppet a skar nagon linje i skeppet b (varldsrymd, samma metod som vaggkollisionen). a och b ar instans-id.
var k, m, ia, ib, ja, jb;
if (argument0.ob_maxx < argument1.ob_minx || argument0.ob_minx > argument1.ob_maxx) { return false; }
if (argument0.ob_maxy < argument1.ob_miny || argument0.ob_miny > argument1.ob_maxy) { return false; }
for (k = 0; k < argument0.nl; k += 1)
{
    ia = g_ship_lines[argument0.ship, 2 * k];
    ib = g_ship_lines[argument0.ship, 2 * k + 1];
    for (m = 0; m < argument1.nl; m += 1)
    {
        ja = g_ship_lines[argument1.ship, 2 * m];
        jb = g_ship_lines[argument1.ship, 2 * m + 1];
        if (scr_seg_intersect(argument0.ow_x[ia], argument0.ow_y[ia], argument0.ow_x[ib], argument0.ow_y[ib],
                              argument1.ow_x[ja], argument1.ow_y[ja], argument1.ow_x[jb], argument1.ow_y[jb]))
        {
            return true;
        }
    }
}
return false;
