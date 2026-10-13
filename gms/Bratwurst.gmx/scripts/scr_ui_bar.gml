/// scr_ui_bar(x, y, w, h, fraction, colour)
// Segmenterad stapel (som tecken i en terminal). fraction 0..1.
var n, f, i, bx;
n = floor(argument2 / 8);
if (n < 1) { exit; }
f = 0;
if (argument4 > 0) { f = ceil(argument4 * n); }
if (f > n) { f = n; }
for (i = 0; i < n; i += 1)
{
    bx = argument0 + i * 8;
    if (i < f)
    {
        draw_set_color(argument5);
        draw_rectangle(bx, argument1, bx + 5, argument1 + argument3, false);
    }
    else
    {
        draw_set_color(g_c[2]);
        draw_rectangle(bx, argument1, bx + 5, argument1 + argument3, false);
    }
}
