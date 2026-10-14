/// scr_menu_enter()
g_paused = false;
// Gar tillbaka till skeppsvalet (behaller tidigare skeppsval) och tar bort matchens objekt.
var i;
with (obj_player) { if (dr_snd >= 0) { audio_stop_sound(dr_snd); } instance_destroy(); }   // driftljudet stoppas
with (obj_shot) { instance_destroy(); }
with (obj_missile) { instance_destroy(); }
with (obj_fx) { instance_destroy(); }
for (i = 0; i < 4; i += 1)
{
    g_sel_stage[i] = 0;
    g_sel_yes[i] = 1;
    g_sel_weapon[i] = scr_weapon_first(g_sel_ship[i]);
    g_sel_pod[i] = 0;
}
g_state = 0;
g_menu_tick = 0;
g_ready_tick = 0;
