/// scr_mn_adjust(node, dir)
// Andrar radens varde (av/pa, tal eller listval) och tillampar + sparar. Returnerar true om raden gar att andra.
var n, t, s, cnt;
n = argument0;
t = g_mn_type[n];
s = g_mn_set[n];
if (t == 2)
{
    g_sv[s] = 1 - g_sv[s];
}
else if (t == 3)
{
    g_sv[s] = clamp(g_sv[s] + argument1, g_mn_min[n], g_mn_max[n]);
}
else if (t == 4)
{
    cnt = g_mn_max[n] - g_mn_min[n] + 1;
    g_sv[s] = g_mn_min[n] + ((g_sv[s] - g_mn_min[n] + argument1 + cnt) mod cnt);
}
else { return false; }
scr_set_changed(s);
return true;
