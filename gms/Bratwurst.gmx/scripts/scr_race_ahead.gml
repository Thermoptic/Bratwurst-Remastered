/// scr_race_ahead(a, b)
// Race (D-057, steg 5): sant om racer a ligger fore racer b (a, b = obj_player-instanser). Ordning: 1) klara fore oklara, klara efter maltid; 2) fler genomforda varv
// (race_x - race_free: passager av malrutan minus startpassagen); 3) vid lika varv den som passerade malrutan senast tidigast (race_ct; 0 = ingen passage an);
// 4) utan passager den som startade narmast linjen (race_s0, storst varde = narmast); 5) lagre plats (slot). Placeringen andras alltsa bara nar nagon passerar rutan.
var pa, pb;
if (argument0.race_fin != argument1.race_fin) { return argument0.race_fin; }
if (argument0.race_fin)
{
    if (argument0.race_ft != argument1.race_ft) { return argument0.race_ft < argument1.race_ft; }
    return argument0.slot < argument1.slot;
}
pa = argument0.race_x - argument0.race_free;
pb = argument1.race_x - argument1.race_free;
if (pa != pb) { return pa > pb; }
if (argument0.race_ct != argument1.race_ct) { return argument0.race_ct < argument1.race_ct; }
if (argument0.race_s0 != argument1.race_s0) { return argument0.race_s0 > argument1.race_s0; }
return argument0.slot < argument1.slot;
