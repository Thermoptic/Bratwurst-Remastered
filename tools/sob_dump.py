#!/usr/bin/env python3
"""Read-only analysis tool for Bratwurst .SOB ship files (see docs/13_SOB_FORMAT_FINDINGS.md).

Usage:  python tools/sob_dump.py <shipbay-dir> [--json out.json] [--svg out.svg]

Opens every original file read-only. NEVER writes next to / into original/.
Layout status: VERIFIED structurally against all 15 files (size formula, index ranges,
mirror symmetry); semantics of the 'params' block are still UNKNOWN.
"""
import glob, json, os, struct, sys

def s16(x): return x - 65536 if x >= 32768 else x

WEAPONS = ['MISSILE', 'GUIDED MISSILE', 'TURBO BOOST', 'TRACTOR BEAM', 'CANNON TURRET']
# P0..P10 copied by the game's own loader (0x11f3e) to the ship struct and then to player variables (0x3498).
PARAM_NAMES = ['DRAG', 'THRUST', 'RELOAD', 'ENERGY?', 'TURN_INIT', 'TURN_MAX', 'TURN_ACCEL', 'SHOT_SHIFT', 'BOUNCE', 'CANNON_AMMO?', 'SPECIAL_AMMO_BASE?']

def parse(path):
    d = open(path, 'rb').read()
    if d[:8] != b'Shobject':
        raise ValueError('bad magic: %s' % path)
    if (len(d) - 8) % 2:
        raise ValueError('odd length: %s' % path)
    w = struct.unpack('>%dH' % ((len(d) - 8) // 2), d[8:])
    n, m, k = w[0], w[1], w[2]
    expect = 3 + (2 * n + 4) + 2 * m + (27 + 4 * k) + 2 * n + 2 * k
    if expect != len(w):
        raise ValueError('size formula mismatch: %s (%d != %d)' % (path, expect, len(w)))
    p = 3
    scr_extra = list(w[p:p + 4])                                         # VERIFIED position (loader skips 4 words first); meaning UNKNOWN
    screen_pts = [(w[p + 4 + 2 * i], w[p + 5 + 2 * i]) for i in range(n)]  # ship-preview/screen cache; skipped by the game's loader
    p += 2 * n + 4
    lines = [(w[p + 2 * i], w[p + 2 * i + 1]) for i in range(m)]
    for a, b in lines:
        if a >= n or b >= n:
            raise ValueError('line index out of range: %s' % path)
    p += 2 * m
    blk = w[p:p + 27 + 4 * k]
    pod_screen = [(blk[2 * i], blk[2 * i + 1]) for i in range(k)]        # SANNOLIK: same screen cache for pods
    q = 2 * k
    pod_angle = [s16(v) for v in blk[q:q + k]]                           # VERIFIED (code 0x134aa): degrees, converted *256/360 to 1/256 turn
    q += k
    pod_flags = [s16(v) for v in blk[q:q + k]]                           # 0 = not selectable for special weapon (code 0x12578); 1/2 = selectable, difference UNKNOWN
    q += k
    params = [s16(v) for v in blk[q:]]                                   # 27 words, see PARAM_NAMES
    wbytes = b''.join(struct.pack('>H', v & 0xffff) for v in blk[q + 11:])
    weapons = [WEAPONS[i] for i in range(5) if wbytes[i]]                # code 0x12444: tst.b (-1,A0,type)
    p += 27 + 4 * k
    pts = [(s16(w[p + 2 * i]), s16(w[p + 2 * i + 1])) for i in range(n)]
    p += 2 * n
    pods = [(s16(w[p + 2 * i]), s16(w[p + 2 * i + 1])) for i in range(k)]
    assert p + 2 * k == len(w)
    return dict(file=os.path.basename(path), size=len(d), points=n, lines=m, pods_n=k,
                pts=pts, line_idx=lines, pods=pods, pod_angle=pod_angle, pod_flags=pod_flags,
                params=params, weapons=weapons, selectable_pods=sum(1 for f in pod_flags if f), screen_pts=screen_pts, screen_extra=scr_extra, pod_screen=pod_screen)

def svg_sheet(ships):
    cols = 5; cell = 360
    rows = (len(ships) + cols - 1) // cols
    out = ['<svg xmlns="http://www.w3.org/2000/svg" width="%d" height="%d" style="background:#000">' % (cols * cell, rows * cell)]
    for i, sh in enumerate(ships):
        ox = (i % cols) * cell + cell // 2
        oy = (i // cols) * cell + cell // 2 + 10
        sc = 0.55
        out.append('<text x="%d" y="%d" fill="#8f8" font-size="14" font-family="monospace">%s</text>' % (ox - cell // 2 + 6, oy - cell // 2 + 18, sh['file']))
        for a, b in sh['line_idx']:
            (x1, y1), (x2, y2) = sh['pts'][a], sh['pts'][b]
            out.append('<line x1="%.1f" y1="%.1f" x2="%.1f" y2="%.1f" stroke="#fff" stroke-width="1.5"/>' % (ox + x1 * sc, oy + y1 * sc, ox + x2 * sc, oy + y2 * sc))
        for j, (x, y) in enumerate(sh['pods']):
            out.append('<circle cx="%.1f" cy="%.1f" r="4" fill="none" stroke="#f55"/><text x="%.1f" y="%.1f" fill="#f99" font-size="10">%d</text>' % (ox + x * sc, oy + y * sc, ox + x * sc + 6, oy + y * sc, j))
    out.append('</svg>')
    return '\n'.join(out)

if __name__ == '__main__':
    d = sys.argv[1]
    files = sorted(glob.glob(os.path.join(d, '*')), key=lambda f: os.path.basename(f).lower())
    ships = [parse(f) for f in files]
    print('parsed %d files OK' % len(ships))
    for sh in ships:
        print('%-15s %4dB pts=%2d lines=%2d pods=%d angles=%s params[0:11]=%s sel_pods=%d weapons=%s' % (sh['file'], sh['size'], sh['points'], sh['lines'], sh['pods_n'], sh['pod_angle'], sh['params'][:11], sh['selectable_pods'], sh['weapons']))
    if '--json' in sys.argv:
        json.dump(ships, open(sys.argv[sys.argv.index('--json') + 1], 'w'), indent=1)
    if '--svg' in sys.argv:
        open(sys.argv[sys.argv.index('--svg') + 1], 'w').write(svg_sheet(ships))
