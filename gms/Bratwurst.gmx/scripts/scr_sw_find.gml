/// scr_sw_find()
// Super Smashwurst (D-085): index (i redigerarens arrayer, efter scr_level_read) pa banans ytterram = den roda gransen, annars -1. Samma regel som scr_frame_prepare: en form som
// innesluter nagon annan forms forsta punkt, eller banans enda form; finns flera sadana valjs den med storst omskrivande box (den yttersta).
var s, q, enc, i, mnx, mxx, mny, mxy, area, best, barea;
best = -1;
barea = -1;
for (s = 0; s < g_ed_n; s += 1)
{
    enc = (g_ed_n == 1);
    for (q = 0; q < g_ed_n; q += 1)
    {
        if (q != s && !enc)
        {
            if (scr_poly_has_point(s, g_ed_px[q, 0], g_ed_py[q, 0])) { enc = true; }
        }
    }
    if (enc)
    {
        mnx = g_ed_px[s, 0]; mxx = mnx; mny = g_ed_py[s, 0]; mxy = mny;
        for (i = 1; i < g_ed_pn[s]; i += 1)
        {
            mnx = min(mnx, g_ed_px[s, i]); mxx = max(mxx, g_ed_px[s, i]);
            mny = min(mny, g_ed_py[s, i]); mxy = max(mxy, g_ed_py[s, i]);
        }
        area = (mxx - mnx) * (mxy - mny);
        if (area > barea) { barea = area; best = s; }
    }
}
return best;
