/// scr_ctb_friend(owner_slot, victim_slot)
// Capture the Bratwurst (D-081/D-082): sant om en traff ska ignoreras for att offret ar en lagkamrat till den som skjuter (friendly fire av). Galler bara i
// laget; skeppets egen explosion skadar fortfarande skeppet sjalvt (owner == victim) som i Classic. Skott, missiler, ringar och stralar gar igenom lagkamrater.
if (g_game_mode != 3) { return false; }
if (argument0 < 0 || argument0 == argument1) { return false; }
return scr_team_of(argument0) == scr_team_of(argument1);
