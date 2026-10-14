/// scr_ast_hit(index, mode)
// Asteroids: stenen traffas. mode 0 = delas som i originalet: stor -> tva mellanstora, mellan -> tva sma (snabbare, riktning ca 25-55 grader at var sida om
// moderns), liten forsvinner helt. mode 1 = forintas (stralen och chockvagen) utan att delas. Gnistor och en liten explosion.
var k, sz, ax, ay, a0, a1, spd, mult, ns, i, side;
k = argument0;
sz = g_as_sz[k];
ax = g_as_x[k];
ay = g_as_y[k];
a0 = arctan2(g_as_vy[k], g_as_vx[k]);
g_as_on[k] = false;
scr_spark_burst(floor(ax), floor(ay), 8 + (2 - sz) * 6 + 4 * (2 - sz), 1.4 + 0.5 * (2 - sz), g_c[6]);
scr_sfx_play(snd_sfx_explosion, 1, 0.3 + 0.1 * (2 - sz));
if (argument1 == 0 && sz < 2)
{
    mult = 1 + 0.06 * min(g_as_wave - 1, 8);
    ns = sz + 1;
    for (i = 0; i < 2; i += 1)
    {
        if (i == 0) { side = 1; } else { side = -1; }
        a1 = a0 + side * random_range(0.45, 0.95);
        if (ns == 1) { spd = random_range(2.2, 3.4) * mult * g_AS_SPEED * min(scr_ast_mult(), 8); } else { spd = random_range(3.6, 5.5) * mult * g_AS_SPEED * min(scr_ast_mult(), 8); }
        scr_ast_new(ax + cos(a1) * g_AS_R[ns] * 0.5, ay + sin(a1) * g_AS_R[ns] * 0.5, cos(a1) * spd, sin(a1) * spd, ns);
    }
}
