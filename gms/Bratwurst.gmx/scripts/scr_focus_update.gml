/// scr_focus_update()
// Helskarm och alt-tab (D-045): i exklusivt helskarmslage (Options -> WINDOW -> FULLSCREEN) forsvann spelets fonster vid alt-tab och gick inte att fa tillbaka.
// Darfor lamnar spelet helskarmslaget (window_set_fullscreen(false)) nar fonstret har saknat fokus i 5 ticks i foljd, sa att det finns som ett vanligt fonster
// i aktivitetsfaltet, och gar tillbaka till helskarm (scr_display_apply) nar fokus ar tillbaka i 5 ticks i foljd. Kors varje tick i obj_game.
if (g_sv[g_SV_SCALE] != 3) { g_fs_lost = false; g_fs_lt = 0; exit; }
if (!g_fs_lost)
{
    if (!window_has_focus()) { g_fs_lt += 1; } else { g_fs_lt = 0; }
    if (g_fs_lt >= 5)
    {
        g_fs_lost = true;
        g_fs_lt = 0;
        window_set_fullscreen(false);
    }
}
else
{
    if (window_has_focus()) { g_fs_lt += 1; } else { g_fs_lt = 0; }
    if (g_fs_lt >= 5)
    {
        g_fs_lost = false;
        g_fs_lt = 0;
        scr_display_apply();
    }
}
