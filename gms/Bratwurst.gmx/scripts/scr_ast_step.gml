/// scr_ast_step()
// Asteroids (D-046): en tick (niva 1-5 dubblar allt, se scr_ast_mult). Stenarna ror sig och roterar och kommer in pa motsatt sida om de lamnar banans ruta (som kantvarvet i originalet); nya vagor kommer
// 1,5 sekunder efter att alla stenar ar borta (forsta vagen 1 s efter start) och en stadig strom nya stora stenar halls igang. Skott och missiler som traffar en sten delar den (scr_ast_hit); en sten som traffar ett skepp ger
// skada (stor 10, mellan 5, liten 1), knuffar skeppet bort, ger 40 ticks skydd mot nya stenskador (ast_cd) och stenen delas (stor/mellan) eller gar sonder (liten) som om den blivit skjuten. Kors i obj_game fran scr_game_step i spellage 4.
var k, active, rr, w, h, j, dx, dy, dl, ax, ay, rad, hitj, m, spd0;
m = scr_ast_mult();   // nivafaktor 1, 2, 4, 8 eller 16
w = g_as_x1 - g_as_x0;
h = g_as_y1 - g_as_y0;
active = 0;
for (k = 0; k < g_AS_MAX; k += 1)
{
    if (g_as_on[k])
    {
        active += 1;
        g_as_x[k] += g_as_vx[k];
        g_as_y[k] += g_as_vy[k];
        g_as_a[k] += g_as_sp[k];
        rr = g_AS_R[g_as_sz[k]] + 40;
        if (g_as_x[k] < g_as_x0 - rr - 20) { g_as_x[k] += w + 2 * rr + 40; }
        if (g_as_x[k] > g_as_x1 + rr + 20) { g_as_x[k] -= w + 2 * rr + 40; }
        if (g_as_y[k] < g_as_y0 - rr - 20) { g_as_y[k] += h + 2 * rr + 40; }
        if (g_as_y[k] > g_as_y1 + rr + 20) { g_as_y[k] -= h + 2 * rr + 40; }
    }
}
// vagor: tom bana -> nedrakning -> ny vag
if (active == 0)
{
    if (g_as_timer < 0) { g_as_timer = max(10, round(g_AS_GAP / m)); }
    else
    {
        g_as_timer -= 1;
        if (g_as_timer <= 0) { scr_ast_spawn_wave(); g_as_timer = -1; }
    }
}
else
{
    // stadig strom: medan det finns stenar kommer en ny stor sten var g_AS_TRICKLE:e tick (6 s) om det finns fa (< 10) och plats i poolen, sa att banan aldrig blir tom lange
    g_as_trk += 1;
    if (g_as_trk >= max(20, round(g_AS_TRICKLE / m)) && active < min(10 * m, g_AS_MAX - 60)) { scr_ast_spawn_one(); g_as_trk = 0; }
}
// skott
with (obj_shot)
{
    k = scr_ast_test(floor((px - vx) / 256), floor((py - vy) / 256), floor(px / 256), floor(py / 256), 2);
    if (k >= 0)
    {
        scr_ast_hit(k, 0);
        instance_destroy();
    }
}
// missiler, guidade missiler och Mini Nuke
with (obj_missile)
{
    k = scr_ast_test(floor((px - vx) / 256), floor((py - vy) / 256), floor(px / 256), floor(py / 256), 4);
    if (k >= 0)
    {
        scr_ast_hit(k, 0);
        scr_fx_spawn(px, py, mtype + (mtype == 3), 1);   // mtype 3 (Mini Nuke) ger explosionstyp 4
        instance_destroy();
    }
}
// skepp
with (obj_player)
{
    if (ast_cd > 0) { ast_cd -= 1; }
    if (alive && ast_cd <= 0)
    {
        hitj = -1;
        for (j = 0; j < g_AS_MAX; j += 1)
        {
            if (hitj < 0 && g_as_on[j])
            {
                ax = g_as_x[j];
                ay = g_as_y[j];
                rad = g_AS_R[g_as_sz[j]] * 0.85;
                spd0 = sqrt(g_as_vx[j] * g_as_vx[j] + g_as_vy[j] * g_as_vy[j]);
                if (point_distance(floor(px / 256), floor(py / 256), ax, ay) <= rad + 70 + spd0)
                {
                    if (scr_point_in_ship(ax, ay)) { hitj = j; }
                    else
                    {
                        // svept test: stenens rorelse senaste tick (fran forra till nuvarande position) mot skeppets hornpunkter, sa att snabba stenar inte flyger igenom
                        for (k = 0; k < np; k += 1)
                        {
                            if (scr_seg_dist(ow_x[k], ow_y[k], ax - g_as_vx[j], ay - g_as_vy[j], ax, ay) <= rad) { hitj = j; break; }
                        }
                    }
                }
            }
        }
        if (hitj >= 0)
        {
            ax = g_as_x[hitj];
            ay = g_as_y[hitj];
            dx = px / 256 - ax;
            dy = py / 256 - ay;
            dl = max(1, sqrt(dx * dx + dy * dy));
            vx += dx / dl * g_AS_KB[g_as_sz[hitj]];
            vy += dy / dl * g_AS_KB[g_as_sz[hitj]];
            energy -= g_AS_DMG[g_as_sz[hitj]];
            ast_cd = 40;
            scr_spark_burst(floor(px / 256), floor(py / 256), 14, 2.2, scr_slot_colour(slot));
            scr_sfx_play(snd_sfx_crash, 2, 0.8);
            scr_ast_hit(hitj, 0);   // stenen delas eller gar sonder (liten) av kollisionen, som om den blivit skjuten
            if (energy <= 0) { scr_player_lose_life(); }
        }
    }
}
