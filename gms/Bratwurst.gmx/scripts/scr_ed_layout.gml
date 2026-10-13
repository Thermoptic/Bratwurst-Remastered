/// scr_ed_layout()
// Redigerarens ritvta: pane till vanster (varlden -3100..3100 x -2400..2400 skalas in), hjalp till hoger.
g_ed_x0 = g_vx + 20;
g_ed_y0 = g_vy + 52;
g_ed_w = g_vw - 40 - 280 - 16;
g_ed_h = g_vh - 52 - 48;
g_ed_es = min((g_ed_w - 24) / 6200, (g_ed_h - 24) / 4800);
g_ed_cxs = g_ed_x0 + g_ed_w / 2;
g_ed_cys = g_ed_y0 + g_ed_h / 2;
