/// scr_ed_step()
// En tick i banredigeraren (g_state = 20). Mus + tangentbord. Verktyg: B = rektangel, P = polygon, X = radera, T = startplats, F = start/malruta (Race).
// Se scr_ed_draw for hjalptexten. Allt ar solida hinder: formerna blir vaggar med kollision.
var s, k, ns, wup, wdn, sxp, syp;
g_menu_tick += 1;
if (g_ed_msgt > 0) { g_ed_msgt -= 1; }
if (g_ed_cdel > 0) { g_ed_cdel -= 1; }
if (g_ed_cesc > 0) { g_ed_cesc -= 1; }
scr_ed_cursor();
if (g_ed_dlg == 1) { scr_ed_dlg_step(); exit; }   // sparfonstret ar modalt
if (g_ed_dlg == 2) { scr_ed_load_step(); exit; }   // laddafonstret ar modalt

if (keyboard_check_pressed(ord("B"))) { g_ed_tool = 0; g_ed_cn = 0; g_ed_bset = false; }
if (keyboard_check_pressed(ord("P"))) { g_ed_tool = 1; g_ed_cn = 0; g_ed_bset = false; }
if (keyboard_check_pressed(ord("X"))) { g_ed_tool = 2; g_ed_cn = 0; g_ed_bset = false; }
if (keyboard_check_pressed(ord("T"))) { g_ed_tool = 3; g_ed_cn = 0; g_ed_bset = false; }
if (keyboard_check_pressed(ord("O"))) { g_ed_tool = 5; g_ed_cn = 0; g_ed_bset = false; g_ed_pkmv = -1; }   // Race: pickuppunkter (D-056)
if (keyboard_check_pressed(ord("F"))) { g_ed_tool = 4; g_ed_cn = 0; g_ed_bset = false; }   // Race: start/malruta (D-054)
if (keyboard_check_pressed(ord("C"))) { g_ed_tool = 6; g_ed_cn = 0; g_ed_bset = false; }   // Capture the Bratwurst: korvens startpunkt (D-078)
if (keyboard_check_pressed(ord("R"))) { g_ed_tool = 7; g_ed_cn = 0; g_ed_bset = false; }   // Capture the Bratwurst: roda zonen
if (keyboard_check_pressed(ord("V"))) { g_ed_tool = 8; g_ed_cn = 0; g_ed_bset = false; }   // Capture the Bratwurst: bla zonen
for (k = 0; k < 4; k += 1)
{
    if (keyboard_check_pressed(ord("1") + k)) { g_ed_tool = 3; g_ed_spawn = k; g_ed_cn = 0; g_ed_bset = false; }
}
if (keyboard_check_pressed(ord("Q"))) { g_ed_sa[g_ed_spawn] = (g_ed_sa[g_ed_spawn] + 256 - 16) mod 256; g_ed_dirty = true; }
if (keyboard_check_pressed(ord("E"))) { g_ed_sa[g_ed_spawn] = (g_ed_sa[g_ed_spawn] + 16) mod 256; g_ed_dirty = true; }
// mushjulet vrider den valda startplatsens skepp (8/256 varv = 11,25 grader per klick; upp = moturs, ned = medurs)
// mushjulet (D-061): over malrutan vrider det pilarna, nara den valda startplatsen (verktyg T) vrider det skeppet, annars zoomar det ritytan
wup = mouse_wheel_up();
wdn = mouse_wheel_down();
if ((wup || wdn) && g_ed_inside)
{
    sxp = g_ed_cxs + (g_ed_sx[g_ed_spawn] / 256) * g_ed_es;
    syp = g_ed_cys + (g_ed_sy[g_ed_spawn] / 256) * g_ed_es;
    if (g_ed_tool == 3 && point_distance(mouse_x, mouse_y, sxp, syp) < 40)
    {
        // 8/256 varv = 11,25 grader per klick; upp = moturs, ned = medurs
        if (wup) { g_ed_sa[g_ed_spawn] = (g_ed_sa[g_ed_spawn] + 256 - 8) mod 256; }
        if (wdn) { g_ed_sa[g_ed_spawn] = (g_ed_sa[g_ed_spawn] + 8) mod 256; }
        g_ed_dirty = true;
    }
    else if (g_ed_fon && scr_ed_in_finish(g_ed_wx, g_ed_wy))
    {
        if (wup) { g_ed_fdir = (g_ed_fdir + 3) mod 4; }
        if (wdn) { g_ed_fdir = (g_ed_fdir + 1) mod 4; }
        g_ed_dirty = true;
    }
    else
    {
        if (wup) { scr_ed_zoom(1); }
        if (wdn) { scr_ed_zoom(-1); }
    }
}
// panorering (D-061): mellanslag + dra med vanster musknapp (eller mittenknappen); Home aterstaller vyn
if (keyboard_check_pressed(vk_home)) { g_ed_zoom = 1; g_ed_panx = 0; g_ed_pany = 0; g_ed_pan_on = false; scr_ed_layout(); scr_ed_cursor(); }
if (g_ed_inside && !g_ed_pan_on && ((keyboard_check(vk_space) && mouse_check_button_pressed(mb_left)) || mouse_check_button_pressed(mb_middle)))
{
    g_ed_pan_on = true;
    g_ed_pan_sx = mouse_x;
    g_ed_pan_sy = mouse_y;
    g_ed_pan_px = g_ed_panx;
    g_ed_pan_py = g_ed_pany;
}
if (g_ed_pan_on)
{
    if (mouse_check_button(mb_left) || mouse_check_button(mb_middle))
    {
        g_ed_panx = g_ed_pan_px - (mouse_x - g_ed_pan_sx) / g_ed_es;
        g_ed_pany = g_ed_pan_py - (mouse_y - g_ed_pan_sy) / g_ed_es;
        scr_ed_pan_clamp();
        scr_ed_layout();
        scr_ed_cursor();
    }
    else { g_ed_pan_on = false; }
}
if (keyboard_check_pressed(ord("G")))
{
    if (g_ed_snap == 25) { g_ed_snap = 50; }
    else if (g_ed_snap == 50) { g_ed_snap = 100; }
    else { g_ed_snap = 25; }
}
if (keyboard_check_pressed(ord("U")) && g_ed_n > 0) { g_ed_n -= 1; g_ed_dirty = true; }
if (keyboard_check_pressed(vk_enter) && g_ed_tool == 1)
{
    if (!scr_ed_add_shape()) { scr_ed_msg("A POLYGON NEEDS AT LEAST 3 POINTS"); }
}
if (mouse_check_button_pressed(mb_right)) { g_ed_cn = 0; g_ed_bset = false; g_ed_pkmv = -1; }

// spara / ny bana / byta bana / ta bort bana
if (keyboard_check_pressed(ord("S")))
{
    scr_ed_dlg_open();   // namn + spellagen (D-026)
    exit;
}
if (keyboard_check_pressed(ord("L")))
{
    if (g_ed_dirty) { scr_ed_msg("SAVE FIRST (S) OR DISCARD (ESC TWICE)"); }
    else { scr_ed_load_open(); exit; }
}
if (keyboard_check_pressed(ord("N")))
{
    if (g_ed_dirty) { scr_ed_msg("SAVE FIRST (S) OR DISCARD (ESC TWICE)"); }
    else
    {
        ns = scr_level_new();
        scr_ed_enter(ns);
        scr_ed_msg("NEW MAP " + string_upper(g_ed_name));
    }
}
if (keyboard_check_pressed(vk_pageup) || keyboard_check_pressed(vk_pagedown) || keyboard_check_pressed(219) || keyboard_check_pressed(221))
{
    if (g_ed_dirty) { scr_ed_msg("SAVE FIRST (S) OR DISCARD (ESC TWICE)"); }
    else
    {
        ns = g_ed_idx + 1;
        if (keyboard_check_pressed(vk_pageup) || keyboard_check_pressed(219)) { ns = g_ed_idx - 1; }
        ns = (ns + g_lv_count) mod g_lv_count;
        scr_ed_enter(ns);
    }
}
if (keyboard_check_pressed(vk_delete))
{
    if (g_lv_count <= 1) { scr_ed_msg("THE LAST MAP CANNOT BE DELETED"); }
    else if (g_ed_cdel > 0)
    {
        // varje spelbart spellage maste ha minst en bana kvar
        for (k = 0; k < 2; k += 1)
        {
            ns = 0;
            for (s = 0; s < g_lv_count; s += 1) { if (s != g_ed_idx && scr_level_allowed(k, s)) { ns += 1; } }
            if (ns == 0 && scr_level_allowed(k, g_ed_idx)) { scr_ed_msg(g_mode_name[k] + " NEEDS AT LEAST ONE MAP"); g_ed_cdel = 0; exit; }
        }
        scr_level_delete(g_ed_idx);
        ns = clamp(g_ed_idx, 0, g_lv_count - 1);
        scr_ed_enter(ns);
        scr_set_save();
        scr_ed_msg("MAP DELETED");
    }
    else
    {
        g_ed_cdel = 150;
        scr_ed_msg("PRESS DELETE AGAIN TO DELETE THIS MAP");
    }
}
if (keyboard_check_pressed(vk_escape))
{
    if (g_ed_dirty && g_ed_cesc <= 0)
    {
        g_ed_cesc = 150;
        scr_ed_msg("UNSAVED CHANGES. PRESS ESC AGAIN TO DISCARD");
    }
    else
    {
        g_state = 11;
        g_menu_tick = 0;
        exit;
    }
}

// musklick i ritytan
if (g_ed_inside && mouse_check_button_pressed(mb_left) && !keyboard_check(vk_space) && !g_ed_pan_on)
{
    if (g_ed_tool == 0)
    {
        if (!g_ed_bset) { g_ed_bx = g_ed_mx; g_ed_by = g_ed_my; g_ed_bset = true; }
        else
        {
            if (g_ed_mx != g_ed_bx && g_ed_my != g_ed_by)
            {
                g_ed_cx[0] = g_ed_bx; g_ed_cy[0] = g_ed_by;
                g_ed_cx[1] = g_ed_mx; g_ed_cy[1] = g_ed_by;
                g_ed_cx[2] = g_ed_mx; g_ed_cy[2] = g_ed_my;
                g_ed_cx[3] = g_ed_bx; g_ed_cy[3] = g_ed_my;
                g_ed_cn = 4;
                if (!scr_ed_add_shape()) { scr_ed_msg("TOO MANY SHAPES (MAX 64)"); }
            }
            g_ed_bset = false;
        }
    }
    else if (g_ed_tool == 1)
    {
        if (g_ed_cn >= 3 && g_ed_mx == g_ed_cx[0] && g_ed_my == g_ed_cy[0]) { scr_ed_add_shape(); }
        else if (g_ed_cn < 32)
        {
            if (g_ed_cn == 0 || g_ed_mx != g_ed_cx[g_ed_cn - 1] || g_ed_my != g_ed_cy[g_ed_cn - 1])
            {
                g_ed_cx[g_ed_cn] = g_ed_mx;
                g_ed_cy[g_ed_cn] = g_ed_my;
                g_ed_cn += 1;
            }
        }
    }
    else if (g_ed_tool == 2)
    {
        k = scr_ed_pk_pick(g_ed_wx, g_ed_wy);
        s = scr_ed_pick(g_ed_wx, g_ed_wy);
        if (k >= 0)
        {
            // pickuppunkt: ta bort och packa ihop listan
            for (s = k; s < g_ed_pk_n - 1; s += 1) { g_ed_pkx[s] = g_ed_pkx[s + 1]; g_ed_pky[s] = g_ed_pky[s + 1]; }
            g_ed_pk_n -= 1;
            g_ed_dirty = true;
            scr_ed_msg("PICKUP POINT REMOVED");
        }
        else if (s >= 0) { scr_ed_delete_shape(s); }
        else if (scr_ed_in_finish(g_ed_wx, g_ed_wy)) { g_ed_fon = false; g_ed_dirty = true; scr_ed_msg("FINISH LINE REMOVED"); }
        else if (g_ed_son && point_distance(g_ed_wx, g_ed_wy, g_ed_sox, g_ed_soy) < 150) { g_ed_son = false; g_ed_dirty = true; scr_ed_msg("SAUSAGE SPAWN REMOVED"); }   // Capture the Bratwurst (D-078)
        else if (scr_ed_in_zone(0, g_ed_wx, g_ed_wy)) { g_ed_zon[0] = false; g_ed_dirty = true; scr_ed_msg("RED ZONE REMOVED"); }
        else if (scr_ed_in_zone(1, g_ed_wx, g_ed_wy)) { g_ed_zon[1] = false; g_ed_dirty = true; scr_ed_msg("BLUE ZONE REMOVED"); }
    }
    else if (g_ed_tool == 5)
    {
        // pickuppunkter: klicka pa en befintlig punkt for att flytta den (klicka igen dar den ska ligga), annars placeras en ny
        if (g_ed_pkmv >= 0)
        {
            g_ed_pkx[g_ed_pkmv] = g_ed_mx;
            g_ed_pky[g_ed_pkmv] = g_ed_my;
            g_ed_pkmv = -1;
            g_ed_dirty = true;
        }
        else
        {
            k = scr_ed_pk_pick(g_ed_wx, g_ed_wy);
            if (k >= 0) { g_ed_pkmv = k; scr_ed_msg("CLICK WHERE THE PICKUP POINT SHOULD BE (RIGHT CLICK CANCELS)"); }
            else if (g_ed_pk_n < g_PK_MAX)
            {
                g_ed_pkx[g_ed_pk_n] = g_ed_mx;
                g_ed_pky[g_ed_pk_n] = g_ed_my;
                g_ed_pk_n += 1;
                g_ed_dirty = true;
            }
            else { scr_ed_msg("TOO MANY PICKUP POINTS (MAX 16)"); }
        }
    }
    else if (g_ed_tool == 4)
    {
        // start/malrutan: tva hornklick; en ny ruta ersatter den gamla (en per bana)
        if (!g_ed_bset) { g_ed_bx = g_ed_mx; g_ed_by = g_ed_my; g_ed_bset = true; }
        else
        {
            if (g_ed_mx != g_ed_bx && g_ed_my != g_ed_by)
            {
                g_ed_fx0 = g_ed_bx; g_ed_fy0 = g_ed_by;
                g_ed_fx1 = g_ed_mx; g_ed_fy1 = g_ed_my;
                if (!g_ed_fon) { g_ed_fdir = 1; }
                g_ed_fon = true;
                g_ed_dirty = true;
            }
            g_ed_bset = false;
        }
    }
    else if (g_ed_tool == 3)
    {
        g_ed_sx[g_ed_spawn] = g_ed_mx * 256;
        g_ed_sy[g_ed_spawn] = g_ed_my * 256;
        g_ed_dirty = true;
    }
    else if (g_ed_tool == 6)
    {
        // Capture the Bratwurst (D-078): korvens startpunkt, exakt en per bana; ett nytt klick flyttar den
        g_ed_sox = g_ed_mx;
        g_ed_soy = g_ed_my;
        g_ed_son = true;
        g_ed_dirty = true;
    }
    else if (g_ed_tool == 7 || g_ed_tool == 8)
    {
        // Capture the Bratwurst (D-078): lagens zon (icke-solid ruta), tva hornklick; en ny ruta ersatter lagets gamla (en per lag)
        if (!g_ed_bset) { g_ed_bx = g_ed_mx; g_ed_by = g_ed_my; g_ed_bset = true; }
        else
        {
            if (g_ed_mx != g_ed_bx && g_ed_my != g_ed_by)
            {
                k = g_ed_tool - 7;
                g_ed_zx0[k] = min(g_ed_bx, g_ed_mx); g_ed_zx1[k] = max(g_ed_bx, g_ed_mx);
                g_ed_zy0[k] = min(g_ed_by, g_ed_my); g_ed_zy1[k] = max(g_ed_by, g_ed_my);
                g_ed_zon[k] = true;
                g_ed_dirty = true;
            }
            g_ed_bset = false;
        }
    }
}
