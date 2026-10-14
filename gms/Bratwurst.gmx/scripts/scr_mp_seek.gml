/// scr_mp_seek(fraction)
// Soker i den spelande lasen till andelen 0..1 av dess langd (klick pa tidslinjen i musikspelarpanelen).
if (g_music_id < 0 || !g_sv[g_SV_MUSIC]) { exit; }
audio_sound_set_track_position(g_music_id, clamp(argument0, 0, 0.999) * audio_sound_length(g_trk_snd[g_trk_idx]));
