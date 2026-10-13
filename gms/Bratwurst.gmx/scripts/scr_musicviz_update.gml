/// scr_musicviz_update()
// Uppdaterar equalizerna efter musikens spelposition: g_mv[0..11] (titelskarmen) och g_mw[0..31] (menyns breda spektrum), bada 0..1, samt
// topparna g_mw_pk (faller langsamt) och en kort historik g_mw_hist (6 rader x 32 band, nyast forst, ny rad var 2:a tick). Banden kommer fran data
// som analyserats i forvag (scr_data_musicviz, tools/gen_music_viz.py): GameMaker 1.4 kan inte lasa spektrum ur ljud i realtid.
// Snabb attack, langsammare fall. g_mv_on = musiken spelas just nu; annars faller staplarna till en lugn grundrorelse.
var i, f, s, v, pos, r, idle;
g_mv_on = false;
if (g_music_id >= 0)
{
    if (audio_is_playing(g_music_id))
    {
        pos = audio_sound_get_track_position(g_music_id);
        f = floor(pos * 50) mod g_mv_n;
        s = g_mv_frame[f];
        for (i = 0; i < 12; i += 1)
        {
            v = (string_pos(string_char_at(s, i + 1), "0123456789abcdefghijklmnopqrstuvwxyz") - 1) / 35;
            g_mv[i] = max(v, g_mv[i] * 0.8);
        }
        s = g_mw_frame[f];
        for (i = 0; i < 32; i += 1)
        {
            v = (string_pos(string_char_at(s, i + 1), "0123456789abcdefghijklmnopqrstuvwxyz") - 1) / 35;
            g_mw[i] = max(v, g_mw[i] * 0.84);
        }
        g_mv_on = true;
    }
}
if (!g_mv_on)
{
    for (i = 0; i < 12; i += 1) { g_mv[i] *= 0.9; }
    for (i = 0; i < 32; i += 1)
    {
        idle = 0.07 + 0.05 * sin(g_bg_t * 0.05 + i * 0.45);
        g_mw[i] = max(g_mw[i] * 0.9, idle);
    }
}
for (i = 0; i < 32; i += 1) { g_mw_pk[i] = max(g_mw[i], g_mw_pk[i] - 0.012); }
if ((g_bg_t mod 2) == 0)
{
    for (r = 5; r >= 1; r -= 1)
    {
        for (i = 0; i < 32; i += 1) { g_mw_hist[r * 32 + i] = g_mw_hist[(r - 1) * 32 + i]; }
    }
    for (i = 0; i < 32; i += 1) { g_mw_hist[i] = g_mw[i]; }
}
