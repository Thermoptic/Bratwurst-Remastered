/// scr_layout_update()
// Beraknar layouten for aktuell vy (se scr_display_apply): g_vx/g_vy/g_vw/g_vh = synlig yta i rumskoordinater (fyller hela fonstret/skarmen).
// Alla skarmar (titel, menyer, match) lagger ut sig relativt den ytan. Spelytan (matchen) fyller bredden mellan 12 px-marginalerna, lika bred som
// panelraden, och hojden mellan rubrikraden och panelraden. Den ritas i skala g_SCALE (original 2; nu reell tal) med originalets hojd (236 enheter);
// i bredd visas lika mycket mer av banan som ryms (widescreen, g_PLAY_W). Med WIDE av: originalets 320 enheters bredd, centrerad.
var rx0, rw0, ry0, rh0, ty, s, pw;
g_vx = view_xview[0];
g_vy = view_yview[0];
g_vw = view_wview[0];
g_vh = view_hview[0];
rx0 = g_vx + 12;
rw0 = g_vw - 24;
ry0 = g_vy + 36;
ty = g_vy + g_vh - 12 - 108;
rh0 = (ty - 12) - ry0;
s = rh0 / g_PLAY_H;
if (g_sv[g_SV_WIDE])
{
    pw = round(rw0 / s);
    s = rw0 / pw;
}
else
{
    pw = 320;
    s = min(s, rw0 / pw);
}
g_PLAY_W = pw;
g_CX = floor(pw / 2);
g_SCALE = s;
g_OX = rx0 + (rw0 - pw * s) / 2;
g_OY = ry0 + (rh0 - g_PLAY_H * s) / 2;
