/// scr_pause_draw()
// Pausmenyn over matchen: tre rutor i en rad. Vanster STATS (lage, runda, bana, lat, tid, antal spelare, ledare och per spelare skepp, liv, vinster,
// status), mitten PAUSED (RESUME GAME / QUIT TO MENU, kompakt) och hoger CONTROLS (vad alla knappar gor, pa engelska). Texten ar liten (sm/md) som i
// resten av gransnittet. Nedtonad bakgrund.
var px, py, ph, sw, mw, cw, gap, tot, x0, x1, x2, i, r, ry, lbl, c, p, yy, mc, li, leader, lead_n, lead_w, st, tr;
gap = 12;
ph = clamp(g_vh - 150, 300, 350);
tot = g_vw - 40;
sw = floor(tot * 0.36);
mw = floor(tot * 0.24);
cw = tot - sw - mw - 2 * gap;
if (sw > 330) { sw = 330; }
if (mw > 250) { mw = 250; }
if (cw > 330) { cw = 330; }
tot = sw + mw + cw + 2 * gap;
x0 = g_vx + floor((g_vw - tot) / 2);
x1 = x0 + sw + gap;
x2 = x1 + mw + gap;
py = g_vy + floor((g_vh - ph) / 2);
draw_set_color(g_c[0]);
draw_set_alpha(0.6);
draw_rectangle(g_vx - 4, g_vy - 4, g_vx + g_vw + 4, g_vy + g_vh + 4, false);
draw_set_alpha(1);
g_fs = g_f_sm;
mc = max(6, floor((sw - 24) / scr_ui_tw("W")));   // tecken per rad i statsrutan

// ---- STATS (vanster) ----
scr_ui_pane(x0, py, sw, ph, "MATCH STATS", g_acc);
yy = py + 16;
lbl = "MODE";
scr_ui_text(x0 + 12, yy, "MODE", g_c[3]);       scr_ui_text_r(x0 + sw - 12, yy, scr_mode_name(), g_c[6]); yy += 17;
scr_ui_text(x0 + 12, yy, "ROUND", g_c[3]);      scr_ui_text_r(x0 + sw - 12, yy, string(g_round) + " OF " + string(g_rounds_total), g_c[6]); yy += 17;
scr_ui_text(x0 + 12, yy, "MAP", g_c[3]);        scr_ui_text_r(x0 + sw - 12, yy, string_copy(string_upper(g_match_map), 1, mc - 6), g_c[6]); yy += 17;
if (g_sv[g_SV_MUSIC]) { tr = g_trk_name[g_trk_idx]; } else { tr = "OFF"; }
scr_ui_text(x0 + 12, yy, "MUSIC", g_c[3]);      scr_ui_text_r(x0 + sw - 12, yy, string_copy(tr, 1, mc - 7), g_c[6]); yy += 17;
scr_ui_text(x0 + 12, yy, "TIME", g_c[3]);       scr_ui_text_r(x0 + sw - 12, yy, scr_pad2(floor(g_tick / 3000)) + ":" + scr_pad2(floor(g_tick / 50) mod 60), g_c[6]); yy += 17;
scr_ui_text(x0 + 12, yy, "PLAYERS", g_c[3]);    scr_ui_text_r(x0 + sw - 12, yy, string(g_n_players), g_c[6]); yy += 17;
// ledare: flest rundvinster
lead_w = 0;
for (i = 0; i < g_n_players; i += 1) { lead_w = max(lead_w, g_wins[i]); }
lead_n = 0;
leader = -1;
for (i = 0; i < g_n_players; i += 1) { if (g_wins[i] == lead_w) { lead_n += 1; leader = i; } }
scr_ui_text(x0 + 12, yy, "LEADER", g_c[3]);
if (g_n_players < 2) { scr_ui_text_r(x0 + sw - 12, yy, "-", g_c[3]); }
else if (lead_w == 0) { scr_ui_text_r(x0 + sw - 12, yy, "NONE YET", g_c[4]); }
else if (lead_n > 1) { scr_ui_text_r(x0 + sw - 12, yy, "TIED AT " + string(lead_w), g_c[4]); }
else { scr_ui_text_r(x0 + sw - 12, yy, "PLAYER " + string(leader + 1) + " (" + string(lead_w) + ")", scr_slot_colour(leader)); }
yy += 20;
draw_set_color(g_c[2]);
draw_rectangle(x0 + 10, yy - 4, x0 + sw - 10, yy - 4, false);
// per spelare: skepp, vinster, liv och status
for (i = 0; i < g_n_players; i += 1)
{
    c = scr_slot_colour(i);
    g_hud_slot = i;
    g_hud_id = noone;
    with (obj_player) { if (slot == g_hud_slot) { g_hud_id = id; } }
    p = g_hud_id;
    if (p == noone) { continue; }
    scr_ui_text(x0 + 12, yy, "P" + string(i + 1) + " " + string_copy(string_upper(p.ship_name), 1, max(4, mc - 14)), c);
    scr_ui_text_r(x0 + sw - 12, yy, "WINS " + string(g_wins[i]), c);
    yy += 17;
    for (li = 0; li < g_lives_max; li += 1)
    {
        if (li < p.p_lives) { draw_set_color(c); draw_rectangle(x0 + 12 + li * 14, yy + 3, x0 + 20 + li * 14, yy + 11, false); }
        else { draw_set_color(g_c[3]); draw_rectangle(x0 + 12 + li * 14, yy + 3, x0 + 20 + li * 14, yy + 11, true); }
    }
    if (p.alive) { st = "EN " + string(max(0, p.energy)) + "/" + string(p.energy_max); }
    else if (p.respawn_t > 0) { st = "RESPAWN " + string(ceil(p.respawn_t / 50)); }
    else { st = "OUT"; }
    scr_ui_text_r(x0 + sw - 12, yy, st, g_c[4]);
    yy += 22;
}

// ---- PAUSED (mitten) ----
scr_ui_pane(x1, py, mw, ph, "PAUSED", g_acc);
for (r = 0; r < 3; r += 1)
{
    ry = py + 26 + r * 34;
    if (r == 0) { lbl = "RESUME GAME"; }
    if (r == 1) { lbl = "OPTIONS"; }
    if (r == 2) { lbl = "QUIT TO MENU"; }
    if (g_pause_sel == r)
    {
        draw_set_color(g_c[1]);
        draw_rectangle(x1 + 10, ry, x1 + mw - 10, ry + 28, false);
        draw_set_color(g_acc);
        draw_rectangle(x1 + 10, ry, x1 + 13, ry + 28, false);
        c = g_acc;
    }
    else { c = g_c[4]; }
    g_fs = g_f_md;
    scr_ui_text(x1 + 24, ry + 5, lbl, c);
}
g_fs = g_f_sm;
scr_ui_text_c(x1 + mw / 2, py + ph - 74, "D-PAD  CHOOSE", g_c[3]);
scr_ui_text_c(x1 + mw / 2, py + ph - 56, "A / START  OK", g_c[3]);
scr_ui_text_c(x1 + mw / 2, py + ph - 38, "B  RESUME", g_c[3]);
scr_ui_text_c(x1 + mw / 2, py + ph - 20, "LB / RB  CHANGE SONG", g_c[3]);

// ---- CONTROLS (hoger) ----
scr_ui_pane(x2, py, cw, ph, "CONTROLS", g_acc);
yy = py + 16;
g_fs = g_f_sm;
scr_ui_text(x2 + 12, yy, "GAMEPAD", g_acc); yy += 17;
scr_ui_text(x2 + 12, yy, "STICK / D-PAD", g_c[4]);   scr_ui_text_r(x2 + cw - 12, yy, "TURN", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "A", g_c[4]);               scr_ui_text_r(x2 + cw - 12, yy, "CANNON", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "X / RT", g_c[4]);          scr_ui_text_r(x2 + cw - 12, yy, "THRUST", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "Y", g_c[4]);               scr_ui_text_r(x2 + cw - 12, yy, "SPECIAL WEAPON", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "B", g_c[4]);               scr_ui_text_r(x2 + cw - 12, yy, "POWERUP", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "BACK", g_c[4]);            scr_ui_text_r(x2 + cw - 12, yy, "NEXT SPECIAL", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "LB", g_c[4]);              scr_ui_text_r(x2 + cw - 12, yy, "WEAPON POD", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "RB", g_c[4]);              scr_ui_text_r(x2 + cw - 12, yy, "NEXT SHIP (TEST)", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "LT + THRUST", g_c[4]);     scr_ui_text_r(x2 + cw - 12, yy, "DRIFT", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "LT ALONE", g_c[4]);        scr_ui_text_r(x2 + cw - 12, yy, "REVERSE", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "START", g_c[4]);           scr_ui_text_r(x2 + cw - 12, yy, "PAUSE", g_c[6]); yy += 15;
scr_ui_text(x2 + 12, yy, "LB / RB IN PAUSE", g_c[4]);   scr_ui_text_r(x2 + cw - 12, yy, "CHANGE SONG", g_c[6]);
