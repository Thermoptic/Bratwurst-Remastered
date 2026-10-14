/// scr_ast_new(x, y, vx, vy, size)
// Skapar en sten (varldspixlar, hastighet i pixlar per tick; size 0 = stor, 1 = mellan, 2 = liten) i forsta lediga platsen i poolen. Slumpad form, vinkel och
// rotationsfart (mindre stenar snurrar snabbare). Returnerar index eller -1 om poolen ar full.
var k, i;
k = -1;
for (i = 0; i < g_AS_MAX; i += 1)
{
    if (!g_as_on[i]) { k = i; break; }
}
if (k < 0) { return -1; }
g_as_on[k] = true;
g_as_x[k] = argument0;
g_as_y[k] = argument1;
g_as_vx[k] = argument2;
g_as_vy[k] = argument3;
g_as_sz[k] = argument4;
g_as_sh[k] = irandom(3);
g_as_a[k] = random(2 * pi);
g_as_sp[k] = (random(2) - 1) * (0.012 + 0.012 * argument4);
return k;
