/// scr_frame_players()
// Samlar de levande skeppens lagen (varldspixlar) i g_fd_x/g_fd_y[0..g_fd_n-1] en gang per bild, for ytterramens tonande (scr_frame_line_draw).
g_fd_n = 0;
with (obj_player)
{
    if (alive && g_fd_n < 8)
    {
        g_fd_x[g_fd_n] = floor(px / 256);
        g_fd_y[g_fd_n] = floor(py / 256);
        g_fd_n += 1;
    }
}
