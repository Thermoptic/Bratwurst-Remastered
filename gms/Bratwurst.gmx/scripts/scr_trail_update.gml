/// scr_trail_update()
// Kors i obj_player en gang per tick (aven nar spelaren ar utslagen). Medan skeppet driftar laggs en ny punkt till i varje spar (vid skeppets akterdel i
// varldspixlar, 1 punkt per tick, hogst g_TR_MAX), sa att sparet vaxer fram och foljer rorelsen. Nar driften slutar fortsatter sparet att hanga med
// skeppet (nya punkter laggs till vid akterdelen) medan hela sparet tonar ut (tr_fade) och de aldsta punkterna tas bort, tills det ar borta.
// Ar spelaren utslagen laggs inga nya punkter till. En markering (tr_brk) bryter sparet om driften borjar igen efter ett uppehall.
var j, sn, cs, ry0, tx, lx, doadd;
doadd = (alive && (drifting || tr_n > 0));
if (doadd)
{
    sn = g_sin_tab[ang];
    cs = g_cos_tab[ang];
    ry0 = g_ship_tr_y[ship];
    tx = g_ship_tr_x[ship];
    if (tr_n >= g_TR_MAX)
    {
        for (j = 1; j < tr_n; j += 1)
        {
            tr_ax[j - 1] = tr_ax[j]; tr_ay[j - 1] = tr_ay[j];
            tr_bx[j - 1] = tr_bx[j]; tr_by[j - 1] = tr_by[j];
            tr_brk[j - 1] = tr_brk[j];
        }
        tr_n -= 1;
    }
    lx = -tx;
    tr_ax[tr_n] = px / 256 + ((lx * cs + ry0 * sn) / 256) * 0.5;
    tr_ay[tr_n] = py / 256 + ((lx * sn - ry0 * cs) / 256) * 0.5;
    lx = tx;
    tr_bx[tr_n] = px / 256 + ((lx * cs + ry0 * sn) / 256) * 0.5;
    tr_by[tr_n] = py / 256 + ((lx * sn - ry0 * cs) / 256) * 0.5;
    tr_brk[tr_n] = tr_gap;
    tr_gap = false;
    tr_n += 1;
}
if (alive && drifting)
{
    tr_fade = 1;
}
else
{
    if (tr_n > 0)
    {
        tr_fade -= 0.025;
        for (j = 2; j < tr_n; j += 1)
        {
            tr_ax[j - 2] = tr_ax[j]; tr_ay[j - 2] = tr_ay[j];
            tr_bx[j - 2] = tr_bx[j]; tr_by[j - 2] = tr_by[j];
            tr_brk[j - 2] = tr_brk[j];
        }
        tr_n = max(0, tr_n - 2);
        if (tr_fade <= 0 || tr_n < 2) { tr_n = 0; tr_fade = 0; }
    }
    if (tr_n == 0) { tr_gap = true; }
}
