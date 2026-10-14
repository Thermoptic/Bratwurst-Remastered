/// scr_drift_sound()
// Kors i obj_player en gang per tick (aven nar spelaren ar utslagen). Driftljudet (snd_sfx_drift, egenproducerad loopbar rymdskeppsmotor, tools/gen_drift_sound.py)
// loopar sa lange spelaren driftar och tonas in (150 ms) och ut (200 ms) nar knappen slapps; varje spelare har egen kanal (dr_snd). Foljer Options -> SOUND EFFECTS.
if (g_sv[g_SV_SFX] && alive && drifting)
{
    dr_off = 0;
    if (dr_snd < 0 || !audio_is_playing(dr_snd))
    {
        dr_snd = audio_play_sound(snd_sfx_drift, 8, true);
        audio_sound_gain(dr_snd, 0, 0);
        audio_sound_gain(dr_snd, g_DRIFT_SND_GAIN, 150);
    }
}
else if (dr_snd >= 0)
{
    if (dr_off == 0) { audio_sound_gain(dr_snd, 0, 200); dr_off = 1; }
    dr_off += 1;
    if (dr_off > 14 || !audio_is_playing(dr_snd))
    {
        audio_stop_sound(dr_snd);
        dr_snd = -1;
        dr_off = 0;
    }
}
