# -*- coding: utf-8 -*-
"""Bygger spellistan i menyn fran mp3-filerna i mappen Music/ (Thermoptic-latarna) till GameMaker-projektet:
  1. ogg-fil per lat:           gms/Bratwurst.gmx/sound/audio/snd_music_N.ogg  (+ sound/snd_music_N.sound.gmx)
  2. equalizerdata per lat:     gms/Bratwurst.gmx/datafiles/viz_N.txt  (en rad per ruta: 12 + 32 tecken, 25 rutor/s)
  3. scripts/scr_data_tracks.gml (namn, ljudresurser, rutor/s) och poster i Bratwurst.project.gmx (sounds + datafiles).
Latnummer 0 ar den inbyggda titellaten (snd_title_music, data i scr_data_musicviz); mp3-latarna blir 1, 2, ... i filnamnsordning.
Kraver ffmpeg (ingen numpy). Kor: python tools/gen_tracks.py   (tar nagra minuter per lat: FFT i ren Python)."""
import io
import math
import os
import re
import struct
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, ".."))
GMX = os.path.join(ROOT, "gms", "Bratwurst.gmx")
MUSIC = os.path.join(ROOT, "Music")
RATE = 22050          # analysen sker pa 22 kHz mono (tillrackligt till 11 kHz)
N = 2048
FPS = 25
BANDS = 12
WIDE = 32
F0, F1 = 50.0, 10000.0
DIG = "0123456789abcdefghijklmnopqrstuvwxyz"


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
        tw = [(1.0, 0.0)]
        for k in range(1, ln // 2):
            tw.append((tw[-1][0] * wr - tw[-1][1] * wi, tw[-1][0] * wi + tw[-1][1] * wr))
        half = ln // 2
        for i in range(0, n, ln):
            for k in range(half):
                cr, ci = tw[k]
                a, b = i + k, i + k + half
                tr = re[b] * cr - im[b] * ci
                ti = re[b] * ci + im[b] * cr
                re[b], im[b] = re[a] - tr, im[a] - ti
                re[a], im[a] = re[a] + tr, im[a] + ti
        ln <<= 1


def decode(path):
    raw = subprocess.run(["ffmpeg", "-v", "error", "-i", path, "-ac", "1", "-ar", str(RATE), "-f", "s16le", "-"], stdout=subprocess.PIPE, check=True).stdout
    return [x / 32768.0 for x in struct.unpack("<%dh" % (len(raw) // 2), raw)]


def ranges_for(bands):
    edges = [F0 * (F1 / F0) ** (i / float(bands)) for i in range(bands + 1)]
    bin_hz = RATE / float(N)
    out = []
    for b in range(bands):
        lo = max(1, int(edges[b] / bin_hz))
        hi = max(lo + 1, int(round(edges[b + 1] / bin_hz)))
        out.append((lo, hi))
    return out


def analyse(s):
    """Returnerar (frames, rader) dar varje rad ar en sträng med 12 + 32 niva-tecken."""
    total = len(s)
    frames = int(total / float(RATE) * FPS)
    win = [0.5 - 0.5 * math.cos(2 * math.pi * i / (N - 1)) for i in range(N)]
    r12, r32 = ranges_for(BANDS), ranges_for(WIDE)
    energy = []
    for f in range(frames):
        centre = int(f / float(FPS) * RATE)
        re = [s[(centre - N // 2 + i) % total] * win[i] for i in range(N)]
        im = [0.0] * N
        fft(re, im)
        pw = [re[k] * re[k] + im[k] * im[k] for k in range(N // 2)]
        row = []
        for lo, hi in r12 + r32:
            p = sum(pw[lo:hi]) / (hi - lo)
            row.append(10 * math.log10(p + 1e-9))
        energy.append(row)
        if f % 500 == 0:
            sys.stdout.write("  %d / %d\n" % (f, frames))
            sys.stdout.flush()
    nb = BANDS + WIDE
    lines = [[0] * nb for _ in range(frames)]
    for b in range(nb):
        col = sorted(r[b] for r in energy)
        lo = col[int(len(col) * 0.08)]
        hi = col[int(len(col) * 0.985)]
        for f in range(frames):
            v = (energy[f][b] - lo) / max(1e-6, hi - lo)
            lines[f][b] = int(round(max(0.0, min(1.0, v)) * 35))
    return frames, ["".join(DIG[v] for v in row) for row in lines]


def pretty(fn):
    base = os.path.splitext(fn)[0]
    base = base.encode("ascii", "ignore").decode("ascii")
    return base.upper().replace("THERMOPTOC", "THERMOPTIC")   # stavfel i en filnamn rattas i visningsnamnet


def snd_xml(idx, template):
    t = template.replace("snd_title_music", "snd_music_%d" % idx)
    return t


def update_project(n):
    p = os.path.join(GMX, "Bratwurst.project.gmx")
    raw = io.open(p, "rb").read().decode("utf8")
    nl = "\r\n" if "\r\n" in raw else "\n"
    for i in range(1, n + 1):
        tag = "    <sound>sound\\snd_music_%d</sound>" % i
        if tag not in raw:
            raw = raw.replace("    <sound>sound\\snd_title_music</sound>" + nl, "    <sound>sound\\snd_title_music</sound>" + nl + tag + nl, 1)
    m = re.search(r"    <datafile>\s*<name>updates\.txt</name>.*?</datafile>" + nl, raw, re.S)
    template = m.group(0)
    for i in range(1, n + 1):
        name = "viz_%d.txt" % i
        size = os.path.getsize(os.path.join(GMX, "datafiles", name))
        entry = template.replace("updates.txt", name)
        entry = re.sub(r"<size>\d+</size>", "<size>%d</size>" % size, entry)
        if "<name>%s</name>" % name in raw:
            raw = re.sub(r"(<name>%s</name>\s*<exists>-1</exists>\s*<size>)\d+(</size>)" % re.escape(name), lambda mm: mm.group(1) + str(size) + mm.group(2), raw)
        else:
            raw = raw.replace("  </datafiles>", entry + "  </datafiles>", 1)
    cnt = len(re.findall(r"<datafile>", raw))
    raw = re.sub(r'<datafiles number="\d+"', '<datafiles number="%d"' % cnt, raw, 1)
    io.open(p, "wb").write(raw.encode("utf8"))


def main():
    # fast ordning: tracks.txt listar filerna i latnummerordning (nummer ar knutna till viz_N.txt); nya mp3 laggs sist i filnamnsordning
    manifest = os.path.join(HERE, "tracks.txt")
    files = []
    if os.path.exists(manifest):
        files = [l.strip() for l in io.open(manifest, encoding="utf8").read().splitlines() if l.strip()]
    files = [f for f in files if os.path.exists(os.path.join(MUSIC, f))]
    for f in sorted(x for x in os.listdir(MUSIC) if x.lower().endswith(".mp3")):
        if f not in files:
            files.append(f)
    io.open(manifest, "w", encoding="utf8", newline=chr(10)).write(chr(10).join(files) + chr(10))
    tmpl = io.open(os.path.join(GMX, "sound", "snd_title_music.sound.gmx"), "rb").read().decode("utf8")
    names = []
    fps = []
    for i, fn in enumerate(files, 1):
        src = os.path.join(MUSIC, fn)
        print("lat %d: %s" % (i, fn))
        ogg = os.path.join(GMX, "sound", "audio", "snd_music_%d.ogg" % i)
        subprocess.run(["ffmpeg", "-v", "error", "-y", "-i", src, "-vn", "-c:a", "libvorbis", "-q:a", "3", "-ar", "44100", ogg], check=True)
        io.open(os.path.join(GMX, "sound", "snd_music_%d.sound.gmx" % i), "wb").write(snd_xml(i, tmpl).encode("utf8"))
        viz = os.path.join(GMX, "datafiles", "viz_%d.txt" % i)
        if os.path.exists(viz) and "--redo" not in sys.argv:
            print("  viz_%d.txt finns redan (--redo for att gora om)" % i)
        else:
            frames, lines = analyse(decode(src))
            io.open(viz, "w", newline="\n", encoding="ascii").write("\n".join(lines) + "\n")
        names.append(pretty(fn))
        fps.append(FPS)
    L = ["/// scr_data_tracks()",
         "// GENERERAD av tools/gen_tracks.py - redigera inte for hand. Latar fran mappen Music/ (lat 0 = titellaten, se scr_config_init).",
         "// Equalizerdata per lat ligger i Included Files (viz_N.txt, en rad per ruta: 12 + 32 tecken) och laddas av scr_tracks_load."]
    for i, nm in enumerate(names, 1):
        L.append('g_trk_name[%d] = "%s"; g_trk_snd[%d] = snd_music_%d; g_trk_fps[%d] = %d; g_trk_viz[%d] = false;' % (i, nm, i, i, i, fps[i - 1], i))
    L.append("g_trk_n = %d;" % (len(names) + 1))
    io.open(os.path.join(GMX, "scripts", "scr_data_tracks.gml"), "w", newline="\n", encoding="ascii").write("\n".join(L) + "\n")
    update_project(len(names))
    print("klart:", names)


if __name__ == "__main__":
    main()
