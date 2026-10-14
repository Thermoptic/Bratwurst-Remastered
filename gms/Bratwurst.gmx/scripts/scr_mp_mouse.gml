/// scr_mp_mouse()
// Musen i musikspelarpanelen (D-044): klick pa tidslinjen soker, pa prev/next byter lat, pa play/paus pausar, pa shuffle/repeat vaxlar och pa volym -/+ andrar
// volymen. Klickytorna skrivs av scr_music_panel (g_mp_x1/y1/x2/y2); g_mp_vis ar sann bara de bildrutor panelen ritats. Kors i obj_game fran scr_mn_step.
var mx, my, k, hit;
if (!g_mp_vis) { exit; }
g_mp_vis = false;
if (!mouse_check_button_pressed(mb_left)) { exit; }
mx = mouse_x;
my = mouse_y;
hit = -1;
for (k = 0; k < 9; k += 1)
{
    if (mx >= g_mp_x1[k] && mx <= g_mp_x2[k] && my >= g_mp_y1[k] && my <= g_mp_y2[k]) { hit = k; }
}
if (hit == 0) { scr_mp_seek((mx - g_mp_x1[0]) / max(1, g_mp_x2[0] - g_mp_x1[0])); }
if (hit == 1) { scr_music_switch(-1); }
if (hit == 2) { scr_mp_toggle(); }
if (hit == 3) { scr_music_switch(1); }
if (hit == 4) { g_mp_shuf = !g_mp_shuf; }
if (hit == 5) { g_mp_rep = !g_mp_rep; }
if (hit == 6) { g_sv[g_SV_VOL] = max(1, g_sv[g_SV_VOL] - 1); scr_set_changed(g_SV_VOL); }
if (hit == 8) { g_mp_mute = !g_mp_mute; }
if (hit == 7) { g_sv[g_SV_VOL] = min(10, g_sv[g_SV_VOL] + 1); scr_set_changed(g_SV_VOL); }
