/// scr_players_set(n)
// Satter antal spelare (1-4) och sparar. (F5 och Back-knappen cyklar inte langre antalet spelare, D-032.)
g_n_players = clamp(argument0, 1, 4);
g_sv[g_SV_PLAYERS] = g_n_players;
scr_set_save();
