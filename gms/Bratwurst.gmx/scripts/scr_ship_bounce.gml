/// scr_ship_bounce(player_a, player_b)
// Skepp mot skepp (NY FUNKTION, inte verifierad mot originalet; D-018, D-028). Bada skeppen aterstalls till forra tickens position (da de inte
// overlappade) och byter impuls, lika massor:
//   normalen ar linjen mellan centrumen; om skeppen mest glider mot varandra (narmande < 35 % av relativa farten) anvands i stallet den
//   relativa rorelseriktningen, sa att ett skepp som kor in i ett stillastaende alltid puttar det i korrekt riktning.
//   vn = narmandehastighet, j = max((1 + g_COL_REST) * vn / 2, 100), a -= j*n*ka, b += j*n*kb.
// Vridning: impulsen vid kontaktpunkten (scr_ship_contact) ger varje skepp en vridhastighet spin_v = (havarm x impuls) / 12000, hogst 3
// vinkelsteg per tick, som dar ut (scr_player_step). Ett skepp som nyligen anvant TURBO BOOST (boost_timer > 0) ger mostandaren en kraftigare
// knuff (g_COL_BOOST). Ingen skada tillfogas. Hastigheten begransas av g_COL_VMAX.
var nx, ny, nlen, vn, jv, ka, kb, sp, ia, ib, rvx, rvy, rl, cl, jx, jy, rax, ray, rbx, rby;
ia = argument0;
ib = argument1;
scr_ship_contact(ia, ib);
with (ia) { px = prev_px; py = prev_py; ang = prev_ang; scr_player_outline(); }
with (ib) { px = prev_px; py = prev_py; ang = prev_ang; scr_player_outline(); }
nx = ib.px - ia.px;
ny = ib.py - ia.py;
nlen = sqrt(nx * nx + ny * ny);
if (nlen < 1) { nx = 1; ny = 0; nlen = 1; }
nx = nx / nlen;
ny = ny / nlen;
rvx = ia.vx - ib.vx;
rvy = ia.vy - ib.vy;
rl = sqrt(rvx * rvx + rvy * rvy);
cl = rvx * nx + rvy * ny;
vn = cl;
if (rl >= 20 && cl < rl * 0.35)
{
    nx = rvx / rl;
    ny = rvy / rl;
    vn = rl;
}
if (vn > 0)
{
    ka = 1;
    kb = 1;
    if (ib.boost_timer > 0) { ka = g_COL_BOOST; }   // a traffas av boostande b
    if (ia.boost_timer > 0) { kb = g_COL_BOOST; }   // b traffas av boostande a
    jv = max(100, (1 + g_COL_REST) * vn / 2);
    jx = jv * nx;
    jy = jv * ny;
    ia.vx = round(ia.vx - jx * ka);
    ia.vy = round(ia.vy - jy * ka);
    ib.vx = round(ib.vx + jx * kb);
    ib.vy = round(ib.vy + jy * kb);
    sp = sqrt(ia.vx * ia.vx + ia.vy * ia.vy);
    if (sp > g_COL_VMAX) { ia.vx = round(ia.vx * g_COL_VMAX / sp); ia.vy = round(ia.vy * g_COL_VMAX / sp); }
    sp = sqrt(ib.vx * ib.vx + ib.vy * ib.vy);
    if (sp > g_COL_VMAX) { ib.vx = round(ib.vx * g_COL_VMAX / sp); ib.vy = round(ib.vy * g_COL_VMAX / sp); }
    // vridning: havarm (kontaktpunkt - centrum) x impuls; positivt = medurs (samma riktning som ang okar)
    rbx = g_ct_x - ib.px / 256;
    rby = g_ct_y - ib.py / 256;
    rax = g_ct_x - ia.px / 256;
    ray = g_ct_y - ia.py / 256;
    ib.spin_v += clamp((rbx * jy * kb - rby * jx * kb) / 12000, -3, 3);
    ia.spin_v += clamp((-rax * jy * ka + ray * jx * ka) / 12000, -3, 3);
    scr_sfx_play(snd_sfx_collide, 2, 1);   // original: samma ljudeffekt vid skepp mot skepp (0x5e14)
    scr_fx_spawn((ia.px + ib.px) / 2, (ia.py + ib.py) / 2, 3);
    // gnistor fran kontaktpunkten i bada skeppens farger; antal och fart okar med stotens styrka
    sp = 1.4 + min(2.4, vn / 2500);
    jv = 8 + clamp(floor(vn / 120), 0, 22);
    scr_spark_burst(floor(g_ct_x), floor(g_ct_y), jv, sp, scr_slot_colour(ia.slot));
    scr_spark_burst(floor(g_ct_x), floor(g_ct_y), jv, sp, scr_slot_colour(ib.slot));
}
