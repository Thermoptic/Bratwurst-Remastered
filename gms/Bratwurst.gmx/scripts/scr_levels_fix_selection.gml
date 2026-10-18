/// scr_levels_fix_selection()
// Ser till att vald bana i Classic (g_SV_MAP) och Astro Duel (g_SV_MAP2) finns och far anvandas i sitt spellage; annars forsta tillatna banan.
var m, k, s, sv;
for (m = 0; m < 3; m += 1)
{
    if (m == 0) { s = g_SV_MAP; } else if (m == 1) { s = g_SV_MAP2; } else { s = g_SV_MAP3; }
    g_sv[s] = clamp(g_sv[s], 0, max(0, g_lv_count - 1));
    if (g_lv_count > 0)
    {
        if (!scr_level_allowed(m, g_sv[s]))
        {
            for (k = 0; k < g_lv_count; k += 1)
            {
                if (scr_level_allowed(m, k)) { g_sv[s] = k; break; }
            }
        }
    }
}
