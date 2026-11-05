/// scr_powerup_enabled()
// Sant om powerups ar pa for aktuellt spellage (Options: Game modes -> POWERUPS ON/OFF, standard ON).
if (g_game_mode == 1) { return g_sv[g_SV_PUAD] == 1; }
if (g_game_mode == 4) { return g_sv[g_SV_PUAS] == 1; }
if (g_game_mode == 2) { return g_sv[g_SV_PURA] == 1; }   // Race: av som standard (D-053)
if (g_game_mode == 3) { return g_sv[g_SV_PUCT] == 1; }   // Capture the Bratwurst (D-080)
if (g_game_mode == 5) { return g_sv[g_SV_SWPU] == 1; }   // Super Smashwurst: av som standard (D-085)
return g_sv[g_SV_PUCL] == 1;
