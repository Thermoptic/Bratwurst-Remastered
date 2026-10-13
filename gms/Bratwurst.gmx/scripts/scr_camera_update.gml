/// scr_camera_update()
// Zoom och kamera enligt originalets rutin vid hunk0 0x2ac4 (VERIFIERAD i kod, docs/15):
//   zoomX = 150*65536/(dx+400), zoomY = 108*65536/(dy+400), Z = min(zoomX, zoomY)  (16-bitsresultat)
//   centrum = mitten av omskrivande rektangel;  skarm = (varld*Z >> 15) - (centrum*Z >> 15) + (160,118)
// Prototypen anvander bara LEVANDE spelare (originalet: alla fyra platserna; hantering av doda ar OKAND).
var dx, dy, zx, zy, cx, cy;
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
g_zoom = min(zx, zy);
cx = floor((g_tmp_maxx + g_tmp_minx) / 2);
cy = floor((g_tmp_maxy + g_tmp_miny) / 2);
g_cam_x = floor(cx * g_zoom / 32768);
g_cam_y = floor(cy * g_zoom / 32768);
