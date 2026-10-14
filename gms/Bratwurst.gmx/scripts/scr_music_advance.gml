/// scr_music_advance()
// Kors nar en lat har spelat klart (inte titellaten, som loopar): med REPEAT spelas samma lat om, med SHUFFLE valjs en slumpad annan (aldrig titellaten),
// annars nasta lat i listan (titellaten hoppas over, sista -> forsta). scr_music_update startar sedan den valda laten.
var k;
g_music_id = -1;
g_mp_pause = false;
if (g_mp_rep || g_trk_n <= 2) { exit; }
if (g_mp_shuf)
{
    k = 1 + irandom(g_trk_n - 3);
    if (k >= g_trk_idx) { k += 1; }
    g_trk_idx = k;
}
else
{
    g_trk_idx += 1;
    if (g_trk_idx >= g_trk_n) { g_trk_idx = 1; }
}
