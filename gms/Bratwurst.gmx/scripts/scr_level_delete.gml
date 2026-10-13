/// scr_level_delete(map_index)
// Tar bort en bana (minst en bana maste finnas kvar). Returnerar true om den togs bort.
var i, j, c0, idn, victim;
if (g_lv_count <= 1) { return false; }
victim = g_lv_id[argument0];
ini_open("levels.ini");
ini_section_delete(victim);
c0 = ini_read_real("index", "count", g_lv_count);
for (i = 0; i < c0; i += 1)
{
    idn = ini_read_string("index", "id" + string(i), "");
    if (idn == victim)
    {
        for (j = i; j < c0 - 1; j += 1)
        {
            ini_write_string("index", "id" + string(j), ini_read_string("index", "id" + string(j + 1), ""));
        }
        break;
    }
}
ini_key_delete("index", "id" + string(c0 - 1));
ini_write_real("index", "count", c0 - 1);
ini_close();
scr_levels_reload();
return true;
