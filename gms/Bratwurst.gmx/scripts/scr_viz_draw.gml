/// scr_viz_draw(x, y, w, h)
// Menyns spektrum: 32 LED-staplar (segment grona -> gula -> roda), toppmarkorer som faller, spegling under basen, en oscilloskoplinje over staplarna,
// en glodande baslinje som pulserar med basen och en liten spektrogramhistorik (6 rader) langst ner. Allt drivs av g_mw (scr_musicviz_update).
var vx, vy, vw, vh, base, nseg, b, s, lit, bx, bw, step, col, fq, lv, pkh, bass, p, u, i0, vv, xx, yy, ox, oy, r, ya;
vx = argument0; vy = argument1; vw = argument2; vh = argument3;
base = vy + floor(vh * 0.62);
nseg = floor((base - vy - 2) / 4);
step = vw / 32;
bw = max(2, floor(step) - 1);
draw_set_color(g_c[1]);
draw_set_alpha(0.55);
draw_rectangle(vx - 2, vy - 2, vx + vw + 2, vy + vh + 2, false);
draw_set_alpha(1);
bass = (g_mw[0] + g_mw[1] + g_mw[2] + g_mw[3]) / 4;
draw_set_color(g_acc);
draw_set_alpha(0.25 + bass * 0.6);
draw_rectangle(vx, base + 1, vx + vw, base + 2, false);
draw_set_alpha(1);
for (b = 0; b < 32; b += 1)
{
    bx = vx + floor(b * step);
    lv = g_mw[b];
    lit = floor(lv * nseg + 0.5);
    for (s = 0; s < lit; s += 1)
    {
        fq = s / nseg;
        col = scr_theme_ramp(fq, 0);
        draw_set_color(col);
        draw_rectangle(bx, base - (s + 1) * 4, bx + bw - 1, base - (s + 1) * 4 + 2, false);
    }
    // spegling under baslinjen
    for (s = 0; s < min(lit, 5); s += 1)
    {
        fq = s / nseg;
        col = scr_theme_ramp(fq, 0);
        draw_set_color(col);
        draw_set_alpha(0.3 - s * 0.055);
        draw_rectangle(bx, base + 4 + s * 4, bx + bw - 1, base + 4 + s * 4 + 2, false);
        draw_set_alpha(1);
    }
    // toppmarkor
    pkh = floor(g_mw_pk[b] * nseg + 0.5);
    if (pkh > lit)
    {
        draw_set_color(g_c[7]);
        draw_rectangle(bx, base - pkh * 4, bx + bw - 1, base - pkh * 4 + 1, false);
    }
}
// oscilloskoplinje
draw_set_color(g_c[14]);
draw_set_alpha(0.6);
ox = vx;
oy = base - 34;
for (p = 0; p < 48; p += 1)
{
    u = p / 47 * 31;
    i0 = floor(u);
    vv = g_mw[i0] * (1 - (u - i0)) + g_mw[min(31, i0 + 1)] * (u - i0);
    xx = vx + p / 47 * vw;
    yy = base - 34 - sin(p * 0.55 + g_bg_t * 0.3) * vv * 14;
    if (p > 0) { draw_line_width(ox, oy, xx, yy, 1.2); }
    ox = xx;
    oy = yy;
}
draw_set_alpha(1);
// spektrogramhistorik (6 rader)
ya = vy + vh - 13;
for (r = 0; r < 6; r += 1)
{
    for (b = 0; b < 32; b += 1)
    {
        lv = g_mw_hist[r * 32 + b];
        if (lv > 0.1)
        {
            col = merge_colour(g_c[0], scr_theme_ramp(b / 31, 1), 0.35 + 0.65 * lv);
            draw_set_color(col);
            draw_set_alpha(0.8 - r * 0.12);
            draw_rectangle(vx + floor(b * step), ya + r * 2, vx + floor(b * step) + bw - 1, ya + r * 2 + 1, false);
        }
    }
}
draw_set_alpha(1);
