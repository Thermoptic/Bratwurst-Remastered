# -*- coding: utf-8 -*-
"""Gor om en ritad SVG (assets/models/sausage.svg, gruppen id="model") till korvmodellen i spelet: skriver scripts/scr_data_sausage.gml som
en explicit punkt- och linjelista i skeppens format (g_ship_pts / g_ship_lines), pseudoskepp g_SAUSAGE = g_ship_count (utanfor skeppsvalet).
Stod: <line>, <polyline>, <polygon>, <rect> och <path> med M L H V Z (absoluta och relativa) samt kurvor C/S/Q (delas upp i 8 raka delar);
transform (translate/scale/rotate/matrix) pa element och grupper tas med. SVG-y vands (modell_y = -svg_y); viewBoxens mitt blir (0,0) och dess bredd 400 enheter. Punkter inom 1,0 enhet
slas ihop sa att sammanhangande linjer delar punkter. Anvandning: python tools/svg_to_model.py [in.svg] [ut.gml]   (--check = skriv bara statistik)"""
import io
import math
import os
import re
import sys
import xml.etree.ElementTree as ET

HERE = os.path.dirname(os.path.abspath(__file__))
SVG = os.path.normpath(os.path.join(HERE, "..", "assets", "models", "sausage.svg"))
GML = os.path.normpath(os.path.join(HERE, "..", "gms", "Bratwurst.gmx", "scripts", "scr_data_sausage.gml"))
SNAP = 1.0
NS = "{http://www.w3.org/2000/svg}"


def mul(a, b):
    return (a[0] * b[0] + a[2] * b[1], a[1] * b[0] + a[3] * b[1], a[0] * b[2] + a[2] * b[3], a[1] * b[2] + a[3] * b[3],
            a[0] * b[4] + a[2] * b[5] + a[4], a[1] * b[4] + a[3] * b[5] + a[5])


def parse_transform(t):
    m = (1, 0, 0, 1, 0, 0)
    for name, args in re.findall(r"(\w+)\s*\(([^)]*)\)", t or ""):
        v = [float(x) for x in re.split(r"[ ,]+", args.strip()) if x]
        if name == "translate":
            m = mul(m, (1, 0, 0, 1, v[0], v[1] if len(v) > 1 else 0))
        elif name == "scale":
            m = mul(m, (v[0], 0, 0, v[1] if len(v) > 1 else v[0], 0, 0))
        elif name == "rotate":
            a = math.radians(v[0])
            r = (math.cos(a), math.sin(a), -math.sin(a), math.cos(a), 0, 0)
            if len(v) == 3:
                m = mul(mul(mul(m, (1, 0, 0, 1, v[1], v[2])), r), (1, 0, 0, 1, -v[1], -v[2]))
            else:
                m = mul(m, r)
        elif name == "matrix":
            m = mul(m, tuple(v))
    return m


def apply(m, p):
    return (m[0] * p[0] + m[2] * p[1] + m[4], m[1] * p[0] + m[3] * p[1] + m[5])


def bez(p0, c1, c2, p1, n=8):
    out = []
    for i in range(1, n + 1):
        t = i / float(n)
        a = (1 - t) ** 3
        b = 3 * (1 - t) ** 2 * t
        c = 3 * (1 - t) * t * t
        d = t ** 3
        out.append((a * p0[0] + b * c1[0] + c * c2[0] + d * p1[0], a * p0[1] + b * c1[1] + c * c2[1] + d * p1[1]))
    return out


def path_polys(d):
    """Returnerar en lista av (punktlista, sluten) fran en path-strang."""
    toks = re.findall(r"[MmLlHhVvZzCcSsQq]|-?\d*\.?\d+(?:[eE][-+]?\d+)?", d)
    st = {"i": 0}
    cmd = None
    cur = (0.0, 0.0)
    start = cur
    polys = []
    pts = []
    lastc = None

    def num():
        v = float(toks[st["i"]])
        st["i"] += 1
        return v
    while st["i"] < len(toks):
        if re.match(r"[A-Za-z]", toks[st["i"]]):
            cmd = toks[st["i"]]
            st["i"] += 1
            if cmd in "Zz":
                if pts:
                    polys.append((pts, True))
                    pts = []
                cur = start
                continue
        rel = cmd.islower()
        c = cmd.upper()
        ox, oy = (cur if rel else (0.0, 0.0))
        if c == "M":
            if pts:
                polys.append((pts, False))
            cur = (ox + num(), oy + num())
            start = cur
            pts = [cur]
            cmd = "l" if rel else "L"
        elif c == "L":
            cur = (ox + num(), oy + num())
            pts.append(cur)
        elif c == "H":
            cur = ((cur[0] if rel else 0.0) + num(), cur[1])
            pts.append(cur)
        elif c == "V":
            cur = (cur[0], (cur[1] if rel else 0.0) + num())
            pts.append(cur)
        elif c == "C":
            c1 = (ox + num(), oy + num())
            c2 = (ox + num(), oy + num())
            e = (ox + num(), oy + num())
            pts += bez(cur, c1, c2, e)
            lastc = c2
            cur = e
        elif c == "S":
            c1 = (2 * cur[0] - lastc[0], 2 * cur[1] - lastc[1]) if lastc else cur
            c2 = (ox + num(), oy + num())
            e = (ox + num(), oy + num())
            pts += bez(cur, c1, c2, e)
            lastc = c2
            cur = e
        elif c == "Q":
            q = (ox + num(), oy + num())
            e = (ox + num(), oy + num())
            c1 = (cur[0] + 2 / 3.0 * (q[0] - cur[0]), cur[1] + 2 / 3.0 * (q[1] - cur[1]))
            c2 = (e[0] + 2 / 3.0 * (q[0] - e[0]), e[1] + 2 / 3.0 * (q[1] - e[1]))
            pts += bez(cur, c1, c2, e)
            cur = e
    if pts:
        polys.append((pts, False))
    return polys


def collect(el, m, out, inmodel):
    tag = el.tag.replace(NS, "")
    m = mul(m, parse_transform(el.get("transform")))
    if tag in ("g", "svg", "switch", "a"):
        gid = el.get("id") or ""
        if gid == "guide":
            return
        for ch in el:
            collect(ch, m, out, inmodel or gid == "model")
        return
    if not inmodel:
        return

    def f(k):
        return float(el.get(k, "0"))
    if tag == "line":
        out.append(([apply(m, (f("x1"), f("y1"))), apply(m, (f("x2"), f("y2")))], False))
    elif tag in ("polyline", "polygon"):
        v = [float(x) for x in re.split(r"[ ,]+", el.get("points", "").strip()) if x]
        p = [apply(m, (v[j], v[j + 1])) for j in range(0, len(v) - 1, 2)]
        out.append((p, tag == "polygon"))
    elif tag == "rect":
        x, y, w, h = f("x"), f("y"), f("width"), f("height")
        out.append(([apply(m, q) for q in ((x, y), (x + w, y), (x + w, y + h), (x, y + h))], True))
    elif tag == "path":
        for p, closed in path_polys(el.get("d", "")):
            out.append(([apply(m, q) for q in p], closed))


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    src = args[0] if len(args) > 0 else SVG
    dst = args[1] if len(args) > 1 else GML
    root = ET.parse(src).getroot()
    # viewBox normaliseras till modellens enheter: mitten av viewBoxen blir (0,0) och bredden 400 enheter (standard: -200 -110 400 220 ger 1:1);
    # en SVG som sparats om i annan skala (t.ex. 0 0 1200 660) hamnar da ratt automatiskt
    vb = [float(x) for x in re.split(r"[ ,]+", (root.get("viewBox") or "-200 -110 400 220").strip())]
    sc = 400.0 / vb[2]
    base = (sc, 0, 0, sc, -(vb[0] + vb[2] / 2.0) * sc, -(vb[1] + vb[3] / 2.0) * sc)
    polys = []
    collect(root, base, polys, False)
    pts, lines, seen = [], [], set()

    def pid(p):
        x, y = p[0], -p[1]   # SVG-y nedat -> modellens y uppat
        for k, q in enumerate(pts):
            if abs(q[0] - x) <= SNAP and abs(q[1] - y) <= SNAP:
                return k
        pts.append((x, y))
        return len(pts) - 1
    for p, closed in polys:
        ids = [pid(q) for q in p]
        if closed and len(ids) > 2:
            ids.append(ids[0])
        for a, b in zip(ids, ids[1:]):
            if a != b and (min(a, b), max(a, b)) not in seen:
                seen.add((min(a, b), max(a, b)))
                lines.append((a, b))
    print("%d punkter, %d linjer" % (len(pts), len(lines)))
    if "--check" in sys.argv:
        return
    L = ["/// scr_data_sausage()",
         "// GENERERAD av tools/svg_to_model.py fran assets/models/sausage.svg - redigera SVG:n och kor verktyget igen, inte denna fil.",
         "// Korvmodellen (Capture the Bratwurst, D-034): pseudoskepp med index g_SAUSAGE = g_ship_count (utanfor skeppsvalet), samma dataformat som skeppen",
         "// (g_ship_pts / g_ship_lines, skeppsenheter, lokal y uppat) och ritas med scr_ui_ship. Kors en gang vid start.",
         "var sh;",
         "sh = g_ship_count;",
         "g_SAUSAGE = sh;"]
    for k, (x, y) in enumerate(pts):
        L.append("g_ship_pts[sh, %d] = %d; g_ship_pts[sh, %d] = %d;" % (2 * k, round(x), 2 * k + 1, round(y)))
    for k, (a, b) in enumerate(lines):
        L.append("g_ship_lines[sh, %d] = %d; g_ship_lines[sh, %d] = %d;" % (2 * k, a, 2 * k + 1, b))
    L += ['g_ship_name[sh] = "Bratwurst";', "g_ship_np[sh] = %d;" % len(pts), "g_ship_nl[sh] = %d;" % len(lines), "g_ship_nk[sh] = 0;"]
    io.open(dst, "w", encoding="ascii", newline="\n").write("\n".join(L) + "\n")
    print("skrev", dst)


if __name__ == "__main__":
    main()
