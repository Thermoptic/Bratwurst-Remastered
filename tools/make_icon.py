# -*- coding: utf-8 -*-
"""Bygger spelets exe-ikon (Windows .ico, flera storlekar med genomskinlighet) fran en bild (webp/png): python tools/make_icon.py <bild>
Skriver gms/Bratwurst.gmx/Configs/Default/windows/runner_icon.ico (den GameMaker anvander, option_windows_game_icon) och Runner_Icon_256.ico, samt en
kopia av kallbilden som assets/icon/icon.png (512 x 512). Storlekar: 16, 24, 32, 48, 64, 128 och 256 pixlar som 32-bitars BMP-poster (fungerar overallt,
aven i aldre verktyg). Kraver ffmpeg (ingen PIL)."""
import os
import struct
import subprocess
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.path.normpath(os.path.join(HERE, ".."))
OUTDIR = os.path.join(ROOT, "gms", "Bratwurst.gmx", "Configs", "Default", "windows")
SIZES = [16, 24, 32, 48, 64, 128, 256]


def rgba(src, size):
    # skala med bra filter, behall alpha, ge ra RGBA-bytes
    vf = "scale=%d:%d:flags=lanczos,format=rgba" % (size, size)
    raw = subprocess.run(["ffmpeg", "-v", "error", "-i", src, "-vf", vf, "-f", "rawvideo", "-pix_fmt", "rgba", "-"], stdout=subprocess.PIPE, check=True).stdout
    assert len(raw) == size * size * 4, (len(raw), size)
    return raw


def bmp_entry(raw, size):
    rows = []
    for y in range(size - 1, -1, -1):          # BMP lagras nerifran och upp
        row = bytearray()
        for x in range(size):
            r, g, b, a = raw[(y * size + x) * 4:(y * size + x) * 4 + 4]
            row += bytes((b, g, r, a))
        rows.append(bytes(row))
    mask_row = ((size + 31) // 32) * 4
    header = struct.pack("<IiiHHIIiiII", 40, size, size * 2, 1, 32, 0, size * size * 4 + mask_row * size, 0, 0, 0, 0)
    return header + b"".join(rows) + b"\x00" * (mask_row * size)


def build(path, sizes, src):
    entries = [(s, bmp_entry(rgba(src, s), s)) for s in sizes]
    out = struct.pack("<HHH", 0, 1, len(entries))
    offset = 6 + 16 * len(entries)
    for s, data in entries:
        out += struct.pack("<BBBBHHII", 0 if s >= 256 else s, 0 if s >= 256 else s, 0, 0, 1, 32, len(data), offset)
        offset += len(data)
    for s, data in entries:
        out += data
    with open(path, "wb") as f:
        f.write(out)
    print("skrev", path, len(out), "byte,", len(entries), "storlekar")


def main():
    src = sys.argv[1]
    build(os.path.join(OUTDIR, "runner_icon.ico"), SIZES, src)
    build(os.path.join(OUTDIR, "Runner_Icon_256.ico"), [256], src)
    os.makedirs(os.path.join(ROOT, "assets", "icon"), exist_ok=True)
    subprocess.run(["ffmpeg", "-v", "error", "-y", "-i", src, "-vf", "scale=512:512:flags=lanczos,format=rgba", os.path.join(ROOT, "assets", "icon", "icon.png")], check=True)
    print("skrev assets/icon/icon.png")


if __name__ == "__main__":
    main()
