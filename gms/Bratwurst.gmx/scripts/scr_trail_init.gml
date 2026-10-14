/// scr_trail_init()
// Driftspar (D-030): beraknar for varje skepp var spararna startar. g_ship_tr_y[s] = avstand bakom mitten (skeppsenheter, +y ar akter),
// g_ship_tr_x[s] = sidoavstand for de tva sparen, g_ship_tr_n[s] = antal spar (1 for smala skepp, annars 2). Kors en gang vid start.
var s, j, xm, ym, yn;
for (s = 0; s < g_ship_count; s += 1)
{
    xm = 1;
    ym = 1;
    yn = 0;
    for (j = 0; j < g_ship_np[s]; j += 1)
    {
        xm = max(xm, abs(g_ship_pts[s, 2 * j]));
        ym = max(ym, g_ship_pts[s, 2 * j + 1]);
        yn = max(yn, -g_ship_pts[s, 2 * j + 1]);
    }
    g_ship_tr_y[s] = ym * 0.85;
    g_ship_nose[s] = yn * 0.5;   // avstand fran mitten till nosen i varldspixlar (1 skeppsenhet = 0,5 pixel); railgunens kula och stral startar har
    if (xm < 80) { g_ship_tr_n[s] = 1; g_ship_tr_x[s] = 0; }
    else { g_ship_tr_n[s] = 2; g_ship_tr_x[s] = xm * 0.5; }
}
