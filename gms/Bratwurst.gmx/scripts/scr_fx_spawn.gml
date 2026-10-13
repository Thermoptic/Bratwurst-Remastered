/// scr_fx_spawn(x24, y24, kind)
// Enkel explosionseffekt (PLACEHOLDER: originalet spawnar 16 resp. 8 partiklar, hunk0 0x660a/0x667e).
var f;
if (argument2 == 1 || argument2 == 2) { scr_sfx_play(snd_sfx_explosion, 1, 1); }   // missil / guidad missil exploderar (original 0x660a, 0x667e)
if (argument2 == 1 || argument2 == 2)
{
    // stor explosion: partikelmoln (pixlar) ut at alla hall; guidad missil lite mindre
    if (argument2 == 1)
    {
        scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), 70, 4.2, g_c[9]);
        scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), 30, 2.2, g_c[10]);
    }
    else
    {
        scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), 45, 3.4, g_c[9]);
        scr_spark_burst(floor(argument0 / 256), floor(argument1 / 256), 20, 1.8, g_c[10]);
    }
}
f = instance_create(0, 0, obj_fx);
f.px = argument0;
f.py = argument1;
f.ftimer = 0;
f.fkind = argument2;
f.fdone[0] = 0; f.fdone[1] = 0; f.fdone[2] = 0; f.fdone[3] = 0;   // vilka skepp ringen redan skadat
if (argument2 == 1) { f.fmax = 14; } else { f.fmax = 9; }
