/// scr_slot_colour(slot)
// Spelarens unika farg (g_pc[0..3], vald ur temat av scr_theme_players). Samma farg anvands for skeppet och spelarens panel.
return g_pc[clamp(argument0, 0, 3)];
