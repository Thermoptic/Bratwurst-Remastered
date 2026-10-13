/// scr_player_lose_life()
// Kors i obj_player nar energin ar slut. Tar ett liv; finns liv kvar startar en nedrakning (g_RESPAWN_DELAY ticks, 3 s) och skeppet aterskapas
// pa startplatsen nar den ar slut (se scr_player_step). Utan liv kvar ar spelaren eliminerad. Under nedrakningen ar skeppet inte i spel (alive = false)
// men raknas som kvar i rundan (scr_count_alive). Panelen visar siffran i stallet for skeppsbilden.
scr_ship_explode();
p_lives -= 1;
alive = false;
if (p_lives > 0) { respawn_t = g_RESPAWN_DELAY; }
else { respawn_t = 0; }
