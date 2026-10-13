/// scr_game_create()
// Initiering (kors en gang i obj_game Create).
scr_config_init();
scr_data_trig();
scr_data_arena();
scr_data_ships();
scr_data_themes();
scr_phys_tables();
scr_set_init();       // laser settings.ini / themes.ini och applicerar temat
scr_font_init();
texture_set_interpolation(true);    // mjuk nedskalning av typsnitten (2x-resurser ritas med skala 0.5)
scr_display_apply();
scr_mn_build();
scr_menu_init();      // skeppsvalets tillstand (g_state = 0)
g_state = 10;         // spelet startar pa titelskarmen
g_menu_tick = 0;
