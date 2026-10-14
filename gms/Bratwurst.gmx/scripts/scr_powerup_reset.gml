/// scr_powerup_reset()
// Kors vid matchstart och ny runda: tar bort ikonen pa kartan och startar nedrakningen till forsta powerupen (g_PU_FIRST ticks = 5 s). -1 = av.
g_pu_on = false;
g_shake_amp = 0;
if (scr_powerup_enabled()) { g_pu_timer = g_PU_FIRST; } else { g_pu_timer = -1; }
