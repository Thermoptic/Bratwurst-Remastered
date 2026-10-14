/// scr_powerup_enabled()
// Sant om powerups ar pa for aktuellt spellage (Options: Game modes -> POWERUPS ON/OFF, standard ON).
if (g_game_mode == 1) { return g_sv[g_SV_PUAD] == 1; }
if (g_game_mode == 4) { return g_sv[g_SV_PUAS] == 1; }
return g_sv[g_SV_PUCL] == 1;
