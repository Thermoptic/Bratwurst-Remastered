/// scr_dots_prepare()
// Forbereder orienteringspunkterna (D-043): ett gitter av fasta punkter i varldskoordinater med g_DOT_STEP (100) pixlars mellanrum over hela arenan. Kors vid
// matchstart efter scr_arena_prepare. Gitterpunktens heltalsindex (i, j) motsvarar varldspunkten (i * g_DOT_STEP, j * g_DOT_STEP). En punkt far plats bara
// om den ligger innanfor banans ram och utanfor alla foremal (udda antal skarningar med en stral at hoger mot alla vaggsegment). Resultat: g_dot_i0/g_dot_j0 =
// lagsta index, g_dot_ni/g_dot_nj = antal, g_dot_ok[(i - i0) * nj + (j - j0)] = 1 om punkten ritas.
var k, a, b, x0, y0, x1, y1, i, j, wx, wy, cnt, sx1, sy1, sx2, sy2;
g_dot_ni = 0;
g_dot_nj = 0;
if (g_wall_n <= 0) { exit; }
x0 = g_wall_px[0]; x1 = x0; y0 = g_wall_py[0]; y1 = y0;
for (k = 1; k < g_wall_n; k += 1)
{
    x0 = min(x0, g_wall_px[k]); x1 = max(x1, g_wall_px[k]);
    y0 = min(y0, g_wall_py[k]); y1 = max(y1, g_wall_py[k]);
}
g_dot_i0 = ceil(x0 / g_DOT_STEP);
g_dot_j0 = ceil(y0 / g_DOT_STEP);
g_dot_ni = floor(x1 / g_DOT_STEP) - g_dot_i0 + 1;
g_dot_nj = floor(y1 / g_DOT_STEP) - g_dot_j0 + 1;
for (i = 0; i < g_dot_ni; i += 1)
{
    for (j = 0; j < g_dot_nj; j += 1)
    {
        wx = (g_dot_i0 + i) * g_DOT_STEP;
        wy = (g_dot_j0 + j) * g_DOT_STEP;
        cnt = 0;
        for (k = 0; k < g_wall_n; k += 1)
        {
            a = g_wall_a[k];
            b = g_wall_b[k];
            sx1 = g_wall_px[a]; sy1 = g_wall_py[a];
            sx2 = g_wall_px[b]; sy2 = g_wall_py[b];
            if ((sy1 > wy) != (sy2 > wy))
            {
                if (wx < sx1 + (wy - sy1) * (sx2 - sx1) / (sy2 - sy1)) { cnt += 1; }
            }
        }
        g_dot_ok[i * g_dot_nj + j] = ((cnt mod 2) == 1);
    }
}
