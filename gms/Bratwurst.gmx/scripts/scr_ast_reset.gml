/// scr_ast_reset()
// Asteroids: ny match eller ny runda. Banan borjar helt tom; forsta vagen kommer efter 1 sekund (g_AS_FIRST = 50 ticks). Rutan som stenarna far fly i (kantvarvet)
// tas ur banans vaggar (omslutande ruta); en sten som lamnar den kommer in pa motsatt sida.
var k;
for (k = 0; k < g_AS_MAX; k += 1) { g_as_on[k] = false; }
g_as_wave = 0;
g_as_timer = max(10, round(g_AS_FIRST / scr_ast_mult()));   // forsta vagen: 1 s pa niva 1, snabbare pa hogre niva
g_as_trk = 0;
if (g_wall_n > 0)
{
    g_as_x0 = g_wall_px[0]; g_as_x1 = g_as_x0; g_as_y0 = g_wall_py[0]; g_as_y1 = g_as_y0;
    for (k = 1; k < g_wall_n; k += 1)
    {
        g_as_x0 = min(g_as_x0, g_wall_px[k]); g_as_x1 = max(g_as_x1, g_wall_px[k]);
        g_as_y0 = min(g_as_y0, g_wall_py[k]); g_as_y1 = max(g_as_y1, g_wall_py[k]);
    }
}
else { g_as_x0 = -2900; g_as_x1 = 2850; g_as_y0 = -2150; g_as_y1 = 2150; }
