/// scr_hud_draw()
// Spelarpanelerna ligger i en rad langs vyns nederkant, en per aktiv spelare. Raden fyller hela bredden (12 px marginal och 12 px mellanrum),
// sa 1, 2, 3 eller 4 paneler ar alltid lika breda och i linje, och lika breda som spelytan. Heltalsfordelning ger exakt samma hogerkant.
var n, i, x0, x1, ty, th, span;
n = clamp(g_n_players, 1, 4);
span = g_vw - 24 + 12;   // radbredd + ett mellanrum
th = 108;
ty = g_vy + g_vh - 12 - th;
for (i = 0; i < n; i += 1)
{
    x0 = g_vx + 12 + floor(i * span / n);
    x1 = g_vx + 12 + floor((i + 1) * span / n) - 12;
    scr_hud_panel(i, x0, ty, x1 - x0, th);
}
