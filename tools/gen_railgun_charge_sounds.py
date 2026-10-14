# -*- coding: utf-8 -*-
"""Syntetiserar de tva laddningsljuden for Railgun (egenproducerade, ingen extern kalla), 44,1 kHz, mono, 16 bit:
  snd_sfx_rg_charge: ett vibrerande, vobblande laddningsljud, 2 s, sommlost loopbart (alla delar har heltal cykler per 2 s). Spelet loopar det medan man
                     halller inne knappen och styr volym (svagt -> starkt) och tonhojd (stigande) med laddningen.
  snd_sfx_rg_ready:  "laddad"-ljudet, 0,9 s: en snabb stigande svep (400 -> 1800 Hz), ett metalliskt ringande klick (1800 + 2700 Hz) och ett kort lagt dunk.
Skriver gms/Bratwurst.gmx/sound/audio/*.wav och sound/*.sound.gmx. Kor: python tools/gen_railgun_charge_sounds.py"""
import io
import math
import os
import random
import struct
import wave

HERE = os.path.dirname(os.path.abspath(__file__))
GMX = os.path.normpath(os.path.join(HERE, "..", "gms", "Bratwurst.gmx"))
R = 44100
TWO_PI = 2 * math.pi


def write(name, samples):
    peak = max(abs(v) for v in samples)
    samples = [v / peak * 0.85 for v in samples]
    path = os.path.join(GMX, "sound", "audio", name + ".wav")
    with wave.open(path, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(R)
        w.writeframes(b"".join(struct.pack("<h", int(round(v * 32767))) for v in samples))
    tmpl = io.open(os.path.join(GMX, "sound", "snd_sfx_shot.sound.gmx"), "rb").read().decode("utf8").replace("snd_sfx_shot", name)
    io.open(os.path.join(GMX, "sound", name + ".sound.gmx"), "wb").write(tmpl.encode("utf8"))
    print("skrev", path, os.path.getsize(path), "byte")


def charge():
    dur = 2
    n = R * dur
    out = []
    for i in range(n):
        t = i / float(R)
        # vibrato 6 Hz pa grundtonen 140 Hz (140 * 2 s = 280 cykler -> heltal)
        ph = TWO_PI * (140.0 * t - 5.0 / (TWO_PI * 6.0) * math.cos(TWO_PI * 6.0 * t))
        tone = math.sin(ph) * 0.6 + math.sin(2 * ph) * 0.25 + math.sin(3 * ph) * 0.12
        # tremolo 9 Hz ("vobblande")
        trem = 0.65 + 0.35 * math.sin(TWO_PI * 9.0 * t)
        # skimrande hog ton 900 Hz med eget tremolo 13 Hz och sakta pulserande 3 Hz
        shim = math.sin(TWO_PI * 900.0 * t + 1.5 * math.sin(TWO_PI * 5.0 * t)) * (0.5 + 0.5 * math.sin(TWO_PI * 13.0 * t)) * (0.6 + 0.4 * math.sin(TWO_PI * 3.0 * t)) * 0.22
        # lagt surr 50 Hz (heltal cykler)
        hum = math.sin(TWO_PI * 50.0 * t) * 0.35
        out.append(math.tanh((tone * trem + shim + hum) * 1.3))
    return out


def ready():
    random.seed(5)
    n = int(R * 0.9)
    out = []
    ph = 0.0
    hp = 0.0
    prev = 0.0
    for i in range(n):
        t = i / float(R)
        # snabb stigande svep under de forsta 0,16 s
        k = min(1.0, t / 0.16)
        f = 400.0 * (1800.0 / 400.0) ** k
        ph += TWO_PI * f / R
        sweep = math.sin(ph) * (1.0 - k * 0.4) * (math.exp(-max(0.0, t - 0.16) * 30.0) if t > 0.16 else 1.0) * 0.6
        # metalliskt ringande "klick"
        ring = 0.0
        for fr, dc, am in ((1800.0, 7.0, 0.45), (2700.0, 9.0, 0.3), (3450.0, 12.0, 0.18)):
            ring += math.sin(TWO_PI * fr * t) * math.exp(-t * dc) * am
        ring *= min(1.0, max(0.0, (t - 0.14)) * 120.0)
        # kort lagt dunk och brusklick vid laddningslaget
        thump = math.sin(TWO_PI * 70.0 * t) * math.exp(-t * 14.0) * 0.7 * (1.0 if t > 0.14 else 0.0)
        nz = random.uniform(-1, 1)
        hp = 0.9 * (hp + nz - prev)
        prev = nz
        click = hp * math.exp(-max(0.0, t - 0.14) * 70.0) * 0.5 * (1.0 if t > 0.14 else 0.0)
        out.append(math.tanh((sweep + ring + thump + click) * 1.4))
    fade = int(R * 0.05)
    for i in range(fade):
        out[n - 1 - i] *= i / float(fade)
    return out


def main():
    write("snd_sfx_rg_charge", charge())
    write("snd_sfx_rg_ready", ready())


if __name__ == "__main__":
    main()
