/// scr_ed_pan_clamp()
// Banredigeraren (D-061): haller panoreringen (g_ed_panx/pany = vilken varldspunkt som ligger mitt i ritytan) inom varlden. Utan inzoomning (zoom 1)
// ar hela varlden synlig och panoreringen noll.
var hx, hy, lx, ly;
if (g_ed_zoom <= 1.001)
{
    g_ed_zoom = 1;
    g_ed_panx = 0;
    g_ed_pany = 0;
    exit;
}
hx = (g_ed_w / 2) / g_ed_es;
hy = (g_ed_h / 2) / g_ed_es;
lx = max(0, 3100 - hx);
ly = max(0, 2400 - hy);
g_ed_panx = clamp(g_ed_panx, -lx, lx);
g_ed_pany = clamp(g_ed_pany, -ly, ly);
