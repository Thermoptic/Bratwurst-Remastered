/// scr_ui_dt(x, y, text)
// Ritar text med aktuell storlek g_fs i aktuell farg/alfa, vansterjusterat fran (x, y) = ovre vanstra hornet. Typsnittsuppsattningen matchar UI-skalan
// g_k (resurserna ar redan i skarmpixlar), sa texten ritas med skala 1/g_k i rumskoordinater = exakt 1 texel per skarmpixel. Positionen
// snappas till hel skarmpixel sa att glyferna inte hamnar mellan pixlar.
var xs, ys;
xs = view_xview[0] + round((argument0 - view_xview[0]) * g_k) / g_k;
ys = view_yview[0] + round((argument1 - view_yview[0]) * g_k) / g_k;
draw_set_font(g_fnt[g_fk * 4 + g_fs]);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(xs, ys, argument2, 1 / g_k, 1 / g_k, 0);
