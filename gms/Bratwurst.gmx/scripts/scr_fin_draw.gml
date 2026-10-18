/// scr_fin_draw()
// Race (D-053): ritar start- och malrutan i matchen: en svagt fylld ruta med kontur och riktningspilar i temats gron farg (g_c[11]). Rutan ar bara en markering
// (icke-solid): skeppen flyger rakt igenom den. Ritas inom spelytan.
var sx0, sy0, sx1, sy1, cx0, cy0, cx1, cy1;
if (!g_fin_on) { exit; }
sx0 = g_OX + scr_w2s_x(g_fin_x0) * g_SCALE;
sy0 = g_OY + scr_w2s_y(g_fin_y0) * g_SCALE;
sx1 = g_OX + scr_w2s_x(g_fin_x1) * g_SCALE;
sy1 = g_OY + scr_w2s_y(g_fin_y1) * g_SCALE;
cx0 = g_OX;
cy0 = g_OY;
cx1 = g_OX + g_PLAY_W * g_SCALE;
cy1 = g_OY + g_PLAY_H * g_SCALE;
if (sx1 < cx0 || sx0 > cx1 || sy1 < cy0 || sy0 > cy1) { exit; }
draw_set_color(g_c[11]);
draw_set_alpha(0.14);
draw_rectangle(clamp(sx0, cx0, cx1), clamp(sy0, cy0, cy1), clamp(sx1, cx0, cx1), clamp(sy1, cy0, cy1), false);
draw_set_alpha(1);
draw_rectangle(clamp(sx0, cx0, cx1), clamp(sy0, cy0, cy1), clamp(sx1, cx0, cx1), clamp(sy1, cy0, cy1), true);
scr_fin_arrows(sx0, sy0, sx1, sy1, g_fin_dir, g_c[11], cx0, cy0, cx1, cy1, 4 * g_SCALE);
