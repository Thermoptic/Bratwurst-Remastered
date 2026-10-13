/// scr_sfx_play(sound, channel, gain)
// Spelar en ljudeffekt pa en av originalets tre effektkanaler (0 = kanonskott, 1 = missiler/explosion, 2 = krasch/traff). Som pa Amiga avbryter en ny
// effekt den som redan spelas pa samma kanal. gain 0..1 (originalets volym/64). Kan stangas av i Options -> SOUND EFFECTS.
if (!g_sv[g_SV_SFX]) { exit; }
if (g_sfx_ch[argument1] >= 0)
{
    if (audio_is_playing(g_sfx_ch[argument1])) { audio_stop_sound(g_sfx_ch[argument1]); }
}
g_sfx_ch[argument1] = audio_play_sound(argument0, 10, false);
audio_sound_gain(g_sfx_ch[argument1], argument2, 0);
