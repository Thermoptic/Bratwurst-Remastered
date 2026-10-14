/// scr_ast_blast(x, y, radius)
// Asteroids: Mini Nukes chockvag (cirkel med mitt (x, y) och radie i varldspixlar) forintar varje sten den nar, utan att dela den. Kors fran scr_fx_damage.
var k;
for (k = 0; k < g_AS_MAX; k += 1)
{
    if (g_as_on[k])
    {
        if (point_distance(g_as_x[k], g_as_y[k], argument0, argument1) <= argument2 + g_AS_R[g_as_sz[k]] * 0.5) { scr_ast_hit(k, 1); }
    }
}
