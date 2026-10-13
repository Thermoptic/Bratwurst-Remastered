/// scr_results_step()
// Slutresultatet (g_state = 30): upp/ner = val, OK = valt, Esc/tillbaka = huvudmenyn. REMATCH ger skeppsvalet (nya skepp) med samma antal rundor.
g_menu_tick += 1;
if (g_nv_up || g_nv_down) { g_res_sel = 1 - g_res_sel; }
if (g_nv_back) { scr_goto_main(); exit; }
if (g_nv_ok)
{
    if (g_res_sel == 0) { scr_menu_enter(); }
    else { scr_goto_main(); }
}
