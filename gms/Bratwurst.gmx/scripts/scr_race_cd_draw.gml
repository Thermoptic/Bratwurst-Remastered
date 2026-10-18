/// scr_race_cd_draw()
// Race (D-060, D-062): stor nedrakning 3, 2, 1 i mitten av spelytan nar ett race startar, sedan GO! (en sekund, tonas ut). Ritas som vektorlinjer
// (logotypens bokstavssystem, scr_logo_glyph) i stallet for en uppskalad bitmapp, sa att den blir skarp i alla upplosningar. Sa lange nedrakningen
// pagar (g_race_cd > 0) gar det inte att gasa (scr_player_step). Kors i scr_match_draw, ovanpa allt i spelytan.
var cx, cy, tx, col, a, sc, lw, wd, x0, y0, n, i, xx;
if (g_race_cd <= 0 && g_race_go <= 0) { exit; }
cx = g_OX + g_PLAY_W * g_SCALE / 2;
cy = g_OY + g_PLAY_H * g_SCALE / 2;
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
sc = g_PLAY_H * g_SCALE * 0.2 / 9;   // bokstavshojd (9 enheter) = 20 % av spelytans hojd
lw = max(3, sc * 0.9);
n = string_length(tx);
wd = (n * 7 + (n - 1) * 1.6) * sc;
x0 = cx - wd / 2;
y0 = cy - 4.5 * sc;
// skugga och sedan sjalva siffran/ordet
draw_set_alpha(a * 0.6);
draw_set_color(g_c[0]);
for (i = 1; i <= n; i += 1) { scr_logo_glyph(ord(string_char_at(tx, i)), x0 + (i - 1) * 8.6 * sc + lw * 0.5, y0 + lw * 0.5, sc, lw); }
draw_set_alpha(a);
draw_set_color(col);
for (i = 1; i <= n; i += 1) { scr_logo_glyph(ord(string_char_at(tx, i)), x0 + (i - 1) * 8.6 * sc, y0, sc, lw); }
draw_set_alpha(1);
