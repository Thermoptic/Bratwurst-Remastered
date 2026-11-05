/// scr_levels_fix_selection()
// Ser till att vald bana i Classic (g_SV_MAP) och Astro Duel (g_SV_MAP2) finns och far anvandas i sitt spellage; annars forsta tillatna banan.
var m, k, s, sv;
for (m = 0; m < 4; m += 1)
{
    if (m == 0) { s = g_SV_MAP; } else if (m == 1) { s = g_SV_MAP2; } else if (m == 2) { s = g_SV_MAP3; } else { s = g_SV_MAP4; }   // m = 3: Capture the Bratwurst (D-080)
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
// Super Smashwurst (D-085) delar Classics banlista (bit 0) men har eget val
g_sv[g_SV_MAP5] = clamp(g_sv[g_SV_MAP5], 0, max(0, g_lv_count - 1));
if (g_lv_count > 0)
{
    if (!scr_level_allowed(0, g_sv[g_SV_MAP5]))
    {
        for (k = 0; k < g_lv_count; k += 1)
        {
            if (scr_level_allowed(0, k)) { g_sv[g_SV_MAP5] = k; break; }
        }
    }
}
