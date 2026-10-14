/// scr_powerup_fire()
// Kors i obj_player nar B (gamepad; tangentbord V / F / M) trycks medan spelaren haller en powerup (pu_have). Avfyrar den fran den valda podden i skeppets riktning utan att
// arva skeppets fart (D-031) och forbrukar den. Mini Nuke (0): en missilliknande projektil (obj_missile, mtype 3) med parametrarna ur Powerup Editor.
var t, p, a, sx, sy, m, b;
t = pu_have - 1;
b = g_SV_PU + t * g_PU_STRIDE;
if (sp_nsel > 0)
{
    p = sp_sel[sp_pod_i];
    a = (ang + g_ship_pod_ang[ship, p]) mod 256;
    sx = pod_wx[p];
    sy = pod_wy[p];
}
else
{
    a = ang;
    sx = px;
    sy = py;
}
if (t == 0)
{
    m = instance_create(0, 0, obj_missile);
    m.mtype = 3;
    m.owner = slot;
    m.px = sx;
    m.py = sy;
    m.vx = vx * g_SHOT_INHERIT - g_psin[a] * g_sv[b + 1];
    m.vy = vy * g_SHOT_INHERIT + g_pcos[a] * g_sv[b + 1];
    m.mtimer = 150;
    m.msize = g_sv[b];
    scr_sfx_play(snd_sfx_missile, 1, 1);
}
pu_have = 0;
