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
if (g_game_mode == 1) { g_lives_max = g_sv[g_SV_ADLIVES]; } else if (g_game_mode == 5) { g_lives_max = g_sv[g_SV_SWLV]; } else { g_lives_max = g_sv[g_SV_LIVES]; }   // Super Smashwurst: STARTING LIVES (D-085)   // Classic: valt antal liv (hogst g_START_LIVES)
g_state = 1;
g_winner = -1;
g_tick = 0;
g_round = 1;                          // ny match: runda 1, noll vinster
g_rounds_total = g_sv[g_SV_ROUNDS];
g_round_timer = 0;
g_end_timer = -1;
for (i = 0; i < 4; i += 1) { g_wins[i] = 0; }
if (g_game_mode == 4) { scr_level_asteroids(); }   // Asteroids har en egen, helt tom bana (D-046)
else { scr_level_read(scr_cur_map()); }   // vald bana (levels.ini)
scr_level_apply();
g_sw_bn = 0;
g_sw_msgt = 0;
if (g_game_mode == 5) { scr_sw_prepare(); }   // Super Smashwurst: den roda gransen blir en spoklinje som skeppen flyger igenom (D-085)
scr_solid_build();   // fyllningstrianglar for vaggarna (Solid colors)
g_match_map = g_ed_name;   // matchens banamn (visas i spelytans horn)
scr_arena_prepare();
scr_frame_prepare();   // arenans ytterram tonar fram nar man narmar sig (D-066)
if (g_game_mode == 5) { g_FR_NEAR = 100000000; g_FR_FAR = 200000000; }   // Super Smashwurst: den roda gransen syns alltid, aven langt bort (D-085)
else { g_FR_NEAR = 400; g_FR_FAR = 1400; }
if (g_game_mode == 4) { scr_ast_reset(); }   // tom bana, forsta stenvagen efter 1 s
scr_dots_prepare();   // orienteringspunkter (D-043), efter att vaggarna ar klara
scr_spark_clear();
for (i = 0; i < g_n_players; i += 1)
{
    p = instance_create(0, 0, obj_player);
    with (p) { scr_player_init(i, g_pship[i]); }
}
if (g_game_mode == 2) { scr_race_reset(); }   // Race (D-053)
if (g_game_mode == 3) { g_ct_rw[0] = 0; g_ct_rw[1] = 0; scr_ctb_reset(); }   // Capture the Bratwurst: ny match, inga rundvinster (D-082)
scr_powerup_reset();
scr_music_round_start();
g_cam_n_prev = -1;   // ny match: kameran hoppar direkt till ratt vy
g_cam_tr = 0;
scr_camera_update();
