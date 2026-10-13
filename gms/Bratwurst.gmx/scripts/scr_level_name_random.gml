/// scr_level_name_random()
// Slumpar ett kartnamn: en planet/stjarna + en korv, t.ex. "Jupiter Salsiccia". Provar att undvika namn som redan finns.
var pl, sa, tries, nm, i, dup;
pl[0] = "Jupiter"; pl[1] = "Earendel"; pl[2] = "Vega"; pl[3] = "Altair"; pl[4] = "Rigel"; pl[5] = "Betelgeuse"; pl[6] = "Antares";
pl[7] = "Procyon"; pl[8] = "Capella"; pl[9] = "Arcturus"; pl[10] = "Aldebaran"; pl[11] = "Spica"; pl[12] = "Deneb"; pl[13] = "Pollux";
pl[14] = "Castor"; pl[15] = "Fomalhaut"; pl[16] = "Mimosa"; pl[17] = "Saturn"; pl[18] = "Neptune"; pl[19] = "Mercury"; pl[20] = "Titan";
pl[21] = "Europa"; pl[22] = "Callisto"; pl[23] = "Ganymede"; pl[24] = "Polaris"; pl[25] = "Canopus"; pl[26] = "Algol"; pl[27] = "Mira";
sa[0] = "Salsiccia"; sa[1] = "Boudin"; sa[2] = "Chorizo"; sa[3] = "Kielbasa"; sa[4] = "Cumberland"; sa[5] = "Knackwurst"; sa[6] = "Weisswurst";
sa[7] = "Andouille"; sa[8] = "Mortadella"; sa[9] = "Sobrasada"; sa[10] = "Cervelat"; sa[11] = "Currywurst"; sa[12] = "Bockwurst";
sa[13] = "Chipolata"; sa[14] = "Saucisson"; sa[15] = "Longaniza"; sa[16] = "Linguica"; sa[17] = "Boerewors"; sa[18] = "Nduja";
sa[19] = "Landjager"; sa[20] = "Morcilla"; sa[21] = "Krakauer"; sa[22] = "Teewurst"; sa[23] = "Thuringer"; sa[24] = "Frankfurter";
sa[25] = "Bratwurst"; sa[26] = "Merguez"; sa[27] = "Cotechino";
nm = "";
for (tries = 0; tries < 30; tries += 1)
{
    nm = pl[irandom(27)] + " " + sa[irandom(27)];
    dup = false;
    for (i = 0; i < g_lv_count; i += 1)
    {
        if (g_lv_name[i] == nm) { dup = true; }
    }
    if (!dup) { break; }
}
return nm;
