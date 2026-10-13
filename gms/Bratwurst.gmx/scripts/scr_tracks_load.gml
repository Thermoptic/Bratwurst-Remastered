/// scr_tracks_load()
// Laddar equalizerdata for spellistans latar till g_tv[lat, ruta] (en string per ruta: 12 tecken titelband + 32 tecken breda band) och g_tv_n[lat].
// Lat 0 (titellaten) byggs av scr_data_musicviz (50 rutor/s); ovriga latar laser viz_N.txt ur Included Files (working_directory, 25 rutor/s,
// gjord av tools/gen_tracks.py). Saknas filen far latan g_trk_viz = false och spektrumet visar bara en lugn grundrorelse.
var t, k, fh, lrow;
g_tv[0, 0] = "";
for (k = 0; k < g_mv_n; k += 1) { g_tv[0, k] = g_mv_frame[k] + g_mw_frame[k]; }
g_tv_n[0] = g_mv_n;
g_trk_fps[0] = 50;
g_trk_viz[0] = true;
for (t = 1; t < g_trk_n; t += 1)
{
    g_tv_n[t] = 0;
    g_trk_viz[t] = false;
    if (file_exists(working_directory + "viz_" + string(t) + ".txt"))
    {
        fh = file_text_open_read(working_directory + "viz_" + string(t) + ".txt");
        k = 0;
        while (!file_text_eof(fh))
        {
            lrow = file_text_read_string(fh);
            file_text_readln(fh);
            if (string_length(lrow) >= 44) { g_tv[t, k] = lrow; k += 1; }
        }
        file_text_close(fh);
        g_tv_n[t] = k;
        g_trk_viz[t] = (k > 0);
    }
}
