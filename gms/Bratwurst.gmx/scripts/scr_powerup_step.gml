/// scr_powerup_step()
// Kors varje matchtick (obj_game). Nedrakning till nasta powerup (5 s efter start, 10 s efter att en tagits upp), spawn och upplockning: ett skepp som
// nuddar ikonen (nagon av dess punkter inom g_PU_RADIUS) far powerupen (pu_have) och en ny dyker upp efter g_PU_RESPAWN ticks pa en ny plats.
if (g_pu_timer < 0 && !g_pu_on) { exit; }
if (!scr_powerup_enabled()) { g_pu_on = false; g_pu_timer = -1; exit; }
if (g_end_timer >= 0) { exit; }   // rundan ar over
if (!g_pu_on)
{
    g_pu_timer -= 1;
    if (g_pu_timer <= 0) { scr_powerup_spawn(); }
    exit;
}
g_hit_id = noone;
g_pj_x = g_pu_x;
g_pj_y = g_pu_y;
with (obj_player)
{
    if (alive && g_hit_id == noone)
    {
        var jj;
        for (jj = 0; jj < np; jj += 1)
        {
            if (point_distance(ow_x[jj], ow_y[jj], g_pj_x, g_pj_y) <= g_PU_RADIUS) { g_hit_id = id; break; }
        }
        if (g_hit_id == noone && point_distance(floor(px / 256), floor(py / 256), g_pj_x, g_pj_y) <= g_PU_RADIUS) { g_hit_id = id; }
    }
}
if (g_hit_id != noone)
{
    g_hit_id.pu_have = g_pu_type + 1;
    g_pu_on = false;
    g_pu_timer = g_PU_RESPAWN;
    scr_sfx_play(snd_sfx_hit, 2, 0.6);
}
