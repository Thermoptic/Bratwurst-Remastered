# -*- coding: utf-8 -*-
"""Skriver assets/models/sausage.svg: korvmodellen (samma som scr_data_sausage) som en redigerbar SVG med en linje per modellinje.
SVG:ns x/y = skarmens koordinater vid vinkel 0 (modellens y vands: svg_y = -modell_y), enhet = skeppsenhet (korven ar ca 320 enheter lang).
Hjalplagret (id="guide": rutnat och mittpunkt) ignoreras av svg_to_model.py; bara det som ligger i gruppen id="model" blir modell.
Kor: python tools/make_sausage_svg.py  (skriver over filen, sa kor den inte om du redan ritat om modellen)."""
import io
import math
import os

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.normpath(os.path.join(HERE, "..", "assets", "models", "sausage.svg"))


def build():
    S, K, rc, thmax, wmax = 32, 5, 267, 1.2, 27
    sag = rc * (1 - math.cos(thmax / 2))
    pts, lines = [], []
    for k in range(K):
        f = -1 + k * 0.5
        for i in range(S + 1):
            u = i / float(S)
            th = (u - 0.5) * thmax
            cx = rc * math.sin(th)
            cy = rc * (1 - math.cos(th)) - sag / 2
            tx, ty = math.cos(th), math.sin(th)
            nx, ny = -ty, tx
            w = wmax * (1 - abs(2 * u - 1) ** 5) ** 0.4
            bw = 6 * (1 - f * f) * (w / wmax)
            pts.append((round(cx + nx * w * f + tx * bw), round(cy + ny * w * f + ty * bw)))
    for k in range(K):
        for i in range(S):
            lines.append((k * (S + 1) + i, k * (S + 1) + i + 1))
    for i in list(range(2, S, 2)) + [1, S - 1]:
        for k in range(K - 1):
            lines.append((k * (S + 1) + i, (k + 1) * (S + 1) + i))
    for e in range(2):
        u, sg, i = (0, -1, 1) if e == 0 else (1, 1, S - 1)
        th = (u - 0.5) * thmax
        tx, ty = math.cos(th) * sg, math.sin(th) * sg
        nx, ny = -ty, tx
        ox, oy = pts[(K - 1) * (S + 1) + i]
        b = len(pts)
        pts.append((round(ox + tx * 14 + nx * 7), round(oy + ty * 14 + ny * 7)))
        pts.append((round(ox + tx * 24 + nx * 17), round(oy + ty * 24 + ny * 17)))
        pts.append((round(ox + tx * 26 + nx * 3), round(oy + ty * 26 + ny * 3)))
        lines += [((K - 1) * (S + 1) + i, b), (b, b + 1), (b, b + 2), (b + 1, b + 2)]
    return pts, lines


def main():
    pts, lines = build()
    L = ['<?xml version="1.0" encoding="UTF-8"?>',
         '<svg xmlns="http://www.w3.org/2000/svg" viewBox="-200 -110 400 220" width="1200" height="660">',
         '<!-- Bratwurst-korven. Rita om den: allt i gruppen id="model" blir korvmodellen (en linje per segment; polyline/path med raka linjer och kurvor funkar ocksa).',
         '     Enhet = skeppsenhet, y nedat som pa skarmen, mitten (0,0) = korvens mittpunkt. Rutnat/mittpunkt ligger i gruppen "guide" och ignoreras.',
         '     Spara och kor: python tools/svg_to_model.py -->',
         '<rect x="-200" y="-110" width="400" height="220" fill="#000"/>',
         '<g id="guide" stroke="#333" stroke-width="0.3" fill="none">']
    for x in range(-200, 201, 20):
        L.append('<line x1="%d" y1="-110" x2="%d" y2="110"/>' % (x, x))
    for y in range(-100, 101, 20):
        L.append('<line x1="-200" y1="%d" x2="200" y2="%d"/>' % (y, y))
    L.append('<line x1="-6" y1="0" x2="6" y2="0" stroke="#0a0"/><line x1="0" y1="-6" x2="0" y2="6" stroke="#0a0"/>')
    L.append('</g>')
    L.append('<g id="model" stroke="#ff3020" stroke-width="0.8" fill="none" stroke-linecap="round">')
    for a, b in lines:
        L.append('<line x1="%d" y1="%d" x2="%d" y2="%d"/>' % (pts[a][0], -pts[a][1], pts[b][0], -pts[b][1]))
    L.append('</g>')
    L.append('</svg>')
    io.open(OUT, "w", encoding="utf8", newline="\n").write("\n".join(L) + "\n")
    print("skrev", OUT, len(pts), "punkter,", len(lines), "linjer")


if __name__ == "__main__":
    main()
