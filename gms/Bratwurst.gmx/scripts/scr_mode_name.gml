/// scr_mode_name()
// Namnet pa aktuellt spellage (g_game_mode: 0 = Classic, 1 = Astro Duel, 4 = Asteroids).
if (g_game_mode == 1) { return "ASTRO DUEL"; }
if (g_game_mode == 4) { return "ASTEROIDS"; }
return "CLASSIC";
