/// scr_player_hits_wall()
// Kors i obj_player. Returnerar true om nagon av skeppets linjer skar nagon vagg (varldsrymd).
var k, w, a, b, x1, y1, x2, y2, dxw, dyw, wl, da, db;
for (w = 0; w < g_wall_n; w += 1)
{
    // snabb avvisning med avgransningsboxar
    if (g_wall_maxx[w] < ob_minx || g_wall_minx[w] > ob_maxx) { continue; }
    if (g_wall_maxy[w] < ob_miny || g_wall_miny[w] > ob_maxy) { continue; }
    for (k = 0; k < nl; k += 1)
    {
        a = g_ship_lines[ship, 2 * k];
        b = g_ship_lines[ship, 2 * k + 1];
        if (scr_seg_intersect(ow_x[a], ow_y[a], ow_x[b], ow_y[b],
                              g_wall_px[g_wall_a[w]], g_wall_py[g_wall_a[w]],
                              g_wall_px[g_wall_b[w]], g_wall_py[g_wall_b[w]]))
        {
            // spara vilken vagg som traffades och kontaktpunkten (skeppslinjens andpunkt narmast vaggens linje) for scr_wall_slide (D-063)
            g_hw_w = w;
            dxw = g_wall_px[g_wall_b[w]] - g_wall_px[g_wall_a[w]];
            dyw = g_wall_py[g_wall_b[w]] - g_wall_py[g_wall_a[w]];
            wl = max(1, sqrt(dxw * dxw + dyw * dyw));
            da = abs((ow_x[a] - g_wall_px[g_wall_a[w]]) * dyw - (ow_y[a] - g_wall_py[g_wall_a[w]]) * dxw) / wl;
            db = abs((ow_x[b] - g_wall_px[g_wall_a[w]]) * dyw - (ow_y[b] - g_wall_py[g_wall_a[w]]) * dxw) / wl;
            if (da <= db) { g_hw_cx = ow_x[a]; g_hw_cy = ow_y[a]; } else { g_hw_cx = ow_x[b]; g_hw_cy = ow_y[b]; }
            return true;
        }
    }
}
return false;
