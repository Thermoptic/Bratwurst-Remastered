#!/usr/bin/env python3
"""Headless Python-spegling av prototypens GML-logik (gms/Bratwurst.gmx/scripts) for rimlighetskontroll.
Testar INTE GML-syntax -- bara att formler/tecken/siffror ger rimligt beteende. Anvands i docs/08-testerna PHY/CAM."""
import json, math, os, struct, sys
root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ships = json.load(open(os.path.join(root, 'analysis', 'ships_raw.json')))
arena = json.load(open(os.path.join(root, 'analysis', 'arena_walls.json')))
flat = open(sys.argv[1], 'rb').read()
SIN = struct.unpack('>256h', flat[0x99238:0x99238 + 512]); COS = struct.unpack('>256h', flat[0x99438:0x99438 + 512])
fl = math.floor
PSIN = [fl(v * 20 / 32) for v in SIN]; PCOS = [fl(v * 20 / 32) for v in COS]   # fysiktabeller (hunk0 0x3414)
GRAV = fl(50 * 20 / 32)

class P:
    def __init__(s, ship, slot):
        sh = ships[ship]; s.sh = sh; p = sh['params']
        s.drag, s.thrust, s.reload_val, s.emax, s.tinit, s.tmax, s.tacc, s.shift = p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]
        s.px = [-300000, 300000, -300000, 300000][slot]; s.py = [-270000, -270000, 270000, 270000][slot]
        s.ang = [96, 160, 64, 192][slot]; s.vx = s.vy = 0; s.w = s.tinit
    def step(s, left=False, right=False, thrust=False):
        t = False
        if left: t = True; s.ang -= s.w; s.w += s.tacc
        if right: t = True; s.ang += s.w; s.w += s.tacc
        s.ang %= 256
        if not t: s.w = s.tinit
        s.w = min(s.w, s.tmax)
        if thrust:
            s.vx -= fl(PSIN[s.ang] * s.thrust / 8); s.vy += fl(PCOS[s.ang] * s.thrust / 8)
        ax, ay = s.vx, s.vy + GRAV
        s.vx = ax - fl(ax * s.drag / 256); s.vy = ay - fl(ay * s.drag / 256)
        s.px += s.vx; s.py += s.vy

def zoom(ps):
    xs = [fl(p.px / 256) for p in ps]; ys = [fl(p.py / 256) for p in ps]
    zx = min(65535, fl(9830400 / (max(xs) - min(xs) + 400))); zy = min(65535, fl(7077888 / (max(ys) - min(ys) + 400)))
    return min(zx, zy)

if __name__ == '__main__':
    p = P(14, 0)   # XWing, P1
    print('XWing params drag/thrust/reload/energy/turn init,max,acc/shift:', p.drag, p.thrust, p.reload_val, p.emax, p.tinit, p.tmax, p.tacc, p.shift)
    # 1) fritt fall utan thrust: gravitation mot terminalhastighet
    q = P(14, 0)
    for i in range(500): q.step()
    print('fritt fall 500 ticks: vy=%d (%.2f px/tick), terminal ~ %.2f px/tick' % (q.vy, q.vy / 256, GRAV * 256 / q.drag / 256))
    # 2) thrust i nosens riktning: startvinkel 96 -> nos (-sin, +cos)
    q = P(14, 0); x0, y0 = q.px, q.py
    for i in range(50): q.step(thrust=True)
    print('50 ticks thrust fran start (ang 96): dx=%.1f px, dy=%.1f px  (nos-riktning = (-sin,+cos) = (%.2f,%.2f))' % ((q.px - x0) / 256, (q.py - y0) / 256, -SIN[96] / 256, COS[96] / 256))
    # 3) svang: varv-tid
    q = P(14, 0); a = q.ang; n = 0
    while True:
        q.step(right=True); n += 1
        if n > 5 and abs(((q.ang - a + 128) % 256) - 128) < 8 and n > 20: break
        if n > 2000: break
    print('1 varv hoger (ungefar): %d ticks' % n)
    # 4) zoom
    ps = [P(14, 0)]; print('zoom 1 spelare vid start:', zoom(ps))
    ps = [P(14, 0), P(12, 1)]; print('zoom P1+P2 vid start (dx=%d px, dy=%d px): %d' % (fl(600000 / 256), 0, zoom(ps)))
    ps = [P(14, 0), P(12, 3)]; print('zoom P1+P4 (diagonal): %d' % zoom(ps))
    print('skarmskala varld->skarm vid Z=17694: 1 varldspixel = %.3f skarmpixel' % (17694 / 32768))
