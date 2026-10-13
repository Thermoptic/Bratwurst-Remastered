/// scr_menu_draw()
// Skeppsval i terminalstil: en ruta per spelarplats (2x2), varje ruta delad i statuslist (steg 1-4), radlista (SHIP, WEAPON, POD, CONFIRM),
// vapenchips, en ram med roterande skepp och statstaplar. Texterna SHIP, SPECIAL WEAPON, IS THIS OK? och "PLAYER n IS READY TO ..." finns i
// originalets exe (docs/13); layout, taplar och farger ar PLACEHOLDERS. Statstaplarna visar skeppets parametrar (g_ship_par) i forhallande
// till det basta skeppet. Ledig plats visar "PRESS FIRE TO JOIN" (spelare laggs till har).
var i, px, py, pw, ph, c, st, ssh, pn, rdy, n, r, ry, rx, rw, rc, lbl, vtxt, t, a, hp, active, yy, s;
var lw, cx0, cw, vh, vy, rowh, bx, bw, k, sf, chx, chy, ctw, sel, avail, pcx, pcy, sx, ex, mxth, mxen, mxtu, mxam, mnrl, rlv;
pw = floor((g_vw - 32 - 12) / 2);
ph = floor((g_vh - 44 - 32 - 12) / 2);
scr_bg_draw();   // samma bakgrund som titelskarmen och huvudmenyn
scr_ui_header("BRATWURST // SHIP SELECT // " + scr_mode_name(), scr_pad2(g_n_players) + " OF 04 PLAYERS");

// basta varde per parameter bland alla skepp (for statstaplarna)
mxth = 1; mxen = 1; mxtu = 1; mxam = 1; mnrl = 9999;
for (s = 0; s < g_ship_count; s += 1)
{
    mxth = max(mxth, g_ship_par[s, 1]);
    mxen = max(mxen, g_ship_par[s, 3]);
    mxtu = max(mxtu, g_ship_par[s, 5]);
    mxam = max(mxam, g_ship_par[s, 9]);
    if (g_ship_par[s, 2] > 0) { mnrl = min(mnrl, g_ship_par[s, 2]); }
}

for (i = 0; i < 4; i += 1)
{
    px = g_vx + 16 + (i mod 2) * (pw + 12);
    py = g_vy + 44 + (i div 2) * (ph + 12);
    c = scr_slot_colour(i);
    if (i == 0) { pn = "ONE"; rdy = "EAT"; }
    if (i == 1) { pn = "TWO"; rdy = "ROCK"; }
    if (i == 2) { pn = "THREE"; rdy = "SWIM"; }
    if (i == 3) { pn = "FOUR"; rdy = "SNEEZE"; }

    if (i >= g_n_players)
    {
        // ledig plats: ram med platsnummer, blinkande uppmaning och tangentbordshjalp
        if (i == g_n_players) { scr_ui_pane(px, py, pw, ph, "SLOT " + string(i + 1) + " // OPEN", c); }
        else { scr_ui_pane(px, py, pw, ph, "SLOT " + string(i + 1) + " // EMPTY", g_c[3]); }
        pcx = px + pw / 2;
        pcy = py + floor(ph / 2);
        // tom skeppsram med hornmarkeringar
        if (i == g_n_players) { rc = c; } else { rc = g_c[3]; }
        draw_set_color(g_c[2]);
        draw_rectangle(pcx - 70, pcy - 62, pcx + 70, pcy + 62, true);
        draw_set_color(rc);
        draw_rectangle(pcx - 70, pcy - 62, pcx - 58, pcy - 62, false);
        draw_rectangle(pcx - 70, pcy - 62, pcx - 70, pcy - 50, false);
        draw_rectangle(pcx + 58, pcy - 62, pcx + 70, pcy - 62, false);
        draw_rectangle(pcx + 70, pcy - 62, pcx + 70, pcy - 50, false);
        draw_rectangle(pcx - 70, pcy + 62, pcx - 58, pcy + 62, false);
        draw_rectangle(pcx - 70, pcy + 50, pcx - 70, pcy + 62, false);
        draw_rectangle(pcx + 58, pcy + 62, pcx + 70, pcy + 62, false);
        draw_rectangle(pcx + 70, pcy + 50, pcx + 70, pcy + 62, false);
        g_fs = g_f_lg;
        if (i == g_n_players)
        {
            if ((g_menu_tick mod 60) < 40) { scr_ui_text_c(pcx, pcy - 22, "PRESS FIRE", c); scr_ui_text_c(pcx, pcy + 2, "TO JOIN", c); }
            g_fs = g_f_sm;
            scr_ui_text_c(pcx, pcy + 34, "PLAYER " + pn, g_c[4]);
            scr_ui_text_c(pcx, py + ph - 24, g_keyhint[i], g_c[3]);
        }
        else
        {
            scr_ui_text_c(pcx, pcy - 10, "- - -", g_c[3]);
            g_fs = g_f_sm;
            scr_ui_text_c(pcx, pcy + 34, "JOIN SLOT " + string(g_n_players + 1) + " FIRST", g_c[3]);
        }
        continue;
    }

    st = g_sel_stage[i];
    ssh = g_sel_ship[i];
    if (st == 4) { scr_ui_pane(px, py, pw, ph, "PLAYER " + pn + " // READY", c); }
    else { scr_ui_pane(px, py, pw, ph, "PLAYER " + pn + " // " + g_keyhint[i], c); }

    // kolumner: radlista till vanster, skeppsram och taplar till hoger
    lw = floor((pw - 36) * 0.58);
    rx = px + 12;
    rw = lw;
    cx0 = rx + lw + 12;
    cw = px + pw - 12 - cx0;

    // statuslist: de fyra stegen (klara = fyllda, aktivt = markerat)
    bw = floor((pw - 24 - 3 * 4) / 4);
    g_fs = g_f_sm;
    for (r = 0; r < 4; r += 1)
    {
        bx = rx + r * (bw + 4);
        if (r == 0) { lbl = "1 SHIP"; }
        if (r == 1) { lbl = "2 WEAPON"; }
        if (r == 2) { lbl = "3 POD"; }
        if (r == 3) { lbl = "4 OK"; }
        if (st > r)
        {
            draw_set_color(g_c[1]);
            draw_rectangle(bx, py + 12, bx + bw, py + 30, false);
            draw_set_color(c);
            draw_rectangle(bx, py + 12, bx + bw, py + 30, true);
            scr_ui_text_c(bx + bw / 2, py + 14, lbl, c);
        }
        else if (st == r)
        {
            draw_set_color(c);
            draw_rectangle(bx, py + 12, bx + bw, py + 30, false);
            scr_ui_text_c(bx + bw / 2, py + 14, lbl, g_c[0]);
        }
        else
        {
            draw_set_color(g_c[2]);
            draw_rectangle(bx, py + 12, bx + bw, py + 30, true);
            scr_ui_text_c(bx + bw / 2, py + 14, lbl, g_c[3]);
        }
    }

    // rader: SHIP / WEAPON / POD / CONFIRM
    n = scr_sel_pod_count(ssh);
    rowh = 32;
    for (r = 0; r < 4; r += 1)
    {
        ry = py + 40 + r * rowh;
        if (r == 0) { lbl = "SHIP"; vtxt = string_upper(g_ship_name[ssh]); }
        if (r == 1) { lbl = "WEAPON"; vtxt = g_wname[g_sel_weapon[i]]; }
        if (r == 2)
        {
            lbl = "POD";
            if (n > 0) { vtxt = string(g_sel_pod[i] + 1) + " / " + string(n); } else { vtxt = "-"; }
        }
        if (r == 3)
        {
            lbl = "CONFIRM";
            if (g_sel_yes[i] == 1) { vtxt = "YES"; } else { vtxt = "NO"; }
        }
        active = (st == r);
        if (active)
        {
            draw_set_color(g_c[1]);
            draw_rectangle(rx, ry, rx + rw, ry + rowh - 4, false);
            draw_set_color(c);
            draw_rectangle(rx, ry, rx + 3, ry + rowh - 4, false);
            rc = c;
        }
        else
        {
            draw_set_color(g_c[2]);
            draw_rectangle(rx, ry + rowh - 4, rx + rw, ry + rowh - 4, false);   // tunn avdelare mellan raderna
            if (st > r) { rc = g_c[6]; } else { rc = g_c[4]; }
        }
        g_fs = g_f_sm;
        scr_ui_text(rx + 10, ry + 2, "0" + string(r + 1), g_c[3]);
        scr_ui_text(rx + 10, ry + 14, lbl, rc);
        g_fs = g_f_md;
        if (active)
        {
            scr_ui_text_r(rx + rw - 10, ry + 7, "< " + vtxt + " >", rc);
        }
        else { scr_ui_text_r(rx + rw - 10, ry + 7, vtxt, rc); }
    }

    // tillgangliga specialvapen som chips (valt vapen fylls)
    g_fs = g_f_sm;
    chx = rx;
    chy = py + 40 + 4 * rowh + 4;
    scr_ui_text(chx, chy, "SPECIAL WEAPONS", g_c[3]);
    chy += 16;
    for (t = 1; t <= 5; t += 1)
    {
        avail = (g_ship_weapon[ssh, t] != 0);
        if (g_game_mode == 1) { avail = (t == 1 || t == 3); }
        if (!avail) { continue; }
        ctw = scr_ui_tw(g_wshort[t]) + 12;
        if (chx + ctw > rx + rw) { chx = rx; chy += 20; }
        if (g_sel_weapon[i] == t)
        {
            draw_set_color(c);
            draw_rectangle(chx, chy, chx + ctw, chy + 17, false);
            scr_ui_text(chx + 6, chy + 1, g_wshort[t], g_c[0]);
        }
        else
        {
            draw_set_color(g_c[3]);
            draw_rectangle(chx, chy, chx + ctw, chy + 17, true);
            scr_ui_text(chx + 6, chy + 1, g_wshort[t], g_c[4]);
        }
        chx += ctw + 6;
    }

    // skeppsram: roterande skepp med radarringar, hornmarkeringar och index
    vh = clamp(ph - 165, 70, 150);
    vy = py + 40;
    draw_set_color(g_c[1]);
    draw_set_alpha(0.6);
    draw_rectangle(cx0, vy, cx0 + cw, vy + vh, false);
    draw_set_alpha(1);
    pcx = cx0 + cw / 2;
    pcy = vy + vh / 2;
    draw_set_color(g_c[2]);
    draw_line(cx0 + 4, pcy, cx0 + cw - 4, pcy);
    draw_line(pcx, vy + 4, pcx, vy + vh - 4);
    draw_circle(pcx, pcy, min(cw, vh) * 0.30, true);
    draw_circle(pcx, pcy, min(cw, vh) * 0.46, true);
    draw_set_color(g_c[3]);
    draw_rectangle(cx0, vy, cx0 + cw, vy + vh, true);
    draw_set_color(c);
    draw_rectangle(cx0, vy, cx0 + 8, vy, false);
    draw_rectangle(cx0, vy, cx0, vy + 8, false);
    draw_rectangle(cx0 + cw - 8, vy, cx0 + cw, vy, false);
    draw_rectangle(cx0 + cw, vy, cx0 + cw, vy + 8, false);
    draw_rectangle(cx0, vy + vh, cx0 + 8, vy + vh, false);
    draw_rectangle(cx0, vy + vh - 8, cx0, vy + vh, false);
    draw_rectangle(cx0 + cw - 8, vy + vh, cx0 + cw, vy + vh, false);
    draw_rectangle(cx0 + cw, vy + vh - 8, cx0 + cw, vy + vh, false);
    a = (g_menu_tick * 2) mod 256;
    hp = -1;
    if (st >= 2) { if (st != 2 || (g_menu_tick mod 20) < 14) { hp = scr_sel_pod(ssh, g_sel_pod[i]); } }   // pods visas nar raden POD eller senare ar vald
    scr_ui_ship(ssh, pcx, pcy - 4, min(0.5, vh / 230), a, c, hp, true);
    g_fs = g_f_sm;
    scr_ui_text(cx0 + 6, vy + 4, scr_pad2(ssh + 1) + "/" + scr_pad2(g_ship_count), g_c[4]);
    scr_ui_text_r(cx0 + cw - 6, vy + 4, "PODS " + string(n), g_c[4]);
    scr_ui_text_c(pcx, vy + vh - 18, string_upper(g_ship_name[ssh]), c);

    // statstaplar fran skeppets parametrar
    yy = vy + vh + 8;
    for (r = 0; r < 5; r += 1)
    {
        rlv = g_ship_par[ssh, 2];
        if (r == 0) { lbl = "SPEED"; sf = g_ship_par[ssh, 1] / mxth; }
        if (r == 1) { lbl = "ENERGY"; sf = g_ship_par[ssh, 3] / mxen; }
        if (r == 2) { lbl = "TURN"; sf = g_ship_par[ssh, 5] / mxtu; }
        if (r == 3) { lbl = "AMMO"; sf = g_ship_par[ssh, 9] / mxam; }
        if (r == 4)
        {
            lbl = "RATE";
            if (rlv > 0) { sf = mnrl / rlv; } else { sf = 1; }
        }
        scr_ui_text(cx0, yy + r * 17, lbl, g_c[4]);
        scr_ui_bar(cx0 + 62, yy + r * 17 + 3, cw - 62, 8, sf, c);
    }

    // nederkant: avdelare och statusrad
    draw_set_color(g_c[2]);
    draw_rectangle(px + 10, py + ph - 28, px + pw - 10, py + ph - 28, false);
    g_fs = g_f_sm;
    if (st == 4)
    {
        if ((g_menu_tick mod 40) < 28) { scr_ui_text(rx + 2, py + ph - 22, "PLAYER " + pn + " IS READY TO " + rdy, c); }
    }
    else
    {
        if (st == 0) { scr_ui_text(rx + 2, py + ph - 22, "UP/DOWN ROW, LEFT/RIGHT CHANGE", g_c[3]); }
        if (st == 1) { scr_ui_text(rx + 2, py + ph - 22, "CHOOSE THE SPECIAL WEAPON", g_c[3]); }
        if (st == 2) { scr_ui_text(rx + 2, py + ph - 22, "CHOOSE THE POD IT FIRES FROM", g_c[3]); }
        if (st == 3) { scr_ui_text(rx + 2, py + ph - 22, "IS THIS OK?", g_c[3]); }
    }
}
g_fs = g_f_sm;
scr_ui_text(g_vx + 20, g_vy + g_vh - 32, "UP/DOWN ROW   LEFT/RIGHT CHANGE   FIRE NEXT/OK   X/THRUST BACK   F5/BACK PLAYERS   ESC MENU", g_c[4]);
if (g_ready_tick > 0) { scr_ui_text_r(g_vx + g_vw - 20, g_vy + g_vh - 32, "ALL READY - LAUNCHING", g_acc); }
