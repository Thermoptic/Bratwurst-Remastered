/// scr_poly_tris()
// Triangulerar en enkel (aven konkav) polygon med ear clipping. Indata i globalerna g_tp_x[0..g_tp_n-1], g_tp_y[0..g_tp_n-1] (punkterna i ordning runt polygonen,
// valfritt medurs eller moturs). Resultat: g_tp_tri[3*k .. 3*k+2] = tre punktindex per triangel; returnerar antal trianglar. Faller en degenererad polygon
// inte ut som en riktig ear tas resten som en solfjader (aldrig oandlig slinga). Anvands for Solid colors (vaggar och skepp).
var n, m, v, i, guard, a, b, c, ax, ay, bx, by, cx, cy, sgn, area, cr, k, j, ok, px2, py2, d1, d2, d3, tcount, found;
n = g_tp_n;
tcount = 0;
if (n < 3) { return 0; }
area = 0;
for (i = 0; i < n; i += 1)
{
    j = (i + 1) mod n;
    area += g_tp_x[i] * g_tp_y[j] - g_tp_x[j] * g_tp_y[i];
}
if (area >= 0) { sgn = 1; } else { sgn = -1; }
for (i = 0; i < n; i += 1) { v[i] = i; }
m = n;
guard = 0;
while (m > 3 && guard < 2000)
{
    guard += 1;
    found = false;
    for (i = 0; i < m; i += 1)
    {
        a = v[(i + m - 1) mod m];
        b = v[i];
        c = v[(i + 1) mod m];
        ax = g_tp_x[a]; ay = g_tp_y[a];
        bx = g_tp_x[b]; by = g_tp_y[b];
        cx = g_tp_x[c]; cy = g_tp_y[c];
        cr = (bx - ax) * (cy - ay) - (by - ay) * (cx - ax);
        if (cr * sgn > 0)
        {
            ok = true;
            for (k = 0; k < m; k += 1)
            {
                j = v[k];
                if (j != a && j != b && j != c)
                {
                    px2 = g_tp_x[j]; py2 = g_tp_y[j];
                    d1 = (bx - ax) * (py2 - ay) - (by - ay) * (px2 - ax);
                    d2 = (cx - bx) * (py2 - by) - (cy - by) * (px2 - bx);
                    d3 = (ax - cx) * (py2 - cy) - (ay - cy) * (px2 - cx);
                    if ((d1 >= 0 && d2 >= 0 && d3 >= 0) || (d1 <= 0 && d2 <= 0 && d3 <= 0)) { ok = false; break; }
                }
            }
            if (ok)
            {
                g_tp_tri[tcount * 3] = a;
                g_tp_tri[tcount * 3 + 1] = b;
                g_tp_tri[tcount * 3 + 2] = c;
                tcount += 1;
                for (k = i; k < m - 1; k += 1) { v[k] = v[k + 1]; }
                m -= 1;
                found = true;
                break;
            }
        }
    }
    if (!found)
    {
        // degenererad polygon: ta resten som en solfjader
        for (i = 1; i < m - 1; i += 1)
        {
            g_tp_tri[tcount * 3] = v[0];
            g_tp_tri[tcount * 3 + 1] = v[i];
            g_tp_tri[tcount * 3 + 2] = v[i + 1];
            tcount += 1;
        }
        m = 2;
    }
}
if (m == 3)
{
    g_tp_tri[tcount * 3] = v[0];
    g_tp_tri[tcount * 3 + 1] = v[1];
    g_tp_tri[tcount * 3 + 2] = v[2];
    tcount += 1;
}
return tcount;
