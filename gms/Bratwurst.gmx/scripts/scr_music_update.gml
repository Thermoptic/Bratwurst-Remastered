/// scr_music_update()
// Titelmusiken (originalets inbaddade ProTracker-modul, snd_title_music) spelas i loop pa titelskarm, menyer, skeppsval, redigerare och resultat,
// och stoppas under matchen (g_state 1 och 2). Kan stangas av i Options -> MUSIC.
var want, gi;
if (g_state == 10 || g_state == 11 || g_state == 0)
{
    // axelknapparna (LB / RB) eller PageUp / PageDown byter lat
    if (keyboard_check_pressed(vk_pageup)) { scr_music_switch(-1); }
    if (keyboard_check_pressed(vk_pagedown)) { scr_music_switch(1); }
    for (gi = 0; gi < 4; gi += 1)
    {
        if (gamepad_is_connected(gi))
        {
            if (gamepad_button_check_pressed(gi, gp_shoulderl)) { scr_music_switch(-1); }
            if (gamepad_button_check_pressed(gi, gp_shoulderr)) { scr_music_switch(1); }
        }
    }
}
want = (g_sv[g_SV_MUSIC] && g_state != 1 && g_state != 2);
if (want)
{
    if (!audio_is_playing(g_music_id)) { g_music_id = audio_play_sound(g_trk_snd[g_trk_idx], 1, true); }
}
else
{
    if (audio_is_playing(g_music_id)) { audio_stop_sound(g_music_id); }
}
