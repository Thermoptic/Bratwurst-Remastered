/// scr_mp_toggle()
// Spelar upp / pausar musiken (musikspelarpanelen, Y pa gamepaden, M pa tangentbordet). Gor ingenting om musiken ar av eller inte har startat.
if (g_music_id < 0 || !g_sv[g_SV_MUSIC]) { exit; }
g_mp_pause = !g_mp_pause;
if (g_mp_pause) { audio_pause_sound(g_music_id); }
else { audio_resume_sound(g_music_id); }
