/// scr_players_set(n)
// Satter antal spelare (1-4) och sparar. Anvands av F5 och Back-knappen (menyn anvander scr_mn_adjust).
g_n_players = clamp(argument0, 1, 4);
g_sv[g_SV_PLAYERS] = g_n_players;
scr_set_save();
