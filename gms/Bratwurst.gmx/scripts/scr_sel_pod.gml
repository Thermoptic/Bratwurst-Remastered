/// scr_sel_pod(ship, i)
// Returnerar podindex (0..K-1) for den i:te valbara specialpodden, eller -1.
var p, n;
n = 0;
for (p = 0; p < g_ship_nk[argument0]; p += 1)
{
    if (g_ship_pod_flag[argument0, p] != 0)
    {
        if (n == argument1) { return p; }
        n += 1;
    }
}
return -1;
