/// scr_lcd_char(char, ox, oy, width, height, thickness)
// Ritar ett tecken i digital LCD-stil (sjusegment, bara raka fyllda staplar utan rundade kanter) med ovre vanstra hornet i (ox, oy), i aktuell farg och alfa.
// Stodjer 1, 2, 3, G, O och !. Segment (bitar): a = overkant 1, b = hoger uppe 2, c = hoger nere 4, d = nederkant 8, e = vanster nere 16, f = vanster uppe 32,
// g = mitten 64. Mellan segmenten ar det en liten glugg (som pa en riktig LCD).
var ch, ox, oy, w, h, t, g, m, hy;
ch = argument0;
ox = argument1; oy = argument2; w = argument3; h = argument4; t = argument5;
g = max(1, t * 0.16);
hy = oy + h / 2;
if (ch == "!")
{
    draw_rectangle(ox, oy, ox + t, oy + h * 0.62, false);
    draw_rectangle(ox, oy + h - t, ox + t, oy + h, false);
    exit;
}
m = 0;
if (ch == "1") { m = 6; }
if (ch == "2") { m = 91; }
if (ch == "3") { m = 79; }
if (ch == "G") { m = 61; }
if (ch == "O") { m = 63; }
if ((m & 1) != 0) { draw_rectangle(ox + t + g, oy, ox + w - t - g, oy + t, false); }
if ((m & 2) != 0) { draw_rectangle(ox + w - t, oy, ox + w, hy - g / 2, false); }
if ((m & 4) != 0) { draw_rectangle(ox + w - t, hy + g / 2, ox + w, oy + h, false); }
if ((m & 8) != 0) { draw_rectangle(ox + t + g, oy + h - t, ox + w - t - g, oy + h, false); }
if ((m & 16) != 0) { draw_rectangle(ox, hy + g / 2, ox + t, oy + h, false); }
if ((m & 32) != 0) { draw_rectangle(ox, oy, ox + t, hy - g / 2, false); }
if ((m & 64) != 0) { draw_rectangle(ox + t + g, hy - t / 2, ox + w - t - g, hy + t / 2, false); }
if (ch == "G") { draw_rectangle(ox + w / 2, hy - t / 2, ox + w - t - g, hy + t / 2, false); }   // G: bara hoger halva mittenstapeln
