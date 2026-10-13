/// scr_level_allowed(mode, map_index)
// Sant om banan far valjas i spellaget (0 = Classic, 1 = Astro Duel, 2 = Race, 3 = Capture the Bratwurst). Bit n i g_lv_modes[bana].
return (g_lv_modes[argument1] & (1 << argument0)) != 0;
