# -*- coding: utf-8 -*-
"""Plockar ut originalets sju ljudeffekter (hunk 2) med exakta gransar fran spelets egna uppspelningsrutiner (docs/15, 'Ljudeffekter').
original/ lases bara. Skriver 16-bit mono WAV till gms/Bratwurst.gmx/sound/audio/ och en tabell till analysis/audio/sfx/.
Tabellen (adress, langd i ord, volym, period, kanal) kommer ur rutinerna 0x5cf4, 0x5d28, 0x5d5c, 0x5d90, 0x5dc4, 0x5e14, 0x5e48 i hunk 0.
Samplingsfrekvens = Paula PAL-klocka 3546895 Hz / period. Kor: python tools/extract_sfx.py [exe]"""
import os
import sys
import json
import struct

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import amiga_audio as aa

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
EXE = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "original", "Bratwurst_Decomp", "Bratwurst")
GMS = os.path.join(ROOT, "gms", "Bratwurst.gmx", "sound", "audio")
OUT = os.path.join(ROOT, "analysis", "audio", "sfx")

# (resursnamn, adress i minnesavbild, langd i 16-bitsord, volym 0..64, Paula-period, kanal, anvandning enligt anropsplats)
SFX = [
    ("snd_sfx_shot", 0x40000, 0x0ca4, 64, 450, 0, "kanonsalva (0x17d4, 0x1b38, 0x1e9c, 0x21fc) och cannon turret (0x7322)"),
    ("snd_sfx_explosion", 0x41948, 0x15f2, 64, 500, 1, "explosion nar missil/guidad missil forstors (0x660a, 0x667e)"),
    ("snd_sfx_missile", 0x4452c, 0x0b96, 64, 300, 1, "missil avfyras (0x6c2a)"),
    ("snd_sfx_guided", 0x45c58, 0x222c, 64, 400, 1, "guidad missil avfyras (0x6c50)"),
    ("snd_sfx_crash", 0x4a0b0, 0x3e35, 64, 300, 2, "skepp krockar i vagg om fart utanfor +-1000 (0x277c-0x28f6, hjalprutin 0x5dc4)"),
    ("snd_sfx_collide", 0x51d1a, 0x3e35, 64, 300, 2, "skepp krockar med skepp (0x292a-0x2a7e, rutin 0x5e14, spar 10 ticks per par)"),
    ("snd_sfx_hit", 0x59984, 0x1960, 26, 130, 2, "kanonskott traffar skepp (0x5f70, 0x5fbc, 0x6008, 0x6054, rutin 0x5e48)"),
]
BASE_H2 = 0x40000


def main():
    d, hunks = aa.read_hunks(EXE)
    h2 = hunks[2]["data"]
    os.makedirs(GMS, exist_ok=True)
    os.makedirs(OUT, exist_ok=True)
    table = []
    for name, addr, words, vol, per, ch, use in SFX:
        o = addr - BASE_H2
        n = words * 2
        seg = h2[o:o + n]
        missing = n - len(seg)
        rate = int(round(3546895.0 / per))
        pcm = b"".join(struct.pack("<h", (b - 256 if b > 127 else b) * 256) for b in seg)
        for dst in (os.path.join(GMS, name + ".wav"), os.path.join(OUT, name + ".wav")):
            aa.write_wav(dst, pcm, rate, 2, 1)
        table.append({"name": name, "address": hex(addr), "bytes": n, "bytes_available": len(seg), "bytes_missing_in_damaged_exe": missing,
                      "volume": vol, "gain": round(vol / 64.0, 3), "period": per, "rate_hz": rate, "channel": ch, "use": use})
        print(name, rate, "Hz", n, "B", "saknas:" if missing else "", missing or "")
    json.dump(table, open(os.path.join(OUT, "sfx_table.json"), "w"), indent=1)


if __name__ == "__main__":
    main()
