/// scr_race_eliminate()
// Race (D-058, steg 6): kors i den sista racern som inte kommit i mal nar 4 sekunder gatt efter att alla andra blivit klara. Skeppet exploderar och ar ute ur
// racet (ingen aterskapning). Det ar racets sarskilda avgorande regel, inte en vapendod.
scr_ship_explode();
alive = false;
race_dnf = true;
respawn_t = 0;
pu_have = 0;
pu_charge = 0;
pu_auto = 0;
drifting = false;
if (rg_snd >= 0) { audio_stop_sound(rg_snd); rg_snd = -1; }
