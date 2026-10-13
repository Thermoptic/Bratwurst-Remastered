# -*- coding: utf-8 -*-
"""Analyserar titelmusiken och skriver gms/Bratwurst.gmx/scripts/scr_data_musicviz.gml: 12 frekvensband per 20 ms (50 bildrutor/s) som
equalizern pa titelskarmen och i menyn laser vid musikens spelposition. GameMaker 1.4 kan inte lasa spektrum ur ljud i realtid, sa analysen
gors har i forvag. Kors om nar musikfilen byts: python tools/gen_music_viz.py [ogg]  (kraver ffmpeg, ingen numpy)."""
import math
import os
import struct
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
SRC = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, "..", "gms", "Bratwurst.gmx", "sound", "audio", "snd_title_music.ogg")
DST = os.path.join(HERE, "..", "gms", "Bratwurst.gmx", "scripts", "scr_data_musicviz.gml")
RATE = 44100
N = 1024
BANDS = 12
FPS = 50
F0, F1 = 50.0, 14000.0
DIG = "0123456789abcdefghijklmnopqrstuvwxyz"


def decode():
    raw = subprocess.run(["ffmpeg", "-v", "error", "-i", SRC, "-ac", "1", "-ar", str(RATE), "-f", "s16le", "-"], stdout=subprocess.PIPE, check=True).stdout
    return [x / 32768.0 for x in struct.unpack("<%dh" % (len(raw) // 2), raw)]


def fft(re, im):
    n = len(re)
    j = 0
    for i in range(1, n):
        bit = n >> 1
        while j & bit:
            j ^= bit
            bit >>= 1
        j ^= bit
        if i < j:
            re[i], re[j] = re[j], re[i]
            im[i], im[j] = im[j], im[i]
    ln = 2
    while ln <= n:
        ang = -2 * math.pi / ln
        wr, wi = math.cos(ang), math.sin(ang)
        for i in range(0, n, ln):
            cr, ci = 1.0, 0.0
            for k in range(ln // 2):
                a, b = i + k, i + k + ln // 2
                tr = re[b] * cr - im[b] * ci
                ti = re[b] * ci + im[b] * cr
                re[b], im[b] = re[a] - tr, im[a] - ti
                re[a], im[a] = re[a] + tr, im[a] + ti
                cr, ci = cr * wr - ci * wi, cr * wi + ci * wr
        ln <<= 1


def main():
    s = decode()
    total = len(s)
    frames = int(round(total / float(RATE) * FPS))
    edges = [F0 * (F1 / F0) ** (i / float(BANDS)) for i in range(BANDS + 1)]
    win = [0.5 - 0.5 * math.cos(2 * math.pi * i / (N - 1)) for i in range(N)]
    bin_hz = RATE / float(N)
    ranges = []
    for b in range(BANDS):
        lo = max(1, int(edges[b] / bin_hz))
        hi = max(lo + 1, int(edges[b + 1] / bin_hz))
        ranges.append((lo, hi))
    energy = []
    for f in range(frames):
        centre = int(f / float(FPS) * RATE)
        re = [s[(centre - N // 2 + i) % total] * win[i] for i in range(N)]
        im = [0.0] * N
        fft(re, im)
        row = []
        for lo, hi in ranges:
            p = sum(re[k] * re[k] + im[k] * im[k] for k in range(lo, hi)) / (hi - lo)
            row.append(10 * math.log10(p + 1e-9))
        energy.append(row)
    levels = [[0] * BANDS for _ in range(frames)]
    for b in range(BANDS):
        col = sorted(r[b] for r in energy)
        lo = col[int(len(col) * 0.08)]
        hi = col[int(len(col) * 0.985)]
        for f in range(frames):
            v = (energy[f][b] - lo) / max(1e-6, hi - lo)
            levels[f][b] = int(round(max(0.0, min(1.0, v)) * 35))
    L = ["/// scr_data_musicviz()",
         "// GENERERAD av tools/gen_music_viz.py - redigera inte for hand. Equalizerdata for titelmusiken: %d rutor a 20 ms, %d band." % (frames, BANDS),
         "// g_mv_frame[i] = %d tecken (0-9, a-z = niva 0..35) for varje band, lagt till hogt. g_mv_n = antal rutor, g_mv_dur = loopens langd i sekunder." % BANDS,
         "g_mv_n = %d;" % frames,
         "g_mv_dur = %.4f;" % (total / float(RATE))]
    for f in range(frames):
        L.append('g_mv_frame[%d] = "%s";' % (f, "".join(DIG[v] for v in levels[f])))
    with open(DST, "w", newline="\n") as fh:
        fh.write("\n".join(L) + "\n")
    print("skrev", DST, frames, "rutor,", "%.2f s" % (total / float(RATE)))


if __name__ == "__main__":
    main()
