/// scr_game_start(n_players)
g_paused = false;
g_pause_opts = false;
// Startar om matchen. Skapar spelare med skeppsval fran g_pship[].
var i, p;
with (obj_player) { if (dr_snd >= 0) { audio_stop_sound(dr_snd); } if (rg_snd >= 0) { audio_stop_sound(rg_snd); } instance_destroy(); }   // driftljudet stoppas
with (obj_shot) { instance_destroy(); }
with (obj_missile) { instance_destroy(); }
with (obj_fx) { instance_destroy(); }
g_n_players = argument0;
if (g_game_mode == 1) { g_lives_max = g_sv[g_SV_ADLIVES]; } else { g_lives_max = g_sv[g_SV_LIVES]; }   // Classic: valt antal liv (hogst g_START_LIVES)
g_state = 1;
g_winner = -1;
g_tick = 0;
g_round = 1;                          // ny match: runda 1, noll vinster
g_rounds_total = g_sv[g_SV_ROUNDS];
g_round_timer = 0;
g_end_timer = -1;
for (i = 0; i < 4; i += 1) { g_wins[i] = 0; }
scr_level_read(scr_cur_map());   // vald bana (levels.ini)
scr_level_apply();
scr_solid_build();   // fyllningstrianglar for vaggarna (Solid colors)
g_match_map = g_ed_name;   // matchens banamn (visas i spelytans horn)
scr_arena_prepare();
scr_spark_clear();
for (i = 0; i < g_n_players; i += 1)
{
    p = instance_create(0, 0, obj_player);
    with (p) { scr_player_init(i, g_pship[i]); }
}
scr_powerup_reset();
scr_music_round_start();
g_cam_n_prev = -1;   // ny match: kameran hoppar direkt till ratt vy
g_cam_tr = 0;
scr_camera_update();
