/// scr_pause_draw()
// Pausmenyn over matchen (D-071, forslag E "band over skarmen"): ett vagrat band over hela bredden med rubriken PAUSED (medelstor text), de tre valen pa en rad
// (stor text; valt val i ljus text med understrykning), en rad med matchinfo (liten text), sma spelarkort under bandet (energi och liv, eller placering och varv i
// Race) och en rad med knapphjalp: kvadratiska knappramar (exakt 1:1) med tecknet centrerat i mitten. Bandets hojd raknas ut ur typsnittens hojder.
// Kontrollerna visas i en egen ruta med Y (scr_pause_controls_draw). Nedtonad bakgrund. Styrs av scr_pause_step.
var by, bh, cx, k, xx, gap, wsum, lbl, tm, info, n, cw, cg, ctot, x0, cy0, ch, i, c, p, st, tx, h1, h2, h3, ty, fh, sq, kw, ky, lw;
cx = g_vx + g_vw / 2;
draw_set_color(g_c[0]);
draw_set_alpha(0.62);
draw_rectangle(g_vx - 4, g_vy - 4, g_vx + g_vw + 4, g_vy + g_vh + 4, false);
draw_set_alpha(1);
if (g_pause_ctrl) { scr_pause_controls_draw(); exit; }

// typsnittshojder (rumskoordinater): PAUSED = medel, valen = stor, matchinfo = liten (85 %)
draw_set_font(g_fnt[g_fk * 4 + g_f_md]);
h1 = string_height("A") / g_k;
draw_set_font(g_fnt[g_fk * 4 + g_f_lg]);
h2 = string_height("A") / g_k;
draw_set_font(g_fnt[g_fk * 4 + g_f_sm]);
h3 = string_height("A") * g_TXT_SMALL / g_k;
bh = 12 + h1 + 14 + h2 + 16 + h3 + 14;
by = g_vy + floor(g_vh / 2) - floor(bh / 2) - 70;
draw_set_color(g_c[0]);
draw_set_alpha(0.95);
draw_rectangle(g_vx - 4, by, g_vx + g_vw + 4, by + bh, false);
draw_set_alpha(1);
draw_set_color(g_c[3]);
draw_line(g_vx - 4, by, g_vx + g_vw + 4, by);
draw_line(g_vx - 4, by + bh, g_vx + g_vw + 4, by + bh);
ty = by + 12;
g_fs = g_f_md;
scr_ui_text_c(cx, ty, "PAUSED", g_acc);
ty += h1 + 14;

// valen pa en rad
g_fs = g_f_lg;
gap = 56;
wsum = 2 * gap;
for (k = 0; k < 3; k += 1)
{
    if (k == 0) { lbl[k] = "RESUME"; }
    if (k == 1) { lbl[k] = "OPTIONS"; }
    if (k == 2) { lbl[k] = "QUIT TO MENU"; }
    tm[k] = scr_ui_tw(lbl[k]);
    wsum += tm[k];
}
xx = cx - wsum / 2;
for (k = 0; k < 3; k += 1)
{
    if (g_pause_sel == k)
    {
        scr_ui_text(xx, ty, lbl[k], g_c[6]);
        draw_set_color(g_acc);
        draw_rectangle(xx, ty + h2 + 2, xx + tm[k], ty + h2 + 3, false);
    }
    else { scr_ui_text(xx, ty, lbl[k], g_c[3]); }
    xx += tm[k] + gap;
}
ty += h2 + 16;

// matchinfo (liten text)
tx = floor(g_tick / 3000);
info = scr_mode_name() + " // ROUND " + string(g_round) + " OF " + string(g_rounds_total) + " // " + string_upper(g_match_map) + " // " + scr_pad2(tx) + ":" + scr_pad2(floor(g_tick / 50) mod 60);
draw_set_font(g_fnt[g_fk * 4 + g_f_sm]);
scr_ed_txt(cx - string_width(info) * g_TXT_SMALL / g_k / 2, ty, info, g_c[4]);

// spelarkort under bandet
g_fs = g_f_sm;
n = clamp(g_n_players, 1, 4);
cg = 12;
cw = 190;
if (n * cw + (n - 1) * cg > g_vw - 40) { cw = floor((g_vw - 40 - (n - 1) * cg) / n); }
ctot = n * cw + (n - 1) * cg;
x0 = cx - ctot / 2;
cy0 = by + bh + 14;
ch = 56;
for (i = 0; i < n; i += 1)
{
    g_hud_slot = i;
    g_hud_id = noone;
    with (obj_player) { if (slot == g_hud_slot) { g_hud_id = id; } }
    p = g_hud_id;
    if (p == noone) { continue; }
    c = scr_slot_colour(i);
    xx = x0 + i * (cw + cg);
    draw_set_color(g_c[0]);
    draw_set_alpha(0.9);
    draw_rectangle(xx, cy0, xx + cw, cy0 + ch, false);
    draw_set_alpha(1);
    draw_set_color(g_c[3]);
    draw_rectangle(xx, cy0, xx + cw, cy0 + ch, true);
    scr_ui_text(xx + 8, cy0 + 6, "P" + string(i + 1) + " " + string_copy(string_upper(p.ship_name), 1, 11), c);
    scr_ui_text_r(xx + cw - 8, cy0 + 6, "W " + string(g_wins[i]), g_c[4]);
    if (!p.alive)
    {
        if (p.respawn_t > 0) { st = "RESPAWN " + string(ceil(p.respawn_t / 50)); } else { st = "OUT"; }
        scr_ui_text(xx + 8, cy0 + 28, st, g_c[8]);
    }
    else if (g_game_mode == 2)
    {
        // Race: placering och varv
        scr_ui_text(xx + 8, cy0 + 28, "POS " + string(scr_race_pos(p, false)) + "/" + string(g_rk_n), g_acc);
        if (p.race_fin) { scr_ui_text_r(xx + cw - 8, cy0 + 28, "FIN " + scr_race_time(p.race_ft), g_c[11]); }
        else { scr_ui_text_r(xx + cw - 8, cy0 + 28, "LAP " + string(min(p.race_laps + 1, g_race_target)) + "/" + string(g_race_target), c); }
    }
    else
    {
        // energi (stapel) och liv (rutor)
        scr_ui_bar(xx + 8, cy0 + 29, cw - 16, 8, max(0, p.energy) / max(1, p.energy_max), c);
        for (k = 0; k < g_lives_max; k += 1)
        {
            if (k < p.p_lives) { draw_set_color(c); draw_rectangle(xx + 8 + k * 12, cy0 + 43, xx + 15 + k * 12, cy0 + 48, false); }
            else { draw_set_color(g_c[3]); draw_rectangle(xx + 8 + k * 12, cy0 + 43, xx + 15 + k * 12, cy0 + 48, true); }
        }
        scr_ui_text_r(xx + cw - 8, cy0 + 38, "EN " + string(max(0, p.energy)), g_c[4]);
    }
}

// knapphjalp pa en rad: varje knapp ar en kvadratisk ram (sq x sq) med tecknet exakt i mitten, sedan vad knappen gor
g_fs = g_f_sm;
draw_set_font(g_fnt[g_fk * 4 + g_f_sm]);
fh = string_height("A") / g_k;
sq = max(scr_ui_tw("LB") + 8, fh + 6);
cy0 = cy0 + ch + 18;
// poster: tecken per knapp ("< >" = tva knappar), etikett
wsum = 0;
n = 0;
for (k = 0; k < 5; k += 1)
{
    if (k == 0) { lbl[k] = "CHOOSE"; tm[k] = 2; }
    if (k == 1) { lbl[k] = "OK"; tm[k] = 1; }
    if (k == 2) { lbl[k] = "RESUME"; tm[k] = 1; }
    if (k == 3) { lbl[k] = "CONTROLS"; tm[k] = 1; }
    if (k == 4) { lbl[k] = "SONG"; tm[k] = 2; }
    wsum += tm[k] * sq + (tm[k] - 1) * 4 + 6 + scr_ui_tw(lbl[k]);
}
wsum += 4 * 22;
xx = cx - wsum / 2;
for (k = 0; k < 5; k += 1)
{
    c = g_c[4];
    if (k == 1) { c = g_c[11]; }
    if (k == 2) { c = g_c[8]; }
    if (k == 3) { c = g_c[10]; }
    for (i = 0; i < tm[k]; i += 1)
    {
        if (k == 0 && i == 0) { st = "<"; }
        if (k == 0 && i == 1) { st = ">"; }
        if (k == 1) { st = "A"; }
        if (k == 2) { st = "B"; }
        if (k == 3) { st = "Y"; }
        if (k == 4 && i == 0) { st = "LB"; }
        if (k == 4 && i == 1) { st = "RB"; }
        draw_set_color(c);
        draw_rectangle(xx, cy0, xx + sq, cy0 + sq, true);
        scr_ui_text(xx + (sq - scr_ui_tw(st)) / 2, cy0 + (sq - fh) / 2 + fh * 0.05, st, c);   // tecknet centrerat i rutan (versalerna sitter i radens ovre del, darfor 5 % nedat)
        xx += sq + 4;
    }
    xx += 2;
    scr_ui_text(xx, cy0 + (sq - fh) / 2, lbl[k], g_c[4]);
    xx += scr_ui_tw(lbl[k]) + 22;
}
