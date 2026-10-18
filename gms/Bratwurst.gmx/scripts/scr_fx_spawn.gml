/// scr_fx_spawn(x24, y24, kind, size)
// size = ringens storleksfaktor: 1 = missilen sprack i luften, g_FX_IMPACT (1.3) = traff vagg eller skepp (+30 % radie).
// Enkel explosionseffekt (PLACEHOLDER: originalet spawnar 16 resp. 8 partiklar, hunk0 0x660a/0x667e).
var f;
if (argument2 == 1 || argument2 == 2 || argument2 == 4) { scr_sfx_play(snd_sfx_explosion, 1, 1); }   // missil / guidad missil exploderar (original 0x660a, 0x667e)
if (argument2 == 1 || argument2 == 2)
{
    // stor explosion: partikelmoln (pixlar) ut at alla hall; guidad missil lite mindre
    if (argument2 == 1)
    {
        scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), round(g_ML_PART * 0.7), 4.2 * argument3, g_c[9]);   // PARTICLES i Powerup Editor (D-069): 70 % + 30 %
        scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), round(g_ML_PART * 0.3), 2.2 * argument3, g_c[10]);
    }
    else
    {
        scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), 45, 3.4 * argument3, g_c[9]);
        scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), 20, 1.8 * argument3, g_c[10]);
    }
}
if (argument2 == 4)
{
    g_shake_amp = max(g_shake_amp, g_sv[g_SV_PU + 6]);   // kameraskakning (Powerup Editor: CAMERA SHAKE)
    // MINI NUKE: partikelmoln (antal ur Powerup Editor) i tre lager
    scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), floor(g_sv[g_SV_PU + 3] * 0.5), 7, g_c[14]);
    scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), floor(g_sv[g_SV_PU + 3] * 0.3), 4.2, g_c[10]);
    scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), floor(g_sv[g_SV_PU + 3] * 0.2), 2.2, g_c[6]);
}
f = instance_create(0, 0, obj_fx);
f.px = argument0;
f.py = argument1;
f.ftimer = 0;
f.fkind = argument2;
f.fsize = argument3;
f.fdone[0] = 0; f.fdone[1] = 0; f.fdone[2] = 0; f.fdone[3] = 0;   // vilka skepp ringen redan skadat
if (argument2 == 1) { f.fmax = 14; } else { f.fmax = 9; }
if (argument2 == 1) { f.rmax = g_ML_BRAD * argument3; f.drad = g_ML_DRAD * argument3; }   // missilens ring och skadeavstand i varldspixlar (D-069)
if (argument2 == 4) { f.fmax = 32; f.rmax = g_sv[g_SV_PU + 2]; }   // chockvagens slutradie i varldspixlar
return f;   // ringen (obj_fx), sa att anroparen kan markera skepp som redan skadats (D-068)
