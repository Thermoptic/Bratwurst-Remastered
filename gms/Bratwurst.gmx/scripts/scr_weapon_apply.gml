/// scr_weapon_apply()
// Laser CANNON- och MISSILE-installningarna ur g_sv (Powerup Editor, post 3 och 4 i powerup-datan) till de globala variablerna som spelkoden anvander (D-069).
// Anropas efter inlasning av settings.ini, nar en sadan installning andras och nar installningarna aterstalls.
var b;
b = g_SV_PU + g_PU_STRIDE * 3;
g_CN_DMG = g_sv[b];
g_CN_SPD = g_sv[b + 1] / 100;
g_CN_GRAV = g_sv[b + 2] / 100;
g_CN_RELOAD = g_sv[b + 3] / 100;
g_CN_KNOCK = g_sv[b + 4] / 100;
b = g_SV_PU + g_PU_STRIDE * 4;
g_ML_SPD = g_sv[b];
g_ML_FUSE = round(g_sv[b + 1] * 5);   // tiondels sekunder -> ticks (50 per sekund)
g_DMG_MSL = g_sv[b + 2];
g_ML_BDMG = g_sv[b + 3];
g_ML_BRAD = g_sv[b + 4];
g_ML_DRAD = g_sv[b + 5];
g_ML_PART = g_sv[b + 6];
g_ML_KNOCK = g_sv[b + 7] / 100;
g_ML_COOL = g_sv[b + 8] / 100;
g_ML_BKNOCK = g_sv[b + 9];   // explosionsringens knuff (D-070)
