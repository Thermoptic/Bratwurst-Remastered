/// scr_goto_main()
g_paused = false;
// Tillbaka till huvudmenyn fran skeppsval eller match. Tar bort matchens objekt.
with (obj_player) { instance_destroy(); }
with (obj_shot) { instance_destroy(); }
with (obj_missile) { instance_destroy(); }
with (obj_fx) { instance_destroy(); }
g_state = 11;
g_menu_tick = 0;
