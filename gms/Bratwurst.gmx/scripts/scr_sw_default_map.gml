/// scr_sw_default_map()
// Super Smashwurst (D-086): standardbanan i laget ar Proxima Merguez (inbyggd bana, id "proxima"). Satter g_sv[g_SV_MAP5] till den om den finns i banlistan och far valjas i Classics
// banlista (bit 0, som laget delar); annars ar valet oforandrat. Kors vid standardinstallningar (scr_set_defaults, aven RESET) och en gang for befintliga installningar (scr_set_init).
var k;
for (k = 0; k < g_lv_count; k += 1)
{
    if (g_lv_id[k] == "proxima" && scr_level_allowed(0, k)) { g_sv[g_SV_MAP5] = k; break; }
}
