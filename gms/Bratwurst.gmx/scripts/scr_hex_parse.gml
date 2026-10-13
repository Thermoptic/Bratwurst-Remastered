/// scr_hex_parse(text)
// "rrggbb" (med eller utan #) -> GM-farg, eller -1 om texten inte ar en giltig farg.
var h, i, d, dig, rr, gg, bb;
h = string_lower(argument0);
if (string_char_at(h, 1) == "#") { h = string_delete(h, 1, 1); }
if (string_length(h) != 6) { return -1; }
dig = "0123456789abcdef";
for (i = 1; i <= 6; i += 1)
{
    if (string_pos(string_char_at(h, i), dig) == 0) { return -1; }
}
rr = (string_pos(string_char_at(h, 1), dig) - 1) * 16 + (string_pos(string_char_at(h, 2), dig) - 1);
gg = (string_pos(string_char_at(h, 3), dig) - 1) * 16 + (string_pos(string_char_at(h, 4), dig) - 1);
bb = (string_pos(string_char_at(h, 5), dig) - 1) * 16 + (string_pos(string_char_at(h, 6), dig) - 1);
return make_colour_rgb(rr, gg, bb);
