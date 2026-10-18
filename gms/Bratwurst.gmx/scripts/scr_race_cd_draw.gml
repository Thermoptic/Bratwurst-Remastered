/// scr_race_cd_draw()
// Race (D-060): stor nedrakning 3, 2, 1 i mitten av spelytan nar ett race startar, sedan GO! (en sekund, tonas ut). Sa lange nedrakningen pagar
// (g_race_cd > 0) gar det inte att gasa (scr_player_step). Kors i scr_match_draw, ovanpa allt i spelytan.
var cx, cy, tx, col, m, w, h, a;
if (g_race_cd <= 0 && g_race_go <= 0) { exit; }
cx = g_OX + g_PLAY_W * g_SCALE / 2;
cy = g_OY + g_PLAY_H * g_SCALE / 2;
m = 3;
a = 1;
if (g_race_cd > 0)
{
    tx = string(ceil(g_race_cd / 50));
    col = g_acc;
}
else
{
    tx = "GO!";
    col = g_c[11];
    a = min(1, g_race_go / 20);
}
draw_set_font(g_fnt[g_fk * 4 + g_f_xl]);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
w = string_width(tx) * m / g_k;
h = string_height(tx) * m / g_k;
draw_set_alpha(a * 0.6);
draw_set_color(g_c[0]);
draw_text_transformed(cx - w / 2 + 3, cy - h / 2 + 3, tx, m / g_k, m / g_k, 0);
draw_set_alpha(a);
draw_set_color(col);
draw_text_transformed(cx - w / 2, cy - h / 2, tx, m / g_k, m / g_k, 0);
draw_set_alpha(1);
