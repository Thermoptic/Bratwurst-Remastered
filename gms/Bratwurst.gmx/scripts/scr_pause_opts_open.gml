/// scr_pause_opts_open()
// Oppnar Options fran pausmenyn (D-038): samma menytrad som i huvudmenyn, men roten ar OPTIONS och Esc/B pa oversta nivan lamnar tillbaka till pausmenyn.
// Menyns stack sparas och aterstalls av scr_pause_opts_close. Banredigeraren (Map Editor) ar inte tillganglig under en match.
g_pm_sd = g_mn_depth;
g_pm_sn = g_mn_stk_node[0];
g_pm_ss = g_mn_stk_sel[0];
g_mn_depth = 0;
g_mn_stk_node[0] = g_mn_opts_node;
g_mn_stk_sel[0] = 0;
g_pause_opts = true;
