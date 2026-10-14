# -*- coding: utf-8 -*-
"""Syntetiserar railgun-ljudet (snd_sfx_railgun): ett kraftfullt scifi-lasersskott, 1,6 s, 44,1 kHz, mono, 16 bit. Egenproducerat (ingen extern kalla).
Lager: (1) ett snabbt fallande laserskrik (6 kHz -> 180 Hz, exponentiell svep med FM-"sprak"), (2) ett lagt dundrande bombljud (sinus 60 -> 28 Hz med
mjuk distorsion), (3) en kort brusstot med hog-pass (smallen i borjan), (4) ett metalliskt ringande eko (tre oharmoniska toner som klingar ut),
(5) en uppladdningsliknande hog ton som klingar av. Allt mjukklipps med tanh. Skriver gms/Bratwurst.gmx/sound/audio/snd_sfx_railgun.wav och
sound/snd_sfx_railgun.sound.gmx. Kor: python tools/gen_railgun_sound.py"""
import io
import math
import os
import random
import struct
import wave

HERE = os.path.dirname(os.path.abspath(__file__))
GMX = os.path.normpath(os.path.join(HERE, "..", "gms", "Bratwurst.gmx"))
R = 44100
DUR = 1.6
N = int(R * DUR)


def main():
    random.seed(11)
    two_pi = 2 * math.pi
    out = []
    ph1 = 0.0
    ph2 = 0.0
    ph3 = 0.0
    prev = 0.0
    hp = 0.0
    for i in range(N):
        t = i / float(R)
        # (1) laserskrik: exponentiellt fallande frekvens 6000 -> 180 Hz over 0,55 s, sedan kvar pa 180 Hz med avtagande niva
        k = min(1.0, t / 0.55)
        f1 = 6000.0 * (180.0 / 6000.0) ** k
        ph1 += two_pi * (f1 + 140.0 * math.sin(two_pi * 90.0 * t)) / R
        env1 = math.exp(-t * 3.2) * min(1.0, t * 400.0)
        zap = (math.sin(ph1) * 0.7 + math.sin(ph1 * 2.01) * 0.25) * env1
        # (2) lagt dunder
        f2 = 28.0 + 40.0 * math.exp(-t * 9.0)
        ph2 += two_pi * f2 / R
        boom = math.tanh(math.sin(ph2) * 2.2) * math.exp(-t * 3.0) * min(1.0, t * 200.0) * 0.9
        # (3) brusstot (hog-passat) i borjan
        n = random.uniform(-1, 1)
        hp = 0.92 * (hp + n - prev)
        prev = n
        crack = hp * math.exp(-t * 28.0) * 0.8
        # (4) metalliskt ringande eko
        ring = 0.0
        for fr, dc, am in ((880.0, 4.0, 0.22), (1357.0, 5.5, 0.16), (2211.0, 7.0, 0.1)):
            ring += math.sin(two_pi * fr * t) * math.exp(-t * dc) * am
        ring *= min(1.0, t * 300.0)
        # (5) hog laddningston som klingar av
        ph3 += two_pi * (1200.0 + 300.0 * math.exp(-t * 6.0)) / R
        whine = math.sin(ph3) * math.exp(-t * 5.0) * 0.18
        v = zap * 0.75 + boom * 0.85 + crack * 0.55 + ring + whine
        out.append(math.tanh(v * 1.5))
    # kort tonad ut i slutet sa att det inte klickar
    fade = int(R * 0.08)
    for i in range(fade):
        out[N - 1 - i] *= i / float(fade)
    peak = max(abs(v) for v in out)
    out = [v / peak * 0.92 for v in out]
    path = os.path.join(GMX, "sound", "audio", "snd_sfx_railgun.wav")
    with wave.open(path, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(R)
        w.writeframes(b"".join(struct.pack("<h", int(round(v * 32767))) for v in out))
    tmpl = io.open(os.path.join(GMX, "sound", "snd_sfx_shot.sound.gmx"), "rb").read().decode("utf8").replace("snd_sfx_shot", "snd_sfx_railgun")
    io.open(os.path.join(GMX, "sound", "snd_sfx_railgun.sound.gmx"), "wb").write(tmpl.encode("utf8"))
    print("skrev", path, os.path.getsize(path), "byte")


if __name__ == "__main__":
    main()
