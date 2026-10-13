/// scr_colour_dist(colour_a, colour_b)
// Enkelt, viktat RGB-avstand (ungefar som synligt avstand): 0 = lika.
var dr, dg, db, rm;
dr = colour_get_red(argument0) - colour_get_red(argument1);
dg = colour_get_green(argument0) - colour_get_green(argument1);
db = colour_get_blue(argument0) - colour_get_blue(argument1);
rm = (colour_get_red(argument0) + colour_get_red(argument1)) / 2;
return sqrt((2 + rm / 256) * dr * dr + 4 * dg * dg + (2 + (255 - rm) / 256) * db * db);
