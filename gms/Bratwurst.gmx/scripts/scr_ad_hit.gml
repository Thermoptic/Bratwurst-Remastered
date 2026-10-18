/// scr_ad_hit()
// Galaxy Duel (D-051): kors i den traffade spelarens kontext (with) nar ett skott, en missil, en chockvag eller en stral traffar. Forsta traffen skadar skeppet
// (ad_dmg = g_AD_DMG_TICKS, 6 s): det blir 60 % langsammare och kan inte anvanda vapen, men reparerar sig sjalv. En ny traff medan skeppet ar skadat
// dodar det (energy = 0 -> scr_player_lose_life). Skadan ger gnistor och losa streck (scr_ad_fx), bara under de 6 sekunderna.
var k;
if (ad_inv > 0) { exit; }   // skyddstid direkt efter traffen (salva med flera skott)
if (ad_dmg > 0) { energy = 0; exit; }
ad_dmg = g_AD_DMG_TICKS;
ad_inv = g_AD_GRACE;
pu_charge = 0;   // en pagaende railgunladdning avbryts
pu_auto = 0;
if (rg_snd >= 0) { audio_stop_sound(rg_snd); rg_snd = -1; }
for (k = 0; k < 3; k += 1) { scr_ad_fx(true); }
