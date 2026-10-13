#!/usr/bin/env python3
"""Genererar GML-datascript (GMS 1.4) ur analysresultaten.

Indata:  analysis/ships_raw.json (tools/sob_dump.py), analysis/arena_walls.json,
         original-exens hunk 4 via relokerad avbild (sin/cos-tabeller) -- läses endast.
Utdata:  gms/Bratwurst.gmx/scripts/scr_data_*.gml   (HÄRLEDDA ur originalet: privata, publicera ej, se docs/09)

Användning: python tools/gen_gms_data.py <flat_image.bin>   (flat_image från tools/build_flat_image.py)
"""
import json, os, struct, sys

root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
out = os.path.join(root, 'gms', 'Bratwurst.gmx', 'scripts')
os.makedirs(out, exist_ok=True)
flat = open(sys.argv[1], 'rb').read()
ships = json.load(open(os.path.join(root, 'analysis', 'ships_raw.json')))
arena = json.load(open(os.path.join(root, 'analysis', 'arena_walls.json')))

def w(name, lines):
    text = '\n'.join(lines) + '\n'
    text = text.translate(str.maketrans('åäöÅÄÖ', 'aaoAAO'))      # ASCII-only GML (GMS 1.4-kodning)
    with open(os.path.join(out, name + '.gml'), 'w', newline='\r\n', encoding='ascii') as f:
        f.write(text)

# --- trig tables (hunk 4 +0x9238 sin, +0x9438 cos; 256 signed words, amplitude 256) -------------
sin = struct.unpack('>256h', flat[0x99238:0x99238 + 512])
cos = struct.unpack('>256h', flat[0x99438:0x99438 + 512])
L = ['/// scr_data_trig()',
     '// GENERERAD av tools/gen_gms_data.py. Sin/cos-tabeller ur originalets hunk 4 (+0x9238/+0x9438).',
     '// 256 steg per varv, amplitud 256 (VERIFIERAD, docs/15). Härledd data: privat.']
for i in range(256):
    L.append('g_sin_tab[%d] = %d;' % (i, sin[i]))
for i in range(256):
    L.append('g_cos_tab[%d] = %d;' % (i, cos[i]))
# fysiktabeller: (v*20)>>5 (aritmetiskt skift = golv), originalets startrutin hunk0 0x3414 (VERIFIERAD)
for i in range(256):
    L.append('g_psin[%d] = %d;' % (i, (sin[i] * 20) // 32))
for i in range(256):
    L.append('g_pcos[%d] = %d;' % (i, (cos[i] * 20) // 32))
w('scr_data_trig', L)

# --- arena -------------------------------------------------------------------------------------
L = ['/// scr_data_arena()',
     '// GENERERAD av tools/gen_gms_data.py. Banans vektorväggar (68 punkter/linjer, hunk 4 +0x8f08/+0x9018).',
     '// Koordinater i originalets världspixlar (signerade). Härledd data: privat.']
L.append('g_wall_n = %d;' % len(arena['lines']))
for i, (x, y) in enumerate(arena['points']):
    L.append('g_wall_px[%d] = %d; g_wall_py[%d] = %d;' % (i, x, i, y))
for i, (a, b) in enumerate(arena['lines']):
    L.append('g_wall_a[%d] = %d; g_wall_b[%d] = %d;' % (i, a, i, b))
for i, (a, b) in enumerate(arena['lines']):
    xa, ya = arena['points'][a]; xb, yb = arena['points'][b]
    L.append('g_wall_minx[%d] = %d; g_wall_maxx[%d] = %d; g_wall_miny[%d] = %d; g_wall_maxy[%d] = %d;'
             % (i, min(xa, xb), i, max(xa, xb), i, min(ya, yb), i, max(ya, yb)))
w('scr_data_arena', L)

# --- ships -------------------------------------------------------------------------------------
L = ['/// scr_data_ships()',
     '// GENERERAD av tools/gen_gms_data.py ur .SOB-filerna (docs/06). Härledd data: privat.',
     '// ship_pts[i,2*j], ship_pts[i,2*j+1]  = punkt j (x,y) i skeppskoordinater (y negativt = nos)',
     '// ship_lines[i,2*k], [i,2*k+1]         = linje k (punktindex a,b)',
     '// ship_pods[i,2*p], [i,2*p+1]          = pod p (x,y);  ship_pod_ang[i,p] = vinkel i 1/256 varv (grader*256/360)',
     '// ship_pod_flag[i,p]                   = 0 ej valbar specialpod, annars valbar',
     '// ship_par[i,k]                        = P0..P10 (se docs/06: DRAG,THRUST,RELOAD,ENERGY?,TURN_INIT,TURN_MAX,TURN_ACCEL,SHOT_SHIFT,BOUNCE,CANNON_AMMO?,SPECIAL_AMMO?)',
     '// ship_weapon[i,t]                     = 1 om specialvapen t (1..5) valbart']
L.append('g_ship_count = %d;' % len(ships))
for i, s in enumerate(ships):
    name = os.path.splitext(s['file'])[0]
    L.append('g_ship_name[%d] = "%s"; g_ship_np[%d] = %d; g_ship_nl[%d] = %d; g_ship_nk[%d] = %d;'
             % (i, name, i, s['points'], i, s['lines'], i, s['pods_n']))
    for j, (x, y) in enumerate(s['pts']):
        L.append('g_ship_pts[%d,%d] = %d; g_ship_pts[%d,%d] = %d;' % (i, 2 * j, x, i, 2 * j + 1, y))
    for k, (a, b) in enumerate(s['line_idx']):
        L.append('g_ship_lines[%d,%d] = %d; g_ship_lines[%d,%d] = %d;' % (i, 2 * k, a, i, 2 * k + 1, b))
    for p, (x, y) in enumerate(s['pods']):
        ang = (s['pod_angle'][p] * 256) // 360
        L.append('g_ship_pods[%d,%d] = %d; g_ship_pods[%d,%d] = %d; g_ship_pod_ang[%d,%d] = %d; g_ship_pod_flag[%d,%d] = %d;'
                 % (i, 2 * p, x, i, 2 * p + 1, y, i, p, ang, i, p, s['pod_flags'][p]))
    for k in range(11):
        L.append('g_ship_par[%d,%d] = %d;' % (i, k, s['params'][k]))
    for t in range(1, 6):
        L.append('g_ship_weapon[%d,%d] = %d;' % (i, t, 1 if t - 1 < len(['x'] * 5) and any(wn == ['MISSILE', 'GUIDED MISSILE', 'TURBO BOOST', 'TRACTOR BEAM', 'CANNON TURRET'][t - 1] for wn in s['weapons']) else 0))
w('scr_data_ships', L)
print('wrote scr_data_trig, scr_data_arena, scr_data_ships ->', out)
