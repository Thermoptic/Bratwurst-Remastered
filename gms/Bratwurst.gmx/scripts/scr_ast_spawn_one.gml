/// scr_ast_spawn_one()
// Asteroids: en stor sten som flyger in fran en slumpad kant: startar strax utanfor banans kant och far en riktning inat (inom ca 40 grader fran kantens normal)
// med fart 0,9-1,6 px/tick gange g_AS_SPEED (1,5) och vagens okning (6 % per vag, hogst 8 gangar). Anvands av vagorna och av den stadiga stromen (scr_ast_step).
var side, sx, sy, nx, ny, a, sp, mult, rr;
mult = 1 + 0.06 * min(g_as_wave - 1, 8);
rr = g_AS_R[0] + 30;
side = irandom(3);
if (side == 0) { sx = g_as_x0 - rr; sy = random_range(g_as_y0, g_as_y1); nx = 1; ny = 0; }
if (side == 1) { sx = g_as_x1 + rr; sy = random_range(g_as_y0, g_as_y1); nx = -1; ny = 0; }
if (side == 2) { sx = random_range(g_as_x0, g_as_x1); sy = g_as_y0 - rr; nx = 0; ny = 1; }
if (side == 3) { sx = random_range(g_as_x0, g_as_x1); sy = g_as_y1 + rr; nx = 0; ny = -1; }
a = arctan2(ny, nx) + random_range(-0.7, 0.7);
sp = random_range(0.9, 1.6) * mult * g_AS_SPEED * min(scr_ast_mult(), 8);   // niva dubblar farten, hogst 8 gangar
scr_ast_new(sx, sy, cos(a) * sp, sin(a) * sp, 0);
