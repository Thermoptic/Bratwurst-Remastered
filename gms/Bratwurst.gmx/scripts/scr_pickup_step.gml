/// scr_pickup_step()
// Race (D-056, steg 4): kors varje tick. Pickuppunkterna (g_pk_*) ar aktiva fran racets start. Rors en punkt av ett levande skepp som inte ar klart (skeppets
// mittpunkt eller nagon konturpunkt inom g_PU_RADIUS) forsvinner den i g_PK_RESPAWN ticks (5 s) och kommer tillbaka pa samma plats; skeppet far sitt foremal
// (scr_pickup_grant). Beror flera skepp punkten samma tick far det narmaste den (aldrig tva).
var i, j;
for (i = 0; i < g_pk_n; i += 1)
{
    if (!g_pk_on[i])
    {
        g_pk_t[i] -= 1;
        if (g_pk_t[i] <= 0) { g_pk_on[i] = true; }
    }
    else
    {
        g_pk_who = noone;
        g_pk_bd = 999999;
        g_pk_cx = g_pk_x[i];
        g_pk_cy = g_pk_y[i];
        with (obj_player)
        {
            if (alive && !race_fin)
            {
                g_pk_dd = point_distance(floor(px / 256), floor(py / 256), g_pk_cx, g_pk_cy);
                for (j = 0; j < np; j += 1) { g_pk_dd = min(g_pk_dd, point_distance(ow_x[j], ow_y[j], g_pk_cx, g_pk_cy)); }
                if (g_pk_dd <= g_PU_RADIUS && g_pk_dd < g_pk_bd) { g_pk_bd = g_pk_dd; g_pk_who = id; }
            }
        }
        if (g_pk_who != noone)
        {
            g_pk_on[i] = false;
            g_pk_t[i] = g_PK_RESPAWN;
            with (g_pk_who) { scr_pickup_grant(); }
        }
    }
}
