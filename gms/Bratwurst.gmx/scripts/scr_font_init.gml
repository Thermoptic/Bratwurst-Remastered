/// scr_font_init()
// Typsnittsresurser (Cascadia Mono, SIL OFL 1.1; genereras av tools/gen_gms_fonts.ps1). Fyra storlekar (sm/md/lg/xl) i fyra UI-skalor
// k = 1, 1.5, 2, 3 (g_fk = 0..3). Texten ritas 1:1 mot skarmpixlarna med den uppsattning som matchar skalan (scr_ui_dt), sa den blir skarp.
// g_fs = aktuell storlek (g_f_sm..g_f_xl = 0..3), t.ex. g_fs = g_f_sm. g_fnt[g_fk * 4 + g_fs] ar typsnittsresursen.
g_fnt[0] = fnt_sm_k10;
g_fnt[1] = fnt_md_k10;
g_fnt[2] = fnt_lg_k10;
g_fnt[3] = fnt_xl_k10;
g_fnt[4] = fnt_sm_k15;
g_fnt[5] = fnt_md_k15;
g_fnt[6] = fnt_lg_k15;
g_fnt[7] = fnt_xl_k15;
g_fnt[8] = fnt_sm_k20;
g_fnt[9] = fnt_md_k20;
g_fnt[10] = fnt_lg_k20;
g_fnt[11] = fnt_xl_k20;
g_fnt[12] = fnt_sm_k30;
g_fnt[13] = fnt_md_k30;
g_fnt[14] = fnt_lg_k30;
g_fnt[15] = fnt_xl_k30;
g_f_sm = 0;
g_f_md = 1;
g_f_lg = 2;
g_f_xl = 3;
g_fs = g_f_md;
g_fk = 0;
g_k = 1;
