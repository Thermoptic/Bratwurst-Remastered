/// scr_ctb_clock(ticks)
// Capture the Bratwurst (D-082): ticks (50 per sekund) som M:SS. Tid kvar rundas uppat (4:59.3 s visas som 5:00), sa att klockan inte visar 0:00 for tidigt.
var s;
s = ceil(argument0 / 50);
return string(floor(s / 60)) + ":" + scr_pad2(s mod 60);
