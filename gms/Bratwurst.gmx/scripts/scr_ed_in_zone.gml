/// scr_ed_in_zone(team, world_x, world_y)
// Capture the Bratwurst (D-078): sant om punkten (varldspixlar) ligger i redigerarens zon for laget (0 = rod, 1 = bla) och zonen finns.
if (!g_ed_zon[argument0]) { return false; }
return (argument1 >= g_ed_zx0[argument0] && argument1 <= g_ed_zx1[argument0] && argument2 >= g_ed_zy0[argument0] && argument2 <= g_ed_zy1[argument0]);
