/// scr_ast_spawn_wave()
// Asteroids: en ny vag stora stenar flyger in fran kanterna: (6 + 2 per vag) * nivafaktorn stenar (niva 1: 6, 8, 10 ... hogst 14; niva 3 gange 4, niva 5 gange 16),
// aldrig fler an att poolen racker till (g_AS_MAX / 5). Varje sten startar strax utanfor kanten och flyger inat (scr_ast_spawn_one).
var n, i, m;
m = scr_ast_mult();
g_as_wave += 1;
n = min(g_AS_MAXN * m, floor(g_AS_MAX / 5), (g_AS_START + 2 * (g_as_wave - 1)) * m);
for (i = 0; i < n; i += 1) { scr_ast_spawn_one(); }
g_as_trk = 0;
