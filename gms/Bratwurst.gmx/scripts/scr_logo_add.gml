/// scr_logo_add(char_code, strokes)
// Registrerar en logotypbokstav: punkter "x,y" (rutnat 7 x 9, y nedat) skilda av mellanslag, ';' startar ett nytt streck. Lagras som linjesegment
// i g_lg_s[kod, 4*j .. 4*j+3] med antal i g_lg_n[kod].
var code, s, i, ch, tok, hp, ppx, ppy, qx, qy, n, c;
code = argument0;
s = argument1 + ";";
tok = "";
hp = false;
n = 0;
ppx = 0; ppy = 0;
for (i = 1; i <= string_length(s); i += 1)
{
    ch = string_char_at(s, i);
    if (ch == " " || ch == ";")
    {
        if (tok != "")
        {
            c = string_pos(",", tok);
            qx = scr_safe_real(string_copy(tok, 1, c - 1), 0);
            qy = scr_safe_real(string_delete(tok, 1, c), 0);
            if (hp)
            {
                g_lg_s[code, n * 4] = ppx;
                g_lg_s[code, n * 4 + 1] = ppy;
                g_lg_s[code, n * 4 + 2] = qx;
                g_lg_s[code, n * 4 + 3] = qy;
                n += 1;
            }
            ppx = qx;
            ppy = qy;
            hp = true;
            tok = "";
        }
        if (ch == ";") { hp = false; }
    }
    else { tok += ch; }
}
g_lg_n[code] = n;
