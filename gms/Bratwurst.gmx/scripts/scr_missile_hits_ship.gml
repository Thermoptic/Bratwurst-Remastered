/// scr_missile_hits_ship(x1, y1, x2, y2, radius)
// Kors i obj_player (D-087). Sant om en missil som under en tick rorde sig fran (x1,y1) till (x2,y2) (varldspixlar) traffar skeppet: det ar en traff om (a) missilens vag skar nagon av skeppets
// linjer, (b) missilen kommer inom 'radius' fran en linje (aven vid vagens andar eller skeppslinjens andpunkter), eller (c) vagens slutpunkt ligger inne i skeppet (jamn/udda-regeln,
// scr_point_in_ship). Det gor att man traffar sjalva linjerna/formen och inte bara mitten, och att en snabb missil (ca 20 pixlar per tick) inte kan hoppa over en tunn del av skeppet mellan
// tva ticks. Snabb avvisning med skeppets avgransningsbox (ob_*, raknas varje tick i scr_player_outline).
var k, a, b, ax, ay, bx, by;
if (max(argument0, argument2) + argument4 < ob_minx || min(argument0, argument2) - argument4 > ob_maxx) { return false; }
if (max(argument1, argument3) + argument4 < ob_miny || min(argument1, argument3) - argument4 > ob_maxy) { return false; }
if (scr_point_in_ship(argument2, argument3)) { return true; }
for (k = 0; k < nl; k += 1)
{
    a = g_ship_lines[ship, 2 * k];
    b = g_ship_lines[ship, 2 * k + 1];
    ax = ow_x[a]; ay = ow_y[a]; bx = ow_x[b]; by = ow_y[b];
    if (scr_seg_intersect(argument0, argument1, argument2, argument3, ax, ay, bx, by)) { return true; }
    if (argument4 > 0)
    {
        if (scr_seg_dist(argument2, argument3, ax, ay, bx, by) <= argument4) { return true; }
        if (scr_seg_dist(argument0, argument1, ax, ay, bx, by) <= argument4) { return true; }
        if (scr_seg_dist(ax, ay, argument0, argument1, argument2, argument3) <= argument4) { return true; }
        if (scr_seg_dist(bx, by, argument0, argument1, argument2, argument3) <= argument4) { return true; }
    }
}
return false;
