/// scr_ui_crt()
// SCANLINES: mjuka horisontella linjer over hela vyn (sista som ritas). Linjerna ar 1 skarmpixel tjocka med 3 pixlars mellanrum.
var yy, y0, y1;
if (!g_sv[g_SV_SCAN]) { exit; }
y0 = view_yview[0];
y1 = view_yview[0] + view_hview[0];
draw_set_color(c_black);
draw_set_alpha(0.16);
for (yy = y0; yy < y1; yy += 3 / g_k)
{
    draw_line_width(view_xview[0], yy, view_xview[0] + view_wview[0], yy, 1 / g_k);
}
draw_set_alpha(1);
