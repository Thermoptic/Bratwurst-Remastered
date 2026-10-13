/// scr_mn_add(type, label, desc)
// Skapar en menynod och returnerar dess index. Typer: 0 undermeny, 1 handling, 2 av/pa, 3 tal, 4 val ur lista, 5 endast text.
var n;
n = g_mn_cnt;
g_mn_type[n] = argument0;
g_mn_label[n] = argument1;
g_mn_desc[n] = argument2;
g_mn_n[n] = 0;
g_mn_set[n] = -1;
g_mn_min[n] = 0;
g_mn_max[n] = 1;
g_mn_act[n] = 0;
g_mn_text[n] = "";
g_mn_ini[n] = "";
g_mn_cnt += 1;
return n;
