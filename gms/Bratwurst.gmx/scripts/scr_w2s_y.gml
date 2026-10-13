/// scr_w2s_y(world_px_y)
// Varld (heltalspixlar) -> skarm-y i originalets 320x256-koordinater.
return floor(argument0 * g_zoom / 32768) - g_cam_y + g_CY;
