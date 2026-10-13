/// scr_theme_ramp(t, mode)
// Farg ur temats 16 farger for t = 0..1. mode 0 ("hetta", for stapelhojd): bla (base0D) -> cyan (0C) -> gron (0B) -> gul (0A) -> orange (09) -> rod (08).
// mode 1 ("spektrum", for frekvens): bla (0D) -> cyan (0C) -> gron (0B) -> gul (0A) -> orange (09) -> rod (08) -> magenta (0E).
var n, u, i, idx;
if (argument1 == 0) { n = 5; } else { n = 6; }
u = clamp(argument0, 0, 1) * n;
i = min(n - 1, floor(u));
idx[0] = 13; idx[1] = 12; idx[2] = 11; idx[3] = 10; idx[4] = 9; idx[5] = 8; idx[6] = 14;
return merge_colour(g_c[idx[i]], g_c[idx[i + 1]], u - i);
