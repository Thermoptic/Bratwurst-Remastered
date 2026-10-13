/// scr_ed_step()
// En tick i banredigeraren (g_state = 20). Mus + tangentbord. Verktyg: B = rektangel, P = polygon, X = radera, T = startplats.
// Se scr_ed_draw for hjalptexten. Allt ar solida hinder: formerna blir vaggar med kollision.
var s, k, ns;
g_menu_tick += 1;
if (g_ed_msgt > 0) { g_ed_msgt -= 1; }
if (g_ed_cdel > 0) { g_ed_cdel -= 1; }
if (g_ed_cesc > 0) { g_ed_cesc -= 1; }
scr_ed_cursor();

if (keyboard_check_pressed(ord("B"))) { g_ed_tool = 0; g_ed_cn = 0; g_ed_bset = false; }
if (keyboard_check_pressed(ord("P"))) { g_ed_tool = 1; g_ed_cn = 0; g_ed_bset = false; }
if (keyboard_check_pressed(ord("X"))) { g_ed_tool = 2; g_ed_cn = 0; g_ed_bset = false; }
if (keyboard_check_pressed(ord("T"))) { g_ed_tool = 3; g_ed_cn = 0; g_ed_bset = false; }
for (k = 0; k < 4; k += 1)
{
    if (keyboard_check_pressed(ord("1") + k)) { g_ed_tool = 3; g_ed_spawn = k; g_ed_cn = 0; g_ed_bset = false; }
}
if (keyboard_check_pressed(ord("Q"))) { g_ed_sa[g_ed_spawn] = (g_ed_sa[g_ed_spawn] + 256 - 16) mod 256; g_ed_dirty = true; }
if (keyboard_check_pressed(ord("E"))) { g_ed_sa[g_ed_spawn] = (g_ed_sa[g_ed_spawn] + 16) mod 256; g_ed_dirty = true; }
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
if (mouse_check_button_pressed(mb_right)) { g_ed_cn = 0; g_ed_bset = false; }

// spara / ny bana / byta bana / ta bort bana
if (keyboard_check_pressed(ord("S")))
{
    scr_level_save(g_ed_idx);
    g_ed_dirty = false;
    scr_ed_msg("SAVED " + string_upper(g_ed_name));
}
if (keyboard_check_pressed(ord("N")))
{
    if (g_ed_dirty) { scr_ed_msg("SAVE FIRST (S) OR DISCARD (ESC TWICE)"); }
    else
    {
        ns = scr_level_new();
        scr_ed_enter(ns);
        g_sv[g_SV_MAP] = ns;
        scr_set_save();
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
        g_sv[g_SV_MAP] = ns;
        scr_set_save();
    }
}
if (keyboard_check_pressed(vk_delete))
{
    if (g_lv_count <= 1) { scr_ed_msg("THE LAST MAP CANNOT BE DELETED"); }
    else if (g_ed_cdel > 0)
    {
        scr_level_delete(g_ed_idx);
        ns = clamp(g_ed_idx, 0, g_lv_count - 1);
        scr_ed_enter(ns);
        g_sv[g_SV_MAP] = ns;
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
if (g_ed_inside && mouse_check_button_pressed(mb_left))
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
        s = scr_ed_pick(g_ed_wx, g_ed_wy);
        if (s >= 0) { scr_ed_delete_shape(s); }
    }
    else if (g_ed_tool == 3)
    {
        g_ed_sx[g_ed_spawn] = g_ed_mx * 256;
        g_ed_sy[g_ed_spawn] = g_ed_my * 256;
        g_ed_dirty = true;
    }
}
