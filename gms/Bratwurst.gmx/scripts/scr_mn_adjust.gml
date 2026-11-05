/// scr_mn_adjust(node, dir)
// Andrar radens varde (av/pa, tal eller listval) och tillampar + sparar. Returnerar true om raden gar att andra.
var n, t, s, cnt, i;
n = argument0;
t = g_mn_type[n];
s = g_mn_set[n];
if (t == 2)
{
    g_sv[s] = 1 - g_sv[s];
}
else if (t == 3)
{
    g_sv[s] = clamp(g_sv[s] + argument1 * g_mn_step[n], g_mn_min[n], g_mn_max[n]);
}
else if (t == 4 && (s == g_SV_MAP || s == g_SV_MAP2 || s == g_SV_MAP3 || s == g_SV_MAP4 || s == g_SV_MAP5))
{
    // banval: hoppa over banor som inte finns i det har spellaget
    cnt = g_lv_count;
    for (i = 0; i < cnt; i += 1)
    {
        g_sv[s] = (g_sv[s] + argument1 + cnt) mod cnt;
        if (scr_level_allowed(g_mn_mode[n], g_sv[s])) { break; }
    }
}
else if (t == 4)
{
    cnt = g_mn_max[n] - g_mn_min[n] + 1;
    g_sv[s] = g_mn_min[n] + ((g_sv[s] - g_mn_min[n] + argument1 + cnt) mod cnt);
}
else { return false; }
scr_set_changed(s);
return true;
