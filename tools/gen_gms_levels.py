# -*- coding: utf-8 -*-
"""Genererar gms/Bratwurst.gmx/scripts/scr_data_levels.gml: de tre inbyggda banorna (originalbanan + tva egna remixer).
Originalbanan lases ur scr_data_arena.gml (harledd data, privat, docs/09) och delas upp i slutna polygoner. Banorna skrivs vid forsta start till
levels.ini i spelets sparmapp och kan redigeras i spelets banredigerare. Kor: python tools/gen_gms_levels.py"""
import os
import re

HERE = os.path.dirname(os.path.abspath(__file__))
SCRIPTS = os.path.join(HERE, "..", "gms", "Bratwurst.gmx", "scripts")

SPAWNS = [(-300000, -270000, 96), (300000, -270000, 160), (-300000, 270000, 64), (300000, 270000, 192)]  # 1/256 px, 256-stegs vinkel


def box(x1, y1, x2, y2):
    return [(x1, y1), (x2, y1), (x2, y2), (x1, y2)]


def original_polygons():
    t = open(os.path.join(SCRIPTS, "scr_data_arena.gml")).read()
    px = {int(i): int(v) for i, v in re.findall(r"g_wall_px\[(\d+)\] = (-?\d+);", t)}
    py = {int(i): int(v) for i, v in re.findall(r"g_wall_py\[(\d+)\] = (-?\d+);", t)}
    a = {int(i): int(v) for i, v in re.findall(r"g_wall_a\[(\d+)\] = (\d+);", t)}
    b = {int(i): int(v) for i, v in re.findall(r"g_wall_b\[(\d+)\] = (\d+);", t)}
    adj = {}
    for k in a:
        adj.setdefault(a[k], []).append(b[k])
        adj.setdefault(b[k], []).append(a[k])
    seen, polys = set(), []
    for s in sorted(adj):
        if s in seen:
            continue
        cyc, prev, cur = [s], None, s
        seen.add(s)
        while True:
            n = [x for x in adj[cur] if x != prev][0]
            if n == s:
                break
            cyc.append(n)
            seen.add(n)
            prev, cur = cur, n
        polys.append([(px[i], py[i]) for i in cyc])
    return polys


def build():
    orig = original_polygons()
    frame = orig[1:2]   # bara den inre ramen (den yttre linjen togs bort pa alla banor, D-033)
    orig = orig[1:]
    nooks = orig[1:5]
    kepler = frame + nooks + [
        [(-120, -800), (120, -800), (120, -120), (800, -120), (800, 120), (120, 120), (120, 800), (-120, 800), (-120, 120), (-800, 120), (-800, -120), (-120, -120)],
        box(-2100, -350, -1950, 350), box(1950, -350, 2100, 350),
        box(-400, -1900, 400, -1800), box(-400, 1800, 400, 1900),
    ]
    proxima = frame + [
        [(0, -500), (500, 0), (0, 500), (-500, 0)],
        box(-1800, -850, -1600, -650), box(1600, -850, 1800, -650), box(-1800, 650, -1600, 850), box(1600, 650, 1800, 850),
        box(-1500, -1700, -600, -1600), box(600, -1700, 1500, -1600), box(-1500, 1600, -600, 1700), box(600, 1600, 1500, 1700),
        box(-2300, -120, -2100, 120), box(2100, -120, 2300, 120),
    ]
    return [("sirius", "Sirius Bratwurst", orig), ("kepler", "Kepler Chorizo", kepler), ("proxima", "Proxima Merguez", proxima)]


def main():
    maps = build()
    L = ["/// scr_data_levels()",
         "// GENERERAD av tools/gen_gms_levels.py - redigera inte for hand. Inbyggda banor (skrivs till levels.ini vid forsta start).",
         "// g_dl_shape[m, j] = polygonens punkter som \"x,y;x,y;...\" (varldspixlar), g_dl_spawn[m, k] = \"x,y,vinkel\" (1/256 px, 256-stegs vinkel).",
         "g_dl_count = %d;" % len(maps)]
    for m, (mid, name, polys) in enumerate(maps):
        L.append('g_dl_id[%d] = "%s"; g_dl_name[%d] = "%s"; g_dl_n[%d] = %d;' % (m, mid, m, name, m, len(polys)))
        for j, poly in enumerate(polys):
            L.append('g_dl_shape[%d,%d] = "%s";' % (m, j, ";".join("%d,%d" % p for p in poly)))
        for k, (x, y, a) in enumerate(SPAWNS):
            L.append('g_dl_spawn[%d,%d] = "%d,%d,%d";' % (m, k, x, y, a))
    with open(os.path.join(SCRIPTS, "scr_data_levels.gml"), "w", newline="\n") as f:
        f.write("\n".join(L) + "\n")
    print("skrev scr_data_levels.gml:", [(n, len(p)) for _, n, p in maps])


if __name__ == "__main__":
    main()
