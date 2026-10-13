/// scr_cur_map()
// Banindex som galler for det spellage som startas (Astro Duel har eget banval).
if (g_game_mode == 1) { return g_sv[g_SV_MAP2]; }
return g_sv[g_SV_MAP];
