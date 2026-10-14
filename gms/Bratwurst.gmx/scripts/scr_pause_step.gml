/// scr_pause_step()
// Pausmenyn under en match (g_paused): upp/ner byter rad, OK (Enter/Space/A/Start) valjer, Esc/Backspace/B ateruppta. Raderna: 0 RESUME GAME, 1 OPTIONS (oppnar installningarna, scr_pause_opts_open), 2 QUIT TO MENU.
// Spelet star stilla medan menyn visas (scr_game_step hoppar over simuleringen); musiken fortsatter.
if (g_nv_up) { g_pause_sel = (g_pause_sel + 2) mod 3; }
if (g_nv_down) { g_pause_sel = (g_pause_sel + 1) mod 3; }
if (g_nv_back) { g_paused = false; exit; }
if (g_nv_ok)
{
    if (g_pause_sel == 0) { g_paused = false; }
    else if (g_pause_sel == 1) { scr_pause_opts_open(); }
    else { scr_goto_main(); }
}
