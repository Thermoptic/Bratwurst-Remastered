/// scr_nearest_player(ref_x24, ref_y24, exclude_slot)
// Hittar narmaste levande spelare till en punkt (24.8-enheter), som originalets malsokning (hunk0 0x6cd8, 0x7052, 0x6406).
// dx,dy = (ref - spelare) >> 8 (heltalspixlar). exclude_slot = -1 tar med alla (guidad missil gor det i originalet).
// Resultat i g_near_id (noone om ingen), g_near_dx, g_near_dy, g_near_d2.
g_near_id = noone;
g_near_d2 = 2147483647;
g_near_dx = 0;
g_near_dy = 0;
g_ref_x = argument0;
g_ref_y = argument1;
g_ref_slot = argument2;
with (obj_player)
{
    if (alive && slot != g_ref_slot)
    {
        var ddx, ddy, dd2;
        ddx = floor((g_ref_x - px) / 256);
        ddy = floor((g_ref_y - py) / 256);
        dd2 = ddx * ddx + ddy * ddy;
        if (dd2 <= g_near_d2)
        {
            g_near_d2 = dd2;
            g_near_id = id;
            g_near_dx = ddx;
            g_near_dy = ddy;
        }
    }
}
