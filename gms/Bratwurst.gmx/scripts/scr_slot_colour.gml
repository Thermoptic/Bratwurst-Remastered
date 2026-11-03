/// scr_slot_colour(slot)
// Spelarens unika farg (g_pc[0..3], vald ur temat av scr_theme_players). Samma farg anvands for skeppet och spelarens panel.
if (g_game_mode == 3) { return g_team_col[scr_team_of(clamp(argument0, 0, 3))]; }   // Capture the Bratwurst: lagets farg, tva spelare delar den (D-079)
return g_pc[clamp(argument0, 0, 3)];
