/// scr_railgun_draw()
// Ritar railgunens laddningskula framfor varje laddande skepp: en glodande boll som vaxer med laddningen (CHARGE BALL SIZE vid full laddning) i spelarens farg
// med allt ljusare karna, och nar den ar fulladdad byter den farg till vitt och flimrar snabbt. Kors i obj_game.
var b, need;
b = g_SV_PU + g_PU_STRIDE;
need = max(1, g_sv[b] * 50);
draw_set_blend_mode(bm_add);
with (obj_player)
{
    if (alive && pu_have == 2 && pu_charge > 0)
    {
        var fr, rw, dist, bx, by, sr, j, pc, ready, cc, fl;
        fr = min(1, pu_charge / need);
        ready = (pu_charge >= need);
        rw = 3 + (g_sv[g_SV_PU + g_PU_STRIDE + 7] - 3) * fr;   // varldspixlar (CHARGE BALL SIZE ar parameter 7 i Railgun, STRIDE + 7)
        dist = g_ship_nose[ship] + 4 + rw;
        bx = g_OX + ((px / 256 - g_sin_tab[ang] / 256 * dist) * g_zoom / 32768 - g_cam_x + g_CX) * g_SCALE;
        by = g_OY + ((py / 256 + g_cos_tab[ang] / 256 * dist) * g_zoom / 32768 - g_cam_y + g_CY) * g_SCALE;
        sr = max(2, rw * g_zoom / 32768 * g_SCALE);
        pc = scr_slot_colour(slot);
        if (ready)
        {
            if ((g_tick mod 4) < 2) { cc = c_white; } else { cc = pc; }
            sr = sr * (1 + 0.12 * sin(g_tick * 1.3));
        }
        else { cc = merge_colour(pc, c_white, fr * 0.6); }
        for (j = 4; j >= 1; j -= 1)
        {
            fl = 0.7 + random(0.6);
            if (ready) { fl = fl * 1.3; }
            draw_set_color(pc);
            draw_set_alpha(min(1, 0.32 * fl / j));
            draw_circle(bx, by, sr * (1 + j * 0.6) * (0.9 + random(0.2)), false);
        }
        draw_set_alpha(1);
        draw_set_color(cc);
        draw_circle(bx, by, sr, false);
    }
}
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
