/// scr_logo_init()
// Titelloggans bokstaver (B R A T W U S E H D) som linjer, samt de fasta stjarnorna och planetens prickmonster (stipple) for titelskarmen.
var c, xx, yy, r, nx, ny, nz, l, sh, d, k, s, lx, ly, lz, ln2;
for (c = 0; c < 128; c += 1) { g_lg_n[c] = 0; }
scr_logo_add(ord("B"), "6,0 0,0 0,3.5;0,5.5 0,9 6,9 7,8 7,5.5 6,4.5 2,4.5;0,0 6,0 7,1 7,3.5 6,4.5 2,4.5");
scr_logo_add(ord("R"), "0,9 0,0 6,0 7,1 7,3.5 6,4.5 0,4.5;3,4.5 7,9");
scr_logo_add(ord("A"), "0,9 3.5,0 7,9 0,9;2.4,7.4 3.5,5 4.6,7.4 2.4,7.4");
scr_logo_add(ord("T"), "0,0 7,0;3.5,0 3.5,9");
scr_logo_add(ord("W"), "0,0 1.5,9 3.5,3 5.5,9 7,0");
scr_logo_add(ord("U"), "0,0 0,8 1,9 6,9 7,8 7,0");
scr_logo_add(ord("S"), "7,0 1,0 0,1 0,3.5 1,4.5 6,4.5 7,5.5 7,8 6,9 0,9");
scr_logo_add(ord("E"), "7,0 0,0 0,9 7,9;0,4.5 5,4.5");
scr_logo_add(ord("H"), "0,0 0,9;7,0 7,9;0,4.5 7,4.5");
scr_logo_add(ord("D"), "0,0 5,0 7,2 7,7 5,9 0,9 0,0");
// Race-nedrakningen (D-062): siffrorna 1-3 och ordet GO! som vektorlinjer
scr_logo_add(ord("1"), "1.5,2.2 3.5,0 3.5,9;1.5,9 5.5,9");
scr_logo_add(ord("2"), "0,2 1.5,0 5.5,0 7,1.5 7,3.5 0,9 7,9");
scr_logo_add(ord("3"), "0,1.5 1.5,0 5.5,0 7,1.5 7,3 5.5,4.3 2.5,4.3;5.5,4.3 7,5.7 7,7.5 5.5,9 1.5,9 0,7.5");
scr_logo_add(ord("G"), "7,1.5 5.5,0 1.5,0 0,1.5 0,7.5 1.5,9 5.5,9 7,7.5 7,5 4,5");
scr_logo_add(ord("O"), "1.5,0 5.5,0 7,1.5 7,7.5 5.5,9 1.5,9 0,7.5 0,1.5 1.5,0");
scr_logo_add(ord("!"), "3.5,0 3.5,6;3.5,8.2 3.5,9");
// fasta stjarnor (position som andel av vyn, typ 0 = plustecken, 1-2 = punkt)
s = 99;
for (k = 0; k < 46; k += 1)
{
    s = (s * 1103515245 + 12345) mod 2147483648;
    g_tt_sx[k] = (s mod 1000) / 1000;
    s = (s * 1103515245 + 12345) mod 2147483648;
    g_tt_sy[k] = (s mod 1000) / 1000;
    g_tt_st[k] = k mod 3;
    g_tt_sp[k] = ((k * 37) mod 100) / 100;
}
// planetens prickmonster (radie 24, ljus fran hoger), 4x4 Bayer-dither
g_tt_n = 0;
r = 24;
lx = cos(0.4); ly = sin(0.4) * 0.5; lz = 0.45;
ln2 = sqrt(lx * lx + ly * ly + lz * lz);
for (yy = -r; yy <= r; yy += 1)
{
    for (xx = -r; xx <= r; xx += 1)
    {
        if (xx * xx + yy * yy > r * r - 3) { continue; }
        nx = xx / r; ny = yy / r; nz = sqrt(max(0, 1 - nx * nx - ny * ny));
        l = (nx * lx + ny * ly + nz * lz) / ln2;
        sh = (1 - l) / 2;
        d = clamp((sh - 0.38) / 0.45, 0, 1);
        k = ((xx + r) mod 4) + 4 * ((yy + r) mod 4);
        // Bayer 4x4 (rad for rad)
        if (k == 0) { c = 0; } if (k == 1) { c = 8; } if (k == 2) { c = 2; } if (k == 3) { c = 10; }
        if (k == 4) { c = 12; } if (k == 5) { c = 4; } if (k == 6) { c = 14; } if (k == 7) { c = 6; }
        if (k == 8) { c = 3; } if (k == 9) { c = 11; } if (k == 10) { c = 1; } if (k == 11) { c = 9; }
        if (k == 12) { c = 15; } if (k == 13) { c = 7; } if (k == 14) { c = 13; } if (k == 15) { c = 5; }
        if (c / 16 < d)
        {
            g_tt_dx[g_tt_n] = xx;
            g_tt_dy[g_tt_n] = yy;
            g_tt_n += 1;
        }
    }
}
