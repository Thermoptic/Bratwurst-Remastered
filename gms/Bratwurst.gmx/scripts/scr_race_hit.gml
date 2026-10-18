/// scr_race_hit()
// Race (D-055, steg 3): kors i den traffade spelarens kontext (with) nar ett skott, en missil, en chockvag eller en stral traffar. Inget vapen skadar eller dodar
// i Race: traffen ger bara fartminskning till g_RACE_SLOW (20 %) i g_RACE_SLOW_TICKS (3 s). En ny traff startar om tiden men gor aldrig skeppet langsammare an 20 %
// (ingen stapling). Farten begransas i scr_player_step.
race_slow = g_RACE_SLOW_TICKS;
