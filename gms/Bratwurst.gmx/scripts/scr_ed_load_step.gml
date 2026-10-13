/// scr_ed_load_step()
// Laddafonstret (modalt): upp/ner eller klick valjer bana, mushjulet rullar listan, Enter / LOAD / dubbelklick laddar, Esc / CANCEL avbryter.
var mx, my, click, i, row, ok;
g_menu_tick += 1;
if (g_ed_ldclick > 0) { g_ed_ldclick -= 1; }
scr_ed_load_layout();
mx = mouse_x;
my = mouse_y;
click = mouse_check_button_pressed(mb_left);
ok = false;
if (keyboard_check_pressed(vk_up)) { g_ed_ldsel = max(0, g_ed_ldsel - 1); }
if (keyboard_check_pressed(vk_down)) { g_ed_ldsel = min(g_lv_count - 1, g_ed_ldsel + 1); }
if (keyboard_check_pressed(vk_pageup)) { g_ed_ldsel = max(0, g_ed_ldsel - 9); }
if (keyboard_check_pressed(vk_pagedown)) { g_ed_ldsel = min(g_lv_count - 1, g_ed_ldsel + 9); }
if (mouse_wheel_up()) { g_ed_ldtop = max(0, g_ed_ldtop - 1); }
if (mouse_wheel_down()) { g_ed_ldtop = min(max(0, g_lv_count - 10), g_ed_ldtop + 1); }
if (click)
{
    for (i = 0; i < 10; i += 1)
    {
        row = g_ed_ldtop + i;
        if (row < g_lv_count && mx >= g_ld_x + 14 && mx <= g_ld_x + g_ld_w - 14 && my >= g_ld_y + 92 + i * 28 && my <= g_ld_y + 92 + i * 28 + 26)
        {
            if (g_ed_ldsel == row && g_ed_ldclick > 0) { ok = true; }   // dubbelklick
            g_ed_ldsel = row;
            g_ed_ldclick = 18;
        }
    }
    if (mx >= g_ld_x + g_ld_w - 330 && mx <= g_ld_x + g_ld_w - 180 && my >= g_ld_y + g_ld_h - 56 && my <= g_ld_y + g_ld_h - 20) { ok = true; }
    if (mx >= g_ld_x + g_ld_w - 170 && mx <= g_ld_x + g_ld_w - 20 && my >= g_ld_y + g_ld_h - 56 && my <= g_ld_y + g_ld_h - 20)
    {
        g_ed_dlg = 0;
        exit;
    }
}
if (keyboard_check_pressed(vk_enter)) { ok = true; }
if (keyboard_check_pressed(vk_escape)) { g_ed_dlg = 0; exit; }
// valt radnummer ska alltid synas
if (g_ed_ldsel < g_ed_ldtop) { g_ed_ldtop = g_ed_ldsel; }
if (g_ed_ldsel > g_ed_ldtop + 9) { g_ed_ldtop = g_ed_ldsel - 9; }
if (ok)
{
    scr_ed_enter(g_ed_ldsel);   // stanger fonstret
    scr_ed_msg("LOADED " + string_upper(g_ed_name));
}
