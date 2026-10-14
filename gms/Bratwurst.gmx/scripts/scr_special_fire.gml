/// scr_special_fire()
// Kors i obj_player, en tick. Foljer originalets specialvapenrutin (hunk0 0x17d8-0x183c + 0x6bce, docs/15 steg 5):
//   nedrakning -1 per tick; nar den ar <= 0 och knappen hallen och ammo > 0: ammo -1 (ocksa om vapnet inte traffar),
//   vapnet utfors fran den valda podden i riktning (vinkel + podvinkel), nedrakning = vapnets varde.
// Hastigheter anvander de SKALADE fysiktabellerna g_psin/g_pcos (amplitud 160).
// NOTHING (typ 0) gor ingenting (originalet drar ammo utan effekt; avvikelse).
var p, a, t, m, ang_f, dxt, dyt, aim, dd, sh;
if (sp_cool > 0) { sp_cool -= 1; }
if (!in_special) { exit; }
if (sp_cool > 0 || sp_ammo <= 0 || sp_wtype == 0 || sp_nsel <= 0) { exit; }

p = sp_sel[sp_pod_i];
a = (ang + g_ship_pod_ang[ship, p]) mod 256;
t = sp_wtype;
sp_ammo -= 1;
sp_cool = g_wcool[t];

if (t == 1 || t == 2)
{
    // MISSILE / GUIDED MISSILE: objekt, max 16 samtidiga (kod 0x6bce)
    if (instance_number(obj_missile) < 16)
    {
        m = instance_create(0, 0, obj_missile);
        m.mtype = t;
        m.owner = slot;
        m.px = pod_wx[p];
        m.py = pod_wy[p];
        scr_boost_vel(-g_psin[a] * (32 + 32 * (g_game_mode == 1)), g_pcos[a] * (32 + 32 * (g_game_mode == 1)));   // Astro Duel: missilen gar dubbelt sa fort; + skeppets fart framat (D-042)
        m.vx = vx * g_SHOT_INHERIT + g_bv_x;
        m.vy = vy * g_SHOT_INHERIT + g_bv_y;
        if (t == 1) { m.mtimer = 50; scr_sfx_play(snd_sfx_missile, 1, 1); } else { m.mtimer = -25; scr_sfx_play(snd_sfx_guided, 1, 1); }
    }
}
if (t == 3)
{
    // TURBO BOOST: ogonblicklig impuls mot ruckets riktning, v += (sin, -cos) << 6 (kod 0x6c76)
    boost_timer = g_COL_TICKS;   // raknas som boostande en stund (krockknuff, D-018)
    vx += g_psin[a] * 64;
    vy -= g_pcos[a] * 64;
}
if (t == 4)
{
    // TRACTOR BEAM: drar narmaste fiende mot podden. F = 108000000/(d2+60000), dv = (d * F) >> 9, |v| <= 0xf00 (kod 0x6cd8)
    scr_nearest_player(pod_wx[p], pod_wy[p], slot);
    if (g_near_id != noone)
    {
        g_tmp_f = floor(108000000 / (g_near_d2 + 60000));
        with (g_near_id)
        {
            vx += floor(g_near_dx * g_tmp_f / 512);
            vy += floor(g_near_dy * g_tmp_f / 512);
            vx = max(-3840, min(3840, vx));
            vy = max(-3840, min(3840, vy));
        }
    }
}
if (t == 5)
{
    // CANNON TURRET: ett kanonskott mot narmaste fiende om malet ligger inom +-64/256 varv fran podens riktning (kod 0x7052)
    scr_nearest_player(pod_wx[p], pod_wy[p], slot);
    if (g_near_id != noone && instance_number(obj_shot) < g_MAX_SHOTS)
    {
        dxt = -g_near_dx;   // mal - pod
        dyt = -g_near_dy;
        aim = round(radtodeg(arctan2(dxt, dyt)) * 256 / 360);
        aim = ((aim mod 256) + 256) mod 256;
        ang_f = (256 - a) mod 256;   // poddens riktning i sikt-konventionen (sin A, cos A)
        dd = ((aim - ang_f + 128) mod 256 + 256) mod 256 - 128;
        if (dd >= -64 && dd <= 64)
        {
            sh = instance_create(0, 0, obj_shot);
            sh.px = pod_wx[p];
            sh.py = pod_wy[p];
            sh.vx = vx + g_psin[aim] * 32;
            sh.vy = vy + g_pcos[aim] * 32;
            sh.owner = slot;
            scr_sfx_play(snd_sfx_shot, 0, 1);
        }
    }
}
