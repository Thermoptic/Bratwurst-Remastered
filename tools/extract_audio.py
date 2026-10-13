# -*- coding: utf-8 -*-
"""Plockar ut ljud ur Amiga-exet (original/ lases bara, skrivs aldrig) till analysis/audio/.
 - modulen (ProTracker, hunk 3): alla sampel som WAV, hela modulen renderad (WAV + OGG om ffmpeg finns)
 - hunk 2 (117 kB 8-bitsdata): hela blocket som raa WAV + uppskattad uppdelning i delljud (se analysis/audio/hunk2/README.txt)
Kor: python tools/extract_audio.py [sokvag-till-exe]"""
import os
import sys
import subprocess
import json

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import amiga_audio as aa

ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..")
EXE = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "original", "Bratwurst_Decomp", "Bratwurst")
OUT = os.path.join(ROOT, "analysis", "audio")


def ogg(wav):
    try:
        subprocess.run(["ffmpeg", "-y", "-loglevel", "error", "-i", wav, "-c:a", "libvorbis", "-q:a", "4", wav[:-4] + ".ogg"], check=True)
        return True
    except Exception as e:  # ffmpeg saknas
        print("ogg hoppades over:", e)
        return False


def main():
    d, hunks = aa.read_hunks(EXE)
    h3 = hunks[3]["data"]
    i = h3.find(b"M.K.")
    mod_off = i - 1080
    print("modul vid hunk3+0x%x (filoffset 0x%x)" % (mod_off, hunks[3]["off"] + mod_off))
    mod = aa.PTModule(h3[mod_off:])
    print("titel:", repr(mod.title), "songlen", mod.songlen, "monster", mod.npat, "trunkerade sampel:", mod.truncated)
    os.makedirs(os.path.join(OUT, "module_samples"), exist_ok=True)
    info = []
    for n, s in enumerate(mod.samples):
        if s["len"] > 2 and s["data"]:
            fn = "%02d_%s.wav" % (n + 1, "".join(c if c.isalnum() else "_" for c in s["name"]) or "sample")
            aa.sample_to_wav(os.path.join(OUT, "module_samples", fn), s["data"])
            info.append({"file": fn, "name": s["name"], "bytes": len(s["data"]), "declared": s["len"], "vol": s["vol"], "loop": [s["loop_start"], s["loop_len"]]})
    json.dump(info, open(os.path.join(OUT, "module_samples", "samples.json"), "w"), indent=1)
    print(len(info), "sampel skrivna")
    L, R = aa.render(mod, loops=2)
    wav = os.path.join(OUT, "music_module.wav")
    peak = max(max(abs(x) for x in L), max(abs(x) for x in R), 1e-6)
    aa.write_wav(wav, aa.stereo16(L, R, 0.9 / peak), 44100, 2, 2)   # normaliserad (tidigare klippte den)
    print("musik %.1f s" % (len(L) / 44100.0))
    ogg(wav)
    clips(h3[:mod_off], "hunk3_before_module", 8287)
    clips(hunks[2]["data"], "hunk2", 8287)


def segment(b, blk=128):
    """Grov uppdelning i delljud: ny start dar enveloppen hoppar upp efter en tystare period (heuristik, inte verifierat)."""
    s = [(v - 256 if v > 127 else v) for v in b]
    env = [sum(abs(v) for v in s[i:i + blk]) / float(blk) for i in range(0, len(s), blk)]
    starts = [0]
    for i in range(4, len(env)):
        if env[i] > max(14, min(env[i - 4:i]) * 3) and i - starts[-1] > 12:
            starts.append(i)
    ends = starts[1:] + [None]
    return [(a * blk, (e * blk if e else len(b)) - a * blk) for a, e in zip(starts, ends)]


def clips(b, name, rate):
    base = os.path.join(OUT, name)
    os.makedirs(base, exist_ok=True)
    aa.sample_to_wav(os.path.join(base, "_whole.wav"), b, rate)
    segs = segment(b)
    lines = ["Gissad uppdelning (heuristik): enveloppen hoppar upp efter en tystare period. Samplingsfrekvensen 8287 Hz ar ett antagande (C-2, PAL).",
             "Namn = klippnummer_startoffset_langd (byte i hunken). Verkliga gransar och tonhojd ar OKANDA tills koden/emulatorn har kontrollerats.", ""]
    for n, (a, ln) in enumerate(segs):
        fn = "%02d_off%06d_len%05d.wav" % (n + 1, a, ln)
        aa.sample_to_wav(os.path.join(base, fn), b[a:a + ln], rate)
        lines.append(fn)
    open(os.path.join(base, "README.txt"), "w").write(chr(10).join(lines) + chr(10))
    print(name, len(segs), "klipp")


if __name__ == "__main__":
    main()
