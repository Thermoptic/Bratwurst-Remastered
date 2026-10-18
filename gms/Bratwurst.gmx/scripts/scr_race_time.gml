/// scr_race_time(ticks)
// Racetid som text M:SS.T (50 ticks per sekund, T = tiondels sekund).
var s, m;
s = floor(argument0 / 50);
m = floor(s / 60);
return string(m) + ":" + scr_pad2(s mod 60) + "." + string(floor((argument0 mod 50) / 5));
