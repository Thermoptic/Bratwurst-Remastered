/// scr_game_step()
// En speltick. Ordning efter originalets huvudloop (docs/15): indata -> spelare -> specialvapenobjekt -> skott -> kamera -> slutkontroll.
// OBS: originalet kor "antal forlorade tick" steg per loopvarv; prototypen kor exakt 1 tick per rumssteg (PLACEHOLDER).
// g_state: 10 = titel, 11 = huvudmeny, 0 = skeppsval, 1 = match, 2 = matchen slut.
var gi;
scr_nav_input();
scr_music_update();
scr_musicviz_update();

// Titelskarm: valfri tangent/knapp -> huvudmeny, Esc = avsluta
if (g_state == 10)
{
    g_menu_tick += 1;
    if (keyboard_check_pressed(vk_escape)) { game_end(); exit; }
    if (g_nv_any) { g_state = 11; g_menu_tick = 0; }
    exit;
}
if (g_state == 11) { scr_mn_step(); exit; }
if (g_state == 20) { scr_ed_step(); exit; }   // banredigeraren
if (g_state == 30) { scr_results_step(); exit; }   // slutresultat

// Skeppsval och match: Esc = huvudmenyn
if (keyboard_check_pressed(vk_escape)) { scr_goto_main(); exit; }
if (keyboard_check_pressed(vk_f1)) { g_debug = !g_debug; }
if (keyboard_check_pressed(vk_f2)) { scr_menu_enter(); exit; }
if (keyboard_check_pressed(vk_f5)) { scr_players_set((g_n_players mod 4) + 1); scr_menu_enter(); exit; }   // cykla 1 -> 2 -> 3 -> 4 spelare

// Xbox: Start = tillbaka till skeppsvalet, Back = cykla antal spelare 1-4
for (gi = 0; gi < 4; gi += 1)
{
    if (gamepad_is_connected(gi))
    {
        if (g_state != 0 && gamepad_button_check_pressed(gi, gp_start)) { scr_menu_enter(); exit; }
        if (gamepad_button_check_pressed(gi, gp_select)) { scr_players_set((g_n_players mod 4) + 1); scr_menu_enter(); exit; }
    }
}

if (g_state == 0) { scr_menu_step(); exit; }
if (g_state == 2) { scr_round_over_step(); exit; }   // rundresultat visas
if (g_state != 1) { exit; }

g_tick += 1;
with (obj_player) { scr_player_step(); }
scr_ship_collisions();
scr_spark_step();
scr_debris_step();   // skepp mot skepp (D-018)
with (obj_missile) { scr_missile_step(); }
with (obj_shot) { scr_shot_step(); }
with (obj_fx) { ftimer += 1; if (ftimer > fmax) { instance_destroy(); } }
scr_camera_update();

// Slutkontroll (bara om fler an en spelare): den sista overlevande vinner (originalet: kod 0x498).
if (g_n_players > 1)
{
    if (scr_count_alive() <= 1)
    {
        g_state = 2;
        g_winner = scr_last_alive();
        g_round_timer = 0;
        if (g_winner >= 0) { g_wins[g_winner] += 1; }
    }
}
