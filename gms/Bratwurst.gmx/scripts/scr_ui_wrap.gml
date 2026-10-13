/// scr_ui_wrap(x, y, text, max_width, line_height, colour)
// Radbrytande text (bryter vid mellanslag). Returnerar y for raden efter sista raden.
var s, line, w, t, p, yy;
s = argument2;
line = "";
yy = argument1;
draw_set_color(argument5);
while (string_length(s) > 0)
{
    p = string_pos(" ", s);
    if (p == 0) { w = s; s = ""; }
    else { w = string_copy(s, 1, p - 1); s = string_delete(s, 1, p); }
    if (line == "") { t = w; } else { t = line + " " + w; }
    if (scr_ui_tw(t) > argument3 && line != "")
    {
        scr_ui_dt(argument0, yy, line);
        yy += argument4;
        line = w;
    }
    else { line = t; }
}
if (line != "")
{
    scr_ui_dt(argument0, yy, line);
    yy += argument4;
}
return yy;
