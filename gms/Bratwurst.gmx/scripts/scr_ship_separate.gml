/// scr_ship_separate(player_a, player_b)
// Tar isar tva skepp som fortfarande overlappar efter scr_ship_bounce (t.ex. vid respawn pa varandra, rotation in i varandra eller nar de
// aterstalldes till en position som redan overlappade) sa att de inte fastnar. Skeppen skjuts ut at motsatta hall langs linjen mellan
// centrumen, 2 pixlar per varv (hogst 24 varv), och ett skepp som da skulle hamna i en vagg flyttas inte. Sist far de en liten
// isarsparande hastighet. NY FUNKTION (D-027), inte verifierad mot originalet.
var nx, ny, nlen, it, ia, ib, ux, uy, vn;
ia = argument0;
ib = argument1;
nx = ib.px - ia.px;
ny = ib.py - ia.py;
nlen = sqrt(nx * nx + ny * ny);
if (nlen < 1) { nx = 1; ny = 0; nlen = 1; }
nx = nx / nlen;
ny = ny / nlen;
for (it = 0; it < 24; it += 1)
{
    ux = round(nx * 512);
    uy = round(ny * 512);
    with (ia)
    {
        px -= ux; py -= uy;
        scr_player_outline();
        if (scr_player_hits_wall()) { px += ux; py += uy; scr_player_outline(); }
    }
    with (ib)
    {
        px += ux; py += uy;
        scr_player_outline();
        if (scr_player_hits_wall()) { px -= ux; py -= uy; scr_player_outline(); }
    }
    if (!scr_ships_overlap(ia, ib)) { break; }
}
// se till att de glider isar: relativ hastighet langs normalen minst 300 (1/256 px per tick)
vn = (ib.vx - ia.vx) * nx + (ib.vy - ia.vy) * ny;
if (vn < 300)
{
    ux = round(nx * (300 - vn) / 2);
    uy = round(ny * (300 - vn) / 2);
    ia.vx -= ux; ia.vy -= uy;
    ib.vx += ux; ib.vy += uy;
}
