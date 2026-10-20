/// scr_ftest_draw()
// TILLFALLIGT (D-073): FONT TEST-sidan. En sida per typsnitt: fem storlekar (8, 10, 14, 20, 28 punkter) i tva kolumner, med kantutjamning (vanster) och utan (hoger). Varje prov
// har ett nummer (fortlopande over alla sidor) att hanvisa till. Texten ritas 1:1 mot skarmpixlarna (skala 1/g_k) som spelets egna typsnitt. Tas bort med tools/remove_font_test.ps1.
var px, py, pw, ph, fi, si, aa, fid, yy, cx0, cx1, txt, fh, col, lbl, k, xx;
fi = g_ft_page;
scr_ui_header("BRATWURST // FONT TEST", "PAGE " + string(fi + 1) + " OF " + string(g_ft_n));
pw = g_vw - 40;
ph = g_vh - 52 - 48;
px = g_vx + 20;
py = g_vy + 52;
scr_ui_pane(px, py, pw, ph, g_ft_name[fi], g_acc);
g_fs = g_f_sm;
if (string_pos("KOMMERSIELL", g_ft_lic[fi]) > 0) { col = g_c[10]; } else { col = g_c[11]; }
scr_ui_text(px + 16, py + 14, "LICENSE: " + g_ft_lic[fi], col);
scr_ui_text(px + 16, py + 32, "SAMPLES " + string(fi * 10 + 1) + " TO " + string(fi * 10 + 10) + "     < >  CHANGE FONT     ESC  BACK", g_c[4]);
cx0 = px + 70;
cx1 = px + 70 + floor((pw - 90) / 2);
scr_ui_text(cx0, py + 56, "WITH ANTI-ALIASING", g_c[3]);
scr_ui_text(cx1, py + 56, "WITHOUT ANTI-ALIASING", g_c[3]);
yy = py + 78;
for (si = 0; si < 5; si += 1)
{
    if (si <= 1) { txt = "CLASSIC // ROUND 1 OF 1 // POS 1/2 LAP 1/3 EN 35/40"; }
    else if (si == 2) { txt = "RESUME OPTIONS QUIT 0123456789"; }
    else if (si == 3) { txt = "PAUSED  RESUME  0123456789"; }
    else { txt = "PAUSED 321 GO!"; }
    g_fs = g_f_sm;
    scr_ui_text(px + 16, yy, string(g_ft_pt[si]) + " PT", g_c[4]);
    for (aa = 1; aa >= 0; aa -= 1)
    {
        fid = (fi * 5 + si) * 2 + aa;
        k = fi * 10 + si * 2 + (1 - aa) + 1;   // provets nummer: 1-10 pa sida 1, 11-20 pa sida 2 ...
        lbl = "#" + string(k);
        if (aa == 1) { xx = cx0; } else { xx = cx1; }
        g_fs = g_f_sm;
        scr_ui_text(xx, yy, lbl, g_acc);
        draw_set_font(g_ft_f[fid]);
        fh = string_height("A") / g_k;
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        draw_set_color(g_c[6]);
        draw_set_alpha(1);
        draw_text_transformed(xx + 40, yy - 2, txt, 1 / g_k, 1 / g_k, 0);
        if (aa == 1) { g_ft_h = fh; }
        if (fh > g_ft_h) { g_ft_h = fh; }
    }
    yy += g_ft_h + 20;
}
