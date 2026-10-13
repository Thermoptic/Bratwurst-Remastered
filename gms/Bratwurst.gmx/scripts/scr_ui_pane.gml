/// scr_ui_pane(x, y, w, h, legend, colour)
// Ruta med ram, rubrik pa ramen och accenthorn nere (command-deck-stilen).
var px, py, pw, ph, tw;
px = argument0; py = argument1; pw = argument2; ph = argument3;
draw_set_color(g_c[3]);
draw_rectangle(px, py, px + pw, py + ph, true);
draw_set_color(argument5);
draw_rectangle(px + pw - 12, py + ph - 1, px + pw + 1, py + ph, false);
draw_rectangle(px + pw - 1, py + ph - 12, px + pw, py + ph, false);
draw_rectangle(px - 1, py + ph - 1, px + 12, py + ph, false);
draw_rectangle(px - 1, py + ph - 12, px, py + ph, false);
if (argument4 != "")
{
    g_fs = g_f_sm;
    tw = scr_ui_tw(argument4) + 14;
    draw_set_color(g_c[0]);
    draw_rectangle(px + 12, py - 9, px + 12 + tw, py + 9, false);
    scr_ui_text(px + 19, py - 8, argument4, argument5);
}
