/// scr_ast_init()
// Asteroids (spellage 4, D-046): engangsforberedelse vid start. Bygger fyra stenformer (12 hornpunkter vardera pa enhetsradien med oregelbunden radie, som i
// Atari-originalet fran 1979) i g_as_shx/g_as_shy[form * 12 + punkt]; stenarna ar stjarnformade runt mitten (kan fyllas som solfjader). Storleksdata:
// g_AS_R[storlek] = radie i varldspixlar (0 stor, 1 mellan, 2 liten), g_AS_DMG = skada pa skepp (10 / 5 / 1), g_AS_KB = knuff mot skeppet.
var sp, j, a, r;
g_AS_MAX = 320;   // pool: en niva 5-vag (upp till 64 stora stenar) kan ge 4 ganger sa manga mindre
g_AS_R[0] = 110; g_AS_R[1] = 55; g_AS_R[2] = 28;
g_AS_DMG[0] = 10; g_AS_DMG[1] = 5; g_AS_DMG[2] = 1;
g_AS_KB[0] = 3200; g_AS_KB[1] = 2400; g_AS_KB[2] = 1400;
for (sp = 0; sp < 4; sp += 1)
{
    for (j = 0; j < 12; j += 1)
    {
        a = (j + 0.25 * sin(sp * 3.1 + j * 1.7)) * 2 * pi / 12;
        r = 0.74 + 0.30 * (0.5 + 0.5 * sin(sp * 7.3 + j * 2.1 + sp * j * 0.9));
        g_as_shx[sp * 12 + j] = cos(a) * r;
        g_as_shy[sp * 12 + j] = sin(a) * r;
    }
}
for (j = 0; j < g_AS_MAX; j += 1) { g_as_on[j] = false; g_as_x[j] = 0; g_as_y[j] = 0; g_as_vx[j] = 0; g_as_vy[j] = 0; g_as_sz[j] = 0; g_as_sh[j] = 0; g_as_a[j] = 0; g_as_sp[j] = 0; }
g_as_wave = 0;
g_as_timer = g_AS_FIRST;
g_as_trk = 0;
