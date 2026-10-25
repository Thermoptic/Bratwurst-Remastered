# -*- coding: utf-8 -*-
"""Genererar gms/Bratwurst.gmx/scripts/scr_data_themes.gml ur 30 morka Base16-teman.
Kalla: https://github.com/tinted-theming/schemes (spec base16). Varje tema har en upphovsperson i kallrepot; kreditera i spelet (docs/09).
Kor: python tools/gen_gms_themes.py"""
import os

THEMES = [  # (id, namn, 16 hex-varden base00..base0F)
    ('default-dark', 'Default Dark', '181818282828383838585858b8b8b8d8d8d8e8e8e8f8f8f8ab4642dc9656f7ca88a1b56c86c1b97cafc2ba8bafa16946'),
    ('monokai', 'Monokai', '27282238383049483e75715ea59f85f8f8f2f5f4f1f9f8f5f92672fd971ff4bf75a6e22ea1efe466d9efae81ffcc6633'),
    ('tomorrow-night', 'Tomorrow Night', '1d1f21282a2e373b41969896b4b7b4c5c8c6e0e0e0ffffffcc6666de935ff0c674b5bd688abeb781a2beb294bba3685a'),
    ('solarized-dark', 'Solarized Dark', '002b36073642586e75657b8383949693a1a1eee8d5fdf6e3dc322fcb4b16b589008599002aa198268bd26c71c4d33682'),
    ('gruvbox-dark-hard', 'Gruvbox dark, hard', '1d20213c3836504945665c54bdae93d5c4a1ebdbb2fbf1c7fb4934fe8019fabd2fb8bb268ec07c83a598d3869bd65d0e'),
    ('gruvbox-dark-medium', 'Gruvbox dark, medium', '2828283c3836504945665c54bdae93d5c4a1ebdbb2fbf1c7fb4934fe8019fabd2fb8bb268ec07c83a598d3869bd65d0e'),
    ('nord', 'Nord', '2e34403b4252434c5e4c566ad8dee9e5e9f0eceff48fbcbbbf616ad08770ebcb8ba3be8c88c0d081a1c1b48ead5e81ac'),
    ('dracula', 'Dracula', '282a3621222c44475a6272a49ea8c7f8f8f2f8f8f2ffffffff5555ffb86cf1fa8c50fa7b8be9fdbd93f9ff79c6993333'),
    ('onedark', 'OneDark', '282c34353b453e4451545862565c64abb2bfb6bdcac8ccd4e06c75d19a66e5c07b98c37956b6c261afefc678ddbe5046'),
    ('atelier-forest', 'Atelier Forest', '1b19182c242168615e766e6b9c9491a8a19fe6e2e0f1efeef22c40df5320c384187b97263d97b8407ee76666eac33ff3'),
    ('ashes', 'Ashes', '1c2023393f45565e65747c84adb3bac7ccd1dfe2e5f3f4f5c7ae95c7c795aec79595c7ae95aec7ae95c7c795aec79595'),
    ('chalk', 'Chalk', '151515202020303030505050b0b0b0d0d0d0e0e0e0f5f5f5fb9fb1eda987ddb26facc26712cfc06fc2efe1a3eedeaf8f'),
    ('github-dark', 'Github Dark', '0d1117151b232f3742656c769198a1d1d7e0f0f6fcffffffff7b72ffa657d299223fb95039c5cf58a6ffbe8fffffa198'),
    ('rose-pine', 'Rose Pine', '1917241f1d2e26233a6e6a86908caae0def4e0def4524f67eb6f92f6c177ebbcba31748f9ccfd8c4a7e7f6c177524f67'),
    ('tokyo-night-dark', 'Tokyo Night Dark', '1a1b2616161e2f3549444b6a787c99a9b1d6cbccd1d5d6dbc0caf5a9b1d60db9d79ece6ab4f9f82ac3debb9af7f7768e'),
    ('twilight', 'Twilight', '1e1e1e323537464b505f5a60838184a7a7a7c3c3c3ffffffcf6a4ccda869f9ee988f9d6aafc4db7587a69b859d9b703f'),
    ('woodland', 'Woodland', '231e18302b2548413a9d8b70b4a490cabcb1d7c8bce4d4c8d35c5cca7f32e0ac16b7ba536eb95888a4d3bb90e2b49368'),
    ('zenburn', 'Zenburn', '3838384040406060606f6f6f808080dcdcccc0c0c0ffffffdca3a3dfaf8fe0cf9f5f7f5f93e0e37cb8bbdc8cc3000000'),
    ('horizon-dark', 'Horizon Dark', '1c1e262325302e303e6f6f709da0a2cbced0dcdfe4e3e6eee93c58e58d7defb993efaf8e24a8b4df5273b072d1e4a382'),
    ('everforest-dark-hard', 'Everforest Dark Hard', '272e332e383c414b508592899da9a0d3c6aaedeadafffbefe67e80e69875dbbc7fa7c08083c0927fbbb3d699b69da9a0'),
    ('catppuccin-mocha', 'Catppuccin Mocha', '1e1e2e18182531324445475a585b70cdd6f4f5e0dcb4befef38ba8fab387f9e2afa6e3a194e2d589b4facba6f7f2cdcd'),
    ('kanagawa', 'Kanagawa', '1f1f2816161d22324954546d727169dcd7bac8c093717c7cc34043ffa066c0a36e76946a6a95897e9cd8957fb8d27e99'),
    ('synth-midnight-dark', 'Synth Midnight', '0506081a1b1c28292a474849a3a5a6c1c3c4cfd1d2dddfe0b53b50ea770dc9d36406ea6142fff903aeffea5ce2cd6320'),
    ('outrun-dark', 'Outrun Dark', '00002a20204a30305a50507ab0b0dad0d0fae0e0fff5f5ffff4242fc8d28f3e87759f1760ef0f066b0fff10596f003ef'),
    ('material-darker', 'Material Darker', '2121213030303535354a4a4ab2ccd6eeffffeefffffffffff07178f78c6cffcb6bc3e88d89ddff82aaffc792eaff5370'),
    ('snazzy', 'Snazzy', '282a3634353e43454f78787ea5a5a9e2e4e5eff0ebf1f1f0ff5c57ff9f43f3f99d5af78e9aedfe57c7ffff6ac1b2643c'),
    ('greenscreen', 'Green Screen', '00110000330000550000770000990000bb0000dd0000ff0000770000990000770000bb0000550000990000bb00005500'),
    ('black-metal-bathory', 'Black Metal Bathory', '000000121212222222333333999999c1c1c1999999c1c1c15f8787aaaaaae78a53fbcb97aaaaaa888888999999444444'),
    ('irblack', 'IR Black', '0000002424224848446c6c66918f88b5b3aad9d7ccfdfbeeff6c60e9c062ffffb6a8ff60c6c5fe96cbfeff73fdb18a3d'),
    ('tube', 'London Tube', '231f201c3f955a5758737171959ca1d9d8d8e7e7e8ffffffee2e24f386a1ffd20400853e85cebc009ddc98005db06110'),
]

# --- Chromostereopsis-serien (D-076): ror pa svart, rod = nara (vaggar, skott, explosioner), bla = langt bort (skepp, linjer, prickar).
# Bakgrunden (base00) ar alltid #000000. Rodton och blaton har konstant nyans; bara ljusstyrkan varierar. Se docs/10_DECISIONS.md D-076.
REDS = [(255, 45, 45), (214, 34, 34), (180, 28, 28), (150, 24, 24)]         # R1..R4, nyans 0 grader
BLUES = [(92, 134, 255), (63, 104, 240), (46, 82, 208), (38, 66, 172)]       # B1..B4, nyans ca 227 grader


def _hex(c):
    return "%02x%02x%02x" % tuple(int(round(v)) for v in c)


def _mix(a, b, f):   # f = 0 -> a, f = 1 -> b
    return tuple(a[i] + (b[i] - a[i]) * f for i in range(3))


def _dim(c, f):      # ljusstyrka mot svart (samma teknik som motorns merge_colour mot bakgrunden)
    return tuple(v * f for v in c)


def _resample(pool, n):   # n jamnt fordelade steg langs en rampa av farger (linjar interpolation)
    out = []
    for i in range(n):
        u = i * (len(pool) - 1) / float(n - 1)
        j = min(len(pool) - 2, int(u))
        out.append(_mix(pool[j], pool[j + 1], u - j))
    return out


def chromo(nred, nblue):
    """Bygger ett Chromostereopsis-tema med nred rodtoner och nblue blatoner. Returnerar (16 hex-varden, spelarfarger[4], vaggfarger[11], prickfarg)."""
    reds = {1: [REDS[0]], 2: [REDS[0], REDS[2]], 3: REDS[:3], 4: REDS[:4]}[nred]
    blues = {1: [BLUES[0]], 2: [BLUES[0], BLUES[2]], 3: BLUES[:3], 4: BLUES[:4]}[nblue]
    ext = blues if len(blues) > 1 else [blues[0], _dim(blues[0], 0.55)]   # X2: den morka bla ar samma bla med lagre ljusstyrka
    rh, rm, rl = reds[0], reds[min(1, len(reds) - 1)], reds[-1]
    rm2 = reds[2] if len(reds) > 2 else rm
    bh, bm, bd = ext[0], ext[1], ext[-1]
    bm2 = ext[2] if len(ext) > 2 else bm
    slot = [
        (0, 0, 0),            # 00 bakgrund: absolut svart
        _dim(bd, 0.30),       # 01 rutnat och ytor i granssnittet (morkaste bla, nedtonad)
        bd,                   # 02 menybakgrundens skepp, hover, asteroidfyllning
        bm,                   # 03 dampad text, arenans ram
        bh,                   # 04 vanlig text
        bh,                   # 05 text
        rh,                   # 06 markering, explosionskarna
        rh,                   # 07
        rh,                   # 08 explosionsringar, accent 0
        rm,                   # 09 missilglod, pickups
        rh,                   # 0A skott, missilkarna
        rm2,                  # 0B standardaccent (rubriker, hornmarkeringar)
        bm,                   # 0C
        bh,                   # 0D
        rl,                   # 0E Mini Nuke yttre ring
        bm2,                  # 0F
    ]
    pool = ext if len(ext) >= 3 or nblue == 1 else ext + [BLUES[3]]   # spelarnas rampa; X4 forlangs med det morkaste blatt
    players = _resample(pool, 4)                     # P1..P4: bla, ljusast forst
    walls = [reds[m % len(reds)] for m in range(11)]  # 11 vaggobjekt, rodtonerna i tur och ordning
    return "".join(_hex(c) for c in slot), [_hex(c) for c in players], [_hex(c) for c in walls], _hex(bd)


CHROMO = {}   # id -> (spelare, vaggar, prickar)
for _n, _r, _b in ((2, 1, 1), (4, 2, 2), (6, 3, 3), (8, 4, 4)):
    _h, _p, _w, _d = chromo(_r, _b)
    THEMES.append(('chromostereopsis-x%d' % _n, 'ChromostereopsisX%d' % _n, _h))
    CHROMO['chromostereopsis-x%d' % _n] = (_p, _w, _d)


def _bgr(hx):
    return "$" + (hx[4:6] + hx[2:4] + hx[0:2]).upper()


def main():
    here = os.path.dirname(os.path.abspath(__file__))
    dst = os.path.join(here, "..", "gms", "Bratwurst.gmx", "scripts", "scr_data_themes.gml")
    L = ["/// scr_data_themes()",
         "// GENERERAD av tools/gen_gms_themes.py - redigera inte for hand. 30 morka Base16-teman (tinted-theming/schemes) + 4 Chromostereopsis-teman (D-076).",
         "// g_th_hex[t,k] = hex-text (utan #), g_th_col[t,k] = GM-farg (BGR). k = 0..15 = base00..base0F.",
         "// g_th_pl[t,0..3] = spelarfarger, g_th_wl[t,0..10] = vaggfarger, g_th_dot[t] = prickfarg; -1 = temat anvander scr_theme_players urval (alla utom Chromostereopsis).",
         "g_th_count = %d;" % len(THEMES)]
    for t, (tid, name, h) in enumerate(THEMES):
        L.append('g_th_id[%d] = "%s"; g_th_name[%d] = "%s";' % (t, tid, t, name))
        for k in range(16):
            hx = h[k * 6:k * 6 + 6]
            bgr = hx[4:6] + hx[2:4] + hx[0:2]
            L.append('g_th_hex[%d,%d] = "%s"; g_th_col[%d,%d] = $%s;' % (t, k, hx, t, k, bgr.upper()))
        if tid in CHROMO:
            pl, wl, dot = CHROMO[tid]
            for i in range(4):
                L.append('g_th_pl[%d,%d] = %s;' % (t, i, _bgr(pl[i])))
            for m in range(11):
                L.append('g_th_wl[%d,%d] = %s;' % (t, m, _bgr(wl[m])))
            L.append('g_th_dot[%d] = %s;' % (t, _bgr(dot)))
        else:
            L.append('g_th_pl[%d,0] = -1; g_th_wl[%d,0] = -1; g_th_dot[%d] = -1;' % (t, t, t))
    with open(dst, "w", newline="\n") as f:
        f.write("\n".join(L) + "\n")
    print("skrev", dst, len(THEMES), "teman")


if __name__ == "__main__":
    main()
