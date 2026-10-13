/// scr_shot_step()
// Kors i obj_shot, en tick. Originalets kanonskott (hunk0 0x5e7c-0x6076, docs/15):
//   vy += 25; x += vx; y += vy;  utanfor skarmen (0..319 x 0..235) -> bort; i vagg -> bort;
//   i ett skepp -> energi -1, hastighetsimpuls v += (skottv - v) >> BOUNCE, skottet bort.
var wx, wy, sxs, sys, tol, hit;
vy += g_SHOT_GRAV;
px += vx;
py += vy;
wx = floor(px / 256);
wy = floor(py / 256);
sxs = scr_w2s_x(wx);
sys = scr_w2s_y(wy);
if (sxs < 0 || sxs > g_PLAY_W - 1 || sys < 0 || sys > g_PLAY_H - 1) { instance_destroy(); exit; }

tol = max(1, 32768 / g_zoom);   // en skarmpixel i varldspixlar
// svep fran forra tickens position (px - vx, py - vy) sa att snabba skott inte flyger igenom tunna vaggar
if (scr_seg_hits_wall(floor((px - vx) / 256), floor((py - vy) / 256), wx, wy, tol))
{
    scr_spark_burst(wx, wy, 5 + irandom(3), 1.6, g_c[10]);   // gnistor dar skottet slar i vaggen
    instance_destroy();
    exit;
}

hx = wx;
hy = wy;
if (!variable_instance_exists(id, "sage")) { sage = 0; }
sage += 1;
g_hit_id = noone;
if (g_game_mode == 1)
{
    // Astro Duel: svept test med 30 % storre projektil
    g_hit_id = scr_proj_hit(floor((px - vx) / 256), floor((py - vy) / 256), wx, wy, scr_proj_radius(), owner, sage);
}
else
{
    with (obj_player)
    {
        if (alive && g_hit_id == noone)
        {
            if (scr_point_in_ship(other.hx, other.hy)) { g_hit_id = id; }
        }
    }
}
if (g_hit_id != noone)
{
    scr_spark_burst(wx, wy, 6 + irandom(3), 1.7, scr_slot_colour(g_hit_id.slot));   // gnistor dar skottet traffar
    scr_sfx_play(snd_sfx_hit, 2, 0.41);   // original: kanonskott traffar skepp, volym 26/64 (0x5e48)
    with (g_hit_id)
    {
        if (g_game_mode == 1) { energy = 0; } else { energy -= 1; }   // Astro Duel: varje traff tar ett liv
        vx += floor((other.vx - vx) / power(2, bounce));
        vy += floor((other.vy - vy) / power(2, bounce));
        if (energy <= 0)
        {
            scr_player_lose_life();   // exploderar, tar ett liv och startar nedrakningen
        }
    }
    instance_destroy();
}
