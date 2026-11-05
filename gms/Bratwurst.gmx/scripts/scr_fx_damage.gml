/// scr_fx_damage()
// Kors i obj_fx, en tick. Missilexplosionens expanderande ring (samma radie som scr_match_draw ritar: 6 + 4 per tick i utpixlar) skadar varje skepp
// som den nar, en gang per skepp och explosion: 3 energi (D-029; sedan D-068 lika mycket som en direktraff: 12 for missil, 5 for guidad missil). Ett skepp raknas som nadd nar nagon av dess hornpunkter ligger inom radien.
// Bara missil (1) och guidad missil (2), inte krockringen (3); ingen splash i Astro Duel (dar tar bara direktraffar liv).
var rw, p, j, dxw, dyw, hitp, rfull, bdx, bdy, bd, bmag, bf;
if (fkind != 1 && fkind != 2 && fkind != 4) { exit; }
if (g_game_mode == 1 && fkind != 4) { exit; }
if (fkind == 4) { rw = rmax * (1 - power(1 - ftimer / fmax, 2)); }   // Mini Nuke: chockvagen vaxer i varldspixlar och bromsar in
else if (fkind == 1) { rw = drad * ftimer / fmax; }   // missilen: skadeavstandet vaxer till DAMAGE RADIUS (D-069)
else { rw = ((6 + ftimer * 4) * fsize / g_SCALE) * 32768 / g_zoom; }   // radie i varldspixlar
if (fkind == 4 && g_game_mode == 4) { scr_ast_blast(floor(px / 256), floor(py / 256), rw); }   // Asteroids: chockvagen forintar stenar
// explosionens fulla rackvidd (varldspixlar) och knuffens styrka (D-070): missil BLAST KNOCKBACK, guidad missil fast 900, Mini Nuke egen installning
if (fkind == 4) { rfull = rmax; bmag = g_sv[g_SV_PU + 7]; }
else if (fkind == 1) { rfull = drad; bmag = g_ML_BKNOCK; }
else { rfull = ((6 + fmax * 4) * fsize / g_SCALE) * 32768 / g_zoom; bmag = 900; }   // guidad missil: fast 900 (oforandrad)
rfull = max(1, rfull);
rw = rw * rw;
with (obj_player)
{
    if (alive && !race_fin && other.fdone[slot] == 0 && !scr_ctb_friend(other.fowner, slot))   // Capture the Bratwurst: ringar skadar och knuffar inte lagkamrater (D-082)
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
            if (g_game_mode == 3) { scr_ctb_hurt(other.fowner, true); }   // missilring och Mini Nuke-chockvag: bararen tappar korven (D-084)   // Capture the Bratwurst: kills och bararens reaktion (D-082)
            if (g_game_mode == 5) { scr_sw_hit(1, px - other.px, py - other.py); }   // Super Smashwurst: ringar och chockvag raknas som missiler, knuff bort fran mitten (D-085)
            else if (g_game_mode == 2) { scr_race_hit(); }   // Race: chockvag och missilring ger bara fartminskning (D-055)
            else if (other.fkind == 4)
            {
                if (g_game_mode == 1) { scr_ad_hit(); } else { energy -= g_sv[g_SV_PU + 5]; }   // Mini Nuke: chockvagsskada ur Powerup Editor (Galaxy Duel: skadar / dodar)
            }
            else if (other.fkind == 1) { energy -= g_ML_BDMG; }   // BLAST DAMAGE i Powerup Editor (D-069)   // ringen skadar lika mycket som en direktraff (D-068)
            else { energy -= g_DMG_GUIDED; }
            // knuff: explosionen puttar skeppet bort fran mitten, starkast nara mitten (D-070)
            bdx = px - other.px;
            bdy = py - other.py;
            bd = sqrt(bdx * bdx + bdy * bdy);
            if (bd < 1) { bdx = random_range(-1, 1); bdy = random_range(-1, 1); bd = max(0.01, sqrt(bdx * bdx + bdy * bdy)); }
            bf = clamp(1.2 - 0.7 * (bd / 256) / rfull, 0.5, 1.2);
            if (g_game_mode != 5)   // Super Smashwurst: knuffen kommer fran Push (scr_sw_hit), inte fran ringens fasta styrka
            {
                vx += bdx / bd * bmag * bf;
                vy += bdy / bd * bmag * bf;
            }
            scr_spark_burst(floor(px / 256), floor(py / 256), 8, 1.8, scr_slot_colour(slot));
            if (energy <= 0) { scr_player_lose_life(); }
        }
    }
}
