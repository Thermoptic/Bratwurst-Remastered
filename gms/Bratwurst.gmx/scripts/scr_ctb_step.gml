/// scr_ctb_step()
// Capture the Bratwurst (D-082): en matchtick i laget (g_game_mode == 3), kors i scr_game_step efter spelare, skott, missiler och stralar (sa att en dod hunnit slappa korven).
// Ordning: rundtimern; faserna efter en leverans (1 = "TEAM SCORES!" 3 s, 2 = nedrakning 3-0, sedan aterskapas korven); korven: spawn-animation, fri korv (fysik och upplockning),
// buren korv (efterslapning, barform, leverans). Alla tider i ticks, 50 per sekund (som resten av spelet). Koordinater: varldspixlar (skeppets px / 256).
var i, c, cx, cy, ox, oy, nx, ny, d, n, t, wx, wy, hit, z, tgx, tgy, sp;
// 1) rundtimern: gar aven under poangpresentationen och nedrakningen (D-081, svar 4)
g_ct_t -= 1;
if (g_ct_t <= 0) { scr_ctb_round_end(); exit; }
if (g_ct_zero > 0) { g_ct_zero -= 1; }
// 2) faserna efter en leverans: skeppen far flyga och skjuta, men korven finns inte, sa ingen kan plocka upp eller poangsatta
if (g_ct_phase == 1)
{
    g_ct_pt -= 1;
    if (g_ct_pt <= 0)
    {
        if (g_ct_lim) { scr_ctb_round_end(); exit; }   // poanggransen nadd: rundan slutar efter meddelandet
        g_ct_phase = 2;
        g_ct_pt = 150;
    }
    exit;
}
if (g_ct_phase == 2)
{
    if ((g_ct_pt mod 50) == 0) { scr_sfx_play(snd_sfx_countdown, 2, 1); }   // ett ljud for 3, 2 och 1
    g_ct_pt -= 1;
    if (g_ct_pt <= 0)
    {
        scr_ctb_spawn();
        g_ct_phase = 0;
        g_ct_zero = 25;   // "0" visas en halv sekund medan korven vaxer fram
        scr_sfx_play(snd_sfx_countdown, 2, 1);
    }
    exit;
}
// 3) korven
if (g_sa_st == 3) { exit; }
// snurran: snabb vid spawn, extra snabb i 1 s efter att baeraren skadats, annars ett varv per 4 s (256 steg per varv)
if (g_sa_st == 0) { sp = 15.36; }
else if (g_sa_spin > 0) { sp = 10.24; }
else { sp = 1.28; }
if (g_sa_spin > 0) { g_sa_spin -= 1; }
g_sa_ang = (g_sa_ang + sp) mod 256;
if (g_sa_st == 0)
{
    g_sa_t += 1;
    if (g_sa_t >= 50) { g_sa_st = 1; }
    exit;
}
if (g_sa_st == 1)
{
    // fri korv: glider vidare med sin fart, bromsas av friktion och studsar mot vaggar (D-081, svar 1)
    ox = g_sa_x;
    oy = g_sa_y;
    nx = ox + g_sa_vx;
    ny = oy + g_sa_vy;
    if (scr_seg_hits_wall(ox, oy, nx, oy, 2)) { g_sa_vx = -g_sa_vx * g_CT_BOUNCE; nx = ox; }
    if (scr_seg_hits_wall(nx, oy, nx, ny, 2)) { g_sa_vy = -g_sa_vy * g_CT_BOUNCE; ny = oy; }
    g_sa_x = nx;
    g_sa_y = ny;
    g_sa_vx *= g_CT_FRIC;
    g_sa_vy *= g_CT_FRIC;
    if (abs(g_sa_vx) + abs(g_sa_vy) < 0.05) { g_sa_vx = 0; g_sa_vy = 0; }
    // upplockning: det forsta levande skeppet (lagsta spelarplats vinner om flera ar lika nara) vars mitt ligger inom g_CT_PICK fran korven (D-081, svar 2)
    for (i = 0; i < g_n_players; i += 1)
    {
        c = scr_ctb_find(i);
        if (c != noone)
        {
            if (point_distance(c.px / 256, c.py / 256, g_sa_x, g_sa_y) <= g_CT_PICK)
            {
                g_sa_st = 2;
                g_sa_car = i;
                g_sa_spin = 0;
                break;
            }
        }
    }
    exit;
}
if (g_sa_st == 2)
{
    c = scr_ctb_find(g_sa_car);
    if (c == noone)
    {
        // baeraren finns inte langre (borttagen eller forstord): korven slapps och behaller sin fart
        g_sa_st = 1;
        g_sa_car = -1;
        exit;
    }
    cx = c.px / 256;
    cy = c.py / 256;
    // mjuk efterslapning (D-081, svar 3): malpunkten ligger g_CT_TRAIL varldspixlar rakt bakom skeppets nos; korven dras mot den en andel per tick
    tgx = cx + g_sin_tab[c.ang] / 256 * g_CT_TRAIL;
    tgy = cy - g_cos_tab[c.ang] / 256 * g_CT_TRAIL;
    ox = g_sa_x;
    oy = g_sa_y;
    nx = ox + (tgx - ox) * g_CT_FOLLOW;
    ny = oy + (tgy - oy) * g_CT_FOLLOW;
    g_sa_vx = nx - ox;   // korvens egen fart, bevaras om baeraren dor (scr_ctb_death)
    g_sa_vy = ny - oy;
    g_sa_x = nx;
    g_sa_y = ny;
    g_ct_carry[g_sa_car] += 1;   // barform: bara for den enda baeraren, bara medan korven bars
    // leverans: baeraren inne i det motsatta lagets zon (rod baerare -> bla zon). Rorelsen sedan forra tickens position provas i steg om hogst 20 pixlar sa att snabba skepp
    // inte kan flyga igenom zonen utan att registreras. Zonerna ar inte solida; den egna zonen ger aldrig poang.
    z = 1 - scr_team_of(g_sa_car);
    if (g_ctz_on[z])
    {
        ox = c.prev_px / 256;
        oy = c.prev_py / 256;
        d = point_distance(ox, oy, cx, cy);
        n = max(1, ceil(d / 20));
        hit = false;
        for (i = 0; i <= n; i += 1)
        {
            t = i / n;
            wx = ox + (cx - ox) * t;
            wy = oy + (cy - oy) * t;
            if (wx >= g_ctz_x0[z] && wx <= g_ctz_x1[z] && wy >= g_ctz_y0[z] && wy <= g_ctz_y1[z]) { hit = true; break; }
        }
        if (hit) { scr_ctb_score(scr_team_of(g_sa_car)); }
    }
}
