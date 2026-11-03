/// scr_team_of(slot)
// Capture the Bratwurst (D-079): lagtillhorigheten for en spelare (0 = rod, 1 = bla). Som standard ar P1 och P3 i lag 0 och P2 och P4 i lag 1 (slot 0..3).
// Lagen delas ut automatiskt; all kod fragar har sa att indelningen kan goras valbar senare utan att andra skript andras.
return argument0 mod 2;
