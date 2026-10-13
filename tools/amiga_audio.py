# -*- coding: utf-8 -*-
"""Hjalpfunktioner for att lasa ljud ur Amiga-exet (skrivskyddat): hunk-parser, ProTracker-modul, enkel PT-renderare, WAV-skrivare."""
import struct
import wave
import math

EXE = None


def read_hunks(path):
    d = open(path, "rb").read()
    o = 0
    assert struct.unpack(">I", d[0:4])[0] == 0x3F3
    o = 4
    while struct.unpack(">I", d[o:o + 4])[0] != 0:  # resident libs
        o += 4 + 4 * struct.unpack(">I", d[o:o + 4])[0]
    o += 4
    nh, first, last = struct.unpack(">III", d[o:o + 12])
    o += 12
    sizes = []
    for i in range(nh):
        sizes.append(struct.unpack(">I", d[o:o + 4])[0] & 0x3FFFFFFF)
        o += 4
    hunks = []
    cur = None
    while o < len(d) and len(hunks) < nh:
        t = struct.unpack(">I", d[o:o + 4])[0] & 0x3FFFFFFF
        o += 4
        if t in (0x3E9, 0x3EA, 0x3EB):  # CODE, DATA, BSS
            n = struct.unpack(">I", d[o:o + 4])[0]
            o += 4
            if t == 0x3EB:
                cur = {"type": "BSS", "off": o, "data": b""}
            else:
                ln = n * 4
                tags = (0x3EC, 0x3F2, 0x3F0, 0x3F1)
                if struct.unpack(">I", d[o + ln:o + ln + 4])[0] & 0x3FFFFFFF not in tags:
                    # exet ar skadat: hunkarna 2 och 3 ar 512 byte kortare an deklarerat (docs/13)
                    ln -= 512
                    assert struct.unpack(">I", d[o + ln:o + ln + 4])[0] & 0x3FFFFFFF in tags, "hunkslut hittades inte"
                cur = {"type": "CODE" if t == 0x3E9 else "DATA", "off": o, "data": d[o:o + ln], "declared": n * 4}
                o += ln
        elif t == 0x3EC:  # RELOC32
            while True:
                n = struct.unpack(">I", d[o:o + 4])[0]
                o += 4
                if n == 0:
                    break
                o += 4 + 4 * n
        elif t == 0x3F2:  # END
            hunks.append(cur)
        else:
            raise ValueError("okand hunk %x vid %x" % (t, o))
    return d, hunks


class PTModule:
    def __init__(self, data):
        self.title = data[0:20].rstrip(b"\0").decode("latin1")
        self.samples = []
        for i in range(31):
            b = data[20 + i * 30:20 + (i + 1) * 30]
            name = b[0:22].rstrip(b"\0").decode("latin1")
            ln, ft, vol, ls, ll = struct.unpack(">HBBHH", b[22:30])
            self.samples.append({"name": name, "len": ln * 2, "finetune": ft & 15, "vol": vol, "loop_start": ls * 2, "loop_len": ll * 2})
        self.songlen = data[950]
        self.order = list(data[952:952 + 128])
        self.sig = data[1080:1084]
        npat = max(self.order) + 1
        self.npat = npat
        self.patterns = []
        o = 1084
        for p in range(npat):
            rows = []
            for r in range(64):
                row = []
                for c in range(4):
                    b0, b1, b2, b3 = data[o:o + 4]
                    o += 4
                    smp = (b0 & 0xF0) | (b2 >> 4)
                    per = ((b0 & 15) << 8) | b1
                    eff = b2 & 15
                    par = b3
                    row.append((smp, per, eff, par))
                rows.append(row)
            self.patterns.append(rows)
        self.truncated = []
        for s in self.samples:
            raw = data[o:o + s["len"]]
            if len(raw) < s["len"]:
                self.truncated.append(s["name"])
            s["data"] = bytes(raw)
            o += s["len"]
        self.end = o


def write_wav(path, frames_bytes, rate, width=1, channels=1):
    w = wave.open(path, "wb")
    w.setnchannels(channels)
    w.setsampwidth(width)
    w.setframerate(rate)
    w.writeframes(frames_bytes)
    w.close()


def sample_to_wav(path, s8, rate=8287):
    """Signerad 8-bit (Amiga) -> osignerad 8-bit WAV, mono."""
    write_wav(path, bytes((b + 128) & 255 for b in s8), rate)


PAL = 7093789.2
PERIODS = [856, 808, 762, 720, 678, 640, 604, 570, 538, 508, 480, 453, 428, 404, 381, 360, 339, 320, 302, 285, 269, 254, 240, 226, 214, 202, 190, 180, 170, 160, 151, 143, 135, 127, 120, 113]


def render(mod, loops=1, rate=44100):
    """Enkel ProTracker-renderare (stereo, Paula-panorering LRRL, nearest-neighbour). Stodjer arpeggio, slides, portamento, vibrato-light,
    sampleoffset, volym, hastighet/tempo, mönsterbrytning/hopp. Returnerar (left, right) som listor av float."""
    speed, tempo = 6, 125
    ch = [{"smp": 0, "per": 0, "pos": 0.0, "vol": 0, "on": False, "tp": 0, "tps": 0, "arp": None, "off": 0} for _ in range(4)]
    L, R = [], []
    order_i, row_i = 0, 0
    played = 0
    visited = set()
    while played < loops and order_i < mod.songlen:
        pat = mod.patterns[mod.order[order_i]]
        row = pat[row_i]
        brk = None
        jmp = None
        for c in range(4):
            smp, per, eff, par = row[c]
            st = ch[c]
            if smp:
                st["smp"] = smp
                st["vol"] = mod.samples[smp - 1]["vol"]
            if per and eff != 3 and eff != 5:
                st["per"] = per
                st["pos"] = 0.0
                st["on"] = True
                if eff == 9:
                    st["pos"] = par * 256.0
            if per and (eff == 3 or eff == 5):
                st["tp"] = per
            if eff == 3 and par:
                st["tps"] = par
            st["eff"] = eff
            st["par"] = par
            if eff == 0xC:
                st["vol"] = min(64, par)
            if eff == 0xF:
                if par < 32:
                    speed = par or 1
                else:
                    tempo = par
            if eff == 0xD:
                brk = (par >> 4) * 10 + (par & 15)
            if eff == 0xB:
                jmp = par
        for tick in range(speed):
            n = int(rate * 2.5 / tempo)
            for c in range(4):
                st = ch[c]
                e, p = st.get("eff", 0), st.get("par", 0)
                if tick > 0:
                    if e == 1:
                        st["per"] = max(113, st["per"] - p)
                    elif e == 2:
                        st["per"] = min(856, st["per"] + p)
                    elif e == 3 or e == 5:
                        if st["tp"]:
                            if st["per"] < st["tp"]:
                                st["per"] = min(st["tp"], st["per"] + st["tps"])
                            else:
                                st["per"] = max(st["tp"], st["per"] - st["tps"])
                    elif e == 0xA:
                        st["vol"] = max(0, min(64, st["vol"] + (p >> 4) - (p & 15)))
            for i in range(n):
                l = r = 0.0
                for c in range(4):
                    st = ch[c]
                    if not st["on"] or st["smp"] == 0 or st["per"] == 0:
                        continue
                    sm = mod.samples[st["smp"] - 1]
                    d = sm["data"]
                    per = st["per"]
                    if st.get("eff", 0) == 0 and st.get("par", 0) and per:
                        idx = (tick % 3)
                        if idx:
                            semi = (st["par"] >> 4) if idx == 1 else (st["par"] & 15)
                            per = per / (2 ** (semi / 12.0))
                    if len(d) < 2:
                        continue
                    pos = int(st["pos"])
                    if sm["loop_len"] > 2:
                        end = sm["loop_start"] + sm["loop_len"]
                        if pos >= end:
                            st["pos"] = sm["loop_start"] + ((st["pos"] - sm["loop_start"]) % sm["loop_len"])
                            pos = int(st["pos"])
                    elif pos >= len(d):
                        st["on"] = False
                        continue
                    if pos >= len(d):
                        st["on"] = False
                        continue
                    b = d[pos]
                    v = (b - 256 if b > 127 else b) / 128.0 * (st["vol"] / 64.0)
                    st["pos"] += (PAL / 2.0 / per) / rate
                    if c in (0, 3):
                        l += v
                    else:
                        r += v
                L.append(l * 0.5)
                R.append(r * 0.5)
        if jmp is not None:
            order_i, row_i = jmp, 0
            played += 1
            continue
        if brk is not None:
            order_i += 1
            row_i = brk
        else:
            row_i += 1
        if row_i >= 64:
            row_i = 0
            order_i += 1
        if order_i >= mod.songlen:
            played += 1
            order_i = 0
            if loops > played:
                continue
    return L, R


def stereo16(L, R, gain=1.0):
    out = bytearray()
    for a, b in zip(L, R):
        a = int(max(-1, min(1, a * gain)) * 32767)
        b = int(max(-1, min(1, b * gain)) * 32767)
        out += struct.pack("<hh", a, b)
    return bytes(out)
