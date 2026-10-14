/// scr_game_create()
// Initiering (kors en gang i obj_game Create).
scr_config_init();
scr_data_trig();
scr_data_arena();
scr_data_ships();
scr_data_powerups();   // powerup-definitioner (D-035)
scr_data_sausage();   // korvmodellen (pseudoskepp utanfor skeppsvalet)
scr_trail_init();   // driftspar per skepp
scr_data_themes();
scr_data_levels();
scr_data_musicviz();
scr_data_tracks();   // latar fran mappen Music (tools/gen_tracks.py)
scr_tracks_load();   // equalizerdata per lat
randomize();
scr_phys_tables();
scr_levels_init();    // levels.ini (inbyggda banor skrivs vid forsta start)
scr_set_init();       // laser settings.ini / themes.ini och applicerar temat
scr_font_init();
texture_set_interpolation(true);    // mjuk nedskalning av typsnitten (2x-resurser ritas med skala 0.5)
scr_display_apply();   // satter ocksa layouten (scr_layout_update)
scr_mn_build();
scr_logo_init();
scr_spark_clear();
scr_menu_init();      // skeppsvalets tillstand (g_state = 0)
g_state = 10;         // spelet startar pa titelskarmen
g_menu_tick = 0;
