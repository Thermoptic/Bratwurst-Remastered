/// scr_mode_name()
// Namnet pa aktuellt spellage (g_game_mode: 0 = Classic, 1 = Astro Duel, 4 = Asteroids).
if (g_game_mode == 1) { return "GALAXY DUEL"; }
if (g_game_mode == 4) { return "ASTEROIDS"; }
if (g_game_mode == 2) { return "RACE"; }
if (g_game_mode == 3) { return "CAPTURE THE BRATWURST"; }   // (D-080)
return "CLASSIC";
