/// scr_seg_intersect(x1,y1,x2,y2,x3,y3,x4,y4)
// Sant om strackorna (1-2) och (3-4) skar varandra (inklusive beroring).
var d1, d2, d3, d4;
d1 = (argument6 - argument4) * (argument1 - argument5) - (argument7 - argument5) * (argument0 - argument4);
d2 = (argument6 - argument4) * (argument3 - argument5) - (argument7 - argument5) * (argument2 - argument4);
d3 = (argument2 - argument0) * (argument5 - argument1) - (argument3 - argument1) * (argument4 - argument0);
d4 = (argument2 - argument0) * (argument7 - argument1) - (argument3 - argument1) * (argument6 - argument0);
if (((d1 > 0 && d2 < 0) || (d1 < 0 && d2 > 0)) && ((d3 > 0 && d4 < 0) || (d3 < 0 && d4 > 0))) { return true; }
if (d1 == 0 && min(argument4, argument6) <= argument0 && argument0 <= max(argument4, argument6) && min(argument5, argument7) <= argument1 && argument1 <= max(argument5, argument7)) { return true; }
if (d2 == 0 && min(argument4, argument6) <= argument2 && argument2 <= max(argument4, argument6) && min(argument5, argument7) <= argument3 && argument3 <= max(argument5, argument7)) { return true; }
if (d3 == 0 && min(argument0, argument2) <= argument4 && argument4 <= max(argument0, argument2) && min(argument1, argument3) <= argument5 && argument5 <= max(argument1, argument3)) { return true; }
if (d4 == 0 && min(argument0, argument2) <= argument6 && argument6 <= max(argument0, argument2) && min(argument1, argument3) <= argument7 && argument7 <= max(argument1, argument3)) { return true; }
return false;
