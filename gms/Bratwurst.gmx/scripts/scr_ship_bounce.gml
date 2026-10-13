/// scr_ship_bounce(player_a, player_b)

// Skepp mot skepp (NY FUNKTION, inte verifierad mot originalet; D-018). Bada skeppen aterstalls till forra tickens position (da de inte overlappade)

// och byter impuls langs linjen mellan dem, lika massor:

//   vn = narmandehastighet langs normalen, j = (1 + g_COL_REST) * vn / 2, a -= j*n*ka, b += j*n*kb.

// Ett skepp som star stilla puttas saledes ivag med ungefar sin motparts fart; ett skepp som nyligen anvant TURBO BOOST (boost_timer > 0)

// ger mostandaren en kraftigare knuff (g_COL_BOOST). Ingen skada tillfogas (kan laggas till). Hastigheten begransas av g_COL_VMAX.

var nx, ny, nlen, vn, jv, ka, kb, sp, ia, ib;

ia = argument0;

ib = argument1;

with (ia) { px = prev_px; py = prev_py; ang = prev_ang; scr_player_outline(); }

with (ib) { px = prev_px; py = prev_py; ang = prev_ang; scr_player_outline(); }

nx = ib.px - ia.px;

ny = ib.py - ia.py;

nlen = sqrt(nx * nx + ny * ny);

if (nlen < 1) { nx = 1; ny = 0; nlen = 1; }

nx = nx / nlen;

ny = ny / nlen;

vn = (ia.vx - ib.vx) * nx + (ia.vy - ib.vy) * ny;

if (vn > 0)

{

    ka = 1;

    kb = 1;

    if (ib.boost_timer > 0) { ka = g_COL_BOOST; }   // a traffas av boostande b

    if (ia.boost_timer > 0) { kb = g_COL_BOOST; }   // b traffas av boostande a

    jv = (1 + g_COL_REST) * vn / 2;

    ia.vx = round(ia.vx - jv * nx * ka);

    ia.vy = round(ia.vy - jv * ny * ka);

    ib.vx = round(ib.vx + jv * nx * kb);

    ib.vy = round(ib.vy + jv * ny * kb);

    sp = sqrt(ia.vx * ia.vx + ia.vy * ia.vy);

    if (sp > g_COL_VMAX) { ia.vx = round(ia.vx * g_COL_VMAX / sp); ia.vy = round(ia.vy * g_COL_VMAX / sp); }

    sp = sqrt(ib.vx * ib.vx + ib.vy * ib.vy);

    if (sp > g_COL_VMAX) { ib.vx = round(ib.vx * g_COL_VMAX / sp); ib.vy = round(ib.vy * g_COL_VMAX / sp); }

    scr_sfx_play(snd_sfx_collide, 2, 1);   // original: samma ljudeffekt vid skepp mot skepp (0x5e14)
    scr_fx_spawn((ia.px + ib.px) / 2, (ia.py + ib.py) / 2, 3);

}

