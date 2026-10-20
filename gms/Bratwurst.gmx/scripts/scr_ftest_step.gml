/// scr_ftest_step()
// TILLFALLIGT (D-073): FONT TEST-sidan (g_state = 40). Vanster/hoger byter typsnitt (sida), Esc eller B gar tillbaka till menyn. Tas bort med tools/remove_font_test.ps1.
g_menu_tick += 1;
if (g_nv_left) { g_ft_page = (g_ft_page + g_ft_n - 1) mod g_ft_n; }
if (g_nv_right) { g_ft_page = (g_ft_page + 1) mod g_ft_n; }
if (g_nv_back) { g_state = 11; g_menu_tick = 0; }
