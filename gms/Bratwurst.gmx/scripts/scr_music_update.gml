/// scr_music_update()
// Spellistans lat g_trk_idx spelas i loop overallt (titel, menyer, skeppsval, redigerare, match; titellaten bara pa titelskarmen) med volymen g_SV_VOL (10-100 %). Under matchen byter
// scr_music_round_start lat varje ny runda. LB/RB eller PageUp/PageDown byter lat i menyerna. Kan stangas av i Options -> MUSIC.
var want, gi;
// titellaten (lat 0) spelas bara pa titelskarmen; i alla andra lagen spelas en annan lat ur spellistan
if (g_trk_n > 1)
{
    if (g_state == 10)
    {
        if (g_trk_idx != 0)
        {
            g_trk_idx = 0;
            if (g_music_id >= 0) { audio_stop_sound(g_music_id); }
            g_music_id = -1;
        }
    }
    else if (g_trk_idx == 0)
    {
        g_trk_idx = 1 + irandom(g_trk_n - 2);
        if (g_music_id >= 0) { audio_stop_sound(g_music_id); }
        g_music_id = -1;
    }
}
if (g_state == 11 || g_state == 0)
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
want = g_sv[g_SV_MUSIC];   // musiken spelas ocksa under matcher (en ny lat per runda, scr_music_round_start)
if (want)
{
    if (!audio_is_playing(g_music_id)) { g_music_id = audio_play_sound(g_trk_snd[g_trk_idx], 1, true); }
    if (g_music_id >= 0) { audio_sound_gain(g_music_id, g_sv[g_SV_VOL] / 10, 0); }
}
else
{
    if (audio_is_playing(g_music_id)) { audio_stop_sound(g_music_id); }
}
