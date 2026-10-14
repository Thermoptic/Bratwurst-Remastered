/// scr_music_panel(x, y, w, h)
// Musikspelarpanelen i huvudmenyns hogra kolumn (D-044, forslag A och anvandarens skiss): en ruta MUSIC med spektrum (scr_viz_draw), NOW PLAYING med lasnummer, titel
// (rullar om den inte ryms), en segmenterad tidslinje (30 segment med luft emellan), tid framat och kvarvarande tid, tre transportknappar (prev LB, play/paus Y,
// next RB), vaxlarna shuffle och repeat, volym med - och +, en LED-stapel (10 steg) och en MUTE-knapp, samt nederst NEXT TRACK med nasta lat. Skriver klickytorna
// till g_mp_x1/y1/x2/y2[0..8] (0 tidslinje, 1 prev, 2 play, 3 next, 4 shuffle, 5 repeat, 6 volym -, 7 volym +, 8 mute) som scr_mp_mouse laser. Kors i obj_game fran scr_mn_draw.
var px, py, pw, ph, ix, iw, y0, vh1, yy, k, nseg, segw, pos, len, fq, on, bw1, bw2, gap, bx, bw, bh, c, mqs, mqn, hint, sx, sy;
var mw, ledw, ledx, gx, nx, nxs;
px = argument0; py = argument1; pw = argument2; ph = argument3;
scr_ui_pane(px, py, pw, ph, "MUSIC", g_acc);
ix = px + 16;
iw = pw - 32;
g_mp_vis = true;
// spektrumets hojd: det som blir kvar nar raderna under fatt sin plats (hela rutan = 300 + spektrum)
vh1 = clamp(ph - 300, 48, 110);
y0 = py + 22;
scr_viz_draw(ix, y0, iw, vh1);
// position och langd
pos = 0;
len = max(1, audio_sound_length(g_trk_snd[g_trk_idx]));
if (g_music_id >= 0 && g_sv[g_SV_MUSIC]) { pos = audio_sound_get_track_position(g_music_id); }
fq = clamp(pos / len, 0, 1);
yy = y0 + vh1 + 14;
g_fs = g_f_sm;
scr_ui_text(ix, yy, "NOW PLAYING", g_c[4]);
scr_ui_text_r(ix + iw, yy, scr_pad2(max(1, g_trk_idx)) + "/" + scr_pad2(max(1, g_trk_n - 1)), g_c[3]);
yy += 20;
if (g_sv[g_SV_MUSIC])
{
    mqs = g_trk_name[g_trk_idx];
    if (scr_ui_tw(mqs) > iw)
    {
        mqn = max(1, floor(iw / (scr_ui_tw(mqs) / string_length(mqs))));
        mqs = mqs + "   //   ";
        mqs = string_copy(mqs + mqs, 1 + (floor(g_bg_t / 8) mod string_length(mqs)), mqn);
    }
    scr_ui_text(ix, yy, mqs, g_acc);
}
else { scr_ui_text(ix, yy, "MUSIC OFF", g_c[3]); }
yy += 26;
// tidslinje: 30 segment med 4 pixlars luft, klickbar
nseg = 30;
segw = (iw + 4) / nseg;
on = floor(fq * nseg);
for (k = 0; k < nseg; k += 1)
{
    if (k < on) { draw_set_color(g_acc); }
    else if (k == on && g_sv[g_SV_MUSIC]) { draw_set_color(g_c[6]); }
    else { draw_set_color(g_c[2]); }
    draw_rectangle(ix + floor(k * segw), yy, ix + floor((k + 1) * segw) - 5, yy + 18, false);
}
g_mp_x1[0] = ix; g_mp_y1[0] = yy - 2; g_mp_x2[0] = ix + iw; g_mp_y2[0] = yy + 20;
yy += 24;
scr_ui_text(ix, yy, string(floor(pos / 60)) + ":" + scr_pad2(floor(pos) mod 60), g_c[6]);
scr_ui_text_r(ix + iw, yy, "-" + string(floor(max(0, len - pos) / 60)) + ":" + scr_pad2(floor(max(0, len - pos)) mod 60), g_c[4]);
yy += 28;
// transportknappar: prev, play/paus (bred, fylld), next
gap = 10;
bw1 = floor((iw - 2 * gap) * 0.27);
bw2 = iw - 2 * gap - 2 * bw1;
bh = 44;
for (k = 0; k < 3; k += 1)
{
    if (k == 0) { bx = ix; bw = bw1; }
    if (k == 1) { bx = ix + bw1 + gap; bw = bw2; }
    if (k == 2) { bx = ix + bw1 + gap + bw2 + gap; bw = bw1; }
    if (k == 1)
    {
        draw_set_color(g_acc);
        draw_rectangle(bx, yy, bx + bw, yy + bh, false);
        c = g_c[0];
        hint = "Y";
    }
    else
    {
        draw_set_color(g_c[1]);
        draw_rectangle(bx, yy, bx + bw, yy + bh, false);
        draw_set_color(g_c[3]);
        draw_rectangle(bx, yy, bx + bw, yy + bh, true);
        c = g_c[6];
        if (k == 0) { hint = "LB"; } else { hint = "RB"; }
    }
    sx = bx + floor(bw / 2);
    sy = yy + floor(bh / 2);
    draw_set_color(c);
    if (k == 0)
    {
        draw_rectangle(sx - 8, sy - 8, sx - 6, sy + 8, false);
        draw_triangle(sx + 8, sy - 8, sx + 8, sy + 8, sx - 5, sy, false);
    }
    if (k == 2)
    {
        draw_rectangle(sx + 6, sy - 8, sx + 8, sy + 8, false);
        draw_triangle(sx - 8, sy - 8, sx - 8, sy + 8, sx + 5, sy, false);
    }
    if (k == 1)
    {
        if (g_mp_pause || !g_sv[g_SV_MUSIC]) { draw_triangle(sx - 6, sy - 10, sx - 6, sy + 10, sx + 9, sy, false); }
        else
        {
            draw_rectangle(sx - 8, sy - 9, sx - 3, sy + 9, false);
            draw_rectangle(sx + 3, sy - 9, sx + 8, sy + 9, false);
        }
    }
    g_fs = g_f_sm;
    scr_ui_text_r(bx + bw - 6, yy + bh - 17, hint, c);
    g_mp_x1[k + 1] = bx; g_mp_y1[k + 1] = yy; g_mp_x2[k + 1] = bx + bw; g_mp_y2[k + 1] = yy + bh;
}
yy += bh + 16;
// raden: shuffle och repeat (vaxlare, slocknar nar de ar av), volym - LED +, MUTE till hoger
for (k = 0; k < 2; k += 1)
{
    bx = ix + k * 40;
    if ((k == 0 && g_mp_shuf) || (k == 1 && g_mp_rep)) { c = g_acc; } else { c = g_c[3]; }
    draw_set_color(g_c[1]);
    draw_rectangle(bx, yy, bx + 34, yy + 30, false);
    draw_set_color(c);
    draw_rectangle(bx, yy, bx + 34, yy + 30, true);
    sx = bx + 17;
    sy = yy + 15;
    if (k == 0)
    {
        draw_line(sx - 9, sy - 6, sx + 9, sy + 6);
        draw_line(sx - 9, sy + 6, sx + 9, sy - 6);
        draw_triangle(sx + 9, sy + 6, sx + 3, sy + 6, sx + 9, sy + 1, false);
        draw_triangle(sx + 9, sy - 6, sx + 3, sy - 6, sx + 9, sy - 1, false);
    }
    else
    {
        draw_rectangle(sx - 9, sy - 6, sx + 9, sy + 6, true);
        draw_set_color(g_c[1]);
        draw_rectangle(sx + 2, sy - 7, sx + 9, sy - 5, false);
        draw_set_color(c);
        draw_triangle(sx + 2, sy - 10, sx + 2, sy - 2, sx + 8, sy - 6, false);
    }
    g_mp_x1[4 + k] = bx; g_mp_y1[4 + k] = yy; g_mp_x2[4 + k] = bx + 34; g_mp_y2[4 + k] = yy + 30;
}
// MUTE-knapp (hogerkant), sedan plus, LED-stapel och minus (hogerjusterade, med luft som skalar med bredden)
mw = clamp(floor(iw * 0.21), 44, 66);
ledw = clamp(floor(iw * 0.20), 50, 90);
gx = clamp(floor((iw - 74 - 24 - 24 - mw - ledw) / 4), 4, 12);
bx = ix + iw - mw;
if (g_mp_mute) { c = g_acc; } else { c = g_c[3]; }
draw_set_color(g_c[1]);
draw_rectangle(bx, yy, bx + mw, yy + 30, false);
draw_set_color(c);
draw_rectangle(bx, yy, bx + mw, yy + 30, true);
g_fs = g_f_sm;
scr_ui_text_c(bx + floor(mw / 2), yy + 7, "MUTE", c);
g_mp_x1[8] = bx; g_mp_y1[8] = yy; g_mp_x2[8] = bx + mw; g_mp_y2[8] = yy + 30;
nx = bx - gx - 24;                 // plus-knappens vanstra kant
ledx = nx - gx - ledw;             // LED-stapelns vanstra kant
for (k = 0; k < 2; k += 1)
{
    if (k == 0) { bx = ledx - gx - 24; } else { bx = nx; }
    draw_set_color(g_c[1]);
    draw_rectangle(bx, yy + 3, bx + 24, yy + 27, false);
    draw_set_color(g_c[3]);
    draw_rectangle(bx, yy + 3, bx + 24, yy + 27, true);
    draw_set_color(g_c[6]);
    draw_rectangle(bx + 6, yy + 14, bx + 18, yy + 15, false);
    if (k == 1) { draw_rectangle(bx + 11, yy + 9, bx + 12, yy + 20, false); }
    g_mp_x1[6 + k] = bx; g_mp_y1[6 + k] = yy + 3; g_mp_x2[6 + k] = bx + 24; g_mp_y2[6 + k] = yy + 27;
}
for (k = 0; k < 10; k += 1)
{
    if (k < g_sv[g_SV_VOL]) { if (k >= 8) { draw_set_color(g_c[8]); } else { draw_set_color(g_c[12]); } }
    else { draw_set_color(g_c[2]); }
    draw_rectangle(ledx + floor(k * ledw / 10), yy + 28 - (6 + k * 2), ledx + floor((k + 1) * ledw / 10) - 2, yy + 28, false);
}
yy += 30 + 14;
// NEXT TRACK: nasta lat enligt SHUFFLE / REPEAT / listans ordning
g_fs = g_f_sm;
scr_ui_text(ix, yy, "NEXT TRACK:", g_c[4]);
if (g_mp_shuf && g_trk_n > 2)
{
    nxs = "RANDOM TRACK";
    nx = 0;
}
else if (g_mp_rep || g_trk_n <= 2)
{
    nx = max(1, g_trk_idx);
    nxs = g_trk_name[min(nx, g_trk_n - 1)];
}
else
{
    nx = g_trk_idx + 1;
    if (nx >= g_trk_n) { nx = 1; }
    nxs = g_trk_name[nx];
}
if (nx > 0) { scr_ui_text_r(ix + iw, yy, scr_pad2(nx) + "/" + scr_pad2(max(1, g_trk_n - 1)), g_c[3]); }
yy += 20;
if (scr_ui_tw(nxs) > iw)
{
    mqn = max(1, floor(iw / (scr_ui_tw(nxs) / string_length(nxs))));
    nxs = nxs + "   //   ";
    nxs = string_copy(nxs + nxs, 1 + (floor(g_bg_t / 8) mod string_length(nxs)), mqn);
}
scr_ui_text(ix, yy, nxs, g_c[6]);
