/// scr_level_allowed(mode, map_index)
// Sant om banan far valjas i spellaget (0 = Classic, 1 = Astro Duel, 2 = Race, 3 = Capture the Bratwurst). Bit n i g_lv_modes[bana].
var k, has;
if (argument0 == 2)
{
    // Race (D-053, steg 1): finns ingen bana markerad for Race (bit 2) far alla banor anvandas tills redigeraren kan markera dem (steg 7)
    has = false;
    for (k = 0; k < g_lv_count; k += 1) { if ((g_lv_modes[k] & 4) != 0) { has = true; break; } }
    if (!has) { return true; }
}
return (g_lv_modes[argument1] & (1 << argument0)) != 0;
