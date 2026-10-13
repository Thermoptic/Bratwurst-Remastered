/// scr_ui_text(x, y, text, colour)
// Terminaltext vansterjusterad. Med PHOSPHOR GLOW ritas forst en svag kopia pa varje sida om texten. Typsnitt: g_fs.
draw_set_color(argument3);
if (g_sv[g_SV_GLOW])
{
    draw_set_alpha(0.25);
    scr_ui_dt(argument0 - 1, argument1, argument2);
    scr_ui_dt(argument0 + 1, argument1, argument2);
    scr_ui_dt(argument0, argument1 - 1, argument2);
    scr_ui_dt(argument0, argument1 + 1, argument2);
    draw_set_alpha(1);
}
scr_ui_dt(argument0, argument1, argument2);
