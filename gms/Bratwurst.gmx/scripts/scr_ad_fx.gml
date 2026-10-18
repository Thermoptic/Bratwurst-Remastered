/// scr_ad_fx(burst)
// Galaxy Duel (D-051): skadeeffekter for ett skadat skepp, i spelarens kontext. En punkt pa skrovet slumpas ut (en av skeppets hornpunkter ow_x/ow_y):
// gnistor flyger ut dar, och ibland lossnar ett litet streck som snurrar och faller (skeppsdelspoolen, scr_debris_add). burst = true ger en tydligare
// puff (vid sjalva traffen). Kors varje tick medan ad_dmg > 0.
var j, wx, wy, c, sc, spd, dir, dl;
sc = 32768 / max(1, g_zoom);
j = irandom(np - 1);
wx = ow_x[j];
wy = ow_y[j];
c = scr_slot_colour(slot);
if (argument0)
{
    scr_spark_burst(wx, wy, 6 + irandom(3), 1.6, c);
    dir = random(360);
    dl = (1.5 + random(1.5)) * sc;
    scr_debris_add(wx, wy, lengthdir_x(dl, random(360)), lengthdir_y(dl, random(360)), lengthdir_x(0.7 * sc, dir) + vx / 512, lengthdir_y(0.7 * sc, dir) + vy / 512, random_range(-0.3, 0.3), 45 + irandom(30), c);
    exit;
}
if (irandom(2) == 0) { scr_spark_burst(wx, wy, 1 + irandom(1), 0.9, c); }
if (irandom(17) == 0)
{
    dir = random(360);
    dl = (1.5 + random(1.5)) * sc;
    scr_debris_add(wx, wy, lengthdir_x(dl, random(360)), lengthdir_y(dl, random(360)), lengthdir_x(0.5 * sc, dir) + vx / 512, lengthdir_y(0.5 * sc, dir) + vy / 512, random_range(-0.3, 0.3), 45 + irandom(30), c);
}
