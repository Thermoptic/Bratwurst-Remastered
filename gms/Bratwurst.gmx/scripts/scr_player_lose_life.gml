/// scr_player_lose_life()
// Kors i obj_player nar energin ar slut. Tar ett liv; finns liv kvar startar en nedrakning (g_RESPAWN_DELAY ticks, 3 s) och skeppet aterskapas
// pa startplatsen nar den ar slut (se scr_player_step). Utan liv kvar ar spelaren eliminerad. Under nedrakningen ar skeppet inte i spel (alive = false)
// men raknas som kvar i rundan (scr_count_alive). Panelen visar siffran i stallet for skeppsbilden.
if (g_game_mode == 3) { scr_ctb_death(); }   // Capture the Bratwurst: slapp korven, kill-statistik (D-082)
scr_ship_explode();
if (g_game_mode != 3) { p_lives -= 1; }   // Capture the Bratwurst: obegransad respawn, inga liv tar slut (D-080)
pu_have = 0;      // en hallen powerup (och en pagaende railgunladdning) forloras
pu_charge = 0;
pu_auto = 0;
if (rg_snd >= 0) { audio_stop_sound(rg_snd); rg_snd = -1; }
alive = false;
if (p_lives > 0) { respawn_t = g_RESPAWN_DELAY; }
else { respawn_t = 0; }
if (g_game_mode == 5)
{
    sw_oob = -1;   // Super Smashwurst (D-085): nedrakningen avslutas vid varje dod
    if (p_lives <= 0) { g_sw_msg = "PLAYER " + string(slot + 1) + " IS ELIMINATED"; g_sw_msgt = 150; g_sw_msgc = scr_slot_colour(slot); }
}
