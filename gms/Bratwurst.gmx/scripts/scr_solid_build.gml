/// scr_solid_build()
// Bygger fyllningstrianglarna for banans vaggar (Options -> SOLID COLORS): varje polygon i banan (g_ed_*, kors efter scr_level_read vid matchstart) triangulerar
// med scr_poly_tris. Banans ytterram (en polygon som innesluter en annan polygons forsta punkt) fylls inte (den ar spelytans kant, inte ett fast foremal).
// Resultat: g_wf_n = antal trianglar, g_wf_tri[6*k .. 6*k+5] = x1,y1,x2,y2,x3,y3 (varldspixlar), g_wf_col[k] = vaggfargens index (samma som linjerna: form mod 11).
var s, i, j, q, enc, cnt, k, tn, nx, ny, px2, py2, inside, x1, y1, x2, y2;
g_wf_n = 0;
for (s = 0; s < g_ed_n; s += 1)
{
    // ytterram? (innesluter nagon annan polygons forsta punkt)
    enc = false;
    for (q = 0; q < g_ed_n; q += 1)
    {
        if (q != s && !enc)
        {
            px2 = g_ed_px[q, 0];
            py2 = g_ed_py[q, 0];
            inside = false;
            for (i = 0; i < g_ed_pn[s]; i += 1)
            {
                j = (i + 1) mod g_ed_pn[s];
                x1 = g_ed_px[s, i]; y1 = g_ed_py[s, i];
                x2 = g_ed_px[s, j]; y2 = g_ed_py[s, j];
                if ((y1 > py2) != (y2 > py2))
                {
                    if (px2 < x1 + (py2 - y1) * (x2 - x1) / (y2 - y1)) { inside = !inside; }
                }
            }
            if (inside) { enc = true; }
        }
    }
    if (!enc && g_ed_pn[s] >= 3 && g_ed_n > 1)   // en bana med bara en polygon (t.ex. helt tom, Asteroids) har bara ramen: ingenting att fylla
    {
        g_tp_n = g_ed_pn[s];
        for (i = 0; i < g_tp_n; i += 1)
        {
            g_tp_x[i] = g_ed_px[s, i];
            g_tp_y[i] = g_ed_py[s, i];
        }
        tn = scr_poly_tris();
        for (k = 0; k < tn; k += 1)
        {
            for (j = 0; j < 3; j += 1)
            {
                g_wf_tri[g_wf_n * 6 + j * 2] = g_tp_x[g_tp_tri[k * 3 + j]];
                g_wf_tri[g_wf_n * 6 + j * 2 + 1] = g_tp_y[g_tp_tri[k * 3 + j]];
            }
            g_wf_col[g_wf_n] = s mod 11;
            g_wf_n += 1;
        }
    }
}
