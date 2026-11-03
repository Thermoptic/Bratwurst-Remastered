/// scr_ctb_hurt(owner_slot, missile)
// Capture the Bratwurst (D-082, D-084): kors i offrets kontext precis fore en vapentraff skadar (skott, missil, missilring, Mini Nuke, railgun). Minns vem som traffade och
// nar (for kill-statistiken, scr_ctb_death) och far en korv som bars av offret att snurra extra snabbt i 1 s (en ny traff forlanger tiden, staplas inte).
// missile = true for missiler (direkttraff, missilring, guidad missil, Mini Nuke): da slapps korven direkt (D-084). Den behaller sin fart och kan plockas upp av bada lagen,
// utom av den som tappade den under 1 s (g_sa_lock), sa att man inte plockar upp den igen samma stund.
hit_by = argument0;
hit_tick = g_tick;
if (g_sa_st == 2 && g_sa_car == slot)
{
    if (argument1)
    {
        g_sa_st = 1;
        g_sa_car = -1;
        g_sa_spin = 0;
        g_sa_lock = slot;
        g_sa_lockt = 50;
        scr_spark_burst(floor(g_sa_x), floor(g_sa_y), 10, 2, g_c[10]);
    }
    else { g_sa_spin = 50; }
}
