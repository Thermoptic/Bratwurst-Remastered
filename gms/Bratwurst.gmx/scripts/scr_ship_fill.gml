/// scr_ship_fill(ship, colour)
// Kors i obj_player (som scr_match_draw redan beraknat dsx/dsy for): fyller skeppets skrov med fargen (Options -> SOLID COLORS ON), med de forberedda trianglarna
// (scr_ship_fill_init) och skeppets aktuella roterade punkter. Konturen ritas sedan ovanpa av scr_match_draw.
var k, j, ix;
if (g_sf_n[argument0] <= 0) { exit; }
draw_set_alpha(1);
draw_primitive_begin(pr_trianglelist);
for (k = 0; k < g_sf_n[argument0]; k += 1)
{
    for (j = 0; j < 3; j += 1)
    {
        ix = g_sf_t[argument0, k * 3 + j];
        draw_vertex_colour(g_OX + dsx[ix] * g_SCALE, g_OY + dsy[ix] * g_SCALE, argument1, 1);
    }
}
draw_primitive_end();
