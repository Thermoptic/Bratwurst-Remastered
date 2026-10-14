/// scr_music_round_start()
// Kors nar en ny rund borjar (matchstart och varje ny runda): en slumpad lat ur spellistan startar och spelas under matchen, alltid en annan an den som
// spelade och aldrig lat 0 (titellaten spelas bara pa titelskarmen). scr_music_update startar ljudet; namnet visas i matchens rubrikrad.
var k;
if (g_trk_n > 2)
{
    if (g_trk_idx == 0) { k = 1 + irandom(g_trk_n - 2); }   // fran titellaten: valfri annan lat 1 .. g_trk_n - 1
    else
    {
        k = 1 + irandom(g_trk_n - 3);   // annars alla utom titellaten och den som spelade
        if (k >= g_trk_idx) { k += 1; }
    }
    g_trk_idx = k;
}
else if (g_trk_n == 2) { g_trk_idx = 1; }
if (g_music_id >= 0) { audio_stop_sound(g_music_id); }
g_music_id = -1;
g_mp_pause = false;
