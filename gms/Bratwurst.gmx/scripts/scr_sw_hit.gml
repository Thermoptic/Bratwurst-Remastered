/// scr_sw_hit(kind, dir_x, dir_y)
// Super Smashwurst (D-085): kors i offrets kontext vid varje traff som annars hade tagit energi. kind 0 = kanonskott (CANNON PUSH, standard 1 %), kind 1 = missil av alla slag (MISSILE PUSH, standard
// 10 %; Mini Nuke, ringar och railgun raknas som missil). Energin rors aldrig i laget. Push okar med procenten (aldrig under 0, tak 9999) och traffens riktning (dir_x, dir_y, behover inte
// vara normaliserad; 0,0 = ingen knuff) ger en knuff: styrkan ar scr_sw_knock av offrets NYA Push, men ett offer med 0 % Push fore traffen far ingen knuff alls (traffen raknas men knuffar inte,
// spec 4). Knuffen laggs pa skeppets hastighet (vx/vy) och skeppets vanliga fysik (motstand, vaggar) tar hand om resten: ingen teleportering.
var inc, old, k, dl;
if (argument0 == 0) { inc = g_sv[g_SV_SWCN]; } else { inc = g_sv[g_SV_SWML]; }
old = sw_push;
sw_push = clamp(old + max(0, inc), 0, 9999);
if (old > 0)
{
    dl = sqrt(argument1 * argument1 + argument2 * argument2);
    if (dl > 0.0001)
    {
        k = scr_sw_knock(sw_push) * g_sv[g_SV_SWPS] / 5;   // PUSH STRENGTH (D-088): 5 = 100 % av kurvan, +20 % per steg (10 = dubbelt, 1 = en femtedel)
        vx += argument1 / dl * k;
        vy += argument2 / dl * k;
    }
}
