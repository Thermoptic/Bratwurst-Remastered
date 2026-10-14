/// scr_boost_vel(bx, by)
// Kors i obj_player. Tar projektilens grundhastighet (bx, by) (riktad exakt dit skeppet skjuter) och lagger till skeppets fart FRAMAT i skjutriktningen, sa att
// projektilen alltid ror sig minst lika snabbt som grundhastigheten relativt skeppet (aldrig sakta nog for att skeppet kor in i sitt eget skott):
//   d = (bx, by) / |b|,  extra = max(0, v_skepp . d) * g_SHOT_BOOST,  resultat = b + d * extra   (i g_bv_x, g_bv_y).
// Bara komponenten langs skjutriktningen laggs till (inte sidofarten), sa riktningen forblir exakt dit skeppet pekar (D-031). Skeppet kan inte heller
// ta igen skottet genom att bara hallas i full fart, eftersom dess fart (begransad av motstandet) inte kan overstiga fart + extra.
var bl, dx, dy, ex;
bl = sqrt(argument0 * argument0 + argument1 * argument1);
if (bl <= 0)
{
    g_bv_x = argument0;
    g_bv_y = argument1;
    exit;
}
dx = argument0 / bl;
dy = argument1 / bl;
ex = max(0, vx * dx + vy * dy) * g_SHOT_BOOST;
g_bv_x = argument0 + dx * ex;
g_bv_y = argument1 + dy * ex;
