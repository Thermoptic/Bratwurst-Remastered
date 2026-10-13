/// scr_w2s_x(world_px_x)
// Varld (heltalspixlar) -> skarm-x i originalets 320x256-koordinater.
return floor(argument0 * g_zoom / 32768) - g_cam_x + g_CX;
