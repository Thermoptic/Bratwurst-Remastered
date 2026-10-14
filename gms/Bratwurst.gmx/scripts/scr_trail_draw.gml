/// scr_trail_draw()
// Ritar alla spelares driftspar (D-030): ett eller tva ljusspar i skeppets farg som tonar ut mot svansen och blir smalare, med additiv blandning.
// Skeppen med smal kropp har ett spar, de breda tva (scr_trail_init). Kors i obj_game fore skeppen.
var i, t, a, w, x1, y1, x2, y2, tw, k, j, rc, rf, fl, pl;
draw_set_blend_mode(bm_add);
with (obj_player)
{
    if (tr_n >= 2)
    {
        draw_set_color(scr_slot_colour(slot));
        for (k = 0; k < g_ship_tr_n[ship]; k += 1)
        {
            for (i = 1; i < tr_n; i += 1)
            {
                if (tr_brk[i]) { continue; }
                t = i / (tr_n - 1);
                a = tr_fade * (0.05 + 0.9 * t * t);
                w = (0.5 + 1.7 * t) * g_SCALE * g_TR_WSCALE;   // smalare (var 0.8 + 2.6 * t)
                if (k == 0)
                {
                    x1 = tr_ax[i - 1]; y1 = tr_ay[i - 1]; x2 = tr_ax[i]; y2 = tr_ay[i];
                }
                else
                {
                    x1 = tr_bx[i - 1]; y1 = tr_by[i - 1]; x2 = tr_bx[i]; y2 = tr_by[i];
                }
                x1 = g_OX + (x1 * g_zoom / 32768 - g_cam_x + g_CX) * g_SCALE;
                y1 = g_OY + (y1 * g_zoom / 32768 - g_cam_y + g_CY) * g_SCALE;
                x2 = g_OX + (x2 * g_zoom / 32768 - g_cam_x + g_CX) * g_SCALE;
                y2 = g_OY + (y2 * g_zoom / 32768 - g_cam_y + g_CY) * g_SCALE;
                draw_set_alpha(a * 0.25);
                draw_line_width(x1, y1, x2, y2, w * 2.4);
                draw_set_alpha(a);
                draw_line_width(x1, y1, x2, y2, w);
            }
        }
        // motorglod i spirens startpunkt medan man driftar: solid karna, utanfor den en mjuk glod som pulserar och flimrar snabbt
        if (alive && drifting && tr_n > 0)
        {
            rc = 3.2 * g_SCALE;
            pl = 1 + 0.12 * sin(g_tick * 0.9 + slot * 2);
            for (k = 0; k < g_ship_tr_n[ship]; k += 1)
            {
                if (k == 0) { x1 = tr_ax[tr_n - 1]; y1 = tr_ay[tr_n - 1]; }
                else { x1 = tr_bx[tr_n - 1]; y1 = tr_by[tr_n - 1]; }
                x1 = g_OX + (x1 * g_zoom / 32768 - g_cam_x + g_CX) * g_SCALE;
                y1 = g_OY + (y1 * g_zoom / 32768 - g_cam_y + g_CY) * g_SCALE;
                for (j = 5; j >= 1; j -= 1)
                {
                    fl = 0.75 + random(0.5);   // flimmer
                    draw_set_alpha(0.3 * fl / j);
                    draw_circle(x1, y1, rc * (1 + j * 0.6) * pl * (0.9 + random(0.2)), false);
                }
                draw_set_alpha(1);
                draw_circle(x1, y1, rc, false);   // solid karna
            }
        }
    }
}
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
