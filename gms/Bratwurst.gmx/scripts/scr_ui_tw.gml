/// scr_ui_tw(text)
// Textens bredd i rumskoordinater med aktuell storlek g_fs.
draw_set_font(g_fnt[g_fk * 4 + g_fs]);
return string_width(argument0) / g_k;
