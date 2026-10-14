/// scr_match_draw()
// Ritar matchen: spelytan i originalets 320x256-koordinater skalad med g_SCALE (vektorlinjer, ingen bitmapp), placerad pa (g_OX, g_OY),
// sedan ramen, spelarpanelerna och eventuell resultatruta. Farger kommer fran temat.
var k, a, b, x1, y1, x2, y2, gx, gy, pwx, phx, mqs, mqn, mqm, shx, shy;
g_proj_hs = 1;
if (g_game_mode == 1) { g_proj_hs = 1.3; }   // Astro Duel: projektiler 30 % storre
// kameraskakning (Mini Nuke): spelytans bild forskjuts slumpmassigt med g_shake_amp pixlar, ram och paneler ligger stilla; kameran aterstalls fore ramen
shx = 0;
shy = 0;
if (g_shake_amp > 0 && !g_paused)
{
    shx = round((random(2) - 1) * g_shake_amp / g_SCALE);
    shy = round((random(2) - 1) * g_shake_amp / g_SCALE);
    g_cam_x += shx;
    g_cam_y += shy;
}
pwx = g_PLAY_W * g_SCALE;
phx = g_PLAY_H * g_SCALE;

// Spelytans svaga rutnat
draw_set_color(g_c[1]);
for (gx = 0; gx <= pwx; gx += 20 * g_SCALE) { draw_line(g_OX + gx, g_OY, g_OX + gx, g_OY + phx); }
for (gy = 0; gy <= phx; gy += 20 * g_SCALE) { draw_line(g_OX, g_OY + gy, g_OX + pwx, g_OY + gy); }

scr_dots_draw();         // orienteringspunkter: syns bara nar kameran ar inzoomad
scr_solid_walls_draw();   // Solid colors: fyll foremalen forst, konturerna ritas ovanpa
// Vaggar: varje objekt i sin egen temafarg (g_wall_grp, scr_theme_players)
for (k = 0; k < g_wall_n; k += 1)
{
    draw_set_color(g_wcol[g_wall_grp[k] mod 11]);
    a = g_wall_a[k];
    b = g_wall_b[k];
    x1 = scr_w2s_x(g_wall_px[a]);
    y1 = scr_w2s_y(g_wall_py[a]);
    x2 = scr_w2s_x(g_wall_px[b]);
    y2 = scr_w2s_y(g_wall_py[b]);
    draw_line(g_OX + x1 * g_SCALE, g_OY + y1 * g_SCALE, g_OX + x2 * g_SCALE, g_OY + y2 * g_SCALE);
}

scr_powerup_draw();   // powerup-orben pa kartan
scr_trail_draw();   // driftspar bakom skeppen
// Skepp (vertexar skalas med Z>>16 och roteras med sin/cos-tabellerna, som hunk0 0x18da)
with (obj_player)
{
    if (alive)
    {
        var sn, cs, bx, by, j, xs, ys, rx, ry;
        dsx[0] = 0; dsy[0] = 0;   // skapa arrayerna (GMS 1.4)
        sn = g_sin_tab[ang];
        cs = g_cos_tab[ang];
        bx = scr_w2s_x(floor(px / 256));
        by = scr_w2s_y(floor(py / 256));
        for (j = 0; j < np; j += 1)
        {
            xs = floor(g_ship_pts[ship, 2 * j] * g_zoom / 65536);
            ys = floor(g_ship_pts[ship, 2 * j + 1] * g_zoom / 65536);
            rx = floor((xs * cs + ys * sn) / 256);
            ry = floor((xs * sn - ys * cs) / 256);
            dsx[j] = bx + rx;
            dsy[j] = by + ry;
        }
        if (g_sv[g_SV_SOLID]) { scr_ship_fill(ship, scr_slot_colour(slot)); }   // Solid colors: fyllt skrov under konturen
        draw_set_color(scr_slot_colour(slot));
        for (j = 0; j < nl; j += 1)
        {
            draw_line(g_OX + dsx[g_ship_lines[ship, 2 * j]] * g_SCALE, g_OY + dsy[g_ship_lines[ship, 2 * j]] * g_SCALE,
                      g_OX + dsx[g_ship_lines[ship, 2 * j + 1]] * g_SCALE, g_OY + dsy[g_ship_lines[ship, 2 * j + 1]] * g_SCALE);
        }
    }
}

// (Vald specialpod markeras inte pa skeppet i arenan, utan som en prick pa skeppsbilden i spelarens panel, scr_hud_panel.)

// Specialvapenobjekt (kort linje = en ticks rorelse) och explosioner
// missiler (alla typer): glodande boll som pulserar och flimrar med solid karna, plus en svans av pixelpartiklar (scr_missile_step)
draw_set_blend_mode(bm_add);
with (obj_missile)
{
    var qx1, qy1, mj, mpl, mrc;
    qx1 = g_OX + (px / 256 * g_zoom / 32768 - g_cam_x + g_CX) * g_SCALE;
    qy1 = g_OY + (py / 256 * g_zoom / 32768 - g_cam_y + g_CY) * g_SCALE;
    mrc = 2.4 * g_SCALE;
    if (mtype == 3) { mrc = (1.4 + msize * 0.5) * g_SCALE; }   // Mini Nuke: storleken ur Powerup Editor
    mpl = 1 + 0.15 * sin(g_tick * 0.8 + id);
    for (mj = 5; mj >= 1; mj -= 1)
    {
        if (mj >= 4) { draw_set_color(g_c[9]); } else { draw_set_color(g_c[10]); }
        if (mtype == 3) { if (mj >= 4) { draw_set_color(g_c[14]); } else { draw_set_color(g_c[12]); } }
        draw_set_alpha(0.32 * (0.7 + random(0.6)) / mj);
        draw_circle(qx1, qy1, mrc * (1 + mj * 0.7) * mpl * (0.88 + random(0.24)), false);
    }
    draw_set_alpha(1);
    draw_set_color(g_c[10]);
    if (mtype == 3) { draw_set_color(g_c[6]); }
    draw_circle(qx1, qy1, mrc, false);
}
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
draw_set_color(g_c[8]);
with (obj_fx)
{
    if (fkind == 4)
    {
        // Mini Nuke: tre chockvagsringar i varldspixlar (zoom-oberoende), tonar ut mot slutet
        var rwk, rsk, tk, fx4, fy4;
        tk = ftimer / fmax;
        rwk = rmax * (1 - power(1 - tk, 2));
        rsk = rwk * g_zoom / 32768 * g_SCALE;
        fx4 = g_OX + (px / 256 * g_zoom / 32768 - g_cam_x + g_CX) * g_SCALE;
        fy4 = g_OY + (py / 256 * g_zoom / 32768 - g_cam_y + g_CY) * g_SCALE;
        draw_set_alpha(1 - tk * 0.7);
        draw_set_color(g_c[14]);
        draw_circle(fx4, fy4, rsk, true);
        draw_circle(fx4, fy4, max(1, rsk - 1), true);
        draw_set_color(g_c[10]);
        draw_circle(fx4, fy4, rsk * 0.8, true);
        draw_set_color(g_c[6]);
        draw_circle(fx4, fy4, rsk * 0.55, true);
        draw_set_alpha(1);
    }
    else
    {
        // explosionsring med dubbel radie mot tidigare (6 + 4 per tick) och en inre ring
        draw_set_color(g_c[8]);
        draw_circle(g_OX + scr_w2s_x(floor(px / 256)) * g_SCALE, g_OY + scr_w2s_y(floor(py / 256)) * g_SCALE, (6 + ftimer * 4) * fsize, true);
        draw_circle(g_OX + scr_w2s_x(floor(px / 256)) * g_SCALE, g_OY + scr_w2s_y(floor(py / 256)) * g_SCALE, (3 + ftimer * 2) * fsize, true);
    }
}

// Skott
draw_set_color(g_c[10]);
with (obj_shot)
{
    var qx, qy;
    qx = g_OX + scr_w2s_x(floor(px / 256)) * g_SCALE;
    qy = g_OY + scr_w2s_y(floor(py / 256)) * g_SCALE;
    draw_rectangle(qx - g_proj_hs, qy - g_proj_hs, qx + g_proj_hs, qy + g_proj_hs, false);
}

scr_spark_draw();
scr_debris_draw();
scr_beam_draw();      // railgunstralar over allt i spelytan
scr_railgun_draw();   // railgunens laddningskula

g_cam_x -= shx;   // aterstall kameran efter skakningen
g_cam_y -= shy;
// Allt som hamnat utanfor spelytan tacks over av bakgrunden, sedan ram och paneler
draw_set_color(g_c[0]);
draw_rectangle(-4000, -4000, g_OX - 1, 4000, false);
draw_rectangle(g_OX + pwx, -4000, 4000, 4000, false);
draw_rectangle(-4000, -4000, 4000, g_OY - 1, false);
draw_rectangle(-4000, g_OY + phx, 4000, 4000, false);
draw_set_color(g_c[3]);
draw_rectangle(g_OX - 1, g_OY - 1, g_OX + pwx, g_OY + phx, true);
draw_set_color(g_acc);
draw_rectangle(g_OX - 2, g_OY - 2, g_OX + 10, g_OY - 1, false);
draw_rectangle(g_OX - 2, g_OY - 2, g_OX - 1, g_OY + 10, false);
draw_rectangle(g_OX + pwx - 10, g_OY + phx, g_OX + pwx + 2, g_OY + phx + 1, false);
draw_rectangle(g_OX + pwx + 1, g_OY + phx - 10, g_OX + pwx + 2, g_OY + phx + 1, false);

// rubrikrad: bana till vanster, aktuell lat till hoger (kortas av om den inte ryms); tangenthjalpen visas i F1-raden
mqs = "BRATWURST // " + scr_mode_name() + " // ROUND " + string(g_round) + " OF " + string(g_rounds_total) + " // MAP: " + string_upper(g_match_map);
g_fs = g_f_sm;
mqn = floor((g_vw - 40 - scr_ui_tw("[] " + mqs) - scr_ui_tw("MUSIC:   00:00:00") - 40) / scr_ui_tw("W"));
mqm = g_trk_name[g_trk_idx];
if (!g_sv[g_SV_MUSIC]) { mqm = "OFF"; }
if (string_length(mqm) > mqn) { mqm = string_copy(mqm, 1, max(0, mqn - 2)) + ".."; }
scr_ui_header(mqs, "MUSIC: " + mqm);
scr_hud_draw();

g_fs = g_f_sm;
if (g_debug)
{
    scr_ui_text(g_OX + 10, g_OY + 28, "ESC MENU  F2 SHIP SELECT  TICK " + string(g_tick) + "  Z=" + string(g_zoom) + "  shots=" + string(instance_number(obj_shot)) + "  F1 debug", g_c[3]);
}
if (g_state == 2)
{
    // rundresultat: vinnaren far stor rubrik "WELL HOT DOG, WE HAVE A WEINER!" och spelarens namn under; ingen vinnare ger bara NO WINNER
    var rw, rh, rtx, rcx, rcy;
    rtx = "WELL HOT DOG, WE HAVE A WEINER!";
    g_fs = g_f_lg;
    rw = scr_ui_tw(rtx) + 48;
    if (rw > pwx - 24) { g_fs = g_f_md; rw = scr_ui_tw(rtx) + 48; }   // ryms inte i spelytan: mindre typsnitt
    rw = max(rw, 380);
    rh = 140;
    rcx = g_OX + pwx / 2;
    rcy = g_OY + phx / 2;
    scr_ui_pane(rcx - rw / 2, rcy - rh / 2, rw, rh, "ROUND " + string(g_round) + " OF " + string(g_rounds_total), g_acc);
    if (g_winner >= 0)
    {
        scr_ui_text_c(rcx, rcy - 48, rtx, g_acc);
        g_fs = g_f_lg;
        scr_ui_text_c(rcx, rcy - 14, "PLAYER " + string(g_winner + 1) + " WINS", scr_slot_colour(g_winner));
    }
    else
    {
        g_fs = g_f_lg;
        scr_ui_text_c(rcx, rcy - 30, "NO WINNER", g_c[10]);
    }
    g_fs = g_f_sm;
    if (g_round >= g_rounds_total) { scr_ui_text_c(rcx, rcy + 28, "FINAL RESULT NEXT", g_c[4]); }
    else { scr_ui_text_c(rcx, rcy + 28, "NEXT ROUND STARTING", g_c[4]); }
    scr_ui_text_c(rcx, rcy + 48, "F2 SHIP SELECT   ESC MAIN MENU", g_c[3]);
}
if (g_paused)
{
    if (g_pause_opts)
    {
        // Options inne i pausmenyn: hela installningsmenyn ritas ovanpa en ogenomskinlig bakgrund
        draw_set_color(g_c[0]);
        draw_set_alpha(1);
        draw_rectangle(g_vx - 4, g_vy - 4, g_vx + g_vw + 4, g_vy + g_vh + 4, false);
        scr_mn_draw();
    }
    else { scr_pause_draw(); }
}
