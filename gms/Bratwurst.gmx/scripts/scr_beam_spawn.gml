/// scr_beam_spawn(x, y, dx, dy, slot)
// Skapar en railgunstral fran (x, y) (varldspixlar) i riktningen (dx, dy) (enhetsvektor), agd av spelare 'slot'. Egenskaperna tas ur Powerup Editor (Railgun).
var k, b;
b = g_SV_PU + 8;
for (k = 0; k < g_BM_MAX; k += 1)
{
    if (!g_bm_on[k])
    {
        g_bm_on[k] = true;
        g_bm_age[k] = 0;
        g_bm_x[k] = argument0;
        g_bm_y[k] = argument1;
        g_bm_dx[k] = argument2;
        g_bm_dy[k] = argument3;
        g_bm_len[k] = 7000;   // gar over hela banan
        g_bm_owner[k] = argument4;
        g_bm_col[k] = scr_slot_colour(argument4);
        g_bm_sweep[k] = max(1, round(g_sv[b + 1] * 5));   // tiondels sekunder -> ticks (50 per sekund)
        g_bm_hold[k] = g_sv[b + 2] * 5;
        g_bm_fade[k] = max(1, g_sv[b + 3] * 5);
        g_bm_w[k] = g_sv[b + 4];
        g_bm_dmg[k] = g_sv[b + 5];
        g_bm_hit[k] = 0;
        break;
    }
}
