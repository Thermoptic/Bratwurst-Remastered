/// scr_ship_fill_init()
// Forberedelse for Solid colors: for varje skepp foljs linjerna runt skrovet (varje punkt har tva grannar) till en sluten slinga, som triangulerar en gang i
// skeppets egna koordinater (scr_poly_tris). g_sf_n[s] = antal trianglar (0 om skrovet inte ar en enda sluten slinga, t.ex. Kaese), g_sf_t[s, 3k + j] = punktindex
// i skeppets punktlista. Triangel-hornen ritas sedan med varje skepps aktuella roterade punkter (scr_ship_fill). Kors en gang vid start.
var s, np2, i, a, b, nxt, prev, cur, cnt, ok, adj0, adj1, deg, tn, k, j, order;
for (s = 0; s < g_ship_count; s += 1)
{
    np2 = g_ship_np[s];
    g_sf_n[s] = 0;
    for (i = 0; i < np2; i += 1) { adj0[i] = -1; adj1[i] = -1; deg[i] = 0; }
    ok = true;
    for (i = 0; i < g_ship_nl[s]; i += 1)
    {
        a = g_ship_lines[s, 2 * i];
        b = g_ship_lines[s, 2 * i + 1];
        if (deg[a] == 0) { adj0[a] = b; } else if (deg[a] == 1) { adj1[a] = b; } else { ok = false; }
        deg[a] += 1;
        if (deg[b] == 0) { adj0[b] = a; } else if (deg[b] == 1) { adj1[b] = a; } else { ok = false; }
        deg[b] += 1;
    }
    for (i = 0; i < np2; i += 1) { if (deg[i] != 2) { ok = false; } }
    if (ok && np2 >= 3)
    {
        // folj slingan fran punkt 0
        cur = 0;
        prev = -1;
        cnt = 0;
        while (cnt < np2)
        {
            order[cnt] = cur;
            cnt += 1;
            if (adj0[cur] != prev) { nxt = adj0[cur]; } else { nxt = adj1[cur]; }
            prev = cur;
            cur = nxt;
            if (cur == 0) { break; }
        }
        if (cnt == np2)
        {
            g_tp_n = np2;
            for (i = 0; i < np2; i += 1)
            {
                g_tp_x[i] = g_ship_pts[s, 2 * order[i]];
                g_tp_y[i] = g_ship_pts[s, 2 * order[i] + 1];
            }
            tn = scr_poly_tris();
            g_sf_n[s] = tn;
            for (k = 0; k < tn; k += 1)
            {
                for (j = 0; j < 3; j += 1) { g_sf_t[s, k * 3 + j] = order[g_tp_tri[k * 3 + j]]; }
            }
        }
    }
}
