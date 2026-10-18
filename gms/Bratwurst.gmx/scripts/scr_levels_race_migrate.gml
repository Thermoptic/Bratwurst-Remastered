/// scr_levels_race_migrate()
// Engangsmigrering av levels.ini fran v2 till v3 (D-062): Race ska bara finnas pa banor som uttryckligen sparats for Race. Tidigare hade alla banor alla spellagen
// (modes = 15, inklusive Race). En bana utan start/malruta kan inte spelas som race, sa Race-biten (4) tas bort fran alla banor som saknar nyckeln finish.
// Banor med malruta behaller sina lagen. Sedan sattas versionen till v3. Banor man sparar efter detta far de lagen man valt i sparfonstret.
var k, cnt, sec, m;
ini_open("levels.ini");
cnt = round(ini_read_real("index", "count", 0));
for (k = 0; k < cnt; k += 1)
{
    sec = ini_read_string("index", "id" + string(k), "");
    if (sec != "")
    {
        m = round(ini_read_real(sec, "modes", 15));
        if ((m & 4) != 0 && ini_read_string(sec, "finish", "") == "") { ini_write_real(sec, "modes", m - 4); }
    }
}
ini_write_string("meta", "version", "v3");
ini_close();
