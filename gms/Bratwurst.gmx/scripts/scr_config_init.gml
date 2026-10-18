/// scr_config_init()
// GMS 1.4: globala variabler/arrayer deklareras med globalvar (prefix g_).
globalvar g_CX, g_CY, g_GRAV, g_MAX_SHOTS, g_PLAY_H, g_PLAY_W, g_SCALE, g_SHOT_GRAV, g_START_LIVES, g_ZOOM_MARGIN;
globalvar g_cam_x, g_cam_y, g_cos_tab, g_debug, g_hit_id, g_n_players, g_pcos, g_pship, g_psin, g_ship_count, g_ship_lines;
globalvar g_ship_name, g_ship_nk, g_ship_nl, g_ship_np, g_ship_par, g_ship_pod_ang, g_ship_pod_flag, g_ship_pods;
globalvar g_ship_pts, g_ship_weapon, g_sin_tab, g_start_ang, g_start_x, g_start_y, g_state, g_tick, g_tmp_maxx;
globalvar g_tmp_maxy, g_tmp_minx, g_tmp_miny, g_tmp_n, g_tmp_slot, g_wall_a, g_wall_b, g_wall_maxx, g_wall_maxy;
globalvar g_wall_minx, g_wall_miny, g_wall_n, g_wall_px, g_wall_py, g_winner, g_zoom;
// Central konfiguration. Alla varden kommer fran docs/15 (VERIFIERAD/SANNOLIK) om inget annat anges.
// Enheter: positioner/hastigheter i 1/256 varldspixel ("24.8-fixpunkt") som i originalet.

// Skarm: originalet ar 320x256 (spelplan 0..319 x 0..235, statusfalt under). Vi ritar i skala 2.
globalvar g_wmult, g_wdiv, g_wname, g_wcool, g_near_id, g_near_dx, g_near_dy, g_near_d2, g_ref_x, g_ref_y, g_ref_slot, g_tmp_f;
// Specialvapentabeller (typ 0..5): ammo-multiplikator/-divisor VERIFIERAD (hunk 4 0x9894); nedrakning VERIFIERAD (kod 0x6bce-0x7052)
g_wname[0] = "NOTHING"; g_wmult[0] = 1; g_wdiv[0] = 1;  g_wcool[0] = 0;
g_wname[1] = "MISSILE"; g_wmult[1] = 1; g_wdiv[1] = 10; g_wcool[1] = 40;
g_wname[2] = "GUIDED MISSILE"; g_wmult[2] = 1; g_wdiv[2] = 12; g_wcool[2] = 100;
g_wname[3] = "TURBO BOOST"; g_wmult[3] = 1; g_wdiv[3] = 8; g_wcool[3] = 20;
g_wname[4] = "TRACTOR BEAM"; g_wmult[4] = 5; g_wdiv[4] = 1; g_wcool[4] = 0;
g_wname[5] = "CANNON TURRET"; g_wmult[5] = 2; g_wdiv[5] = 1; g_wcool[5] = 3;

globalvar g_sel_stage, g_sel_ship, g_sel_weapon, g_sel_pod, g_sel_yes, g_mi_l, g_mi_r, g_mi_ok, g_mi_back, g_mi_prevx, g_pweapon, g_ppod, g_menu_tick, g_ready_tick;
globalvar g_wshort;
g_wshort[0] = "NONE"; g_wshort[1] = "MSL"; g_wshort[2] = "GUIDED"; g_wshort[3] = "TURBO"; g_wshort[4] = "TRACT"; g_wshort[5] = "TURRET";   // kompakta namn for 3-4 spelares HUD/meny (placeholder)
g_SCALE = 2;
g_CX = 160;          // skarmcentrum x (VERIFIERAD, kod 0x2bc2)
g_CY = 118;          // skarmcentrum y (VERIFIERAD, kod 0x2bc6)
g_PLAY_W = 320;
g_PLAY_H = 236;      // VERIFIERAD: gransen 0..235 (data 0x675a)

// Fysik (VERIFIERAD i kod; enhet 1/256 px per tick)
g_GRAV = 31;         // 50 i filen, skalas (50*20)>>5 = 31 av startrutinen (scr_phys_tables)
g_SHOT_GRAV = 15;    // 25 i filen, skalas till 15 (scr_phys_tables)
g_ZOOM_MARGIN = 400; // hunk 4 0x9963c
g_START_LIVES = 6;   // kod 0x34ca
g_MAX_SHOTS = 600;   // kod 0x1754

// Startpositioner/-vinklar (VERIFIERAD, kod 0x3f84, 0x40a4, 0x41c8, 0x42ec)
g_start_x[0] = -300000; g_start_y[0] = -270000; g_start_ang[0] = 96;
g_start_x[1] =  300000; g_start_y[1] = -270000; g_start_ang[1] = 160;
g_start_x[2] = -300000; g_start_y[2] =  270000; g_start_ang[2] = 64;
g_start_x[3] =  300000; g_start_y[3] =  270000; g_start_ang[3] = 192;

// Standardskepp: index i scr_data_ships (alfabetisk ordning). 14 = XWing, 12 = TieFighter.
g_pship[0] = 14;
g_pship[1] = 12;
g_pship[2] = 0;
g_pship[3] = 1;

// Tillstand
g_n_players = 2;
g_state = 0;         // 0 = skeppsval, 1 = match, 2 = matchen slut, 10 = titelskarm, 11 = huvudmeny
g_winner = -1;
g_debug = false;
g_zoom = 17694;      // 108*65536/400 = zoom for en ensam spelare vid start
g_cam_x = 0;
g_cam_y = 0;
g_tick = 0;

// ---- Terminal-UI (Fas 3): layout, tema, installningar, meny ----
// Rum 1024x640. Spelytan (320x236 i skala 2 = 640x472) ligger i mitten; spelare 1-2 har sidopaneler, spelare 3-4 paneler under spelytan.
globalvar g_dl_count, g_dl_id, g_dl_name, g_dl_n, g_dl_shape, g_dl_spawn, g_lv_count, g_lv_id, g_lv_name, g_SV_MAP, g_mn_map_node;
globalvar g_ed_n, g_ed_pn, g_ed_px, g_ed_py, g_ed_sx, g_ed_sy, g_ed_sa, g_ed_name, g_ed_idx, g_ed_tool, g_ed_cn, g_ed_cx, g_ed_cy, g_ed_bset, g_ed_bx, g_ed_by;
globalvar g_ed_spawn, g_ed_dirty, g_ed_cdel, g_ed_cesc, g_ed_snap, g_ed_msg, g_ed_msgt, g_ed_x0, g_ed_y0, g_ed_w, g_ed_h, g_ed_es, g_ed_cxs, g_ed_cys, g_ed_wx, g_ed_wy, g_ed_mx, g_ed_my, g_ed_inside;
globalvar g_SV_MAP2, g_lv_modes, g_ed_modes, g_ed_dlg, g_ed_dname, g_ed_dmsg, g_dg_x, g_dg_y, g_dg_w, g_dg_h, g_mode_name, g_mn_mode;
globalvar g_mw, g_mw_pk, g_mw_hist, g_mw_frame, g_bg_t, g_lg_n, g_lg_s, g_tt_sx, g_tt_sy, g_tt_st, g_tt_sp, g_tt_dx, g_tt_dy, g_tt_n, g_SHIP_GRAV, g_DB_MAX, g_db_x, g_db_y, g_db_hx, g_db_hy, g_db_vx, g_db_vy, g_db_w, g_db_life, g_db_col;
globalvar g_SV_ZOOM, g_SV_ASLV, g_AS_FIRST, g_AS_GAP, g_AS_START, g_AS_MAXN, g_AS_TRICKLE, g_AS_SPEED, g_as_trk, g_SV_PUAS, g_AS_MAX, g_AS_R, g_AS_DMG, g_AS_KB, g_as_on, g_as_x, g_as_y, g_as_vx, g_as_vy, g_as_sz, g_as_sh, g_as_a, g_as_sp, g_as_shx, g_as_shy, g_as_px, g_as_py, g_as_wave, g_as_timer, g_as_x0, g_as_y0, g_as_x1, g_as_y1, g_fs_lost, g_fs_lt, g_mu_t, g_MU_FADE, g_mp_mute, g_mp_pause, g_mp_shuf, g_mp_rep, g_mp_vis, g_mp_x1, g_mp_y1, g_mp_x2, g_mp_y2, g_DOT_STEP, g_DOT_ZLO, g_DOT_ZHI, g_dot_i0, g_dot_j0, g_dot_ni, g_dot_nj, g_dot_ok, g_bv_x, g_bv_y, g_SHOT_BOOST, g_FILL_EXPAND, g_SV_SOLID, g_tp_x, g_tp_y, g_tp_n, g_tp_tri, g_wf_n, g_wf_tri, g_wf_col, g_sf_n, g_sf_t, g_PU_STRIDE, g_DRIFT_SIDE, g_PU_SPAWN, g_TR_WSCALE, g_pause_opts, g_pm_sn, g_pm_ss, g_pm_sd, g_cam_n_prev, g_cam_tr, g_cam_sz, g_cam_scx, g_cam_scy, g_CAM_TRANS, g_CAM_K, g_RG_AUTO, g_bm_cur, g_BM_MAX, g_bm_on, g_bm_age, g_bm_x, g_bm_y, g_bm_dx, g_bm_dy, g_bm_len, g_bm_owner, g_bm_col, g_bm_sweep, g_bm_hold, g_bm_fade, g_bm_w, g_bm_dmg, g_bm_hit, g_ship_nose, g_sd_x1, g_sd_y1, g_sd_x2, g_sd_y2, g_shake_amp, g_SV_PUCL, g_SV_PUAD, g_SV_PU, g_PU_COUNT, g_pu_name, g_pu_key, g_pu_icon, g_pu_np, g_pu_pname, g_pu_pdesc, g_pu_pkey, g_pu_pmin, g_pu_pmax, g_pu_pstep, g_pu_pdef, g_pu_on, g_pu_x, g_pu_y, g_pu_type, g_pu_timer, g_PU_RADIUS, g_PU_WALL, g_PU_FIRST, g_PU_RESPAWN, g_mn_step, g_mn_opts_node, g_mn_pu_node, g_mn_pu_linked, g_SAUSAGE, g_SV_LIVES, g_TR_MAX, g_ship_tr_x, g_ship_tr_y, g_ship_tr_n, g_DRIFT_SND_GAIN, g_SHOT_INHERIT, g_REVERSE_THRUST, g_DRIFT_MINSPEED, g_DRIFT_TURN, g_DRIFT_ANG, g_DRIFT_THRUST, g_FX_IMPACT, g_paused, g_pause_sel, g_SV_VOL, g_trk_fps, g_tv, g_tv_n, g_trk_n, g_trk_name, g_trk_snd, g_trk_viz, g_trk_idx, g_ct_x, g_ct_y, g_pv_idx, g_ld_x, g_ld_y, g_ld_w, g_ld_h, g_ed_ldsel, g_ed_ldtop, g_ed_ldclick, g_mi_u, g_mi_d, g_mi_prevy, g_match_map, g_end_timer, g_END_DELAY, g_RESPAWN_DELAY, g_game_mode, g_lives_max, g_SV_ADLIVES, g_AD_SHOTS, g_AD_COOLDOWN, g_pj_hit, g_pj_x, g_pj_y, g_pj_r, g_pj_owner, g_pj_age, g_mn_map_node2, g_proj_hs;
globalvar g_mv, g_mv_on, g_mv_n, g_mv_dur, g_mv_frame, g_SP_MAX, g_sp_x, g_sp_y, g_sp_vx, g_sp_vy, g_sp_life, g_sp_col, g_sp_size, g_sp_next, g_SV_SFX, g_sfx_ch, g_SV_MUSIC, g_music_id, g_SV_ROUNDS, g_round, g_rounds_total, g_wins, g_round_timer, g_res_sel;
globalvar g_COL_REST, g_COL_BOOST, g_COL_TICKS, g_COL_VMAX, g_col_id, g_wall_grp, g_wall_gn, g_wall_tmp, g_wcol, g_pc, g_vx, g_vy, g_vw, g_vh, g_SV_WIDE, g_OX, g_OY, g_c, g_acc, g_sv, g_SV_THEME, g_SV_ACCENT, g_SV_SCALE, g_SV_VSYNC, g_SV_SCAN, g_SV_GLOW, g_SV_PLAYERS;
globalvar g_th_count, g_th_id, g_th_name, g_th_hex, g_th_col, g_acc_name, g_scale_name;
globalvar g_f_sm, g_f_md, g_f_lg, g_f_xl, g_fs, g_fnt, g_fk, g_k;
globalvar g_nv_up, g_nv_down, g_nv_left, g_nv_right, g_nv_ok, g_nv_back, g_nv_any, g_nv_px, g_nv_py, g_nv_btn;
globalvar g_mn_cnt, g_mn_type, g_mn_label, g_mn_desc, g_mn_n, g_mn_kid, g_mn_set, g_mn_min, g_mn_max, g_mn_act, g_mn_text, g_mn_ini;
globalvar g_mn_depth, g_mn_stk_node, g_mn_stk_sel, g_hud_slot, g_hud_id, g_keyhint;
g_OX = 192;          // spelytans ovre vanstra horn pa skarmen (rumskoordinater)
g_OY = 36;
// Installningsindex i g_sv[] (sparas i settings.ini)
g_SV_THEME = 0; g_SV_ACCENT = 1; g_SV_SCALE = 2; g_SV_VSYNC = 3; g_SV_SCAN = 4; g_SV_GLOW = 5; g_SV_PLAYERS = 6; g_SV_WIDE = 7; g_SV_MAP = 8; g_SV_ROUNDS = 9; g_FX_IMPACT = 1.3; g_TR_MAX = 40; g_ship_tr_x[0] = 0; g_ship_tr_y[0] = 0; g_ship_tr_n[0] = 1; g_REVERSE_THRUST = 0.25; g_SHOT_INHERIT = 0; g_DRIFT_SND_GAIN = 0.45; g_DRIFT_MINSPEED = 500; g_DRIFT_TURN = 1.5; g_DRIFT_ANG = 34; g_DRIFT_THRUST = 1.17; g_paused = false; g_pause_sel = 0; g_SV_MUSIC = 10; g_SV_VOL = 14; g_SV_LIVES = 15; g_SV_PUCL = 16; g_SV_PUAD = 17; g_SV_PU = 24;   // PU: parametrar for powerups, 8 platser per powerup
g_shake_amp = 0; g_BM_MAX = 8; g_SV_ZOOM = 21; g_SV_ASLV = 20; g_AS_FIRST = 50; g_AS_GAP = 75; g_AS_START = 6; g_AS_MAXN = 14; g_AS_TRICKLE = 300; g_AS_SPEED = 1.5; g_as_trk = 0; g_SV_PUAS = 19; g_AS_MAX = 320; g_as_wave = 0; g_as_timer = 150; g_as_x0 = -2900; g_as_y0 = -2150; g_as_x1 = 2850; g_as_y1 = 2150; g_as_px[0] = 0; g_as_py[0] = 0; g_mode_name[4] = "ASTEROIDS";
g_fs_lost = false; g_fs_lt = 0; g_mu_t = 0; g_MU_FADE = 75;   // musiken tonas in fran tyst under de forsta 1,5 sekunderna efter start (ticks; var 150 = 3 s)
g_mp_mute = false; g_mp_pause = false; g_mp_shuf = false; g_mp_rep = false; g_mp_vis = false;
for (g_tmp_n = 0; g_tmp_n < 9; g_tmp_n += 1) { g_mp_x1[g_tmp_n] = 0; g_mp_y1[g_tmp_n] = 0; g_mp_x2[g_tmp_n] = -1; g_mp_y2[g_tmp_n] = -1; }
g_DOT_STEP = 100; g_DOT_ZLO = 7000; g_DOT_ZHI = 13000; g_dot_i0 = 0; g_dot_j0 = 0; g_dot_ni = 0; g_dot_nj = 0; g_dot_ok[0] = 0;   // orienteringspunkter: avstand (varldspix), zoom for borta / full styrka
g_bv_x = 0; g_bv_y = 0; g_SHOT_BOOST = 1; g_FILL_EXPAND = 1; g_SV_SOLID = 18; g_tp_n = 0; g_tp_x[0] = 0; g_tp_y[0] = 0; g_tp_tri[0] = 0; g_wf_n = 0; g_wf_tri[0] = 0; g_wf_col[0] = 0; g_sf_n[0] = 0; g_sf_t[0, 0] = 0;
g_PU_STRIDE = 12; g_DRIFT_SIDE = 0.6; g_TR_WSCALE = 1; g_pause_opts = false; g_pm_sn = 0; g_pm_ss = 0; g_pm_sd = 0; g_cam_n_prev = -1; g_cam_tr = 0; g_cam_sz = 17694; g_cam_scx = 0; g_cam_scy = 0; g_CAM_TRANS = 100; g_CAM_K = 0.045;   // STRIDE = platser i g_sv per powerup (upp till 12 parametrar); mjuk kamerazoom: ticks och andel per tick
g_RG_AUTO = 150;   // Railgun: ticks (3 s) fulladdad innan den avfyras av sig sjalv
 g_bm_cur = 0; g_bm_on[0] = false; g_ship_nose[0] = 0; g_sd_x1 = 0; g_sd_y1 = 0; g_sd_x2 = 0; g_sd_y2 = 0; g_pu_on = false; g_pu_x = 0; g_pu_y = 0; g_pu_type = 0; g_pu_timer = -1; g_PU_RADIUS = 36; g_PU_WALL = 20; g_PU_FIRST = 250; g_PU_RESPAWN = 500; g_mn_opts_node = -1; g_mn_pu_node = -1; g_mn_pu_linked = false;
 g_SAUSAGE = 15;
g_SV_ADLIVES = 12;
g_match_map = ""; // spellista: namn, ljudresurs och om det finns forberedda equalizerdata (scr_data_musicviz) for latan
g_trk_n = 1; g_trk_idx = 0; g_trk_fps[0] = 50; g_tv_n[0] = 1; g_tv[0, 0] = "";
g_trk_name[0] = "3LE - DAS BRATWURST (DNB EDIT)"; g_trk_snd[0] = snd_title_music; g_trk_viz[0] = true;
g_ct_x = 0; g_ct_y = 0; g_RESPAWN_DELAY = 150;   // ticks (3 s vid 50 steg/s) mellan forlorat liv och aterskapning
 g_pv_idx = -1; g_ld_x = 0; g_ld_y = 0; g_ld_w = 740; g_ld_h = 450; g_ed_ldsel = 0; g_ed_ldtop = 0; g_ed_ldclick = 0; g_mi_u = false; g_mi_d = false; g_mi_prevy[0] = 0; g_mi_prevy[1] = 0; g_mi_prevy[2] = 0; g_mi_prevy[3] = 0; g_end_timer = -1; g_END_DELAY = 200;   // 4 s mellan sista dodsfallet och rundresultatet
g_sv[g_SV_ADLIVES] = 1; g_game_mode = 0; g_lives_max = 6; g_mn_map_node2 = -1; g_proj_hs = 1;
// Astro Duel (D-023): antal skott per laddning och nedkylning i ticks (4 s vid 50 steg/s)
g_AD_SHOTS = 3; g_AD_COOLDOWN = 200; g_pj_hit = noone; g_pj_x = 0; g_pj_y = 0; g_pj_r = 0; g_pj_owner = 0; g_pj_age = 0;
g_mv_on = false; g_mv_n = 1; g_mv_dur = 1; g_mv_frame[0] = "000000000000";
for (g_tmp_n = 0; g_tmp_n < 12; g_tmp_n += 1) { g_mv[g_tmp_n] = 0; }
g_SHIP_GRAV = 0;   // skeppens gravitation (originalet 31 efter skalning; D-024: 0 pa begaran)
g_bg_t = 0; g_SV_MAP2 = 13; g_sv[g_SV_MAP2] = 0; g_lv_modes[0] = 15; g_ed_modes = 15; g_ed_dlg = 0; g_ed_dname = ""; g_ed_dmsg = ""; g_dg_x = 0; g_dg_y = 0; g_dg_w = 520; g_dg_h = 400; g_mn_mode[0] = 0;
g_mode_name[0] = "CLASSIC"; g_mode_name[1] = "GALAXY DUEL"; g_mode_name[2] = "RACE"; g_mode_name[3] = "CAPTURE THE BRATWURST (SOON)"; g_mw_frame[0] = "";
for (g_tmp_n = 0; g_tmp_n < 32; g_tmp_n += 1) { g_mw[g_tmp_n] = 0; g_mw_pk[g_tmp_n] = 0; }
for (g_tmp_n = 0; g_tmp_n < 192; g_tmp_n += 1) { g_mw_hist[g_tmp_n] = 0; } g_lg_n[0] = 0; g_lg_s[0, 0] = 0; g_tt_sx[0] = 0; g_tt_sy[0] = 0; g_tt_st[0] = 0; g_tt_sp[0] = 0; g_tt_dx[0] = 0; g_tt_dy[0] = 0; g_tt_n = 0;
g_DB_MAX = 40; g_db_x[0] = 0; g_db_y[0] = 0; g_db_hx[0] = 0; g_db_hy[0] = 0; g_db_vx[0] = 0; g_db_vy[0] = 0; g_db_w[0] = 0; g_db_col[0] = 0; g_db_life[0] = 0;
g_SP_MAX = 400; g_sp_next = 0; g_sp_x[0] = 0; g_sp_y[0] = 0; g_sp_vx[0] = 0; g_sp_vy[0] = 0; g_sp_col[0] = 0; g_sp_size[0] = 2; g_sp_life[0] = 0; g_SV_SFX = 11;
g_sv[g_SV_SFX] = 1; g_sfx_ch[0] = -1; g_sfx_ch[1] = -1; g_sfx_ch[2] = -1;
g_sv[g_SV_MUSIC] = 1; g_sv[g_SV_VOL] = 7; g_music_id = -1;
g_sv[g_SV_ROUNDS] = 3; g_round = 1; g_rounds_total = 3; g_round_timer = 0; g_res_sel = 0;
g_wins[0] = 0; g_wins[1] = 0; g_wins[2] = 0; g_wins[3] = 0;
g_sv[g_SV_MAP] = 0;
g_lv_count = 0; g_mn_map_node = -1; g_ed_n = 0; g_ed_cn = 0; g_ed_bset = false; g_ed_dirty = false; g_ed_snap = 50;
g_ed_sx[0] = 0; g_ed_sy[0] = 0; g_ed_sa[0] = 0; g_ed_name = ""; g_ed_msg = ""; g_ed_msgt = 0; g_ed_cdel = 0; g_ed_cesc = 0;
g_vx = 0; g_vy = 0; g_vw = 1024; g_vh = 640;
g_acc_name[0] = "RED"; g_acc_name[1] = "ORANGE"; g_acc_name[2] = "YELLOW"; g_acc_name[3] = "GREEN"; g_acc_name[4] = "CYAN"; g_acc_name[5] = "BLUE"; g_acc_name[6] = "MAGENTA";
g_scale_name[0] = "1X"; g_scale_name[1] = "1.5X"; g_scale_name[2] = "2X"; g_scale_name[3] = "FULLSCREEN";
g_keyhint[0] = "ARROWS + ENTER";
g_keyhint[1] = "WASD + E";
g_keyhint[2] = "IJKL + U";
g_keyhint[3] = "GAMEPAD 4: D-PAD + A";
g_nv_px[0] = 0; g_nv_px[1] = 0; g_nv_px[2] = 0; g_nv_px[3] = 0;
g_nv_py[0] = 0; g_nv_py[1] = 0; g_nv_py[2] = 0; g_nv_py[3] = 0;
g_nv_up = false; g_nv_down = false; g_nv_left = false; g_nv_right = false; g_nv_ok = false; g_nv_back = false; g_nv_any = false;
// Gamepadknappar som raknas som "valfri knapp" pa titelskarmen
g_nv_btn[0] = gp_face1; g_nv_btn[1] = gp_face2; g_nv_btn[2] = gp_face3; g_nv_btn[3] = gp_face4;
g_nv_btn[4] = gp_shoulderl; g_nv_btn[5] = gp_shoulderr; g_nv_btn[6] = gp_shoulderlb; g_nv_btn[7] = gp_shoulderrb;
g_nv_btn[8] = gp_select; g_nv_btn[9] = gp_start; g_nv_btn[10] = gp_stickl; g_nv_btn[11] = gp_stickr;
g_nv_btn[12] = gp_padu; g_nv_btn[13] = gp_padd; g_nv_btn[14] = gp_padl; g_nv_btn[15] = gp_padr;
g_mn_depth = 0;
g_mn_cnt = 0;
g_hud_slot = 0;
g_hud_id = noone;
g_c[0] = c_black; g_c[1] = c_black; g_c[2] = c_black; g_c[3] = c_gray; g_c[4] = c_ltgray; g_c[5] = c_white; g_c[6] = c_white; g_c[7] = c_white;
g_c[8] = c_red; g_c[9] = c_orange; g_c[10] = c_yellow; g_c[11] = c_lime; g_c[12] = c_aqua; g_c[13] = c_blue; g_c[14] = c_fuchsia; g_c[15] = c_maroon;
g_acc = c_lime;
// Skepp mot skepp (D-018, PLACEHOLDER-varden att justera efter spelkansla): studs 0..1, knuffmultiplikator for boostande skepp, hur lange (ticks) ett
// skepp raknas som boostande efter TURBO BOOST, och maxfart (1/256 px per tick) efter en krock.
g_COL_REST = 0.7; g_COL_BOOST = 1.6; g_COL_TICKS = 30; g_COL_VMAX = 16000; g_col_id[0] = noone;
g_wall_gn = 1; g_wall_grp[0] = 0; g_wall_tmp[0] = 0;
for (g_tmp_n = 0; g_tmp_n < 11; g_tmp_n += 1) { g_wcol[g_tmp_n] = c_white; }
g_pc[0] = c_aqua; g_pc[1] = c_yellow; g_pc[2] = c_lime; g_pc[3] = c_fuchsia;
g_f_sm = 0; g_f_md = 1; g_f_lg = 2; g_f_xl = 3; g_fs = 1; g_fk = 0; g_k = 1;   // g_fnt[] fylls i scr_font_init
globalvar g_AD_SLOW, g_AD_DMG_TICKS, g_AD_GRACE;
g_AD_GRACE = 25;   // Galaxy Duel: efter en traff raknas inga fler traffar under 0,5 s (en salva med flera skott ska inte doda direkt)
g_AD_SLOW = 0.4;   // Galaxy Duel: skadat skepp har 40 % av normal fart och gas (60 % langsammare, D-051)
g_AD_DMG_TICKS = 300;   // skadan varar 6 s (50 ticks/s) och repareras sedan sjalv
globalvar g_DRIFT_FUEL, g_DRIFT_RECHARGE;
g_DRIFT_FUEL = 400;   // Drifting fuel (D-052): full matare = 8 s (400 ticks), andras av Powerup Editor -> DRIFT -> DRIFTING FUEL (scr_drift_apply)
g_DRIFT_RECHARGE = 300;   // tom matare laddas pa exakt 6 s (300 ticks) och drift ar avstangd under tiden
globalvar g_SV_MAP3, g_SV_LAPS, g_SV_PURA, g_mn_map_node3, g_race_t, g_race_target;
g_SV_MAP3 = 60; g_SV_LAPS = 61; g_SV_PURA = 62;   // Race (D-053): bana, antal varv, powerups pa/av (g_sv-index efter powerup-parametrarna)
g_mn_map_node3 = -1; g_race_t = 0; g_race_target = 3;
g_sv[g_SV_MAP3] = 0; g_sv[g_SV_LAPS] = 3; g_sv[g_SV_PURA] = 0;
globalvar g_ed_fon, g_ed_fx0, g_ed_fy0, g_ed_fx1, g_ed_fy1, g_ed_fdir, g_fin_on, g_fin_x0, g_fin_y0, g_fin_x1, g_fin_y1, g_fin_cx, g_fin_cy, g_fin_dx, g_fin_dy, g_fin_hw, g_fin_dir;
g_ed_fon = false; g_ed_fx0 = 0; g_ed_fy0 = 0; g_ed_fx1 = 0; g_ed_fy1 = 0; g_ed_fdir = 1;   // Race (D-054): start/malrutan i redigeraren (varldspixlar, riktning 0 upp, 1 hoger, 2 ner, 3 vanster)
g_fin_on = false; g_fin_x0 = 0; g_fin_y0 = 0; g_fin_x1 = 0; g_fin_y1 = 0; g_fin_cx = 0; g_fin_cy = 0; g_fin_dx = 1; g_fin_dy = 0; g_fin_hw = 0; g_fin_dir = 1;
globalvar g_RACE_SLOW, g_RACE_SLOW_TICKS;
g_RACE_SLOW = 0.2;   // Race (D-055): ett vapen som traffar ger 20 % av normal fart ...
g_RACE_SLOW_TICKS = 150;   // ... i 3 s (50 ticks/s); ny traff startar om tiden
