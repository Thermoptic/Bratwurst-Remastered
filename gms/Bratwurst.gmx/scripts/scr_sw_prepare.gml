/// scr_sw_prepare()
// Super Smashwurst (D-085): kors vid matchstart efter scr_level_apply (redigerarens arrayer galler fortfarande). Hittar ytterramen (scr_sw_find), kopierar dess polygon till g_sw_bx/by
// (varldspixlar; gransen som skeppen raknas utanfor) och gor ramens vaggar till spoklinjer (g_wall_gh) sa att skepp, skott och missiler flyger igenom den. Ramen ritas som forut.
// Hittas ingen ram finns ingen grans (g_sw_bn = 0) och ingen kan hamna utanfor.
var s, i, first, k;
g_sw_bn = 0;
s = scr_sw_find();
if (s < 0) { exit; }
first = 0;
for (k = 0; k < s; k += 1) { first += g_ed_pn[k] ; }
g_sw_bn = g_ed_pn[s];
for (i = 0; i < g_ed_pn[s]; i += 1)
{
    g_sw_bx[i] = g_ed_px[s, i];
    g_sw_by[i] = g_ed_py[s, i];
    g_wall_gh[first + i] = true;
}
