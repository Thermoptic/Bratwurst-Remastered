#!/usr/bin/env python3
"""Bygger en relokerad platt minnesavbild av Amiga-exen för Ghidra (läser bara originalet).
Eftersom exe:n är skadad (hunk 2/3 är 512 B kortare än deklarerat, docs/13) parsas hunkarna
med de faktiska HUNK_END-positionerna. Basadresser: h0 0x000000, h1 0x020000, h2 0x040000,
h3 0x070000, h4 0x090000, h5 0x0a0000 (BSS), h6 0x0a1000 (BSS).
Skriver <out>.bin, <out>_seeds.txt (kodpekare i hunk 0) och <out>_map.txt."""
import struct, sys
BASES = [0x000000, 0x020000, 0x040000, 0x070000, 0x090000, 0x0a0000, 0x0a1000]
d = open(sys.argv[1], 'rb').read()
u = lambda o: struct.unpack('>I', d[o:o+4])[0]
# header
o = 4
while u(o) != 0: o += 4 + 4 * u(o)
o += 4
n = u(o); o += 12 + 4 * n
hunks = [dict(data=b'', relocs=[], bss=0) for _ in range(n)]
h = 0
actual_end = {2: 236144, 3: 308848}       # verifierade HUNK_END-positioner (docs/13)
while h < n and o < len(d):
    t = u(o) & 0x3fffffff; o += 4
    if t in (0x3e9, 0x3ea):
        sz = u(o) * 4; start = o + 4
        if h in actual_end:               # skadade hunkar: använd faktisk längd
            sz = actual_end[h] - start
        hunks[h]['data'] = d[start:start + sz]; o = start + sz
    elif t == 0x3eb: hunks[h]['bss'] = u(o) * 4; o += 4
    elif t == 0x3ec:
        while u(o) != 0:
            c, tg = u(o), u(o + 4); o += 8
            hunks[h]['relocs'] += [(tg, u(o + 4 * i)) for i in range(c)]; o += 4 * c
        o += 4
    elif t == 0x3f2: h += 1
    else: raise SystemExit('unknown hunk id %x at %x' % (t, o))
size = BASES[6] + 229376
img = bytearray(size)
for i, hk in enumerate(hunks):
    img[BASES[i]:BASES[i] + len(hk['data'])] = hk['data']
seeds = {}
for i, hk in enumerate(hunks):
    for tg, off in hk['relocs']:
        a = BASES[i] + off
        v = struct.unpack('>I', img[a:a+4])[0]
        img[a:a+4] = struct.pack('>I', (v + BASES[tg]) & 0xffffffff)
        if tg == 0:
            opw = struct.unpack('>H', img[a-2:a])[0] if off >= 2 else 0
            kind = 'jsr' if opw in (0x4eb9, 0x4ef9) else ('pea' if opw == 0x4879 else ('lea' if opw & 0xf1ff == 0x41f9 else ('data' if i != 0 else 'other')))
            seeds.setdefault(v, set()).add((i, kind))
open(sys.argv[2] + '.bin', 'wb').write(img)
with open(sys.argv[2] + '_seeds.txt', 'w') as f:
    for v in sorted(seeds):
        f.write('%#x %s\n' % (v, ','.join(sorted('%d:%s' % k for k in seeds[v]))))
with open(sys.argv[2] + '_map.txt', 'w') as f:
    for i, hk in enumerate(hunks):
        f.write('hunk %d base %#x data %d bss %d relocs %d\n' % (i, BASES[i], len(hk['data']), hk['bss'], len(hk['relocs'])))
print(open(sys.argv[2] + '_map.txt').read())
