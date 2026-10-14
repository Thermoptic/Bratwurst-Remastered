/// scr_camera_update()
// Zoom och kamera enligt originalets rutin vid hunk0 0x2ac4 (VERIFIERAD i kod, docs/15):
//   zoomX = 150*65536/(dx+400), zoomY = 108*65536/(dy+400), Z = min(zoomX, zoomY)  (16-bitsresultat)
//   centrum = mitten av omskrivande rektangel;  skarm = (varld*Z >> 15) - (centrum*Z >> 15) + (160,118)
// Prototypen anvander bara LEVANDE spelare (originalet: alla fyra platserna; hantering av doda ar OKAND).
var dx, dy, zx, zy, cx, cy, tz;
// Flera spelare: nar bara en ar kvar ar matchen over (rundslut), da laser sig bilden i stallet for att zooma in pa den sista spelaren.
if (g_n_players > 1 && scr_count_alive() <= 1) { exit; }
g_tmp_n = 0;
with (obj_player)
{
    if (alive)
    {
        var wx, wy;
        wx = floor(px / 256);
        wy = floor(py / 256);
        if (g_tmp_n == 0)
        {
            g_tmp_minx = wx; g_tmp_maxx = wx;
            g_tmp_miny = wy; g_tmp_maxy = wy;
        }
        else
        {
            g_tmp_minx = min(g_tmp_minx, wx); g_tmp_maxx = max(g_tmp_maxx, wx);
            g_tmp_miny = min(g_tmp_miny, wy); g_tmp_maxy = max(g_tmp_maxy, wy);
        }
        g_tmp_n += 1;
    }
}
if (g_tmp_n == 0) { exit; }
dx = g_tmp_maxx - g_tmp_minx;
dy = g_tmp_maxy - g_tmp_miny;
zx = min(65535, floor((g_PLAY_W / 2 - 10) * 65536 / (dx + g_ZOOM_MARGIN)));   // 150*65536 vid originalets 320 enheters bredd
zy = min(65535, floor(7077888 / (dy + g_ZOOM_MARGIN)));   // 108*65536
tz = min(zx, zy);
cx = floor((g_tmp_maxx + g_tmp_minx) / 2);
cy = floor((g_tmp_maxy + g_tmp_miny) / 2);
// Mjuk zoom nar antalet spelare i bilden andras (nagon dor eller aterskapas): zoom och centrum glider exponentiellt mot det nya malet under g_CAM_TRANS ticks
// i stallet for att hoppa direkt. Annars foljer kameran spelarna omedelbart som forut (ingen eftersleppning vid vanlig rorelse).
if (g_cam_n_prev >= 0 && g_tmp_n != g_cam_n_prev) { g_cam_tr = g_CAM_TRANS; }
g_cam_n_prev = g_tmp_n;
if (g_cam_tr > 0)
{
    g_cam_tr -= 1;
    g_cam_sz += (tz - g_cam_sz) * g_CAM_K;
    g_cam_scx += (cx - g_cam_scx) * g_CAM_K;
    g_cam_scy += (cy - g_cam_scy) * g_CAM_K;
}
else
{
    g_cam_sz = tz;
    g_cam_scx = cx;
    g_cam_scy = cy;
}
g_zoom = round(g_cam_sz);
g_cam_x = floor(g_cam_scx * g_zoom / 32768);
g_cam_y = floor(g_cam_scy * g_zoom / 32768);
