/// scr_fin_arrows(sx0, sy0, sx1, sy1, dir, colour, clip_x0, clip_y0, clip_x1, clip_y1, size)
// Ritar malrutans riktningspilar (smma vinklar > som pekar at rutans riktning: 0 = upp, 1 = hoger, 2 = ner, 3 = vanster) i rutan med hornen (sx0,sy0)-(sx1,sy1)
// i skarmpixlar. Pilarna ligger i ett jamnt rutnat (hogst ca 40 st) och ritas bara om deras mittpunkt ligger inom klipprutan. size = pilens halvstorlek.
var ddx, ddy, ppx, ppy, lx0, ly0, lx1, ly1, mx, my, ll, ww, step, nt, nu, i, j, t, u, ax, ay, a;
a = argument10;
lx0 = min(argument0, argument2); lx1 = max(argument0, argument2);
ly0 = min(argument1, argument3); ly1 = max(argument1, argument3);
ddx = 0; ddy = 0;
if (argument4 == 0) { ddy = -1; }
if (argument4 == 1) { ddx = 1; }
if (argument4 == 2) { ddy = 1; }
if (argument4 == 3) { ddx = -1; }
ppx = -ddy;
ppy = ddx;
mx = (lx0 + lx1) / 2;
my = (ly0 + ly1) / 2;
if (ddx != 0) { ll = lx1 - lx0; ww = ly1 - ly0; } else { ll = ly1 - ly0; ww = lx1 - lx0; }
step = max(a * 3, sqrt(max(1, ll * ww) / 40));
nt = max(1, floor(ll / step));
nu = max(1, floor(ww / step));
draw_set_color(argument5);
for (i = 0; i < nt; i += 1)
{
    t = (i - (nt - 1) / 2) * step;
    for (j = 0; j < nu; j += 1)
    {
        u = (j - (nu - 1) / 2) * step;
        ax = mx + ddx * t + ppx * u;
        ay = my + ddy * t + ppy * u;
        if (ax >= argument6 && ax <= argument8 && ay >= argument7 && ay <= argument9)
        {
            draw_line(ax - ddx * a + ppx * a, ay - ddy * a + ppy * a, ax + ddx * a, ay + ddy * a);
            draw_line(ax - ddx * a - ppx * a, ay - ddy * a - ppy * a, ax + ddx * a, ay + ddy * a);
        }
    }
}
