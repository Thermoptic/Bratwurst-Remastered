/// scr_goto_main()
g_paused = false;
g_pause_opts = false;
// Tillbaka till huvudmenyn fran skeppsval eller match. Tar bort matchens objekt.
with (obj_player) { if (dr_snd >= 0) { audio_stop_sound(dr_snd); } if (rg_snd >= 0) { audio_stop_sound(rg_snd); } instance_destroy(); }   // driftljudet stoppas
with (obj_shot) { instance_destroy(); }
with (obj_missile) { instance_destroy(); }
with (obj_fx) { instance_destroy(); }
g_state = 11;
g_menu_tick = 0;
