/// scr_ast_test(x1, y1, x2, y2, pad)
// Asteroids: forsta stenen som strackan (x1,y1)-(x2,y2) (varldspixlar, t.ex. ett skotts rorelse senaste tick) traffar (stenens cirkel, 90 % av radien, plus pad),
// annars -1. Anvands for skott och missiler. En snabb rutkontroll sorterar bort stenar langt fran strackan fore det dyrare avstandsanropet (med upp till 320 stenar).
var k, rr, lx, hx, ly, hy;
lx = min(argument0, argument2);
hx = max(argument0, argument2);
ly = min(argument1, argument3);
hy = max(argument1, argument3);
for (k = 0; k < g_AS_MAX; k += 1)
{
    if (g_as_on[k])
    {
        rr = g_AS_R[g_as_sz[k]] * 0.9 + argument4;
        if (g_as_x[k] >= lx - rr && g_as_x[k] <= hx + rr && g_as_y[k] >= ly - rr && g_as_y[k] <= hy + rr)
        {
            if (scr_seg_dist(g_as_x[k], g_as_y[k], argument0, argument1, argument2, argument3) <= rr) { return k; }
        }
    }
}
return -1;
