/// scr_ctb_validate()
// Capture the Bratwurst (D-078): kontrollerar att banan i redigerarens arrayer (efter scr_level_read) har det laget kraver: en korvstartpunkt och en rod och en bla zon.
// Returnerar "" om allt ar i ordning, annars en kort text om vad som saknas eller ar fel. Hittar inte pa nagra koordinater.
if (!g_ed_son) { return "NO SAUSAGE SPAWN (TOOL C)"; }
if (!g_ed_zon[0]) { return "NO RED ZONE (TOOL R)"; }
if (!g_ed_zon[1]) { return "NO BLUE ZONE (TOOL V)"; }
// zonerna far inte ligga over varandra: da ar det oklart vilket lag som poangar
if (!(g_ed_zx1[0] < g_ed_zx0[1] || g_ed_zx1[1] < g_ed_zx0[0] || g_ed_zy1[0] < g_ed_zy0[1] || g_ed_zy1[1] < g_ed_zy0[0])) { return "THE ZONES OVERLAP"; }
// korven far inte starta i en zon: den som plockar upp den dar kunde poangsatta direkt
if (scr_ed_in_zone(0, g_ed_sox, g_ed_soy) || scr_ed_in_zone(1, g_ed_sox, g_ed_soy)) { return "SPAWN INSIDE A ZONE"; }
return "";
