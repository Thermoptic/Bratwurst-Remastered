/// scr_game_step()
// En speltick. Ordning efter originalets huvudloop (docs/15): indata -> spelare -> specialvapenobjekt -> skott -> kamera -> slutkontroll.
// OBS: originalet kor "antal forlorade tick" steg per loopvarv; prototypen kor exakt 1 tick per rumssteg (PLACEHOLDER).
// g_state: 10 = titel, 11 = huvudmeny, 0 = skeppsval, 1 = match, 2 = matchen slut.
var gi;
scr_nav_input();
g_bg_t += 1;   // fortlopande klocka for menybakgrunden
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

// Match: Esc eller Start oppnar pausmenyn (RESUME GAME / QUIT TO MENU); medan den ar oppen star spelet stilla
if (g_state == 1)
{
    if (g_paused)
    {
        with (obj_player)
        {
            drifting = false;
            scr_drift_sound();
            if (rg_snd >= 0) { audio_stop_sound(rg_snd); rg_snd = -1; }   // railgunens laddljud tystnar under paus
        }   // driftljudet tonas ut under paus
        if (g_pause_opts) { scr_mn_step(); exit; }   // Options inne i pausmenyn (D-038)
        scr_pause_step();
        exit;
    }
    if (keyboard_check_pressed(vk_escape))
    {
        g_paused = true; g_pause_sel = 0; exit;
    }
    for (gi = 0; gi < 4; gi += 1)
    {
        if (gamepad_is_connected(gi) && gamepad_button_check_pressed(gi, gp_start)) { g_paused = true; g_pause_sel = 0; exit; }
    }
}
// Skeppsval och rundresultat: Esc = huvudmenyn
if (keyboard_check_pressed(vk_escape)) { scr_goto_main(); exit; }
if (keyboard_check_pressed(vk_f1)) { g_debug = !g_debug; }
if (keyboard_check_pressed(vk_f2)) { scr_menu_enter(); exit; }

// Xbox: Start = tillbaka till skeppsvalet (rundresultat; under match oppnar Start pausmenyn)
for (gi = 0; gi < 4; gi += 1)
{
    if (gamepad_is_connected(gi))
    {
        if (g_state != 0 && g_state != 1 && gamepad_button_check_pressed(gi, gp_start)) { scr_menu_enter(); exit; }
    }
}

if (g_state == 0) { scr_menu_step(); exit; }
if (g_state == 2)
{
    with (obj_player) { if (rg_snd >= 0) { audio_stop_sound(rg_snd); rg_snd = -1; } }   // inget laddljud efter rundslutet
    scr_round_over_step();
    exit;
}   // rundresultat visas
if (g_state != 1) { exit; }

g_tick += 1;
with (obj_player) { scr_player_step(); }
scr_ship_collisions();
scr_spark_step();
scr_debris_step();   // skepp mot skepp (D-018)
with (obj_missile) { scr_missile_step(); }
with (obj_shot) { scr_shot_step(); }
scr_powerup_step();   // powerup-orben: spawn, upplockning, nedrakning (D-035)
scr_beam_step();   // railgunstralar (D-036)
g_shake_amp *= 0.9;   // kameraskakningen klingar av (ca 0,4 s)
if (g_shake_amp < 0.3) { g_shake_amp = 0; }
with (obj_fx) { scr_fx_damage(); ftimer += 1; if (ftimer > fmax) { instance_destroy(); } }
scr_camera_update();

// Slutkontroll (bara om fler an en spelare): den sista overlevande vinner (originalet: kod 0x498).
// Nar bara en (eller ingen) ar kvar startar en nedrakning pa g_END_DELAY ticks (4 s); spelet fortsatt som vanligt under tiden (explosionen spelas
// klart, man kan flyga runt). Nar den ar slut visas rundresultatet; vinnaren ar den som da ar kvar (ingen om ingen ar kvar).
if (g_n_players > 1)
{
    if (g_end_timer < 0 && scr_count_alive() <= 1) { g_end_timer = g_END_DELAY; }
    if (g_end_timer >= 0)
    {
        g_end_timer -= 1;
        if (g_end_timer < 0)
        {
            g_state = 2;
            g_winner = scr_last_alive();
            g_round_timer = 0;
            g_end_timer = -1;
            if (g_winner >= 0) { g_wins[g_winner] += 1; }
        }
    }
}
