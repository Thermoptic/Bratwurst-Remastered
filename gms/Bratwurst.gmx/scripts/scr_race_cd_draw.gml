/// scr_race_cd_draw()
// Race (D-060, D-062, D-064): stor nedrakning 3, 2, 1 i mitten av spelytan nar ett race startar, sedan GO! (en sekund, tonas ut). Ritas i digital
// LCD-stil av raka, fyllda staplar (scr_lcd_char) i stallet for en uppskalad bitmapp: skarpt och utan rundade kanter i alla upplosningar. Sa lange
// nedrakningen pagar (g_race_cd > 0) gar det inte att gasa (scr_player_step). Kors i scr_match_draw, ovanpa allt i spelytan.
var cx, cy, tx, col, a, hh, ww, tt, sp, n, i, ch, cw, tot, xx, x0, y0;
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
hh = g_PLAY_H * g_SCALE * 0.2;   // teckenhojd: 20 % av spelytans hojd
ww = hh * 0.6;                    // teckenbredd
tt = hh * 0.17;                   // stapeltjocklek
sp = ww * 0.3;                    // mellanrum mellan tecken
n = string_length(tx);
tot = 0;
for (i = 1; i <= n; i += 1)
{
    if (string_char_at(tx, i) == "!") { tot += tt; } else { tot += ww; }
    if (i < n) { tot += sp; }
}
x0 = cx - tot / 2;
y0 = cy - hh / 2;
// skugga (morkt, forskjuten) och sedan sjalva siffran/ordet
for (i = 0; i < 2; i += 1)
{
    if (i == 0) { draw_set_alpha(a * 0.6); draw_set_color(g_c[0]); xx = x0 + tt * 0.35; }
    else { draw_set_alpha(a); draw_set_color(col); xx = x0; }
    for (n = 1; n <= string_length(tx); n += 1)
    {
        ch = string_char_at(tx, n);
        if (ch == "!") { cw = tt; } else { cw = ww; }
        scr_lcd_char(ch, xx, y0 + (i == 0) * tt * 0.35, cw, hh, tt);
        xx += cw + sp;
    }
}
draw_set_alpha(1);
