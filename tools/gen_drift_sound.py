# -*- coding: utf-8 -*-
"""Syntetiserar driftljudet (snd_sfx_drift): en loopbar rymdskeppsmotor, 2 sekunder, 44,1 kHz, mono, 16 bit.
Egenproducerat ljud (ingen extern kalla): ett morrande lagt grundljud (saagtand 55 Hz + 82,5 Hz), ett svagt tjutande ton (330 Hz med
frekvensmodulering 3 Hz), ett lagpassfiltrerat bruslager och langsam amplitudmodulering (7 Hz). Alla delar har ett heltal cykler per 2 s och bruset
filtreras cirkulart, sa loopen ar sommlos.
Skriver gms/Bratwurst.gmx/sound/audio/snd_sfx_drift.wav och sound/snd_sfx_drift.sound.gmx. Kor: python tools/gen_drift_sound.py"""
import io
import math
import os
import random
import struct
import wave

HERE = os.path.dirname(os.path.abspath(__file__))
GMX = os.path.normpath(os.path.join(HERE, "..", "gms", "Bratwurst.gmx"))
R = 44100
DUR = 2
N = R * DUR


def main():
    random.seed(7)
    two_pi = 2 * math.pi
    # periodiskt brus: slumpbrus lagpassfiltreras over tre kopior i rad (fram och tillbaka) och mittkopian anvands, sa att skarvarna blir sommlosa
    base = [random.uniform(-1, 1) for _ in range(N)]
    ext = base * 3
    M = len(ext)
    a = 0.06
    y = 0.0
    for i in range(M):
        y += a * (ext[i] - y)
        ext[i] = y
    y = 0.0
    for i in range(M - 1, -1, -1):
        y += a * (ext[i] - y)
        ext[i] = y
    nz = ext[N:2 * N]
    peak_n = max(abs(v) for v in nz)
    nz = [v / peak_n for v in nz]
    samples = []
    for i in range(N):
        t = i / float(R)
        rumble = 0.0
        for k in range(1, 7):
            rumble += math.sin(two_pi * 55.0 * k * t) / k * 0.6
            rumble += math.sin(two_pi * 82.5 * k * t + 0.7) / k * 0.35
        phase = two_pi * (330.0 * t - 12.0 / (two_pi * 3.0) * math.cos(two_pi * 3.0 * t))
        whine = math.sin(phase) * 0.12 + math.sin(2 * phase) * 0.05
        am = 0.82 + 0.18 * math.sin(two_pi * 7.0 * t)
        v = (rumble * 0.55 + nz[i] * 0.45 + whine) * am
        samples.append(math.tanh(v * 1.4))
    peak = max(abs(v) for v in samples)
    samples = [v / peak * 0.85 for v in samples]
    wav_path = os.path.join(GMX, "sound", "audio", "snd_sfx_drift.wav")
    with wave.open(wav_path, "wb") as w:
        w.setnchannels(1)
        w.setsampwidth(2)
        w.setframerate(R)
        w.writeframes(b"".join(struct.pack("<h", int(round(v * 32767))) for v in samples))
    tmpl = io.open(os.path.join(GMX, "sound", "snd_sfx_shot.sound.gmx"), "rb").read().decode("utf8").replace("snd_sfx_shot", "snd_sfx_drift")
    io.open(os.path.join(GMX, "sound", "snd_sfx_drift.sound.gmx"), "wb").write(tmpl.encode("utf8"))
    print("skrev", wav_path, os.path.getsize(wav_path), "byte")


if __name__ == "__main__":
    main()
