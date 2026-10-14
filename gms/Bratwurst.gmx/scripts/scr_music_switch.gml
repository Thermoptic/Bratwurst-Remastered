/// scr_music_switch(direction)
// Byter lat i spellistan (g_trk_*): +1 nasta, -1 foregaende, med omslag; med SHUFFLE (musikspelarpanelen) ger +1 en slumpad annan lat. Lat 0 (titellaten,
// 3LE - Das Bratwurst) hoppas over: den spelas bara pa titelskarmen (scr_music_update). Den pagaende lagen stoppas; scr_music_update startar den nya.
// Med mindre an tva latar i listan gors ingenting.
var k;
if (g_trk_n <= 2) { exit; }
if (g_mp_shuf && argument0 > 0 && g_trk_idx > 0)
{
    k = 1 + irandom(g_trk_n - 3);
    if (k >= g_trk_idx) { k += 1; }
    g_trk_idx = k;
}
else
{
    g_trk_idx = (g_trk_idx + argument0 + g_trk_n) mod g_trk_n;
    if (g_trk_idx == 0) { g_trk_idx = (g_trk_idx + argument0 + g_trk_n) mod g_trk_n; }
}
if (g_music_id >= 0) { audio_stop_sound(g_music_id); }
g_music_id = -1;
g_mp_pause = false;
