/// scr_ed_frame(x, y, w, h, name, dirty)
// Ritytans ram och rubrik utan fyllning (fyllningen och innehallet ritas fore; scr_ui_pane skulle morkna kartan). Rubrikfalt, hornmarkeringar och ram som
// scr_ui_pane; ett * efter namnet och gul farg nar banan har osparade andringar.
var px, py, pw, ph, tw, col, lg;
px = argument0; py = argument1; pw = argument2; ph = argument3;
if (argument5) { col = g_c[10]; lg = argument4 + " *"; } else { col = g_acc; lg = argument4; }
draw_set_alpha(1);
draw_set_color(g_c[3]);
draw_rectangle(px, py, px + pw, py + ph, true);
draw_set_color(col);
draw_rectangle(px + pw - 12, py + ph, px + pw, py + ph, false);
draw_rectangle(px, py + ph, px + 12, py + ph, false);
draw_rectangle(px + pw, py + ph - 12, px + pw, py + ph, false);
draw_rectangle(px, py + ph - 12, px, py + ph, false);
g_fs = g_f_sm;
tw = scr_ui_tw(lg) + 14;
draw_set_color(g_c[0]);
draw_rectangle(px + 12, py - 9, px + 12 + tw, py + 9, false);
scr_ui_text(px + 19, py - 8, lg, col);
