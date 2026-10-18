/// scr_ed_in_finish(world_x, world_y)
// Sant om punkten (varldspixlar) ligger i banredigerarens malruta (och rutan finns).
if (!g_ed_fon) { return false; }
return (argument0 >= min(g_ed_fx0, g_ed_fx1) && argument0 <= max(g_ed_fx0, g_ed_fx1) && argument1 >= min(g_ed_fy0, g_ed_fy1) && argument1 <= max(g_ed_fy0, g_ed_fy1));
