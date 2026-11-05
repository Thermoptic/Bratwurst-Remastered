/// scr_sw_colour(push_percent)
// Super Smashwurst (D-085): Push-matarens farg ur temat: cyan/bla vid lagt Push, via gult och orange till rott vid 100 % och uppat (base0C -> 0A -> 09 -> 08).
var t;
t = clamp(argument0 / 100, 0, 1);
if (t < 0.35) { return merge_colour(g_c[12], g_c[10], t / 0.35); }
if (t < 0.65) { return merge_colour(g_c[10], g_c[9], (t - 0.35) / 0.3); }
return merge_colour(g_c[9], g_c[8], (t - 0.65) / 0.35);
