/// scr_ed_dlg_step()
// Sparfonstret (modalt): skriv namnet, GENERATE NAME slumpar ett (stjarna + korv), klicka pa rutorna for att valja spellagen banan ska finnas i,
// SAVE / Enter sparar, CANCEL / Esc avbryter. Minst en bana per spellage maste finnas (Classic och Astro Duel).
var i, s, ch, clean, mx, my, click, m, k, ok, hasother, need;
g_menu_tick += 1;
scr_ed_dlg_layout();
// namnet: bara ASCII 32..126, max 30 tecken
s = keyboard_string;
clean = "";
for (i = 1; i <= string_length(s); i += 1)
{
    ch = ord(string_char_at(s, i));
    if (ch >= 32 && ch <= 126) { clean += chr(ch); }
}
clean = string_copy(clean, 1, 30);
if (clean != s) { keyboard_string = clean; }
g_ed_dname = clean;
mx = mouse_x;
my = mouse_y;
click = mouse_check_button_pressed(mb_left);
if (click)
{
    // GENERATE NAME
    if (mx >= g_dg_x + 350 && mx <= g_dg_x + 500 && my >= g_dg_y + 50 && my <= g_dg_y + 84)
    {
        g_ed_dname = scr_level_name_random();
        keyboard_string = g_ed_dname;
        g_ed_dmsg = "";
    }
    // spellagen
    for (m = 0; m < 4; m += 1)
    {
        if (mx >= g_dg_x + 20 && mx <= g_dg_x + 500 && my >= g_dg_y + 132 + m * 36 && my <= g_dg_y + 132 + m * 36 + 32)
        {
            g_ed_modes = g_ed_modes ^ (1 << m);
            g_ed_dmsg = "";
        }
    }
}
ok = false;
if (keyboard_check_pressed(vk_enter)) { ok = true; }
if (click && mx >= g_dg_x + g_dg_w - 330 && mx <= g_dg_x + g_dg_w - 180 && my >= g_dg_y + g_dg_h - 56 && my <= g_dg_y + g_dg_h - 20) { ok = true; }
if (keyboard_check_pressed(vk_escape) || (click && mx >= g_dg_x + g_dg_w - 170 && mx <= g_dg_x + g_dg_w - 20 && my >= g_dg_y + g_dg_h - 56 && my <= g_dg_y + g_dg_h - 20))
{
    g_ed_dlg = 0;
    exit;
}
if (ok)
{
    if (string_length(string_replace_all(g_ed_dname, " ", "")) == 0) { g_ed_dmsg = "TYPE A NAME FIRST"; exit; }
    if ((g_ed_modes & 15) == 0) { g_ed_dmsg = "PICK AT LEAST ONE GAME MODE"; exit; }
    // varje spelbart spellage maste ha minst en bana kvar
    for (m = 0; m < 2; m += 1)
    {
        if ((g_ed_modes & (1 << m)) == 0)
        {
            hasother = false;
            for (k = 0; k < g_lv_count; k += 1)
            {
                if (k != g_ed_idx && scr_level_allowed(m, k)) { hasother = true; }
            }
            if (!hasother) { g_ed_dmsg = g_mode_name[m] + " NEEDS AT LEAST ONE MAP"; exit; }
        }
    }
    g_ed_name = g_ed_dname;
    scr_level_save(g_ed_idx);
    scr_levels_fix_selection();
    scr_set_save();
    g_ed_dirty = false;
    g_ed_dlg = 0;
    scr_ed_msg("SAVED " + string_upper(g_ed_name));
}
