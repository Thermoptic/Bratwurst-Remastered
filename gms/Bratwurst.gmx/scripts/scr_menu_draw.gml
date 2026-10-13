/// scr_menu_draw()
// Skeppsval i terminalstil: en ruta per spelarplats (2x2). Texterna SHIP, SPECIAL WEAPON, IS THIS OK? och "PLAYER n IS READY TO ..." finns i
// originalets exe (docs/13); layout och farger ar PLACEHOLDERS. Ledig plats visar "PRESS FIRE TO JOIN" (spelare laggs till har).
var i, px, py, pw, ph, c, st, ssh, pn, rdy, n, r, ry, rx, rw, rc, lbl, vtxt, t, wl, pod_i, a, hp, active, yy;
pw = 490;
ph = 272;
scr_ui_header("BRATWURST // SHIP SELECT", scr_pad2(g_n_players) + " OF 04 PLAYERS");
for (i = 0; i < 4; i += 1)
{
    px = 16 + (i mod 2) * 502;
    py = 44 + (i div 2) * 284;
    c = scr_slot_colour(i);
    if (i == 0) { pn = "ONE"; rdy = "EAT"; }
    if (i == 1) { pn = "TWO"; rdy = "ROCK"; }
    if (i == 2) { pn = "THREE"; rdy = "SWIM"; }
    if (i == 3) { pn = "FOUR"; rdy = "SNEEZE"; }

    if (i >= g_n_players)
    {
        // ledig plats
        if (i == g_n_players) { scr_ui_pane(px, py, pw, ph, "SLOT " + string(i + 1) + " // OPEN", c); }
        else { scr_ui_pane(px, py, pw, ph, "SLOT " + string(i + 1) + " // EMPTY", g_c[3]); }
        g_fs = g_f_lg;
        if (i == g_n_players)
        {
            if ((g_menu_tick mod 60) < 40) { scr_ui_text_c(px + pw / 2, py + 96, "PRESS FIRE TO JOIN", c); }
            g_fs = g_f_sm;
            scr_ui_text_c(px + pw / 2, py + 150, "PLAYER " + pn, g_c[4]);
            scr_ui_text_c(px + pw / 2, py + 172, g_keyhint[i], g_c[3]);
        }
        else
        {
            scr_ui_text_c(px + pw / 2, py + 100, "- - -", g_c[3]);
            g_fs = g_f_sm;
            scr_ui_text_c(px + pw / 2, py + 150, "JOIN SLOT " + string(g_n_players + 1) + " FIRST", g_c[3]);
        }
        continue;
    }

    st = g_sel_stage[i];
    ssh = g_sel_ship[i];
    scr_ui_pane(px, py, pw, ph, "PLAYER " + pn + " // " + g_keyhint[i], c);

    // rader: SHIP / WEAPON / POD / CONFIRM
    n = scr_sel_pod_count(ssh);
    rx = px + 12;
    rw = 280;
    for (r = 0; r < 4; r += 1)
    {
        ry = py + 28 + r * 40;
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
            if (st < 3) { vtxt = "-"; }
        }
        active = (st == r);
        if (active)
        {
            draw_set_color(g_c[1]);
            draw_rectangle(rx, ry, rx + rw, ry + 36, false);
            draw_set_color(c);
            draw_rectangle(rx, ry, rx + 3, ry + 36, false);
            rc = c;
            vtxt = "< " + vtxt + " >";
        }
        else if (r < st) { rc = g_c[4]; }
        else { rc = g_c[3]; }
        g_fs = g_f_md;
        scr_ui_text(rx + 12, ry + 8, lbl, rc);
        scr_ui_text_r(rx + rw - 10, ry + 8, vtxt, rc);
    }

    // tillgangliga specialvapen
    wl = "";
    for (t = 1; t <= 5; t += 1)
    {
        if (g_ship_weapon[ssh, t] != 0)
        {
            if (wl != "") { wl += ", "; }
            wl += g_wshort[t];
        }
    }
    if (wl == "") { wl = "(NONE)"; }
    g_fs = g_f_sm;
    scr_ui_text(rx + 12, py + 196, "AVAILABLE: " + wl, g_c[4]);

    if (st == 4)
    {
        if ((g_menu_tick mod 40) < 28) { scr_ui_text(rx + 12, py + 232, "PLAYER " + pn + " IS READY TO " + rdy, c); }
    }
    else
    {
        if (st == 0) { scr_ui_text(rx + 12, py + 232, "LEFT/RIGHT BROWSE, FIRE CONFIRMS", g_c[3]); }
        if (st == 1) { scr_ui_text(rx + 12, py + 232, "CHOOSE THE SPECIAL WEAPON", g_c[3]); }
        if (st == 2) { scr_ui_text(rx + 12, py + 232, "CHOOSE THE POD IT FIRES FROM", g_c[3]); }
        if (st == 3) { scr_ui_text(rx + 12, py + 232, "IS THIS OK?", g_c[3]); }
    }

    // roterande skeppsforhandsvisning med podmarkeringar
    a = (g_menu_tick * 2) mod 256;
    pod_i = scr_sel_pod(ssh, g_sel_pod[i]);
    hp = -1;
    if (st >= 2) { if (st != 2 || (g_menu_tick mod 20) < 14) { hp = pod_i; } }
    scr_ui_ship(ssh, px + pw - 100, py + 140, 0.55, a, c, hp, true);
}
g_fs = g_f_sm;
scr_ui_text(20, 608, "LEFT/RIGHT BROWSE    FIRE CONFIRM    OPEN SLOT: FIRE = JOIN    F5/BACK = PLAYERS    ESC = MAIN MENU", g_c[4]);
if (g_ready_tick > 0) { scr_ui_text_r(room_width - 20, 608, "ALL READY - LAUNCHING", g_acc); }
