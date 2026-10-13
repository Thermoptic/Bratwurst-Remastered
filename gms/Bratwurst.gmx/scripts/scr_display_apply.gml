/// scr_display_apply()
// Fonsterstorlek, helskarm och vsync enligt installningarna, samt vyn. Bilden renderas i skarmens egen upplosning (inga uppstrackta pixlar):
// UI-skalan k valjs som 1, 1.5, 2 eller 3 (storsta som ryms: 1024*k <= bredd och 640*k <= hojd), vyn blir bredd/k x hojd/k och
// designytan 1024x640 hamnar centrerad (extra yta fylls med temats bakgrund). Typsnittsuppsattningen (g_fk) foljer k, se scr_font_init.
// Fonsterlagen 1X/1.5X/2X ger exakt k = 1/1.5/2. Spelets koordinater ar fortfarande rummets 1024x640.
var sc, f, w, h, vw, vh, kk;
display_reset(0, g_sv[g_SV_VSYNC]);
sc = g_sv[g_SV_SCALE];
kk = 1;
if (sc == 3)
{
    window_set_fullscreen(true);
    w = display_get_width();
    h = display_get_height();
    f = min(w / room_width, h / room_height);
    if (f >= 1) { kk = 1; g_fk = 0; }
    if (f >= 1.5) { kk = 1.5; g_fk = 1; }
    if (f >= 2) { kk = 2; g_fk = 2; }
    if (f >= 3) { kk = 3; g_fk = 3; }
    if (f < 1) { kk = f; g_fk = 0; }
}
else
{
    window_set_fullscreen(false);
    f = 1;
    g_fk = 0;
    if (sc == 1) { f = 1.5; g_fk = 1; }
    if (sc == 2) { f = 2; g_fk = 2; }
    w = room_width * f;
    h = room_height * f;
    if (w > display_get_width() || h > display_get_height() - 80)
    {
        f = 1;
        g_fk = 0;
        w = room_width;
        h = room_height;
    }
    kk = f;
    window_set_size(w, h);
    window_center();
}
g_k = kk;
vw = w / kk;
vh = h / kk;
view_enabled = true;
view_visible[0] = true;
view_wview[0] = vw;
view_hview[0] = vh;
view_xview[0] = round(((room_width - vw) / 2) * kk) / kk;
view_yview[0] = round(((room_height - vh) / 2) * kk) / kk;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = w;
view_hport[0] = h;
surface_resize(application_surface, w, h);
