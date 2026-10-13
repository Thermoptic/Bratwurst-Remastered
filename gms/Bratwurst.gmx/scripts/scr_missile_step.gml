/// scr_missile_step()
// Kors i obj_missile, en tick. Originalets specialvapenobjekt (hunk0 0x610c, handlers 0x63ea / 0x6406, docs/15 steg 5):
//   MISSILE:  x += v; timer -= 1; borta (explosion) nar timer <= 0 (50 ticks).
//   GUIDED:   timer += 1; timer < 0: rakt; timer >= 225: borta utan att rora sig; annars styr mot narmaste levande spelare
//             (OBS: inklusive agaren, som i originalet): v -= (d * F) >> 8, F = (108e6 + timer*0x493e0)/(d2 + 60000), |v| <= 0x1400.
//   Traff i vagg: explosion. Traff i skepp: position -= v, energi -12 (MISSILE) / -5 (GUIDED), impuls (v_obj - v)*16 >> BOUNCE.
var expired, wxp, wyp, tol, ff;
expired = false;
if (mtype == 1)
{
    px += vx;
    py += vy;
    mtimer -= 1;
    if (mtimer <= 0) { expired = true; }
}
if (mtype == 2)
{
    mtimer += 1;
    if (mtimer >= 225) { expired = true; }
    else
    {
        if (mtimer >= 0)
        {
            scr_nearest_player(px, py, -1);
            if (g_near_id != noone)
            {
                ff = floor((108000000 + mtimer * 300000) / (g_near_d2 + 60000));
                vx -= floor(g_near_dx * ff / 256);
                vx = max(-5120, min(5120, vx));
                vy -= floor(g_near_dy * ff / 256);
                vy = max(-5120, min(5120, vy));
            }
        }
        px += vx;
        py += vy;
    }
}
if (expired) { scr_fx_spawn(px, py, mtype); instance_destroy(); exit; }

wxp = floor(px / 256);
wyp = floor(py / 256);
tol = max(1, 32768 / g_zoom);
if (scr_point_hits_wall(wxp, wyp, tol)) { scr_fx_spawn(px, py, mtype); instance_destroy(); exit; }

hx = wxp;
hy = wyp;
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
    px -= vx;
    py -= vy;
    with (g_hit_id)
    {
        if (other.mtype == 1) { energy -= 12; } else { energy -= 5; }
        vx += floor((other.vx - vx) * 16 / power(2, bounce));
        vy += floor((other.vy - vy) * 16 / power(2, bounce));
    }
    scr_fx_spawn(px, py, mtype);
    instance_destroy();
}
