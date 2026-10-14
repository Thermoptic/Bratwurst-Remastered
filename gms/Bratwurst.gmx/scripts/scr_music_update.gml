/// scr_music_update()
// Spellistans lat g_trk_idx spelas i loop overallt (titel, menyer, skeppsval, redigerare, match; titellaten bara pa titelskarmen) med volymen g_SV_VOL (10-100 %). Under matchen byter
// scr_music_round_start lat varje ny runda. LB/RB eller PageUp/PageDown byter lat i menyerna. Kan stangas av i Options -> MUSIC.
var want, gi;
// titellaten (lat 0) spelas pa titelskarmen och fortsatter i huvudmenyn nar man kommer dit fran titeln; lamnar man huvudmenyn (skeppsval, match, redigerare,
// resultat) byter den till en slumpad annan lat och kommer tillbaka forst nar man gar tillbaka till titelskarmen
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
    else if (g_trk_idx == 0 && g_state != 11)   // titellaten far fortsatta spela nar man gar fran titeln till huvudmenyn
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
    if (g_state == 11 && keyboard_check_pressed(ord("M"))) { scr_mp_toggle(); }   // M: spela / pausa
    for (gi = 0; gi < 4; gi += 1)
    {
        if (gamepad_is_connected(gi))
        {
            if (gamepad_button_check_pressed(gi, gp_shoulderl)) { scr_music_switch(-1); }
            if (gamepad_button_check_pressed(gi, gp_shoulderr)) { scr_music_switch(1); }
            if (g_state == 11 && gamepad_button_check_pressed(gi, gp_face4)) { scr_mp_toggle(); }   // Y: spela / pausa (musikspelarpanelen)
        }
    }
}
want = g_sv[g_SV_MUSIC];   // musiken spelas ocksa under matcher (en ny lat per runda, scr_music_round_start)
// latens slut (inte titellaten, som loopar): REPEAT spelar om den, SHUFFLE slumpar en annan, annars nasta i listan (scr_music_advance)
if (want && g_music_id >= 0 && g_trk_idx > 0 && !g_mp_pause && !audio_is_playing(g_music_id)) { scr_music_advance(); }
if (want)
{
    if (!audio_is_playing(g_music_id)) { g_music_id = audio_play_sound(g_trk_snd[g_trk_idx], 1, (g_trk_idx == 0)); }
    if (g_music_id >= 0)
    {
        if (g_mu_t < g_MU_FADE) { g_mu_t += 1; }   // intoning: 0 -> normal volym under g_MU_FADE ticks (3 s) fran att forsta lat startar
        audio_sound_gain(g_music_id, (g_sv[g_SV_VOL] / 10) * (1 - g_mp_mute) * min(1, g_mu_t / g_MU_FADE), 0);   // MUTE tystar utan att andra volyminstallningen
    }
}
else
{
    if (audio_is_playing(g_music_id)) { audio_stop_sound(g_music_id); }
    g_music_id = -1;
    g_mp_pause = false;
}
