/// scr_frame_prepare()
// Arenans ytterram (D-066): markerar vilka vaggobjekt som ar banans yttre gransvagg, g_wfr[objekt] = true. Ytterram = en form som innesluter nagon annan forms forsta
// punkt (samma regel som Solid colors, scr_solid_build), eller banans enda form. Ytterramen ritas bara nar ett skepp narmar sig (scr_frame_line_draw).
// Kors efter scr_arena_prepare (vaggobjekten) vid matchstart.
var s, q, i, enc, lc, first;
for (i = 0; i < g_wall_gn; i += 1) { g_wfr[i] = false; }
lc = 0;
for (s = 0; s < g_ed_n; s += 1)
{
    first = lc;
    lc += g_ed_pn[s];
    enc = (g_ed_n == 1);
    for (q = 0; q < g_ed_n; q += 1)
    {
        if (q != s && !enc)
        {
            if (scr_poly_has_point(s, g_ed_px[q, 0], g_ed_py[q, 0])) { enc = true; }
        }
    }
    if (enc && first < g_wall_n) { g_wfr[g_wall_grp[first]] = true; }
}
