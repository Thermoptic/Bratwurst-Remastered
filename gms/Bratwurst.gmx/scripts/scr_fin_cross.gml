/// scr_fin_cross()
// Race (D-053, steg 2): kors i en spelares kontext varje tick (scr_race_step). Start- och malrutan ar en port: ett skepp passerar den nar dess mittpunkt gar over
// rutans mittlinje (tvars pilens riktning) inom rutans bredd. Framat (i pilens riktning) racknas race_x upp, bakat ner, sa att man inte kan fa varv genom att
// vicka fram och tillbaka. Rutan ar icke-solid. Genomforda varv = race_x - race_free (race_free = 1 om skeppet startade bakom linjen: forsta passagen ar
// da bara starten), hogst malvarven. Nar malvarven ar klara markeras skeppet som klart och maltiden sparas.
var x0, y0, x1, y1, sp, sn, t, lx, ly, lat;
x1 = px / 256; y1 = py / 256;
x0 = prev_px / 256; y0 = prev_py / 256;
sp = (x0 - g_fin_cx) * g_fin_dx + (y0 - g_fin_cy) * g_fin_dy;
sn = (x1 - g_fin_cx) * g_fin_dx + (y1 - g_fin_cy) * g_fin_dy;
if ((sp < 0 && sn >= 0) || (sp >= 0 && sn < 0))
{
    t = sp / (sp - sn);
    lx = x0 + (x1 - x0) * t;
    ly = y0 + (y1 - y0) * t;
    lat = abs((lx - g_fin_cx) * (-g_fin_dy) + (ly - g_fin_cy) * g_fin_dx);
    if (lat <= g_fin_hw)
    {
        if (sn >= 0) { race_x += 1; } else { race_x -= 1; }
    }
}
race_laps = clamp(race_x - race_free, 0, g_race_target);
if (race_laps >= g_race_target)
{
    race_fin = true;
    race_ft = g_race_t;
}
