/// scr_railgun_fire()
// Kors i obj_player. Avfyrar railgunen: kulan forsvinner och en stral (scr_beam_spawn) gar fran skeppets nos at det hall skeppet pekar (arver ingen fart),
// med lasersljud och kameraskakning. Powerupen forbrukas och laddningen nollas.
var b, fx, fy, ox, oy;
b = g_SV_PU + 8;
fx = -g_sin_tab[ang] / 256;
fy = g_cos_tab[ang] / 256;
ox = px / 256 + fx * (g_ship_nose[ship] + 4);
oy = py / 256 + fy * (g_ship_nose[ship] + 4);
scr_beam_spawn(ox, oy, fx, fy, slot);
scr_sfx_play(snd_sfx_railgun, 1, 1);
g_shake_amp = max(g_shake_amp, g_sv[b + 6]);
pu_have = 0;
pu_charge = 0;
pu_auto = 0;
if (rg_snd >= 0) { audio_stop_sound(rg_snd); rg_snd = -1; }
