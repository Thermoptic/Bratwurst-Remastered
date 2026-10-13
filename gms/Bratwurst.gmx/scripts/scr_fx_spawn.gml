/// scr_fx_spawn(x24, y24, kind)
// Enkel explosionseffekt (PLACEHOLDER: originalet spawnar 16 resp. 8 partiklar, hunk0 0x660a/0x667e).
var f;
if (argument2 == 1 || argument2 == 2) { scr_sfx_play(snd_sfx_explosion, 1, 1); }   // missil / guidad missil exploderar (original 0x660a, 0x667e)
f = instance_create(0, 0, obj_fx);
f.px = argument0;
f.py = argument1;
f.ftimer = 0;
if (argument2 == 1) { f.fmax = 14; } else { f.fmax = 9; }
