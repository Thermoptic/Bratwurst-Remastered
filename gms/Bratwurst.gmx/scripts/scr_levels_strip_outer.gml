/// scr_levels_strip_outer()
// Engangsmigrering av levels.ini fran v1 till v2 (D-033): tar bort den yttre ramlinjen (den stora fyrkanten -3000,-2273 .. 2961,2273) ur alla banor,
// ocksa anvandarens egna. Tidigare levels.ini sparas forst som levels_v1_backup.ini. Skiktnumren (s0..) packas om.
var n, i, sec, cnt, s, keep, kn, outer;
outer = "-3000,-2273;2961,-2273;2961,2273;-3000,2273";
if (file_exists("levels.ini")) { file_copy("levels.ini", "levels_v1_backup.ini"); }
ini_open("levels.ini");
n = round(ini_read_real("index", "count", 0));
for (i = 0; i < n; i += 1)
{
    sec = ini_read_string("index", "id" + string(i), "");
    if (sec == "" || !ini_section_exists(sec)) { continue; }
    cnt = clamp(round(ini_read_real(sec, "shapes", 0)), 0, 64);
    kn = 0;
    for (s = 0; s < cnt; s += 1)
    {
        keep[kn] = ini_read_string(sec, "s" + string(s), "");
        if (keep[kn] != outer) { kn += 1; }
    }
    if (kn < cnt)
    {
        ini_write_real(sec, "shapes", kn);
        for (s = 0; s < kn; s += 1) { ini_write_string(sec, "s" + string(s), keep[s]); }
        for (s = kn; s < cnt; s += 1) { ini_key_delete(sec, "s" + string(s)); }
    }
}
ini_write_string("meta", "version", "v2");
ini_close();
