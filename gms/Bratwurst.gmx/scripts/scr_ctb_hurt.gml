/// scr_ctb_hurt(owner_slot)
// Capture the Bratwurst (D-082): kors i offrets kontext precis fore en vapentraff skadar (skott, missil, missilring, Mini Nuke, railgun). Minns vem som traffade och
// nar (for kill-statistiken, scr_ctb_death) och far en korv som bars av offret att snurra extra snabbt i 1 s (en ny traff forlanger tiden, staplas inte).
hit_by = argument0;
hit_tick = g_tick;
if (g_sa_st == 2 && g_sa_car == slot) { g_sa_spin = 50; }
