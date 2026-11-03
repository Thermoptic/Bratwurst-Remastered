/// scr_levels_ctb_migrate()
// Engangsmigrering av levels.ini fran v3 till v4 (D-083): Capture the Bratwurst ska bara finnas pa banor som uttryckligen sparats for det laget. Aldre banor hade alla spellagen
// (modes = 15) och fick darmed Capture the Bratwurst-biten (8) fast laget inte fanns. Biten tas bort fran alla banor som saknar korvstart (nyckeln ctb_spawn). Banor med
// korvstart behaller sina lagen. Sedan sattas versionen till v4. Banor man sparar efter detta far de lagen man valt i sparfonstret.
var k, cnt, sec, m;
ini_open("levels.ini");
cnt = round(ini_read_real("index", "count", 0));
for (k = 0; k < cnt; k += 1)
{
    sec = ini_read_string("index", "id" + string(k), "");
    if (sec != "")
    {
        m = round(ini_read_real(sec, "modes", 7));
        if ((m & 8) != 0 && ini_read_string(sec, "ctb_spawn", "") == "") { ini_write_real(sec, "modes", m - 8); }
    }
}
ini_write_string("meta", "version", "v4");
ini_close();
