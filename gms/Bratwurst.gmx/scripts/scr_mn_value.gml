/// scr_mn_value(node)
// Radens varde som text.
var n, t, s;
n = argument0;
t = g_mn_type[n];
s = g_mn_set[n];
if (t == 0) { return ">>>"; }
if (t == 2) { if (g_sv[s]) { return "ON"; } return "OFF"; }
if (t == 3 && s == g_SV_VOL && g_sv[s] == 0) { return "OFF"; }
if (t == 3 && s == g_SV_VOL) { return string(g_sv[s] * 10) + "%"; }
if (t == 3 && s == g_SV_CTTM) { return string(g_sv[s]) + " MIN"; }   // Capture the Bratwurst: rundtid i minuter (D-080)
if (t == 3 && s == g_SV_SWOB) { return string(g_sv[s]) + " S"; }   // Super Smashwurst: sekunder utanfor gransen (D-085)
if (t == 3 && (s == g_SV_SWCN || s == g_SV_SWML)) { return string(g_sv[s]) + "%"; }   // Push i procent
if (t == 3) { return string(g_sv[s]); }
if (t == 4)
{
    if (s == g_SV_THEME) { return string_upper(g_th_name[g_sv[s]]); }
    if (s == g_SV_ACCENT) { return g_acc_name[g_sv[s]]; }
    if (s == g_SV_SCALE) { return g_scale_name[g_sv[s]]; }
    if (s == g_SV_MAP3 && scr_race_maps() == 0) { return "NO RACE MAPS"; }
    if (s == g_SV_MAP4 && scr_ctb_maps() == 0) { return "NO CTB MAPS"; }
    if (s == g_SV_MAP || s == g_SV_MAP2 || s == g_SV_MAP3 || s == g_SV_MAP4 || s == g_SV_MAP5) { return g_lv_name[clamp(g_sv[s], 0, g_lv_count - 1)]; }
}
if (t == 5) { return g_mn_text[n]; }
return "";
