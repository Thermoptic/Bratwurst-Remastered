/// scr_ast_beam(x1, y1, x2, y2, width)
// Asteroids: Railgunstralens sveprade del (strackan fran kanonen till huvudet, varldspixlar, bredd width) forintar varje sten den skar, utan att dela den.
// Kors fran scr_beam_step.
var k;
for (k = 0; k < g_AS_MAX; k += 1)
{
    if (g_as_on[k])
    {
        if (scr_seg_dist(g_as_x[k], g_as_y[k], argument0, argument1, argument2, argument3) <= g_AS_R[g_as_sz[k]] * 0.9 + argument4 / 2) { scr_ast_hit(k, 1); }
    }
}
