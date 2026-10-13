/// scr_sel_pod_count(ship)
// Antal valbara specialpods = pods med flagga != 0 (VERIFIERAD, kod 0x12578/0x12594; 1-4 per skepp).
var p, n;
n = 0;
for (p = 0; p < g_ship_nk[argument0]; p += 1)
{
    if (g_ship_pod_flag[argument0, p] != 0) { n += 1; }
}
return n;
