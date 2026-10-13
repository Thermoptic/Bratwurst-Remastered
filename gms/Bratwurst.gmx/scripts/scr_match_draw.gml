/// scr_match_draw()
// Ritar matchen: spelytan i originalets 320x256-koordinater skalad med g_SCALE (vektorlinjer, ingen bitmapp), placerad pa (g_OX, g_OY),
// sedan ramen, spelarpanelerna och eventuell resultatruta. Farger kommer fran temat.
var k, a, b, x1, y1, x2, y2, gx, gy, pwx, phx;
g_proj_hs = 1;
if (g_game_mode == 1) { g_proj_hs = 1.3; }   // Astro Duel: projektiler 30 % storre
pwx = g_PLAY_W * g_SCALE;
phx = g_PLAY_H * g_SCALE;

// Spelytans svaga rutnat
draw_set_color(g_c[1]);
for (gx = 0; gx <= pwx; gx += 20 * g_SCALE) { draw_line(g_OX + gx, g_OY, g_OX + gx, g_OY + phx); }
for (gy = 0; gy <= phx; gy += 20 * g_SCALE) { draw_line(g_OX, g_OY + gy, g_OX + pwx, g_OY + gy); }

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
draw_set_color(g_c[9]);
with (obj_missile)
{
    var qx1, qy1, qx2, qy2;
    qx1 = g_OX + scr_w2s_x(floor(px / 256)) * g_SCALE;
    qy1 = g_OY + scr_w2s_y(floor(py / 256)) * g_SCALE;
    qx2 = g_OX + scr_w2s_x(floor((px - vx) / 256)) * g_SCALE;
    qy2 = g_OY + scr_w2s_y(floor((py - vy) / 256)) * g_SCALE;
    draw_line(qx1, qy1, qx2, qy2);
    draw_rectangle(qx1 - g_proj_hs, qy1 - g_proj_hs, qx1 + g_proj_hs, qy1 + g_proj_hs, false);
}
draw_set_color(g_c[8]);
with (obj_fx)
{
    // explosionsring med dubbel radie mot tidigare (6 + 4 per tick) och en inre ring
    draw_circle(g_OX + scr_w2s_x(floor(px / 256)) * g_SCALE, g_OY + scr_w2s_y(floor(py / 256)) * g_SCALE, 6 + ftimer * 4, true);
    draw_circle(g_OX + scr_w2s_x(floor(px / 256)) * g_SCALE, g_OY + scr_w2s_y(floor(py / 256)) * g_SCALE, 3 + ftimer * 2, true);
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

scr_ui_header("BRATWURST // " + scr_mode_name() + " // ROUND " + string(g_round) + " OF " + string(g_rounds_total), "ESC MENU   F2 SHIP SELECT   F1 DEBUG   TICK " + string(g_tick));
scr_hud_draw();

g_fs = g_f_sm;
g_fs = g_f_sm;
scr_ui_text(g_vx + 20 + scr_ui_tw("[] BRATWURST // " + scr_mode_name() + " // ROUND " + string(g_round) + " OF " + string(g_rounds_total)) + 28, g_vy + 8, "// MAP: " + string_upper(g_match_map), g_c[5]);   // bana till hoger om rundtexten i rubrikraden
if (g_debug)
{
    scr_ui_text(g_OX + 10, g_OY + 28, "Z=" + string(g_zoom) + "  shots=" + string(instance_number(obj_shot)) + "  F1 debug", g_c[3]);
}
if (g_state == 2)
{
    scr_ui_pane(g_OX + pwx / 2 - 190, g_OY + phx / 2 - 56, 380, 112, "ROUND " + string(g_round) + " OF " + string(g_rounds_total), g_acc);
    g_fs = g_f_lg;
    if (g_winner >= 0) { scr_ui_text_c(g_OX + pwx / 2, g_OY + phx / 2 - 38, "PLAYER " + string(g_winner + 1) + " WINS", scr_slot_colour(g_winner)); }
    else { scr_ui_text_c(g_OX + pwx / 2, g_OY + phx / 2 - 38, "NO WINNER", g_c[10]); }
    g_fs = g_f_sm;
    if (g_round >= g_rounds_total) { scr_ui_text_c(g_OX + pwx / 2, g_OY + phx / 2 + 14, "FINAL RESULT NEXT", g_c[4]); }
    else { scr_ui_text_c(g_OX + pwx / 2, g_OY + phx / 2 + 14, "NEXT ROUND STARTING", g_c[4]); }
    scr_ui_text_c(g_OX + pwx / 2, g_OY + phx / 2 + 34, "F2 SHIP SELECT   ESC MAIN MENU", g_c[3]);
}
