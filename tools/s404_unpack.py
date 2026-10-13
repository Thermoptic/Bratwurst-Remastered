#!/usr/bin/env python3
"""Packar upp StoneCracker 4.10 ('S404', "generation 8") ur en buffert.
Port av algoritmen i temisu/ancient (src/StoneCrackerDecompressor.cpp, BSD-liknande licens) för analys.
Användning: s404_unpack.py <in.bin> <offset> <out.bin>   (läser bara in-filen)
"""
import struct, sys

class Err(Exception): pass

def unpack(buf, off):
    if buf[off:off+4] != b'S404': raise Err('no S404')
    raw = struct.unpack('>I', buf[off+8:off+12])[0]
    packed = struct.unpack('>I', buf[off+12:off+16])[0] + 2 + 16
    data = buf[off:off+packed]
    cur = packed - 2           # backward input pointer
    lo = 16
    def rd16():
        nonlocal cur
        if cur - 2 < lo: raise Err('input underrun')
        cur -= 2
        return (data[cur] << 8) | data[cur+1]
    bitcount = ((data[packed-2] << 8) | data[packed-1]) & 15
    val = rd16()
    bl = bitcount; bc = val >> (16 - bitcount) if bitcount else 0
    mode = rd16()
    if mode < 10 or mode > 14: raise Err('bad mode %d' % mode)
    state = [bc, bl]
    def bits(n):
        ret = 0
        while n:
            if state[1] == 0:
                state[0] = rd16(); state[1] = 16
            m = min(n, state[1])
            state[1] -= m
            ret = (ret << m) | ((state[0] >> state[1]) & ((1 << m) - 1))
            n -= m
        return ret
    def bit(): return bits(1)
    def vlc(args):
        bl_, offs = [], []; length = 0
        for a in args:
            if a < 0: offs.append(0); length = 1 << -a; bl_.append(-a)
            else: offs.append(length); length += 1 << a; bl_.append(a)
        return bl_, offs
    cb, co = vlc([0,1,2,3,2,1,0,8,-3,2,0,5])
    db, do = vlc([5,9,mode])
    def vdec(b, o, base):
        if base >= len(b): raise Err('vlc base')
        return o[base] + bits(b[base])
    ccodes = {(1,0b0):0x80,(2,0b11):1,(3,0b101):2,(4,0b1000):7,(5,0b10010):3,(6,0b100110):4,(7,0b1001110):5,(8,0b10011110):6,(8,0b10011111):0x8b}
    dcodes = {(1,0b1):2,(2,0b00):1,(2,0b01):0}
    def huff(codes):
        c = 0; l = 0
        while True:
            c = (c << 1) | bit(); l += 1
            if (l, c) in codes: return codes[(l, c)]
            if l > 8: raise Err('huffman')
    out = bytearray(raw)
    pos = raw                      # writes backwards
    while pos > 0:
        ci = huff(ccodes)
        count = vdec(cb, co, ci & 0x7f) + 1
        if count == 278:
            while True:
                t = bits(8); count += t
                if t != 0xff: break
        if ci & 0x80:
            for _ in range(count):
                if pos <= 0: raise Err('output overrun')
                pos -= 1; out[pos] = bits(8)
        else:
            dist = vdec(db, do, huff(dcodes)) + 1
            if dist + pos > raw or count > pos: raise Err('bad copy')
            for _ in range(count):
                pos -= 1; out[pos] = out[pos + dist]
    return bytes(out)

if __name__ == '__main__':
    b = open(sys.argv[1], 'rb').read()
    r = unpack(b, int(sys.argv[2], 0))
    open(sys.argv[3], 'wb').write(r)
    print('unpacked', len(r), 'bytes')
