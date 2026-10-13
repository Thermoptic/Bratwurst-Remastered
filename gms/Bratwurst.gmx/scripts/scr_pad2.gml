/// scr_pad2(n)
// Tvasiffrig text, t.ex. 7 -> "07".
if (argument0 < 10) { return "0" + string(argument0); }
return string(argument0);
