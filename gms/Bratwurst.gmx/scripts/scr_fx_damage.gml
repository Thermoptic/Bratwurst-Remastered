/// scr_fx_damage()
// Kors i obj_fx, en tick. Missilexplosionens expanderande ring (samma radie som scr_match_draw ritar: 6 + 4 per tick i utpixlar) skadar varje skepp
// som den nar, en gang per skepp och explosion: 3 energi (D-029). Ett skepp raknas som nadd nar nagon av dess hornpunkter ligger inom radien.
// Bara missil (1) och guidad missil (2), inte krockringen (3); ingen splash i Astro Duel (dar tar bara direktraffar liv).
var rw, p, j, dxw, dyw, hitp;
if (fkind != 1 && fkind != 2) { exit; }
if (g_game_mode == 1) { exit; }
rw = ((6 + ftimer * 4) / g_SCALE) * 32768 / g_zoom;   // radie i varldspixlar
rw = rw * rw;
with (obj_player)
{
    if (alive && other.fdone[slot] == 0)
    {
        hitp = false;
        for (j = 0; j < np; j += 1)
        {
            dxw = ow_x[j] - floor(other.px / 256);
            dyw = ow_y[j] - floor(other.py / 256);
            if (dxw * dxw + dyw * dyw <= rw) { hitp = true; break; }
        }
        if (hitp)
        {
            other.fdone[slot] = 1;
            energy -= 3;
            scr_spark_burst(floor(px / 256), floor(py / 256), 8, 1.8, scr_slot_colour(slot));
            if (energy <= 0) { scr_player_lose_life(); }
        }
    }
}
