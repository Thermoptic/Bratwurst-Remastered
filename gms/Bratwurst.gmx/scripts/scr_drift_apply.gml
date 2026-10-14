/// scr_drift_apply()
// Laser drift- och reverseinstallningarna ur g_sv (Powerup Editor -> DRIFT, post 2 i powerup-datan) till de globala variablerna som spelkoden anvander:
// g_DRIFT_MINSPEED, g_DRIFT_TURN, g_DRIFT_ANG, g_DRIFT_THRUST, g_REVERSE_THRUST, g_TR_MAX, g_DRIFT_SND_GAIN och g_TR_WSCALE. Anropas efter inlasning av
// settings.ini, nar en driftinstallning andras och nar installningarna aterstalls.
var b;
b = g_SV_PU + g_PU_STRIDE * 2;
g_DRIFT_MINSPEED = g_sv[b];
g_DRIFT_TURN = g_sv[b + 1] / 100;
g_DRIFT_ANG = g_sv[b + 2];
g_DRIFT_THRUST = g_sv[b + 3] / 100;
g_REVERSE_THRUST = g_sv[b + 4] / 100;
g_TR_MAX = g_sv[b + 5];
g_DRIFT_SND_GAIN = g_sv[b + 6] / 100;
g_TR_WSCALE = g_sv[b + 7] / 100;
g_DRIFT_SIDE = g_sv[b + 8] / 100;
