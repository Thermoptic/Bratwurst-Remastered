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
if (scr_point_hits_wall(wx, wy, tol)) { instance_destroy(); exit; }

hx = wx;
hy = wy;
g_hit_id = noone;
with (obj_player)
{
    if (alive && g_hit_id == noone)
    {
        if (scr_point_in_ship(other.hx, other.hy)) { g_hit_id = id; }
    }
}
if (g_hit_id != noone)
{
    with (g_hit_id)
    {
        energy -= 1;
        vx += floor((other.vx - vx) / power(2, bounce));
        vy += floor((other.vy - vy) / power(2, bounce));
        if (energy <= 0)
        {
            p_lives -= 1;
            if (p_lives > 0) { scr_player_respawn(); }
            else { alive = false; }
        }
    }
    instance_destroy();
}
