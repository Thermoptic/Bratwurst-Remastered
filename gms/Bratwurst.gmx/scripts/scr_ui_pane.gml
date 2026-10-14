/// scr_ui_pane(x, y, w, h, legend, colour)
// Ruta med ram, rubrik pa ramen och accenthorn nere (command-deck-stilen).
var px, py, pw, ph, tw;
px = argument0; py = argument1; pw = argument2; ph = argument3;
draw_set_alpha(0.8);
draw_set_color(g_c[0]);
draw_rectangle(px, py, px + pw, py + ph, false);
draw_set_alpha(1);
draw_set_color(g_c[3]);
draw_rectangle(px, py, px + pw, py + ph, true);
draw_set_color(argument5);
// en enda accentlinje i varje nedre horn, exakt pa ramens kant (tidigare ett L av tva linjer)
draw_rectangle(px + pw - 12, py + ph, px + pw, py + ph, false);
draw_rectangle(px, py + ph, px + 12, py + ph, false);
// hornen blir vinkelhakar: en kort lodrat linje upp langs sidokanten, exakt pa ramens linje (ingen dubbel linje)
draw_rectangle(px + pw, py + ph - 12, px + pw, py + ph, false);
draw_rectangle(px, py + ph - 12, px, py + ph, false);
if (argument4 != "")
{
    g_fs = g_f_sm;
    tw = scr_ui_tw(argument4) + 14;
    draw_set_color(g_c[0]);
    draw_rectangle(px + 12, py - 9, px + 12 + tw, py + 9, false);
    scr_ui_text(px + 19, py - 8, argument4, argument5);
}
