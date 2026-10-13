/// scr_music_switch(direction)
// Byter lat i spellistan (g_trk_*): +1 nasta, -1 foregaende, med omslag. Den pagaende lagen stoppas; scr_music_update startar den nya. Med bara en lat
// i listan gors ingenting. Nya latar laggs till i scr_config_init (g_trk_n, g_trk_name, g_trk_snd, g_trk_viz).
if (g_trk_n <= 1) { exit; }
g_trk_idx = (g_trk_idx + argument0 + g_trk_n) mod g_trk_n;
if (g_music_id >= 0) { audio_stop_sound(g_music_id); }
g_music_id = -1;
