/// scr_railgun_update()
// Kors i obj_player varje tick. Railgun (powerup 1, pu_have = 2): halls powerup-knappen inne laddas kanonen (pu_charge racker upp, CHARGE TIME sekunder i
// Powerup Editor) medan ett vibrerande, vobblande laddljud (snd_sfx_rg_charge, loop) gar upp i volym och tonhojd. Nar den ar fulladdad tystnar laddljudet och
// "laddad"-ljudet (snd_sfx_rg_ready) spelas. Slapps knappen fulladdad avfyras den (scr_railgun_fire); halls den kvar avfyras den av sig sjalv efter
// g_RG_AUTO ticks (3 s). Slapps knappen for tidigt avbryts laddningen och powerupen ar kvar. Annars nollas laddningen.
var b, need, fr;
if (pu_have != 2)
{
    pu_charge = 0;
    pu_auto = 0;
    if (rg_snd >= 0) { audio_stop_sound(rg_snd); rg_snd = -1; }
    exit;
}
b = g_SV_PU + g_PU_STRIDE;
need = max(1, g_sv[b] * 50);
if (in_pu_hold)
{
    if (pu_charge < need)
    {
        pu_charge += 1;
        fr = pu_charge / need;
        if (pu_charge >= need)
        {
            // fulladdad: laddljudet stoppas och "laddad"-ljudet spelas
            if (rg_snd >= 0) { audio_stop_sound(rg_snd); rg_snd = -1; }
            scr_sfx_play(snd_sfx_rg_ready, 2, 1);
            pu_auto = 0;
        }
        else if (g_sv[g_SV_SFX])
        {
            if (rg_snd < 0 || !audio_is_playing(rg_snd)) { rg_snd = audio_play_sound(snd_sfx_rg_charge, 8, true); }
            audio_sound_gain(rg_snd, 0.08 + 0.92 * fr * fr, 0);   // forsiktigt -> starkare och starkare
            audio_sound_pitch(rg_snd, 0.8 + 0.7 * fr);            // tonhojden stiger med laddningen
        }
    }
    else
    {
        pu_auto += 1;
        if (pu_auto >= g_RG_AUTO) { scr_railgun_fire(); }   // 3 s efter fulladdning: avfyras av sig sjalv
    }
}
else
{
    if (pu_charge >= need) { scr_railgun_fire(); }
    pu_charge = 0;
    pu_auto = 0;
    if (rg_snd >= 0) { audio_stop_sound(rg_snd); rg_snd = -1; }
}
