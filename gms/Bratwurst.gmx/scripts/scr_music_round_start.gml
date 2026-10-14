/// scr_music_round_start()
// Kors nar en ny rund borjar (matchstart och varje ny runda): en slumpad lat ur spellistan (alltid en annan an den som spelade, om det finns fler an en)
// startar och spelas under matchen. scr_music_update startar ljudet; namnet visas i matchens rubrikrad.
var k;
if (g_trk_n > 1)
{
    k = irandom(g_trk_n - 2);
    if (k >= g_trk_idx) { k += 1; }
    g_trk_idx = k;
}
if (g_music_id >= 0) { audio_stop_sound(g_music_id); }
g_music_id = -1;
