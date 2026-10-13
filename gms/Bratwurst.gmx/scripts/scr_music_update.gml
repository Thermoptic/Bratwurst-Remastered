/// scr_music_update()
// Titelmusiken (originalets inbaddade ProTracker-modul, snd_title_music) spelas i loop pa titelskarm, menyer, skeppsval, redigerare och resultat,
// och stoppas under matchen (g_state 1 och 2). Kan stangas av i Options -> MUSIC.
var want;
want = (g_sv[g_SV_MUSIC] && g_state != 1 && g_state != 2);
if (want)
{
    if (!audio_is_playing(g_music_id)) { g_music_id = audio_play_sound(snd_title_music, 1, true); }
}
else
{
    if (audio_is_playing(g_music_id)) { audio_stop_sound(g_music_id); }
}
