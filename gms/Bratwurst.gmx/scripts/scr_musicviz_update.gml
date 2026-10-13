/// scr_musicviz_update()
// Uppdaterar equalizern (g_mv[0..11], 0..1) efter musikens spelposition. Banden kommer fran data som analyserats i forvag (scr_data_musicviz,
// tools/gen_music_viz.py): GameMaker 1.4 kan inte lasa spektrum ur ljud i realtid. Snabb attack, langsammare fall. g_mv_on = musiken spelas just nu.
var i, f, s, v, pos;
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
        g_mv_on = true;
    }
}
if (!g_mv_on)
{
    for (i = 0; i < 12; i += 1) { g_mv[i] *= 0.9; }
}
