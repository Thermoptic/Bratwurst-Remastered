/// scr_ship_fill(ship, colour)
// Kors i obj_player (som scr_match_draw redan beraknat dsx/dsy for): fyller skeppets skrov med fargen (Options -> SOLID COLORS ON), med de forberedda trianglarna
// (scr_ship_fill_init) och skeppets aktuella roterade punkter. Konturen ritas sedan ovanpa av scr_match_draw.
var k, j, ix, ex, ox, oy;
if (g_sf_n[argument0] <= 0) { exit; }
draw_set_alpha(1);
// fyllningen ritas g_FILL_EXPAND + 1 ganger, forskjuten 0..g_FILL_EXPAND pixlar at hoger och ned: grafikkortets fyllregel (D3D9) lamnar sista pixelraden pa
// hoger/nedre kant tom, och forskjutna kopior tacker den (de hamnar bara under konturlinjen, aldrig utanfor den). g_FILL_EXPAND = 0 stanger av detta.
for (ox = 0; ox <= g_FILL_EXPAND; ox += 1)
{
    for (oy = 0; oy <= g_FILL_EXPAND; oy += 1)
    {
        draw_primitive_begin(pr_trianglelist);
        for (k = 0; k < g_sf_n[argument0]; k += 1)
        {
            for (j = 0; j < 3; j += 1)
            {
                ix = g_sf_t[argument0, k * 3 + j];
                draw_vertex_colour(g_OX + dsx[ix] * g_SCALE + ox, g_OY + dsy[ix] * g_SCALE + oy, argument1, 1);
            }
        }
        draw_primitive_end();
    }
}
// Grafikkortets fyllregel (D3D9) tacker inte den sista pixelraden pa hoger/nedre kanten av en triangel, sa att fyllningen ser ut att ligga 1-2 pixlar snett mot
// konturen. Trianglarnas kanter ritas darfor ocksa som linjer i samma farg (linjer traffar exakt samma pixlar som konturen), sa att fyllningen tacker hela skrovet.
for (k = 0; k < g_sf_n[argument0]; k += 1)
{
    for (j = 0; j < 3; j += 1)
    {
        ix = g_sf_t[argument0, k * 3 + j];
        ex = g_sf_t[argument0, k * 3 + ((j + 1) mod 3)];
        draw_line_colour(g_OX + dsx[ix] * g_SCALE, g_OY + dsy[ix] * g_SCALE, g_OX + dsx[ex] * g_SCALE, g_OY + dsy[ex] * g_SCALE, argument1, argument1);
    }
}
