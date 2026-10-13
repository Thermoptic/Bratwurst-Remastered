/// scr_match_draw()
// Ritar matchen: spelytan i originalets 320x256-koordinater skalad med g_SCALE (vektorlinjer, ingen bitmapp), placerad pa (g_OX, g_OY),
// sedan ramen, spelarpanelerna och eventuell resultatruta. Farger kommer fran temat.
var k, a, b, x1, y1, x2, y2, gx, gy, W, H;
W = room_width;
H = room_height;

// Spelytans svaga rutnat
draw_set_color(g_c[1]);
for (gx = 0; gx <= 640; gx += 40) { draw_line(g_OX + gx, g_OY, g_OX + gx, g_OY + 472); }
for (gy = 0; gy <= 472; gy += 40) { draw_line(g_OX, g_OY + gy, g_OX + 640, g_OY + gy); }

// Vaggar
draw_set_color(g_c[5]);
for (k = 0; k < g_wall_n; k += 1)
{
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

// Markering av vald specialpod
with (obj_player)
{
    if (alive && sp_nsel > 0)
    {
        var mp, mxs, mys, mrx, mry, msn, mcs;
        mp = sp_sel[sp_pod_i];
        msn = g_sin_tab[ang];
        mcs = g_cos_tab[ang];
        mxs = floor(g_ship_pods[ship, 2 * mp] * g_zoom / 65536);
        mys = floor(g_ship_pods[ship, 2 * mp + 1] * g_zoom / 65536);
        mrx = floor((mxs * mcs + mys * msn) / 256);
        mry = floor((mxs * msn - mys * mcs) / 256);
        draw_set_color(scr_slot_colour(slot));
        draw_circle(g_OX + (scr_w2s_x(floor(px / 256)) + mrx) * g_SCALE, g_OY + (scr_w2s_y(floor(py / 256)) + mry) * g_SCALE, 3, true);
    }
}

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
    draw_rectangle(qx1 - 1, qy1 - 1, qx1 + 1, qy1 + 1, false);
}
draw_set_color(g_c[8]);
with (obj_fx)
{
    draw_circle(g_OX + scr_w2s_x(floor(px / 256)) * g_SCALE, g_OY + scr_w2s_y(floor(py / 256)) * g_SCALE, 3 + ftimer * 2, true);
}

// Skott
draw_set_color(g_c[10]);
with (obj_shot)
{
    var qx, qy;
    qx = g_OX + scr_w2s_x(floor(px / 256)) * g_SCALE;
    qy = g_OY + scr_w2s_y(floor(py / 256)) * g_SCALE;
    draw_rectangle(qx - 1, qy - 1, qx + 1, qy + 1, false);
}

// Allt som hamnat utanfor spelytan tacks over av bakgrunden, sedan ram och paneler
draw_set_color(g_c[0]);
draw_rectangle(-4000, -4000, g_OX - 1, 4000, false);
draw_rectangle(g_OX + 640, -4000, 4000, 4000, false);
draw_rectangle(-4000, -4000, 4000, g_OY - 1, false);
draw_rectangle(-4000, g_OY + 472, 4000, 4000, false);
draw_set_color(g_c[3]);
draw_rectangle(g_OX - 1, g_OY - 1, g_OX + 640, g_OY + 472, true);
draw_set_color(g_acc);
draw_rectangle(g_OX - 2, g_OY - 2, g_OX + 10, g_OY - 1, false);
draw_rectangle(g_OX - 2, g_OY - 2, g_OX - 1, g_OY + 10, false);
draw_rectangle(g_OX + 630, g_OY + 472, g_OX + 642, g_OY + 473, false);
draw_rectangle(g_OX + 641, g_OY + 462, g_OX + 642, g_OY + 473, false);

scr_ui_header("BRATWURST // MATCH", "ESC MENU   F2 SHIP SELECT   F1 DEBUG   TICK " + string(g_tick));
scr_hud_draw();

g_fs = g_f_sm;
if (g_debug)
{
    scr_ui_text(g_OX + 8, g_OY + 6, "Z=" + string(g_zoom) + "  shots=" + string(instance_number(obj_shot)) + "  F1 debug", g_c[3]);
}
if (g_state == 2)
{
    scr_ui_pane(g_OX + 170, g_OY + 190, 300, 92, "RESULT", g_acc);
    g_fs = g_f_lg;
    scr_ui_text_c(g_OX + 320, g_OY + 208, "PLAYER " + string(g_winner + 1) + " WINS", scr_slot_colour(g_winner));
    g_fs = g_f_sm;
    scr_ui_text_c(g_OX + 320, g_OY + 250, "F2 = SHIP SELECT   ESC = MAIN MENU", g_c[4]);
}
