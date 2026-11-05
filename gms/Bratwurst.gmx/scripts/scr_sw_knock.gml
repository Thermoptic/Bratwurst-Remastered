/// scr_sw_knock(push_percent)
// Super Smashwurst (D-085): knuffens styrka (hastighetsenheter, 1/256 varldspixel per tick, samma enhet som skeppens vx/vy) for ett offer med Push-procenten argument0. Linjar interpolation
// mellan ankarpunkter: 0 % = ingen knuff; 1-25 % mycket liten (upp till 1500 = ca 6 px/tick); 26-50 % markbar (5000); 51-75 % stark (10000); 76-99 % mycket stark (17000);
// 100 % och uppat extremt (28000 vid 100 %, 50000 vid 200 % och darefter, tak). Skeppen bromsas med drag/256 per tick (drag 3-8): en knuff v ger ca v / drag varldspixlar, sa 28000 slar ett
// tungt skepp (drag 8) ca 3500, ett medelskepp (drag 5) ca 5600 och ett lattare (drag 3) ca 9300 varldspixlar (banans bredd ar ca 5800): 100 %+ slar skeppet langt utanfor arenan.
var p, k, n, p0, p1, v0, v1;
p = max(0, argument0);
if (p <= 0) { return 0; }
if (p >= 200) { return 50000; }
n = 7;
ax_p[0] = 0; ax_v[0] = 0;
ax_p[1] = 25; ax_v[1] = 1500;
ax_p[2] = 50; ax_v[2] = 5000;
ax_p[3] = 75; ax_v[3] = 10000;
ax_p[4] = 99; ax_v[4] = 17000;
ax_p[5] = 100; ax_v[5] = 28000;
ax_p[6] = 200; ax_v[6] = 50000;
for (k = 0; k < n - 1; k += 1)
{
    p0 = ax_p[k]; p1 = ax_p[k + 1];
    if (p <= p1)
    {
        v0 = ax_v[k]; v1 = ax_v[k + 1];
        return v0 + (v1 - v0) * (p - p0) / (p1 - p0);
    }
}
return 50000;
