/// scr_wall_slide()
// Kors i obj_player nar skeppet efter sin rorelse skar en vagg (D-063). Ersatter den gamla "tillbaka och -v/4"-reaktionen som gjorde att skeppet fastnade:
//  - Vaggens normal (g_hw_w = vaggen som traffades, riktad mot skeppets sida) delar farten i en normaldel (in i vaggen) och en tangentdel (along vaggen).
//  - Normaldelen studsar tillbaka med en fjardedel (som originalets -v/4); tangentdelen BEHALLS men saktas ned: ju mer skeppets nos pekar mot vaggen,
//    desto mer (ft = 0,96 - 0,8 * lk, lk = 1 nar nosen pekar rakt in i vaggen). Skeppet glider alltsa langs vaggen och kan fortsatta aka.
//  - Skeppet flyttas tillbaka till forra platsen, svangningen behalls om den inte skar vaggen, sedan glider det tangentdelen (och trycks 0,5 px ut fran
//    vaggen); sitter skeppet redan i en vagg trycks det ut langs normalen. Gnistor vid kontaktpunkten: en stor small vid en ny kontakt, sma varje tick
//    det slapar mot vaggen. Skada (ej Galaxy Duel/Race): originalets formel pa normalfarten (+1 bara vid ny kontakt), sa att slapande ger ingen skada.
var wa, wb, wx1, wy1, wx2, wy2, dxw, dyw, wl, nx, ny, vn, vtx, vty, hx, hy, lk, ft, dmg, spd0, st, nsp, newc, cxw, cyw, sx, sy, k, hw;
hw = g_hw_w;
cxw = g_hw_cx;
cyw = g_hw_cy;
wa = g_wall_a[hw]; wb = g_wall_b[hw];
wx1 = g_wall_px[wa]; wy1 = g_wall_py[wa]; wx2 = g_wall_px[wb]; wy2 = g_wall_py[wb];
dxw = wx2 - wx1; dyw = wy2 - wy1;
wl = max(1, sqrt(dxw * dxw + dyw * dyw));
nx = -dyw / wl;
ny = dxw / wl;
if ((px / 256 - wx1) * nx + (py / 256 - wy1) * ny < 0) { nx = -nx; ny = -ny; }   // normalen pekar mot skeppets sida
vn = vx * nx + vy * ny;   // < 0 = in i vaggen
vtx = vx - vn * nx;
vty = vy - vn * ny;
spd0 = sqrt(vx * vx + vy * vy);
newc = (wall_c <= 0);
wall_c = 3;   // raknas som kontakt i tre ticks (ny kontakt = forsta tick efter fri flygning)
// skada (originalets formel pa normalfarten) och ljud
if (g_game_mode != 1 && g_game_mode != 2 && g_game_mode != 5)   // Super Smashwurst: ingen energi, vaggar skadar inte (D-085)
{
    dmg = floor(floor((vn * vn) / 65536) / 64);
    if (newc) { dmg += 1; }
    energy -= dmg;
}
if (newc && (abs(vx) > 1000 || abs(vy) > 1000)) { scr_sfx_play(snd_sfx_crash, 2, 1); }   // original: ljud bara om farten ligger utanfor +-1000 (0x5dc4)
if (newc) { scr_spark_burst(cxw, cyw, clamp(floor(spd0 / 120), 2, 40), 1.1 + min(2.2, spd0 / 3500), scr_slot_colour(slot)); }
// tillbaka till forra platsen; svangningen behalls om den inte skar vaggen
px = prev_px;
py = prev_py;
scr_player_outline();
if (scr_player_hits_wall())
{
    ang = prev_ang;
    scr_player_outline();
    if (scr_player_hits_wall())
    {
        // sitter redan i en vagg (t.ex. nuffad dit av ett annat skepp): tryck ut langs normalen
        for (k = 0; k < 8; k += 1)
        {
            px += nx * 256;
            py += ny * 256;
            scr_player_outline();
            if (!scr_player_hits_wall()) { break; }
        }
    }
}
// hur mycket nosen pekar mot vaggen (1 = rakt in) styr hur mycket tangentfarten saktas ned
hx = -g_psin[ang] / 160;
hy = g_pcos[ang] / 160;
lk = max(0, -(hx * nx + hy * ny));
if (vn < 0)
{
    ft = clamp(0.96 - 0.8 * lk, 0.05, 1);
    vx = round(vtx * ft + nx * (-vn) * 0.25);
    vy = round(vty * ft + ny * (-vn) * 0.25);
}
else { ft = 1; }
// glid tangentdelen i denna tick (och 0,5 px ut fran vaggen); fastnar det, forsok utan utskjutningen, annars stanna
sx = px;
sy = py;
px = sx + vtx * ft + nx * 128;
py = sy + vty * ft + ny * 128;
scr_player_outline();
if (scr_player_hits_wall())
{
    px = sx + vtx * ft;
    py = sy + vty * ft;
    scr_player_outline();
    if (scr_player_hits_wall())
    {
        px = sx;
        py = sy;
        scr_player_outline();
    }
}
// gnistor medan skeppet slapar mot vaggen (fler ju mer nosen pekar mot den och ju snabbare tangentfarten ar)
st = sqrt(vtx * vtx + vty * vty) * ft;
if (st > 300 && !newc)
{
    nsp = 1 + floor(st / 2500) + (lk > 0.6);
    scr_spark_burst(cxw, cyw, min(4, nsp), 0.9 + min(1.4, st / 4000), g_c[10]);
}
